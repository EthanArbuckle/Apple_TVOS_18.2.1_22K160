void sub_1000054B0(uint64_t a1)
{
  id WeakRetained;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _callInvalidationHandler:0];
}
}

void sub_100005C88(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  v2 = (void *)qword_1001574B8;
  qword_1001574B8 = (uint64_t)v1;
}

LABEL_5:
  v8 = v6;
LABEL_6:
  v9 = v8;
LABEL_7:

  return v9;
}

  return v6;
}

  v13 = *((_BYTE *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

  v13 = *((_BYTE *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

void sub_100006930(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  v2 = (void *)qword_1001574C8;
  qword_1001574C8 = (uint64_t)v1;
}

LABEL_9:
  return v8;
}

  return v13;
}

LABEL_15:
LABEL_16:
  v15 = 0;
LABEL_17:

  return v15;
}

    objc_sync_exit(v10);

    if (!v14)
    {
      v25 = v18;
      goto LABEL_22;
    }

    v24 = v10->_log;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      sub_1000B2C94((uint64_t)v14, v24);
      if (a5) {
        goto LABEL_18;
      }
    }

    else if (a5)
    {
LABEL_18:
      v25 = 0LL;
      *a5 = v14;
LABEL_22:

      return v25;
    }

    v25 = 0LL;
    goto LABEL_22;
  }

  if (v12)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Getting on-device PPS Data", buf, 2u);
  }

  v28 = 0LL;
  v20 = v8;
  *(void *)buf = 0LL;
  v32 = (uint64_t)buf;
  v33 = 0x2020000000LL;
  v21 = off_1001577B0;
  v34 = off_1001577B0;
  if (!off_1001577B0)
  {
    v22 = (void *)sub_100039894();
    v21 = dlsym(v22, "PerfPowerServicesGetData");
    *(void *)(v32 + 24) = v21;
    off_1001577B0 = v21;
  }

  _Block_object_dispose(buf, 8);
  if (v21)
  {
    v23 = ((uint64_t (*)(id, id *))v21)(v20, &v28);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v23);

    v14 = v28;
    goto LABEL_15;
  }

  v27 = dlerror();
  result = (id)abort_report_np("%s", v27);
  __break(1u);
  return result;
}

  v18 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  v16,  v11,  (double)0x384uLL));

  return v18;
}
      }

      v5 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }

    while (v5);
  }

  if (os_log_type_enabled(v28->_log, OS_LOG_TYPE_DEBUG)) {
    sub_1000B4EE4();
  }
  if (os_log_type_enabled(v28->_log, OS_LOG_TYPE_DEBUG)) {
    sub_1000B4E84();
  }
  availableStatus = v28->_availableStatus;
  v28->_availableStatus = v32;
  v24 = v32;

  previewAvailableStatus = v28->_previewAvailableStatus;
  v28->_previewAvailableStatus = v30;
  v26 = v30;

  -[NSUserDefaults setObject:forKey:]( v28->_defaults,  "setObject:forKey:",  v28->_availableStatus,  @"availableStatus");
  -[NSUserDefaults setObject:forKey:]( v28->_defaults,  "setObject:forKey:",  v28->_previewAvailableStatus,  @"previewAvailableStatus");
}

  v12 = 0;
LABEL_16:

  return v12;
}
}

LABEL_24:
  return v15;
}
  }

  else
  {
    v54 = @"activityName";
    v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) description]);
    v55 = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v55,  &v54,  1LL));
    v20 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"_DASActivityDependencyManagerErrorDomain",  3LL,  v19));
    v21 = *(void *)(*(void *)(a1 + 56) + 8LL);
    v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;

    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
  }

  objc_autoreleasePoolPop(context);
}
}

  v6 = v32;

  v10 = 1;
LABEL_26:

LABEL_27:
  return v10;
}
              }
            }

            [v59 addObject:v24];
            goto LABEL_31;
          }

          if (v27 && [v24 isContactTracingBackgroundActivity])
          {
            [v59 addObject:v24];
            v29 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"exposure-notification"));
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Replacing similar task", buf, 2u);
            }
          }
        }

void sub_1000085E8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_1000085F8( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

  ;
}

void sub_1000087F4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100008814(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  if (a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDataProtectionStateMonitor dataProtectionClassC]( &OBJC_CLASS____DASDataProtectionStateMonitor,  "dataProtectionClassC"));
    unsigned int v7 = [v5 isEqualToString:v6];

    if (v7)
    {
      objc_copyWeak(&to, (id *)(a1 + 32));
      id v8 = objc_loadWeakRetained(&to);

      if (v8)
      {
        id v9 = objc_loadWeakRetained(&to);
        v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 log]);

        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v13 = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Class C now available.", v13, 2u);
        }

        id v11 = objc_loadWeakRetained(&to);
        [v11 setClassCUnlocked:1];

        id v12 = objc_loadWeakRetained(&to);
        [v12 setDataProtectionStateMonitor:0];
      }

      objc_destroyWeak(&to);
    }
  }
}

void sub_100008930( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_100008988(id a1)
{
  id v1 = objc_opt_new(&OBJC_CLASS____APRSPrewarmRecommendation);
  v2 = (void *)qword_1001574D0;
  qword_1001574D0 = (uint64_t)v1;
}

void sub_100008ECC(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  id v5 = a2;
  uint64_t v6 = (uint64_t)[v10 integerValue];
  double v7 = 1.0;
  if (v6 <= 999)
  {
    objc_msgSend(v10, "doubleValue", 1.0);
    double v7 = v8 / 1000.0;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v7));
  [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v5];
}

void sub_100008FF4(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  [a3 doubleValue];
  if (v5 >= 0.25)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    if (v5 >= 0.75) {
      double v7 = &off_1001219A8;
    }
    else {
      double v7 = &off_100121990;
    }
    id v8 = v9;
  }

  else
  {
    uint64_t v6 = *(void **)(a1 + 32);
    double v7 = &off_100121978;
    id v8 = v9;
  }

  [v6 setObject:v7 forKeyedSubscript:v8];
}

uint64_t sub_100009438(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v5]);
  [v7 doubleValue];
  double v9 = v8;

  id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v6]);
  [v10 doubleValue];
  double v12 = v11;

  if (v9 <= v12)
  {
    if (v12 <= v9)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationRecord bundleRecordWithApplicationIdentifier:error:]( &OBJC_CLASS___LSApplicationRecord,  "bundleRecordWithApplicationIdentifier:error:",  v5,  0LL));
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 bundleIdentifier]);

      v16 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationRecord bundleRecordWithApplicationIdentifier:error:]( &OBJC_CLASS___LSApplicationRecord,  "bundleRecordWithApplicationIdentifier:error:",  v6,  0LL));
      v17 = (void *)objc_claimAutoreleasedReturnValue([v16 bundleIdentifier]);

      v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:v15]);
      signed int v19 = [v18 intValue];
      v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:v17]);
      signed int v21 = [v20 intValue];

      if (v19 <= v21)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:v15]);
        int v23 = [v22 intValue];
        v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:v17]);
        uint64_t v13 = v23 > (int)[v24 intValue];
      }

      else
      {
        uint64_t v13 = -1LL;
      }
    }

    else
    {
      uint64_t v13 = 1LL;
    }
  }

  else
  {
    uint64_t v13 = -1LL;
  }

  return v13;
}

void sub_100009984( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

id sub_10000C518(uint64_t a1)
{
  return [*(id *)(a1 + 32) cleanupTimerHandler];
}

void sub_10000C594(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  v2 = (void *)qword_1001574E8;
  qword_1001574E8 = (uint64_t)v1;
}

void sub_10000C7E4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

LABEL_4:
  double v8 = 0;
LABEL_5:

  return v8;
}

void sub_10000CF10(_Unwind_Exception *a1)
{
}

void sub_10000D1E8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_10000DBD0(_Unwind_Exception *a1)
{
}

id sub_10000DC94(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 40)));
  [v2 setObject:v3 forKeyedSubscript:@"rateLimited"];

  if (*(_BYTE *)(a1 + 40)) {
    v4 = &off_1001219C0;
  }
  else {
    v4 = &off_1001219D8;
  }
  [v2 setObject:v4 forKeyedSubscript:@"rateLimitedInt"];
  uint64_t v5 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) rateLimitConfigurationName]);
  id v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = _DASDefaultConfigurationName;
  }
  [v2 setObject:v7 forKeyedSubscript:@"configurationName"];

  double v8 = (void *)objc_claimAutoreleasedReturnValue( +[_DASRateLimiterUtilities rateLimitIdentifierForActivity:]( &OBJC_CLASS____DASRateLimiterUtilities,  "rateLimitIdentifierForActivity:",  *(void *)(a1 + 32)));
  [v2 setObject:v8 forKeyedSubscript:@"group"];

  return v2;
}

void sub_10000E114(_Unwind_Exception *a1)
{
}

void sub_10000E26C(_Unwind_Exception *a1)
{
}

void sub_10000E334(_Unwind_Exception *a1)
{
}

void sub_10000ECC0(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1 + 32), "locked_modulateBudgets");
  objc_autoreleasePoolPop(v2);
}

id sub_10000ECF0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "locked_modulateBudgets");
}

LABEL_44:
          [v18 balance];
          v51 = v50;
          [v18 capacity];
          if (v51 != v52)
          {
            v53 = objc_claimAutoreleasedReturnValue([v18 lastModulatedDate]);
            if (!v53
              || (v54 = (void *)v53,
                  v55 = (void *)objc_claimAutoreleasedReturnValue([v18 lastModulatedDate]),
                  [v10 timeIntervalSinceDate:v55],
                  v57 = v56,
                  v55,
                  v54,
                  v57 >= 86400.0))
            {
              v63 = self->_log;
              if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
              {
                v64 = v63;
                v65 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue([v18 name]));
                *(_DWORD *)buf = 138412546;
                v77 = v65;
                v78 = 2048;
                v79 = v16;
                _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_INFO,  "Set %@ balance to %10.2lf",  buf,  0x16u);
              }

              [v18 capacity];
              v48 = v18;
              goto LABEL_52;
            }
          }

          v58 = self->_log;
          if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
          {
            v59 = v58;
            v60 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue([v18 name]));
            v61 = (void *)objc_claimAutoreleasedReturnValue([v18 lastModulatedDate]);
            v62 = (void *)objc_claimAutoreleasedReturnValue([v61 dateByAddingTimeInterval:86400.0]);
            *(_DWORD *)buf = 138412546;
            v77 = v60;
            v78 = 2112;
            v79 = *(double *)&v62;
            _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "%@ next refresh at %@", buf, 0x16u);

            uint64_t v13 = v70;
          }

    goto LABEL_45;
  }

  if ((xpc_get_event_name("com.apple.bg.system.task", a3, buf) & 1) != 0)
  {
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_100066724;
    v37[3] = &unk_100115DC8;
    v39 = a3;
    double v9 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", buf));
    v38 = v9;
    id v10 = objc_retainBlock(v37);
    service_uid_for_token = xpc_get_service_uid_for_token(a3);
    double v12 = (void *)objc_claimAutoreleasedReturnValue( +[_DASBGSystemTask taskNameWithIdentifier:UID:]( &OBJC_CLASS____DASBGSystemTask,  "taskNameWithIdentifier:UID:",  v9,  service_uid_for_token));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100157BD8 objectForKeyedSubscript:v12]);

    if (v13)
    {
      v14 = (os_log_s *)qword_100157BD0;
      if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v41 = 138543362;
        v42 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Skipping XPC_EVENT_PUBLISHER_ACTION_ADD since %{public}@ already exists",  v41,  0xCu);
      }
    }

    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) serviceNameFromToken:a3]);
      if ([v24 length])
      {
        v25 = -[_DASBGSystemTask initWithDescriptor:withToken:withUID:withService:staticSubmission:]( objc_alloc(&OBJC_CLASS____DASBGSystemTask),  "initWithDescriptor:withToken:withUID:withService:staticSubmission:",  v7,  a3,  service_uid_for_token,  v24,  1LL);
        if (v25)
        {
          v26 = *(void **)(a1 + 32);
          v36 = 0LL;
          v27 = [v26 dasSubmitActivity:v25 error:&v36];
          v28 = v36;
          v29 = (os_log_s *)qword_100157BD0;
          if ((v27 & 1) != 0)
          {
            if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v41 = 138543618;
              v42 = v24;
              v43 = 2114;
              v44 = v25;
              _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Created BGSystemTask on XPC add event from service %{public}@: %{public}@",  v41,  0x16u);
            }

            v30 = (void *)qword_100157BD8;
            v31 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBGSystemTask name](v25, "name"));
            [v30 setObject:v25 forKeyedSubscript:v31];
          }

          else
          {
            if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_ERROR)) {
              sub_1000B5FE0();
            }
            ((void (*)(void *))v10[2])(v10);
          }
        }

        else
        {
          if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_ERROR)) {
            sub_1000B5F80();
          }
          ((void (*)(void *))v10[2])(v10);
        }
      }

      else
      {
        if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_ERROR)) {
          sub_1000B5F20();
        }
        ((void (*)(void *))v10[2])(v10);
      }
    }

    goto LABEL_44;
  }

  if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_ERROR)) {
    sub_1000B6048();
  }
LABEL_45:
}

LABEL_53:
          if ((id)++v17 != v13) {
            continue;
          }
          uint64_t v13 = [obj countByEnumeratingWithState:&v72 objects:v82 count:16];
          if (!v13) {
            goto LABEL_55;
          }
          goto LABEL_3;
        case 3u:
          if (v15 < 0.0)
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBudgetModulator usageTimeline](self, "usageTimeline"));
            -[_DASBudgetModulator relativeUsageAtDate:withTimeline:]( self,  "relativeUsageAtDate:withTimeline:",  v10,  v31);
            v15 = v32;
          }

          [v18 capacity];
          v16 = v33 * (1.0 - v15);
          goto LABEL_29;
        case 4u:
          if (a4)
          {
            signed int v19 = (void *)objc_claimAutoreleasedReturnValue([v18 widgetBudgetID]);
            v20 = 0.0;
            if (a5 >= 1)
            {
              v22 = 1 - a5;
              signed int v21 = a5 + 1;
              do
              {
                int v23 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue([v10 dateByAddingTimeInterval:(double)(dword_1001574F0 * v22)]));
                -[_DASBudgetModulator locked_budgetAllocationProportionAtDate:forWidgetBudgetID:]( self,  "locked_budgetAllocationProportionAtDate:forWidgetBudgetID:",  *(void *)&v23,  v19);
                v15 = v24;
                v20 = v20 + v24;
                v25 = self->_log;
                if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412802;
                  v77 = v23;
                  v78 = 2048;
                  v79 = v15;
                  v80 = 2048;
                  v81 = v20;
                  _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "Relative usage at slot date %@ is %5.5f, total proportion until now is %5.5f",  buf,  0x20u);
                }

                --v21;
                ++v22;
              }

              while (v21 > 1);
            }

            a4 = v67;
            v14 = v68;
            uint64_t v13 = v70;
          }

          else
          {
            v20 = 0.05;
          }

          [v18 capacity];
          v16 = v20 * v34;
          v35 = self->_log;
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218240;
            v77 = v20 * 100.0;
            v78 = 2048;
            v79 = v16;
            _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_INFO,  "Allocating %5.5f%% of widget budget based on usage, resulting in a adjustment of %5.5f",  buf,  0x16u);
          }

          goto LABEL_29;
        default:
LABEL_29:
          if (a4) {
            goto LABEL_31;
          }
          goto LABEL_41;
      }
    }
  }

LABEL_55:
}

            p_info = (__objc2_class_ro **)(&OBJC_METACLASS____DASBackgroundAppKillDemo + 32);
            continue;
          }
        }
      }

      double v8 = [v5 countByEnumeratingWithState:&v54 objects:v67 count:16];
    }

    while (v8);
  }

  +[_DASMetricRecorder incrementOccurrencesForKey:byCount:]( _DASMetricRecorder,  "incrementOccurrencesForKey:byCount:",  @"com.apple.das.suspensioncount",  [v50 count]);
  return v50;
}

LABEL_11:
  -[_DASBudgetPersisting saveBudgets:](self->_persistence, "saveBudgets:", self->_budgets);
}

  return v8;
}

  startTime = self->_startTime;
  if (!startTime) {
    startTime = v3;
  }
  v14 = startTime;
  v15 = v14;
  v16 = 0.0;
  if (self->_minDurationBetweenInstances != 0.0 && (id)-[NSDate compare:](v14, "compare:", v7) == (id)1)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSDate dateByAddingTimeInterval:]( v15,  "dateByAddingTimeInterval:",  self->_minDurationBetweenInstances));
    [v17 timeIntervalSinceDate:v7];
    v16 = v18;
    signed int v19 = (void *)qword_1001579B8;
    if (os_log_type_enabled((os_log_t)qword_1001579B8, OS_LOG_TYPE_INFO))
    {
      v20 = v19;
      signed int v21 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBGSystemTask name](self, "name"));
      *(_DWORD *)v24 = 134218242;
      *(void *)&v24[4] = (uint64_t)v16;
      *(_WORD *)&v24[12] = 2114;
      *(void *)&v24[14] = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "Using temporary delay of %lld seconds to account for late fire of %{public}@",  v24,  0x16u);
    }
  }

  -[_DASBGSystemTask saveActivityBaseTime:](self, "saveActivityBaseTime:", v7, *(_OWORD *)v24);
  baseTime = self->_baseTime;
  self->_baseTime = v7;
  int v23 = v7;

  self->_tempDelay = v16;
LABEL_19:
}

  return (char)v9;
}

    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
    goto LABEL_28;
  }

  if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(_DASBGSystemTask **)(a1 + 32);
    double v8 = *(_DWORD *)(a1 + 64);
    double v9 = *(_DWORD *)(a1 + 68);
    *(_DWORD *)buf = 138543874;
    v29 = v7;
    v30 = 1024;
    v31 = v8;
    v32 = 1024;
    v33 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "submitTaskRequestWithIdentifier: Task %{public}@ from UID %d, PID %d already exists",  buf,  0x18u);
  }
}

  objc_sync_exit(v5);
  return v7;
}

  os_unfair_recursive_lock_unlock(p_activityStateLock);
  return v7;
}

  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Maximum Allowable Runtime: %lf", buf, 0xCu);
  }

  v7[2](v7, v10);
}
}
}

  os_unfair_recursive_lock_unlock(p_lock);
  return v10;
}

  os_unfair_recursive_lock_unlock(p_lock);
  return v7;
}

LABEL_42:
  return v20;
}

  v37 = (void *)objc_claimAutoreleasedReturnValue([v6 startDate]);
  v38 = (void *)objc_claimAutoreleasedReturnValue([v6 startAfter]);
  [v37 timeIntervalSinceDate:v38];
  v40 = round(v39 / (double)v11 * 5.0) * 20.0;

  v41 = 1000.0;
  if (v40 <= 1000.0) {
    v41 = v40;
  }
  v42 = fmax(v41, 0.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  v44 = (void *)objc_claimAutoreleasedReturnValue([v43 components:28 fromDate:v7]);
  v102 = v43;
  v45 = objc_claimAutoreleasedReturnValue([v43 dateFromComponents:v44]);

  v101 = (void *)v45;
  [v7 timeIntervalSinceDate:v45];
  v97 = (int)(v46 / 3600.0) % 24;
  v112[0] = v110;
  v111[0] = @"Name";
  v111[1] = @"Priority";
  v100 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v6 schedulingPriority]));
  v112[1] = v100;
  v111[2] = @"RuntimeMins";
  v99 = (void *)objc_claimAutoreleasedReturnValue([v6 startDate]);
  v107 = v7;
  if (v99)
  {
    [v7 timeIntervalSinceDate:v108];
    v48 = (const __CFString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  round(v47 / 60.0)));
  }

  else
  {
    v48 = &stru_100118C98;
  }

  v112[2] = v48;
  v112[3] = v109;
  v111[3] = @"Interval";
  v111[4] = @"Completed";
  v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4, v48));
  v112[4] = v98;
  v111[5] = @"Backlogged";
  v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 backlogged]));
  v112[5] = v96;
  v111[6] = @"AppLaunch";
  v95 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v6 requestsApplicationLaunch]));
  v112[6] = v95;
  v111[7] = @"LaunchType";
  v49 = objc_claimAutoreleasedReturnValue([v6 launchReason]);
  v94 = (void *)v49;
  if (v49) {
    v50 = (const __CFString *)v49;
  }
  else {
    v50 = &stru_100118C98;
  }
  v112[7] = v50;
  v111[8] = @"SuspendRequested";
  v93 = (void *)objc_claimAutoreleasedReturnValue([v6 suspendRequestDate]);
  v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v93 != 0LL));
  v112[8] = v92;
  v111[9] = @"RequiresInactivity";
  v91 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v6 requiresDeviceInactivity]));
  v112[9] = v91;
  v111[10] = @"RequiresPlugin";
  v90 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v6 requiresPlugin]));
  v112[10] = v90;
  v111[11] = @"RequiresInexpensive";
  v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v6 requiresInexpensiveNetworking]));
  v112[11] = v51;
  v111[12] = @"RequiresNetworking";
  v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v6 requiresNetwork]));
  v112[12] = v52;
  v111[13] = @"IsIntensive";
  v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v6 isIntensive]));
  v112[13] = v53;
  v112[14] = v29;
  v103 = v36;
  v104 = v29;
  v111[14] = @"TimeWindow";
  v111[15] = @"DeadlineDelta";
  v112[15] = v36;
  v111[16] = @"DeadlinePct";
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v42));
  v112[16] = v54;
  v111[17] = @"DeadlinePctHist";
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v42));
  v112[17] = v55;
  v111[18] = @"RecentlyUpdated";
  v56 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  +[_DASConfig hasRecentlyUpdated](&OBJC_CLASS____DASConfig, "hasRecentlyUpdated")));
  v112[18] = v56;
  v111[19] = @"TimeSlot";
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v97));
  v112[19] = v57;
  v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v112,  v111,  20LL));
  v59 = [v58 mutableCopy];

  if (v99) {
  if ([v6 lastDenialValue])
  }
  {
    v60 = (void *)objc_claimAutoreleasedReturnValue( +[_DASConditionScore lastDenialResponses:]( &OBJC_CLASS____DASConditionScore,  "lastDenialResponses:",  v6));
    if ([v60 count])
    {
      v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v60));
      v62 = (void *)objc_claimAutoreleasedReturnValue([v61 anyObject]);
      [v59 setObject:v62 forKeyedSubscript:@"SuspensionReason"];
    }
  }

  v63 = (void *)objc_claimAutoreleasedReturnValue([v106 objectForKeyedSubscript:@"batteryLevel"]);

  if (v63)
  {
    v64 = (void *)objc_claimAutoreleasedReturnValue([v106 objectForKeyedSubscript:@"batteryLevel"]);
    [v59 setObject:v64 forKeyedSubscript:@"StartBatteryLevel"];
  }

  v65 = (void *)objc_claimAutoreleasedReturnValue([v106 objectForKeyedSubscript:@"nwInterface"]);

  if (v65)
  {
    v66 = (void *)objc_claimAutoreleasedReturnValue([v106 objectForKeyedSubscript:@"nwInterface"]);
    [v59 setObject:v66 forKeyedSubscript:@"StartNWInterface"];
  }

  v67 = (void *)objc_claimAutoreleasedReturnValue([v106 objectForKeyedSubscript:@"nwQuality"]);

  if (v67)
  {
    v68 = (void *)objc_claimAutoreleasedReturnValue([v106 objectForKeyedSubscript:@"nwQuality"]);
    [v59 setObject:v68 forKeyedSubscript:@"StartNWQuality"];
  }

  v69 = (void *)objc_claimAutoreleasedReturnValue([v106 objectForKeyedSubscript:@"onCharger"]);

  if (v69)
  {
    v70 = (void *)objc_claimAutoreleasedReturnValue([v106 objectForKeyedSubscript:@"onCharger"]);
    [v59 setObject:v70 forKeyedSubscript:@"StartedOnCharger"];
  }

  v71 = (void *)objc_claimAutoreleasedReturnValue([v106 objectForKeyedSubscript:@"idle"]);

  if (v71)
  {
    v72 = (void *)objc_claimAutoreleasedReturnValue([v106 objectForKeyedSubscript:@"idle"]);
    [v59 setObject:v72 forKeyedSubscript:@"StartIdle"];
  }

  v73 = (void *)objc_claimAutoreleasedReturnValue([v105 objectForKeyedSubscript:@"thermalLevel"]);

  if (v73)
  {
    v74 = (void *)objc_claimAutoreleasedReturnValue([v105 objectForKeyedSubscript:@"thermalLevel"]);
    [v59 setObject:v74 forKeyedSubscript:@"EndingThermalPressure"];
  }

  v75 = (void *)objc_claimAutoreleasedReturnValue([v105 objectForKeyedSubscript:@"batteryLevel"]);

  if (v75)
  {
    v76 = (void *)objc_claimAutoreleasedReturnValue([v105 objectForKeyedSubscript:@"batteryLevel"]);
    [v59 setObject:v76 forKeyedSubscript:@"EndBatteryLevel"];
  }

  v77 = (void *)objc_claimAutoreleasedReturnValue([v105 objectForKeyedSubscript:@"nwInterface"]);

  if (v77)
  {
    v78 = (void *)objc_claimAutoreleasedReturnValue([v105 objectForKeyedSubscript:@"nwInterface"]);
    [v59 setObject:v78 forKeyedSubscript:@"EndNWInterface"];
  }

  v79 = (void *)objc_claimAutoreleasedReturnValue([v105 objectForKeyedSubscript:@"nwQuality"]);

  if (v79)
  {
    v80 = (void *)objc_claimAutoreleasedReturnValue([v105 objectForKeyedSubscript:@"nwQuality"]);
    [v59 setObject:v80 forKeyedSubscript:@"EndNWQuality"];
  }

  v81 = (void *)objc_claimAutoreleasedReturnValue([v105 objectForKeyedSubscript:@"onCharger"]);

  if (v81)
  {
    v82 = (void *)objc_claimAutoreleasedReturnValue([v105 objectForKeyedSubscript:@"onCharger"]);
    [v59 setObject:v82 forKeyedSubscript:@"EndedOnCharger"];
  }

  v83 = (void *)objc_claimAutoreleasedReturnValue([v105 objectForKeyedSubscript:@"idle"]);

  if (v83)
  {
    v84 = (void *)objc_claimAutoreleasedReturnValue([v105 objectForKeyedSubscript:@"idle"]);
    [v59 setObject:v84 forKeyedSubscript:@"EndIdle"];
  }

  v85 = (void *)objc_claimAutoreleasedReturnValue([v105 objectForKeyedSubscript:@"thermalLevel"]);

  if (v85)
  {
    v86 = (void *)objc_claimAutoreleasedReturnValue([v105 objectForKeyedSubscript:@"thermalLevel"]);
    [v59 setObject:v86 forKeyedSubscript:@"EndingThermalPressure"];
  }

  v87 = [v59 copy];

  return v87;
}

void sub_100010FC8(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_100157500;
  qword_100157500 = (uint64_t)v1;
}

void sub_1000110A8(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 8) objectForKey:@"budgets"]);
  id v3 = [v2 mutableCopy];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v3;

  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v6 = *(id *)(a1 + 40);
  id v7 = [v6 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v25;
    *(void *)&__int128 v8 = 138412290LL;
    __int128 v23 = v8;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v6);
        }
        double v12 = *(_DASWidgetRefreshBudget **)(*((void *)&v24 + 1) + 8LL * (void)i);
        uint64_t v13 = *(void **)(a1 + 32);
        v14 = (void *)v13[2];
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "convertNameFromFullToCompact:", v12, v23, (void)v24));
        v16 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v15]);
        id v17 = [v16 mutableCopy];

        if (v17)
        {
          [v17 setObject:v12 forKeyedSubscript:@"name"];
          v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"budgetID"]);

          if (!v18)
          {
            signed int v19 = (void *)objc_claimAutoreleasedReturnValue( +[_DASWidgetRefreshBudgetManager widgetBudgetIDFromBudgetName:]( &OBJC_CLASS____DASWidgetRefreshBudgetManager,  "widgetBudgetIDFromBudgetName:",  v12));
            [v17 setObject:v19 forKeyedSubscript:@"budgetID"];
          }

          v20 = -[_DASWidgetRefreshBudget initWithDictionary:]( objc_alloc(&OBJC_CLASS____DASWidgetRefreshBudget),  "initWithDictionary:",  v17);
          if (v20) {
            [*(id *)(a1 + 48) addObject:v20];
          }
          signed int v21 = *(os_log_s **)(*(void *)(a1 + 32) + 24LL);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v23;
            v29 = v20;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Found in store: %@", buf, 0xCu);
          }
        }

        else
        {
          v22 = *(os_log_s **)(*(void *)(a1 + 32) + 24LL);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v23;
            v29 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "Budget for %@ not found in store",  buf,  0xCu);
          }
        }
      }

      id v9 = [v6 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }

    while (v9);
  }
}

id sub_1000113C4(uint64_t a1)
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v5 = *(id *)(a1 + 40);
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        double v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dictionaryRepresentation", (void)v17));
        double v12 = *(void **)(a1 + 32);
        uint64_t v13 = (void *)v12[2];
        v14 = (void *)objc_claimAutoreleasedReturnValue([v10 name]);
        v15 = (void *)objc_claimAutoreleasedReturnValue([v12 convertNameFromFullToCompact:v14]);
        [v13 setObject:v11 forKeyedSubscript:v15];
      }

      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v7);
  }

  return [*(id *)(*(void *)(a1 + 32) + 8) setObject:*(void *)(*(void *)(a1 + 32) + 16) forKey:@"budgets"];
}

id sub_1000115C0(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) dictionaryRepresentation]);
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = (void *)v3[2];
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) name]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 convertNameFromFullToCompact:v5]);
  [v4 setObject:v2 forKeyedSubscript:v6];

  return [*(id *)(*(void *)(a1 + 32) + 8) setObject:*(void *)(*(void *)(a1 + 32) + 16) forKey:@"budgets"];
}

id sub_1000116CC(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) setObject:*(void *)(a1 + 40) forKey:@"lastModulation"];
}

uint64_t sub_1000117B8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000117C8(uint64_t a1)
{
}

void sub_1000117D0(uint64_t a1)
{
}

void sub_100011BA4(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  v2 = (void *)qword_100157508;
  qword_100157508 = (uint64_t)v1;
}

int64_t sub_100011CCC(id a1, NSNumber *a2, NSNumber *a3)
{
  uint64_t v4 = a2;
  id v5 = a3;
  -[NSNumber doubleValue](v4, "doubleValue");
  double v7 = v6;
  -[NSNumber doubleValue](v5, "doubleValue");
  if (v7 <= v8)
  {
    -[NSNumber doubleValue](v4, "doubleValue");
    double v11 = v10;
    -[NSNumber doubleValue](v5, "doubleValue");
    int64_t v9 = v11 < v12;
  }

  else
  {
    int64_t v9 = -1LL;
  }

  return v9;
}

void sub_1000123C4(uint64_t a1)
{
  id v1 = -[_DASRemoteDeviceNearbyMonitor initWithDaemon:]( objc_alloc(&OBJC_CLASS____DASRemoteDeviceNearbyMonitor),  "initWithDaemon:",  *(void *)(a1 + 32));
  v2 = (void *)qword_100157520;
  qword_100157520 = (uint64_t)v1;
}

id sub_1000125F8(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pendingWidgets]);
  [v2 addObject:*(void *)(a1 + 40)];

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12LL));
  return [*(id *)(a1 + 32) protectedRegisterForRemoteDevices];
}

id sub_100012700(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pendingWidgets]);
  unsigned int v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if (v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pendingWidgets]);
    [v4 removeObject:*(void *)(a1 + 40)];
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12LL));
  return [*(id *)(a1 + 32) protectedRegisterForRemoteDevices];
}

void sub_1000129E0(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pendingWidgets", 0));
  id v4 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        if (*(void *)(a1 + 40))
        {
          double v8 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
          uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 remoteDevice]);
          if (v9)
          {
            double v10 = (void *)v9;
            double v11 = *(void **)(a1 + 40);
            double v12 = (void *)objc_claimAutoreleasedReturnValue([v8 remoteDevice]);
            LODWORD(v11) = [v11 isEqualToString:v12];

            if ((_DWORD)v11) {
              [v2 addObject:v8];
            }
          }
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }

    while (v5);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12LL));
  if ([v2 count])
  {
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"NWBrowser"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v21 = v14;
      __int16 v22 = 2112;
      __int128 v23 = v2;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Remote device nearby: %@, Re-evaluating activities: %@",  buf,  0x16u);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) daemon]);
    [v15 evaluateScoreAndRunActivities:v2];
  }
}

void sub_100013408(_Unwind_Exception *a1)
{
}

void sub_100013424(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = a3;
  char changes = nw_browse_result_get_changes(v5, v6);
  if ((changes & 2) != 0)
  {
    nw_endpoint_t v14 = nw_browse_result_copy_endpoint(v6);
    nw_endpoint_t v9 = v14;
    if (v14)
    {
      uint64_t device_id = nw_endpoint_get_device_id(v14);
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      double v12 = WeakRetained;
      if (!device_id || !WeakRetained) {
        goto LABEL_16;
      }
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", device_id));
      [v12 updateDeviceNearby:v13];
LABEL_11:

LABEL_16:
      goto LABEL_17;
    }

    double v12 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"NWBrowser"));
    if (!os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
LABEL_15:
    sub_1000B13A8();
    goto LABEL_16;
  }

  if ((changes & 4) != 0)
  {
    nw_endpoint_t v8 = nw_browse_result_copy_endpoint(v5);
    nw_endpoint_t v9 = v8;
    if (v8)
    {
      uint64_t v10 = nw_endpoint_get_device_id(v8);
      id v11 = objc_loadWeakRetained((id *)(a1 + 32));
      double v12 = v11;
      if (!v10 || !v11) {
        goto LABEL_16;
      }
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v10));
      [v12 updateDeviceLost:v13];
      goto LABEL_11;
    }

    double v12 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"NWBrowser"));
    if (!os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }

LABEL_17:
}

  if (-[NSMutableSet containsObject:](self->_runningTasks, "containsObject:", v4))
  {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v4 suspendRequestDate]);
    if (v21
      || (uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v4 startDate])) == 0
      || ([v4 requestsApplicationLaunch] & 1) != 0)
    {
LABEL_19:

      goto LABEL_20;
    }

    v35 = (void *)objc_claimAutoreleasedReturnValue([v4 clientName]);
    v36 = [v35 isEqualToString:_DASClientNameBGST];

    if ((v36 & 1) == 0)
    {
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"misuse"));
      if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
        *(_DWORD *)buf = 138412290;
        v49 = v37;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v21,  OS_LOG_TYPE_DEFAULT,  "Please file a bug for %@ – the activity deferred without being asked to defer",  buf,  0xCu);
      }

      goto LABEL_19;
    }
  }

void sub_1000135B4(id a1, int a2, OS_nw_error *a3)
{
  id v4 = a3;
  switch(a2)
  {
    case 0:
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"NWBrowser"));
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
        goto LABEL_13;
      }
      __int16 v13 = 0;
      uint64_t v6 = "Browser entered invalid state";
      double v7 = (uint8_t *)&v13;
      break;
    case 1:
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"NWBrowser"));
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
        goto LABEL_13;
      }
      __int16 v12 = 0;
      uint64_t v6 = "Browser entered ready state";
      double v7 = (uint8_t *)&v12;
      break;
    case 2:
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"NWBrowser"));
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
        goto LABEL_13;
      }
      __int16 v11 = 0;
      uint64_t v6 = "Browser entered failed state";
      double v7 = (uint8_t *)&v11;
      break;
    case 3:
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"NWBrowser"));
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
        goto LABEL_13;
      }
      __int16 v10 = 0;
      uint64_t v6 = "Browser entered cancelled state";
      double v7 = (uint8_t *)&v10;
      break;
    case 4:
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"NWBrowser"));
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
        goto LABEL_13;
      }
      __int16 v9 = 0;
      uint64_t v6 = "Browser entered waiting state";
      double v7 = (uint8_t *)&v9;
      break;
    default:
      goto LABEL_14;
  }

  _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, v6, v7, 2u);
LABEL_13:

LABEL_14:
  if (v4)
  {
    nw_endpoint_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"NWBrowser"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000B13D4();
    }
  }
}

void sub_1000138C4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

LABEL_14:
        nw_endpoint_t v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      __int128 v18 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      __int16 v12 = v18;
      if (!v18)
      {
LABEL_20:

        -[_DASPredictionAccuracy setTotalPredictionIntervals:]( v10,  "setTotalPredictionIntervals:",  -[_DASPredictionAccuracy totalPredictionIntervals](v10, "totalPredictionIntervals") + 1);
        nw_endpoint_t v8 = v20;
        break;
      }
    }
  }

  return v10;
}

  return v11;
}
    }
  }

  else
  {
    __int128 v19 = v8->_log;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 v24 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "No bundleIdentifier was associated with the process handle, aborting state transition",  v24,  2u);
    }
  }

  objc_sync_exit(v8);
}

        nw_endpoint_t v8 = (char *)v8 + 1;
      }

      while (v4 != v8);
      id v4 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }

    while (v4);
  }

  __int128 v24 = (os_log_s *)v3[42].isa;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v25 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    *(_DWORD *)buf = 138543362;
    v34 = v25;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Resubmitting running BGSTs to DAS %{public}@",  buf,  0xCu);
  }

  return [(id)qword_100157BE8 resubmitRunningActivities:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}
  }

uint64_t sub_1000140C4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  a2,  *(void *)(a1 + 32));
}

LABEL_27:
  -[_DASKnapsackSolver reset](v11, "reset");
  __int128 v27 = -[NSSet initWithObjects:](objc_alloc(&OBJC_CLASS___NSSet), "initWithObjects:", &off_1001219F0, 0LL);
LABEL_28:
  objc_sync_exit(v11);

  return v27;
}

      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7[133], "keyPathForThermalPressureLevel", v31));
      if ([v9 isEqual:v18])
      {
        __int128 v19 = 1;
      }

      else
      {
        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v7[133] keyPathForInUseStatus]);
        if ([v9 isEqual:v20])
        {
          __int128 v19 = 1;
        }

        else
        {
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualKeyPath ephemeralKeyPathWithKey:]( &OBJC_CLASS____CDContextualKeyPath,  "ephemeralKeyPathWithKey:",  @"/system/peakPowerPressureLevel"));
          if ([v9 isEqual:v21])
          {
            __int128 v19 = 1;
          }

          else
          {
            v33 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForEnergyBudgetRemainingStatus]( &OBJC_CLASS____CDContextQueries,  "keyPathForEnergyBudgetRemainingStatus"));
            __int128 v19 = [v9 isEqual:v33];
          }

          double v7 = &AnalyticsSendEventLazy_ptr;
        }
      }

      if ((v3 & 1) != 0)
      {
LABEL_50:
        __int128 v23 = 0;
        __int128 v24 = v38;
        goto LABEL_51;
      }

    +[_DASMetricRecorder incrementOccurrencesForKey:byCount:]( &OBJC_CLASS____DASMetricRecorder,  "incrementOccurrencesForKey:byCount:",  @"com.apple.das.submitcount.all",  1LL);
    v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v33 = (void *)objc_claimAutoreleasedReturnValue([v8 submitDate]);
    v34 = v33 == 0LL;

    if (v34) {
      [v8 setSubmitDate:v105];
    }
    if (+[_DASCheckpointRecorder shouldLogCheckpointForActivity:]( &OBJC_CLASS____DASCheckpointRecorder,  "shouldLogCheckpointForActivity:",  v8))
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[_DASCheckpointRecorder sharedInstance](&OBJC_CLASS____DASCheckpointRecorder, "sharedInstance"));
      [v35 reportTaskCheckpoint:10 forTask:v8 error:0];
    }

    v36 = (void *)objc_claimAutoreleasedReturnValue([v8 featureCodes]);
    if (v36)
    {
    }

    else
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue([v8 fastPass]);
      v38 = v37 == 0LL;

      if (v38) {
        goto LABEL_35;
      }
    }

    v39 = (void *)objc_claimAutoreleasedReturnValue(+[_DASCheckpointRecorder sharedInstance](&OBJC_CLASS____DASCheckpointRecorder, "sharedInstance"));
    v40 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
    v41 = (void *)objc_claimAutoreleasedReturnValue([v8 featureCodes]);
    v42 = (void *)objc_claimAutoreleasedReturnValue([v8 fastPass]);
    objc_msgSend( v39,  "addFeatureCodesForTask:featureCodes:semanticVersion:",  v40,  v41,  objc_msgSend(v42, "semanticVersion"));

LABEL_35:
    v43 = (void *)objc_claimAutoreleasedReturnValue([v8 producedResultIdentifiers]);
    if (v43)
    {
    }

    else
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue([v8 dependencies]);
      v45 = v44 == 0LL;

      if (v45) {
        goto LABEL_46;
      }
    }

    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    v119 = 0u;
    v120 = 0u;
    v118 = 0u;
    v117 = 0u;
    v47 = (void *)objc_claimAutoreleasedReturnValue([v8 dependencies]);
    v48 = [v47 countByEnumeratingWithState:&v117 objects:v121 count:16];
    if (v48)
    {
      v49 = *(void *)v118;
      do
      {
        for (i = 0LL; i != v48; i = (char *)i + 1)
        {
          if (*(void *)v118 != v49) {
            objc_enumerationMutation(v47);
          }
          v51 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v117 + 1) + 8 * (void)i) identifier]);
          [v46 addObject:v51];
        }

        v48 = [v47 countByEnumeratingWithState:&v117 objects:v121 count:16];
      }

      while (v48);
    }

    v52 = (void *)objc_claimAutoreleasedReturnValue(+[_DASCheckpointRecorder sharedInstance](&OBJC_CLASS____DASCheckpointRecorder, "sharedInstance"));
    v53 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
    v54 = (void *)objc_claimAutoreleasedReturnValue([v8 producedResultIdentifiers]);
    [v52 addDependencyInfoForTask:v53 producedResultIdentifiers:v54 dependencyIdentifiers:v46];

LABEL_46:
    -[_DASRuntimeLimiter maximumRuntimeForActivity:](self->_runtimeLimiter, "maximumRuntimeForActivity:", v8);
    [v8 setMaximumRuntime:(uint64_t)v55];
    -[_DASDaemon computeStaticPriorityForActivity:](v21, "computeStaticPriorityForActivity:", v8);
    -[_DASDaemon clearActivityFromPrerunning:](v21, "clearActivityFromPrerunning:", v8);
    +[_DASConditionScore setActivityShouldBypassPredictions:]( &OBJC_CLASS____DASConditionScore,  "setActivityShouldBypassPredictions:",  v8);
    if ([v8 requestsApplicationLaunch])
    {
      v56 = (void *)objc_claimAutoreleasedReturnValue([v8 launchReason]);
      v57 = [v56 isEqualToString:_DASLaunchReasonBackgroundRemoteNotification];

      if (v57)
      {
        v58 = [v8 isSilentPush];
        +[_DASMetricRecorder incrementOccurrencesForKey:byCount:]( &OBJC_CLASS____DASMetricRecorder,  "incrementOccurrencesForKey:byCount:",  @"com.apple.das.push.count",  1LL);
        v59 = [v8 schedulingPriority];
        if ((unint64_t)v59 >= _DASSchedulingPriorityBackground)
        {
          +[_DASMetricRecorder incrementOccurrencesForKey:byCount:]( &OBJC_CLASS____DASMetricRecorder,  "incrementOccurrencesForKey:byCount:",  @"com.apple.das.highprioritypush",  1LL);
          if (v58)
          {
            +[_DASMetricRecorder incrementOccurrencesForKey:byCount:]( &OBJC_CLASS____DASMetricRecorder,  "incrementOccurrencesForKey:byCount:",  @"com.apple.das.silentpush.highprioritycount",  1LL);
            +[_DASMetricRecorder incrementOccurrencesForKey:byCount:]( &OBJC_CLASS____DASMetricRecorder,  "incrementOccurrencesForKey:byCount:",  @"com.apple.das.silentpush.count",  1LL);
            v60 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar"));
            if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
            {
              v61 = (void *)objc_claimAutoreleasedReturnValue([v8 relatedApplications]);
              v62 = (void *)objc_claimAutoreleasedReturnValue([v61 firstObject]);
              sub_1000B7E30(v62, (uint64_t)buf, v60, v61);
            }

            v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v8));
            -[_DASDaemon cancelActivities:](v21, "cancelActivities:", v63);

            v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  _DASActivitySchedulerErrorDomain,  3LL,  &off_1001224E8));
            v10[2](v10, 0LL, v64);

            goto LABEL_92;
          }
        }

        else
        {
          +[_DASMetricRecorder incrementOccurrencesForKey:byCount:]( &OBJC_CLASS____DASMetricRecorder,  "incrementOccurrencesForKey:byCount:",  @"com.apple.das.lowprioritypush",  1LL);
          if (v58) {
            +[_DASMetricRecorder incrementOccurrencesForKey:byCount:]( &OBJC_CLASS____DASMetricRecorder,  "incrementOccurrencesForKey:byCount:",  @"com.apple.das.silentpush.count",  1LL);
          }
        }

        barScheduler = v21->_barScheduler;
        v66 = (void *)objc_claimAutoreleasedReturnValue([v8 relatedApplications]);
        v67 = (void *)objc_claimAutoreleasedReturnValue([v66 firstObject]);
        v68 = -[_DASBARScheduler pushLaunchAllowedForApp:immediately:]( barScheduler,  "pushLaunchAllowedForApp:immediately:",  v67,  buf);

        if (buf[0]) {
          v69 = v68;
        }
        else {
          v69 = 0;
        }
        if (v69 == 1)
        {
          v10[2](v10, 1LL, 0LL);
          -[_DASDaemon addLaunchRequest:](v21, "addLaunchRequest:", v8);
          -[_DASDaemon immediatelyBeginWorkForActivity:](v21, "immediatelyBeginWorkForActivity:", v8);
          goto LABEL_92;
        }

        v70 = [v8 schedulingPriority];
        if (((v68 | v58 ^ 1) & 1) == 0) {
          +[_DASMetricRecorder recordOccurrenceForKey:]( &OBJC_CLASS____DASMetricRecorder,  "recordOccurrenceForKey:",  @"com.apple.das.silentpush.pushnotallowedcount");
        }
        v71 = v21->_barScheduler;
        v72 = (void *)objc_claimAutoreleasedReturnValue([v8 relatedApplications]);
        v73 = (void *)objc_claimAutoreleasedReturnValue([v72 firstObject]);
        LODWORD(v71) = -[_DASBARScheduler isNewsstandApp:](v71, "isNewsstandApp:", v73);

        if ((_DWORD)v71) {
          [v8 setRequestsNewsstandLaunch:1];
        }
      }
    }

    if (([v8 requestsApplicationLaunch] & 1) != 0
      || [v8 requestsExtensionLaunch])
    {
      if (!-[_DASDaemon addLaunchRequest:](v21, "addLaunchRequest:", v8))
      {
        v99 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar"));
        if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
        {
          v100 = (void *)objc_claimAutoreleasedReturnValue([v8 relatedApplications]);
          v101 = (void *)objc_claimAutoreleasedReturnValue([v100 firstObject]);
          sub_1000B7DDC(v101, (uint64_t)buf, v99, v100);
        }

        v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v8));
        -[_DASDaemon cancelActivities:](v21, "cancelActivities:", v102);

        v103 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  _DASActivitySchedulerErrorDomain,  5LL,  &off_100122510));
        v10[2](v10, 0LL, v103);

        goto LABEL_92;
      }

      if ([v8 requestsApplicationLaunch])
      {
        +[_DASMetricRecorder incrementOccurrencesForKey:byCount:]( &OBJC_CLASS____DASMetricRecorder,  "incrementOccurrencesForKey:byCount:",  @"com.apple.das.submitcount.launch",  1LL);
        v74 = (void *)objc_claimAutoreleasedReturnValue([v8 relatedApplications]);
        v75 = [v74 count];

        if (v75) {
          -[_DASDaemon advanceAppLaunchDateIfNecessaryForActivity:]( v21,  "advanceAppLaunchDateIfNecessaryForActivity:",  v8);
        }
      }
    }

    -[_DASActivityDependencyManager beginDependencyMonitoringForActivity:]( v21->_dependencyManager,  "beginDependencyMonitoringForActivity:",  v8);
    v76 = (void *)objc_claimAutoreleasedReturnValue([v8 remoteDevice]);
    if (v76)
    {
      v77 = [v8 targetDevice] == (id)3;

      if (v77) {
        -[_DASRemoteDeviceNearbyMonitor registerForRemoteDeviceWithActivity:]( v21->_remoteDeviceNearbyMonitor,  "registerForRemoteDeviceWithActivity:",  v8);
      }
    }

    v78 = (void *)objc_claimAutoreleasedReturnValue([v8 remoteDevice]);
    if (v78)
    {
      v79 = [v8 requiresRemoteDeviceWake];

      if (v79) {
        -[_DASRemoteDeviceWakeMonitor registerRemoteDeviceWakeStateWithActivity:]( v21->_remoteDeviceWakeMonitor,  "registerRemoteDeviceWakeStateWithActivity:",  v8);
      }
    }

    if (-[_DASNetworkEvaluationMonitor requiresNetworkPathMonitoring:]( v21->_networkEvaluationMonitor,  "requiresNetworkPathMonitoring:",  v8))
    {
      +[_DASMetricRecorder incrementOccurrencesForKey:byCount:]( &OBJC_CLASS____DASMetricRecorder,  "incrementOccurrencesForKey:byCount:",  @"com.apple.das.submitcount.network",  1LL);
      networkEvaluationMonitor = v21->_networkEvaluationMonitor;
      v81 = (void *)objc_claimAutoreleasedReturnValue([v8 uuid]);
      v82 = (void *)objc_claimAutoreleasedReturnValue( +[_DASNetworkEvaluationMonitor nwParametersForActivity:]( &OBJC_CLASS____DASNetworkEvaluationMonitor,  "nwParametersForActivity:",  v8));
      v83 = (void *)objc_claimAutoreleasedReturnValue([v8 userInfo]);
      v84 = (void *)objc_claimAutoreleasedReturnValue([v83 objectForKeyedSubscript:kNWEndpointKey]);
      -[_DASNetworkEvaluationMonitor startMonitoringActivity:withNetworkParameters:withEndpoint:]( networkEvaluationMonitor,  "startMonitoringActivity:withNetworkParameters:withEndpoint:",  v81,  v82,  v84);
    }

    -[_DASDaemon recordToTaskRegistry:lifeCycleStateName:]( v21,  "recordToTaskRegistry:lifeCycleStateName:",  v8,  @"submitted");
    v10[2](v10, 1LL, 0LL);
    evaluationQueue = (dispatch_queue_s *)v21->_evaluationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10008B774;
    block[3] = &unk_100115120;
    v86 = v8;
    v114 = v86;
    v115 = v21;
    v87 = v105;
    v116 = v87;
    dispatch_async(evaluationQueue, block);
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    v123 = sub_100084B3C;
    *(void *)v124 = sub_100084B4C;
    *(void *)&v124[8] = 0LL;
    timerSchedulingQueue = (dispatch_queue_s *)v21->_timerSchedulingQueue;
    v108[0] = _NSConcreteStackBlock;
    v108[1] = 3221225472LL;
    v108[2] = sub_10008B8C0;
    v108[3] = &unk_100117038;
    v89 = v87;
    v109 = v89;
    v90 = v86;
    v110 = v90;
    v111 = v21;
    v112 = buf;
    dispatch_sync(timerSchedulingQueue, v108);
    if (*(void *)(*(void *)&buf[8] + 40LL))
    {
      v91 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
      if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG)) {
        sub_1000B7D7C();
      }

      v92 = (void *)objc_claimAutoreleasedReturnValue([v90 name]);
      [*(id *)(*(void *)&buf[8] + 40) timeIntervalSinceDate:v89];
      v94 = v93;
      v95 = (void *)objc_claimAutoreleasedReturnValue([v90 startBefore]);
      [v95 timeIntervalSinceDate:v89];
      v97 = v96;
      v98 = [v90 schedulingPriority];
      -[_DASDaemon scheduleTimerOnBehalfOf:between:and:waking:]( v21,  "scheduleTimerOnBehalfOf:between:and:waking:",  v92,  (unint64_t)v98 > _DASSchedulingPriorityUtility,  v94,  v97);
    }

    _Block_object_dispose(buf, 8);
LABEL_92:

    objc_autoreleasePoolPop(context);
    objc_sync_exit(v21);

    goto LABEL_93;
  }

  v125 = @"exhaustedRuntimeFeatureCodes";
  v15 = (void *)objc_claimAutoreleasedReturnValue( -[_DASRuntimeLimiter exhaustedRuntimeFeatureCodesAssociatedWithActivity:]( self->_runtimeLimiter,  "exhaustedRuntimeFeatureCodesAssociatedWithActivity:",  v8));
  __int128 v16 = v15;
  if (!v15) {
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v126 = v16;
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v126,  &v125,  1LL));
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  _DASActivitySchedulerErrorDomain,  7LL,  v17));

  if (!v15) {
  __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"featureDurationTracker"));
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Rejecting submission of %@ with error: %@!",  buf,  0x16u);
  }

  v10[2](v10, 0LL, v18);
LABEL_93:
}

                    __int128 v16 = (char *)v16 + 1;
                  }

                  while (v14 != v16);
                  __int128 v27 = [v13 countByEnumeratingWithState:&v76 objects:v93 count:16];
                  nw_endpoint_t v14 = v27;
                }

                while (v27);
              }

              os_unfair_recursive_lock_unlock(p_applicationLaunchRequestsLock);
              -[_DASDaemon cancelActivities:](self, "cancelActivities:", v12);
              v28 = (void *)objc_claimAutoreleasedReturnValue( +[_DASApplicationPolicy policyInstance]( &OBJC_CLASS____DASApplicationPolicy,  "policyInstance"));
              [v28 updateAppLaunchedRecently:v68];

              __int16 v10 = v64 + 1;
              if (v64 + 1 != v62) {
                continue;
              }
              break;
            }

            v62 = (char *)[v60 countByEnumeratingWithState:&v80 objects:v94 count:16];
            if (v62) {
              continue;
            }
            break;
          }

void sub_1000147F0(_Unwind_Exception *a1)
{
}

void sub_100014A20(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  uint64_t v2 = (void *)qword_100157530;
  qword_100157530 = (uint64_t)v1;
}

void sub_100014B00(id a1)
{
  os_log_t v1 = os_log_create("com.apple.duetactivityscheduler", "budgetShMem");
  uint64_t v2 = (void *)qword_100157548;
  qword_100157548 = (uint64_t)v1;
}

void sub_100014C1C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100014C34(uint64_t a1)
{
  int v2 = shm_open((const char *)[@"com.apple.dasd.budgets" UTF8String], 2, 384);
  if (v2 != -1) {
    goto LABEL_2;
  }
  unsigned int v3 = *(os_log_s **)(a1 + 32);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Creating shared memory for budgeting (likely after reboot)",  buf,  2u);
  }

  int v4 = shm_open((const char *)[@"com.apple.dasd.budgets" UTF8String], 514, 384);
  if (v4 == -1)
  {
    double v7 = *(void **)(a1 + 32);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
      sub_1000B1434(v7);
    }
  }

  else
  {
    int v2 = v4;
    if (ftruncate(v4, 0x4000LL) != -1)
    {
LABEL_2:
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = mmap(0LL, 0x4000uLL, 3, 1, v2, 0LL);
      close(v2);
      if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) == -1LL)
      {
        uint64_t v6 = *(void **)(a1 + 32);
        if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR)) {
          sub_1000B151C(v6);
        }
      }

      else
      {
        qword_100157550 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
      }

      return;
    }

    close(v2);
    id v5 = *(void **)(a1 + 32);
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
      sub_1000B14A8(v5);
    }
  }

uint64_t sub_100014F44(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100014F54(uint64_t a1)
{
}

void sub_100014F5C(uint64_t a1)
{
  id v2 = objc_alloc_init(*(Class *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8LL);
  int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_1000150A0(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) budgetToIndex]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) name]);
  id v14 = (id)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:v3]);

  int v4 = v14;
  if (v14)
  {
    unsigned __int8 v5 = [v14 unsignedIntValue];
    [*(id *)(a1 + 40) capacity];
    uint64_t v6 = v5;
    *(void *)(qword_100157550 + ((unint64_t)v5 << 6) + 40) = v7;
    [*(id *)(a1 + 40) balance];
    *(void *)(qword_100157550 + ((unint64_t)v5 << 6) + 4_Block_object_dispose(va, 8) = v8;
    unsigned __int8 v9 = [*(id *)(a1 + 40) allocationType];
    *(_BYTE *)(qword_100157550 + ((unint64_t)v5 << 6) + 56) = v9;
    __int16 v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) lastModulatedDate]);

    if (v10)
    {
      __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) lastModulatedDate]);
      [v11 timeIntervalSinceReferenceDate];
      double v13 = v12;
    }

    else
    {
      double v13 = -1.0;
    }

    *(double *)(qword_100157550 + (v6 << 6) + 64) = v13;
    int v4 = v14;
  }
}

void sub_100015230(uint64_t a1)
{
  id v2 = malloc(0x810uLL);
  bzero(v2, 0x810uLL);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASSharedMemoryBudgetPersistence log](&OBJC_CLASS____DASSharedMemoryBudgetPersistence, "log"));
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id obj = *(id *)(a1 + 32);
  unsigned __int8 v4 = 0;
  id v5 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v5)
  {
    uint64_t v24 = *(void *)v26;
    *(void *)&__int128 v6 = 138412290LL;
    __int128 v22 = v6;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v26 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v22;
          v30 = v8;
          _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Saving budget: %@", buf, 0xCu);
        }

        id v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name", v22));
        __strcpy_chk(&v2[64 * (unint64_t)v4 + 8], [v9 UTF8String], 32);

        [v8 capacity];
        __int16 v10 = &v2[64 * (unint64_t)v4];
        *((void *)v10 + 5) = v11;
        [v8 balance];
        *((void *)v10 + 6) = v12;
        v10[56] = [v8 allocationType];
        double v13 = (void *)objc_claimAutoreleasedReturnValue([v8 lastModulatedDate]);

        if (v13)
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 lastModulatedDate]);
          [v14 timeIntervalSinceReferenceDate];
          double v16 = v15;
        }

        else
        {
          double v16 = -1.0;
        }

        *(double *)&v2[64 * (unint64_t)v4 + 64] = v16;
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) budgetToIndex]);
        objc_sync_enter(v17);
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", v4));
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) budgetToIndex]);
        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
        [v19 setObject:v18 forKeyedSubscript:v20];

        objc_sync_exit(v17);
        ++v4;
      }

      id v5 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    }

    while (v5);
  }

  _BYTE *v2 = v4;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = *v2;
    *(_DWORD *)buf = 67109120;
    LODWORD(v30) = v21;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Num Budgets: %u", buf, 8u);
  }

  memcpy((void *)qword_100157550, v2, 0x810uLL);
  free(v2);
}

void sub_10001553C(_Unwind_Exception *a1)
{
}

void sub_10001576C(uint64_t a1)
{
  id v2 = malloc(0x810uLL);
  memcpy(v2, (const void *)qword_100157550, 0x810uLL);
  uint64_t v3 = (id *)(a1 + 32);
  *(void *)(*(void *)(a1 + 32) + 8LL) = v2;
  uint64_t v29 = a1;
  id v5 = *(void **)(a1 + 40);
  unsigned __int8 v4 = (id *)(a1 + 40);
  if ([v5 count] == (id)**((unsigned __int8 **)*v3 + 1))
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    id v6 = *v3;
    uint64_t v7 = (_BYTE *)*((void *)*v3 + 1);
    if (*v7)
    {
      unint64_t v8 = 0LL;
      uint64_t v9 = 8LL;
      while (1)
      {
        __int16 v10 = (__int128 *)&v7[v9];
        __int128 v11 = *v10;
        __int128 v12 = v10[1];
        __int128 v13 = v10[3];
        __int128 v32 = v10[2];
        __int128 v33 = v13;
        *(_OWORD *)buf = v11;
        *(_OWORD *)&uint8_t buf[16] = v12;
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 validatedStringFromStoredValue:buf withAllowedNames:*v4]);
        if (!v14) {
          break;
        }
        else {
          double v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  *((double *)&v33 + 1)));
        }
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[_DASBudget budgetWithName:capacity:balance:allocationType:lastModulatedDate:]( &OBJC_CLASS____DASBudget,  "budgetWithName:capacity:balance:allocationType:lastModulatedDate:",  v14,  v33,  v16,  v32));
        [v30 addObject:v17];
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([*v3 budgetToIndex]);
        objc_sync_enter(v18);
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v8));
        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([*v3 budgetToIndex]);
        [v20 setObject:v19 forKeyedSubscript:v14];

        objc_sync_exit(v18);
        ++v8;
        id v6 = *v3;
        uint64_t v7 = (_BYTE *)*((void *)*v3 + 1);
        v9 += 64LL;
      }

      __int128 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASSharedMemoryBudgetPersistence log]( &OBJC_CLASS____DASSharedMemoryBudgetPersistence,  "log"));
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_1000B1590(v28);
      }
    }

    else
    {
LABEL_12:
      int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASSharedMemoryBudgetPersistence log]( &OBJC_CLASS____DASSharedMemoryBudgetPersistence,  "log"));
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = **((unsigned __int8 **)*v3 + 1);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = v22;
        *(_WORD *)&buf[8] = 2112;
        *(void *)&buf[10] = v30;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Stored Budgets: %u %@", buf, 0x12u);
      }

      id v23 = [v30 copy];
      uint64_t v24 = *(void *)(*(void *)(v29 + 48) + 8LL);
      __int128 v25 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = v23;
    }

    __int128 v27 = (os_log_s *)v30;
  }

  else
  {
    __int128 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASSharedMemoryBudgetPersistence log](&OBJC_CLASS____DASSharedMemoryBudgetPersistence, "log"));
    __int128 v27 = v26;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      sub_1000B15D0((uint64_t)v3, v4, v26);
      __int128 v27 = v26;
    }
  }
}

void sub_100015A70(_Unwind_Exception *a1)
{
}

void sub_100015B08(uint64_t a1)
{
  *(void *)(qword_100157550 + 2056) = v2;
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASSharedMemoryBudgetPersistence log](&OBJC_CLASS____DASSharedMemoryBudgetPersistence, "log"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(qword_100157550 + 2056);
    int v6 = 138412546;
    uint64_t v7 = v4;
    __int16 v8 = 2048;
    uint64_t v9 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Setting modulation date: %@ (%lf)",  (uint8_t *)&v6,  0x16u);
  }
}

void sub_100015D1C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

double sub_100015D40(uint64_t a1)
{
  double result = *(double *)(qword_100157550 + 2056);
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

void sub_100015D7C( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

char *sub_100015D9C(int *a1)
{
  return strerror(*a1);
}

int *sub_100015DA4()
{
  return __error();
}

id sub_100015DAC(id a1)
{
  return a1;
}

void sub_100015E28(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = (void *)qword_100157568;
  qword_100157568 = (uint64_t)v1;
}

uint64_t sub_1000161F4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100016204(uint64_t a1)
{
}

void sub_10001620C(uint64_t a1)
{
  id v1 = *(void **)(*(void *)(a1 + 32) + 40LL);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualKeyPath keyPathWithKey:]( &OBJC_CLASS____CDContextualKeyPath,  "keyPathWithKey:",  kDASWidgetRefreshMaximumBudgetDailyKey));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKeyedSubscript:v2]);

  if (v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:kDASDailyBudgetForAllWidgetsKey]);
    uint64_t v5 = (uint64_t)[v4 intValue];

    int v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:kDASDailyBudgetMaxForSystemAddedIndividualWidgetKey]);
    unsigned int v7 = [v6 intValue];

    __int16 v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:kDASDailyBudgetMaxForIndividualWidgetKey]);
    unsigned int v9 = [v8 intValue];

    if ((_DWORD)v5) {
      goto LABEL_6;
    }
  }

  else
  {
    unsigned int v7 = 0;
    unsigned int v9 = 0;
  }

  uint64_t v5 = 750LL;
LABEL_6:
  v42 = v3;
  if (v9) {
    unsigned int v10 = v9;
  }
  else {
    unsigned int v10 = 50;
  }
  if (v7) {
    unsigned int v11 = v7;
  }
  else {
    unsigned int v11 = 50;
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 12LL) = v10;
  *(_DWORD *)(*(void *)(a1 + 32) + 8LL) = v5;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[_DKKnowledgeStore knowledgeStore](&OBJC_CLASS____DKKnowledgeStore, "knowledgeStore"));
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getAverageWidgetViewsPerDayWithStore:"));
  v40 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualKeyPath keyPathWithKey:]( &OBJC_CLASS____CDContextualKeyPath,  "keyPathWithKey:",  kDASWidgetSystemAddedKeyPath));
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "objectForKeyedSubscript:"));
  v44 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  id obj = v12;
  id v14 = [obj countByEnumeratingWithState:&v50 objects:v61 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v51;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v51 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v50 + 1) + 8LL * (void)i);
        else {
          uint64_t v19 = v10;
        }
        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v19));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v44, "setObject:forKeyedSubscript:", v20, v18);
      }

      id v15 = [obj countByEnumeratingWithState:&v50 objects:v61 count:16];
    }

    while (v15);
  }

  v39 = v13;

  int v21 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) allocatedBudgetsWithAverageViews:obj groupTotalBudget:v5 individualMaxBudgets:v44 individualMinBudget:6]);
  id v22 = [v21 mutableCopy];
  uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v24 = *(void **)(v23 + 40);
  *(void *)(v23 + 40) = v22;

  uint64_t v25 = a1;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) allKeys]);
  id v27 = [v26 countByEnumeratingWithState:&v46 objects:v60 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v47;
    do
    {
      for (j = 0LL; j != v28; j = (char *)j + 1)
      {
        if (*(void *)v47 != v29) {
          objc_enumerationMutation(v26);
        }
        v31 = *(void **)(*(void *)(v25 + 32) + 48LL);
        if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v32 = *(void *)(*((void *)&v46 + 1) + 8LL * (void)j);
          __int128 v33 = v31;
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "objectForKeyedSubscript:", v32, v39));
          v35 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(v25 + 40) + 8) + 40) objectForKeyedSubscript:v32]);
          *(_DWORD *)buf = 138412802;
          uint64_t v55 = v32;
          __int16 v56 = 2112;
          v57 = v34;
          __int16 v58 = 2112;
          v59 = v35;
          _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "For widget %@, averageViewsPerDay: %@ and computedBudget: %@",  buf,  0x20u);

          uint64_t v25 = a1;
        }
      }

      id v28 = [v26 countByEnumeratingWithState:&v46 objects:v60 count:16];
    }

    while (v28);
  }

  uint64_t v36 = objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  uint64_t v37 = *(void *)(v25 + 32);
  v38 = *(void **)(v37 + 32);
  *(void *)(v37 + 32) = v36;
}

void sub_1000166E0(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;
}

void sub_100016770(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;
}

void sub_100017544(id a1)
{
  id v1 = -[_DASTrialManager initWithNamespaceName:]( objc_alloc(&OBJC_CLASS____DASTrialManager),  "initWithNamespaceName:",  @"COREOS_DAS");
  uint64_t v2 = (void *)qword_100157588;
  qword_100157588 = (uint64_t)v1;
}

void sub_100017960( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, id location)
{
}

void sub_100017988(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&to, (id *)(a1 + 32));
  id v4 = objc_loadWeakRetained(&to);

  if (v4)
  {
    id v5 = objc_loadWeakRetained(&to);
    [v5 updateFactors];

    id v6 = objc_loadWeakRetained(&to);
    [v6 updateKernelWithDASIdentifiers];
  }

  objc_destroyWeak(&to);
}

void sub_100017A08( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

id sub_100017A1C(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateKernelWithDASIdentifiers];
}

id sub_100017E24(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dasTrialManager:hasUpdatedParametersForNamespace:");
}

void sub_100018604(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained readFromDefaults]);
    [v3 sendToPowerLog:v2];

    id WeakRetained = v3;
  }
}

void sub_100019254(uint64_t a1)
{
  if (notify_register_check( (const char *)[@"com.apple.das.clas.startDutyCycling" UTF8String],  (int *)(*(void *)(a1 + 32) + 20))
    && os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 56LL), OS_LOG_TYPE_ERROR))
  {
    sub_1000B179C();
  }

  if (notify_register_check( (const char *)[@"com.apple.das.clas.dutyCyclingMicroSeconds" UTF8String],  (int *)(*(void *)(a1 + 32) + 24)))
  {
    if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 56LL), OS_LOG_TYPE_ERROR)) {
      sub_1000B1730();
    }
  }

uint64_t sub_1000194A4(uint64_t a1)
{
  unsigned int v2 = +[_DASDeviceActivityPolicy isDeviceInUse:]( &OBJC_CLASS____DASDeviceActivityPolicy,  "isDeviceInUse:",  *(void *)(*(void *)(a1 + 32) + 104LL));
  if ([*(id *)(a1 + 32) dutyCyclingInitiated])
  {
    if ([*(id *)(a1 + 32) dutyCyclingMethod] == (id)1) {
      unsigned int v3 = v2;
    }
    else {
      unsigned int v3 = 0;
    }
    if (v3 == 1)
    {
      [*(id *)(a1 + 32) resetSFIEffort];
      [*(id *)(a1 + 32) setDutyCyclingInitiated:0];
    }
  }

  return 1LL;
}

uint64_t sub_100019514(uint64_t a1)
{
  unsigned int v2 = *(void **)(*(void *)(a1 + 32) + 104LL);
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](&OBJC_CLASS____CDContextQueries, "keyPathForPluginStatus"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:v3]);
  unsigned __int8 v5 = [v4 BOOLValue];

  id v6 = *(void **)(a1 + 32);
  if ((v5 & 1) != 0)
  {
    unsigned int v7 = (void *)v6[13];
    __int16 v8 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForPluginStatus]( &OBJC_CLASS____CDContextQueries,  "keyPathForPluginStatus"));
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v7 lastModifiedDateForContextualKeyPath:v8]);

    [v9 timeIntervalSinceNow];
    if (v10 > -10.0) {
      [*(id *)(a1 + 32) resetState];
    }
  }

  else
  {
    [v6 resetState];
    [*(id *)(a1 + 32) recordSessionAnalytics];
    [*(id *)(a1 + 32) resetAnalyticsState];
  }

  return 1LL;
}

id sub_100019764(uint64_t a1)
{
  return [*(id *)(a1 + 32) checkControlAction:*(void *)(a1 + 40)];
}

id sub_10001A168(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

LABEL_26:
    if (dutyCyclingMethod == 1)
    {
      -[_DASControlEngine executeSFIWithEffort:](self, "executeSFIWithEffort:", a4);
      if (a4)
      {
LABEL_30:
        self->_dutyCyclingInitiated = 1;
        goto LABEL_33;
      }
    }

    else
    {
      if (dutyCyclingMethod == 2) {
        -[_DASControlEngine executeDutyCyclingWithEffort:](self, "executeDutyCyclingWithEffort:", a4);
      }
      if (a4) {
        goto LABEL_30;
      }
    }

    self->_dutyCyclingInitiated = 0;
    goto LABEL_33;
  }

  if (!a4 && self->_initialMitigationInitiated)
  {
    if (self->_trialInitialAction < 0)
    {
      __int16 v8 = self;
      unsigned int v9 = 0LL;
      goto LABEL_24;
    }

    if (!self->_dutyCyclingInitiated) {
      goto LABEL_33;
    }
LABEL_20:
    id v15 = self->_log;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Less than minimum effort. Setting effort to 0",  (uint8_t *)&v16,  2u);
    }

    a4 = 0LL;
    dutyCyclingMethod = self->_dutyCyclingMethod;
    goto LABEL_26;
  }

  if (self->_dutyCyclingInitiated)
  {
    if ((unint64_t)a4 > 9)
    {
      a4 = 10LL;
      goto LABEL_26;
    }

    goto LABEL_20;
  }
}

LABEL_33:
}

id sub_10001AB64(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_10001AF8C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_10001AFB0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10001AFC0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_10001B21C(uint64_t a1, void *a2)
{
  id v6 = a2;
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "objectForKeyedSubscript:"));

  if (v3)
  {
    id v4 = *(void **)(a1 + 40);
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:v6]);
    [v4 addObject:v5];
  }
}

_BYTE *sub_10001BA00(uint64_t a1)
{
  double result = *(_BYTE **)(a1 + 32);
  if (result[8])
  {
    [result recordValue];
    ++*(void *)(*(void *)(a1 + 32) + 80LL);
    uint64_t v3 = *(void *)(a1 + 32);
    if (!(*(void *)(v3 + 80) % *(void *)(v3 + 32)))
    {
      [(id)v3 analyzeValues:*(void *)(v3 + 48) currentContext:*(void *)(v3 + 40)];
      uint64_t v3 = *(void *)(a1 + 32);
    }

    return [*(id *)(v3 + 64) scheduleOnBehalfOf:@"com.apple.das.monitor.batteryTemperature" between:0 and:(double)*(unint64_t *)(v3 + 72) waking:(double)*(unint64_t *)(v3 + 72)];
  }

  return result;
}

id sub_10001BAE4(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 8LL) = 1;
  return [*(id *)(*(void *)(a1 + 32) + 64) scheduleOnBehalfOf:@"com.apple.das.monitor.batteryTemperature" between:0 and:(double)*(unint64_t *)(*(void *)(a1 + 32) + 72) waking:(double)*(unint64_t *)(*(void *)(a1 + 32) + 72)];
}

uint64_t sub_10001BB6C(uint64_t result)
{
  *(_BYTE *)(*(void *)(result + 32) + 8LL) = 0;
  *(void *)(*(void *)(result + 32) + 16LL) = 0LL;
  return result;
}

void sub_10001BBD8(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 24) currentValue]);
  [*(id *)(*(void *)(a1 + 32) + 48) addObject:v2];
}

uint64_t sub_10001BDA8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10001BDB8(uint64_t a1)
{
}

void sub_10001BDC0(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 96) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10001BEA0(uint64_t a1)
{
  double v3 = v2;
  [*(id *)(a1 + 40) getReferenceTemperatureForContext:*(void *)(a1 + 48) reader:*(void *)(*(void *)(a1 + 40) + 24)];
  double v5 = v4;
  id v6 = os_log_create("com.apple.clas", "signals");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1000B1C10(v6, v5, v3);
  }
  if (v3 - v5 <= 0.0)
  {
    unint64_t v8 = 0LL;
  }

  else
  {
    double v7 = (v3 - v5) / 5.0;
    if (v7 > 100.0) {
      double v7 = 100.0;
    }
    unint64_t v8 = (unint64_t)v7;
  }

  *(void *)(*(void *)(a1 + 40) + 16LL) = v8;
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v3));
  [v9 setObject:v10 forKeyedSubscript:@"BatteryTemperatureMean"];

  [*(id *)(a1 + 32) rate];
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  [v9 setObject:v11 forKeyedSubscript:@"BatteryTemperatureRate"];

  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v8));
  [v9 setObject:v12 forKeyedSubscript:@"BatteryTemperatureControlEffort"];

  uint64_t v13 = *(void *)(a1 + 40);
  id v14 = *(void **)(v13 + 96);
  *(void *)(v13 + 96) = v9;
}

void sub_10001C1CC(uint64_t a1)
{
  uint64_t v1 = objc_opt_new(*(void *)(a1 + 32));
  double v2 = (void *)qword_100157598;
  qword_100157598 = v1;
}

void sub_10001C4D0(_Unwind_Exception *a1)
{
}

void sub_10001C5D8(_Unwind_Exception *a1)
{
}

void sub_10001C6C8(_Unwind_Exception *a1)
{
}

void sub_10001C838(_Unwind_Exception *a1)
{
}

void sub_10001C924(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

_BYTE *sub_10001CB78(uint64_t a1)
{
  double result = *(_BYTE **)(a1 + 32);
  if (result[9])
  {
    [result recordValue];
    ++*(void *)(*(void *)(a1 + 32) + 80LL);
    uint64_t v3 = *(void *)(a1 + 32);
    if (!(*(void *)(v3 + 80) % *(void *)(v3 + 32)))
    {
      [(id)v3 analyzeValues:*(void *)(v3 + 48) currentContext:*(void *)(v3 + 40)];
      uint64_t v3 = *(void *)(a1 + 32);
    }

    return [*(id *)(v3 + 64) scheduleOnBehalfOf:@"com.apple.das.monitor.chargeRate" between:0 and:(double)*(unint64_t *)(v3 + 72) waking:(double)*(unint64_t *)(v3 + 72)];
  }

  return result;
}

id sub_10001CC5C(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 9LL) = 1;
  return [*(id *)(*(void *)(a1 + 32) + 64) scheduleOnBehalfOf:@"com.apple.das.monitor.chargeRate" between:0 and:(double)*(unint64_t *)(*(void *)(a1 + 32) + 72) waking:(double)*(unint64_t *)(*(void *)(a1 + 32) + 72)];
}

uint64_t sub_10001CCE4(uint64_t result)
{
  *(_BYTE *)(*(void *)(result + 32) + 9LL) = 0;
  *(void *)(*(void *)(result + 32) + 16LL) = 0LL;
  return result;
}

void sub_10001CD50(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 24) currentValue]);
  [*(id *)(*(void *)(a1 + 32) + 48) addObject:v2];
}

LABEL_12:
        double v10 = 0.225;
      }
    }
  }

LABEL_18:
  return v10;
}

  return v7;
}

    id v15 = objc_claimAutoreleasedReturnValue( +[RBSDomainAttribute attributeWithDomain:name:]( &OBJC_CLASS___RBSDomainAttribute,  "attributeWithDomain:name:",  @"com.apple.dasd",  v9));
    if (v15)
    {
      uint64_t v16 = (void *)v15;
      __int128 v17 = objc_alloc(&OBJC_CLASS___RBSAssertion);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[RBSTarget targetWithPid:](&OBJC_CLASS___RBSTarget, "targetWithPid:", v4));
      uint64_t v24 = v16;
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL));
      __int128 v20 = [v17 initWithExplanation:@"com.apple.das.backgroundTasks" target:v18 attributes:v19];

      id v14 = -[_DASAssertion initWithRBSAssertion:forPid:]( objc_alloc(&OBJC_CLASS____DASAssertion),  "initWithRBSAssertion:forPid:",  v20,  v4);
      goto LABEL_21;
    }

    double v5 = v18;
    double v4 = v19;
    if (v31[24])
    {
      id v22 = 0LL;
      id v14 = [v19 setTaskExpiredWithRetryAfter:&v22 error:0.0];
      id v15 = v22;
      if ((v14 & 1) == 0)
      {
        uint64_t v16 = v6;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        {
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v19 identifier]);
          sub_1000B523C(v17, (uint64_t)v15, v34, v16);
        }

        [v19 setTaskCompleted];
      }
    }

    else
    {
      if (-[NSMutableArray count](v20, "count"))
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v34 = 138412290;
          v35 = v20;
          _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Found significantly overdue activities:\n%@",  v34,  0xCu);
        }

        [(id)objc_opt_class(a1) triggerABCCaseForActivities:v20];
      }

      objc_msgSend(v19, "setTaskCompleted", v18);
    }

    _Block_object_dispose(buf, 8);
  }

  else if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    sub_1000B5210();
  }
}

  return v7;
}
}

uint64_t sub_10001CFA4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10001CFB4(uint64_t a1)
{
}

void sub_10001CFBC(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 96) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  double v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10001D09C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[_DASBatteryTemperatureReader batteryProperties]( &OBJC_CLASS____DASBatteryTemperatureReader,  "batteryProperties"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"ChargerData"]);
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"NotChargingReason"]);

  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0) {
    goto LABEL_23;
  }
  if (+[_DASRequiresPluggedInPolicy isIgnorableNotChargingReason:]( _DASRequiresPluggedInPolicy,  "isIgnorableNotChargingReason:",  [v5 unsignedLongLongValue]))
  {
    *(void *)(*(void *)(a1 + 32) + 16LL) = 0LL;
    [v3 setObject:&off_100121A68 forKeyedSubscript:@"ChargeRate"];
    double v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(*(void *)(a1 + 32) + 16LL)));
    [v3 setObject:v7 forKeyedSubscript:@"ChargeRateControlEffort"];

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 96LL), v3);
    goto LABEL_23;
  }

  unsigned __int16 v8 = (unsigned __int16)[v5 unsignedLongLongValue];
  uint64_t v9 = *(void *)(a1 + 32);
  if ((v8 & 0x11E) != 0)
  {
    if (!*(_BYTE *)(v9 + 8))
    {
      char v10 = 1;
LABEL_9:
      *(_BYTE *)(v9 + _Block_object_dispose(va, 8) = v10;
    }
  }

  else if (*(_BYTE *)(v9 + 8))
  {
    char v10 = 0;
    goto LABEL_9;
  }

  [*(id *)(a1 + 40) rate];
  double v12 = v11;
  uint64_t v13 = os_log_create("com.apple.clas", "signals");
  id v14 = [*(id *)(a1 + 40) count];
  if (v14 >= [*(id *)(a1 + 40) limit])
  {
    double v15 = v12 * 60.0;
  }

  else
  {
    double v15 = 2.0;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LOWORD(v24) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Not enough samples in the queue. Setting current rate to max rate",  (uint8_t *)&v24,  2u);
    }
  }

  [*(id *)(a1 + 32) getReferenceChargeRateForContext:*(void *)(a1 + 48) reader:*(void *)(*(void *)(a1 + 32) + 24)];
  double v17 = v16;
  uint64_t v18 = v13;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) allObjects]);
    int v24 = 134218498;
    double v25 = v17;
    __int16 v26 = 2048;
    double v27 = v15;
    __int16 v28 = 2112;
    uint64_t v29 = v23;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "Charge Rate reference Value %lf Current value %lf, Signal values: %@",  (uint8_t *)&v24,  0x20u);
  }

  if (v15 < 0.0 || v15 >= v17)
  {
    unint64_t v20 = 0LL;
  }

  else
  {
    double v19 = (v17 - v15) / v17 * 100.0;
    if (v19 > 100.0) {
      double v19 = 100.0;
    }
    unint64_t v20 = (unint64_t)v19;
  }

  *(void *)(*(void *)(a1 + 32) + 16LL) = v20;
  int v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v15));
  [v3 setObject:v21 forKeyedSubscript:@"ChargeRate"];

  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(*(void *)(a1 + 32) + 16LL)));
  [v3 setObject:v22 forKeyedSubscript:@"ChargeRateControlEffort"];

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 96LL), v3);
LABEL_23:
}

id sub_10001D7D0(uint64_t a1)
{
  return [*(id *)(a1 + 32) unprotectedExecuteWorkItems];
}

uint64_t sub_10001D93C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 40) + 40LL) + 16LL))();
}

void sub_10001D9C8(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 48) count];
  uint64_t v3 = *(void *)(a1 + 32);
  if ((unint64_t)v2 >= *(void *)(v3 + 16))
  {
    [(id)v3 unprotectedExecuteWorkItems];
  }

  else if (v2 == (id)1)
  {
    double v4 = *(dispatch_source_s **)(v3 + 56);
    dispatch_time_t v5 = dispatch_time(0LL, (uint64_t)(*(double *)(v3 + 8) * 1000000000.0));
    dispatch_source_set_timer( v4,  v5,  0xFFFFFFFFFFFFFFFFLL,  (unint64_t)(*(double *)(*(void *)(a1 + 32) + 8LL) / 10.0 * 1000000000.0));
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 56LL));
  }

void sub_10001DB0C(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 48) count]) {
    BOOL v2 = 0;
  }
  else {
    BOOL v2 = [*(id *)(a1 + 40) count] != 0;
  }
  [*(id *)(*(void *)(a1 + 32) + 48) addObjectsFromArray:*(void *)(a1 + 40)];
  id v3 = [*(id *)(*(void *)(a1 + 32) + 48) count];
  uint64_t v4 = *(void *)(a1 + 32);
  if ((unint64_t)v3 >= *(void *)(v4 + 16))
  {
    [(id)v4 unprotectedExecuteWorkItems];
  }

  else if (v2)
  {
    dispatch_time_t v5 = *(dispatch_source_s **)(v4 + 56);
    dispatch_time_t v6 = dispatch_time(0LL, (uint64_t)(*(double *)(v4 + 8) * 1000000000.0));
    dispatch_source_set_timer( v5,  v6,  0xFFFFFFFFFFFFFFFFLL,  (unint64_t)(*(double *)(*(void *)(a1 + 32) + 8LL) / 10.0 * 1000000000.0));
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 56LL));
  }

void sub_10001DD0C(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS____DASResultDependencyPolicy);
  BOOL v2 = (void *)qword_1001575B0;
  qword_1001575B0 = (uint64_t)v1;
}

void sub_10001E08C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) launchLikelihoodPredictionForApp:*(void *)(a1 + 40)]);
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void sub_10001E15C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pluginLikelihood]);
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void sub_10001E224(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) deviceActivityLikelihood]);
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void sub_10001E400(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = (void (**)(void))objc_claimAutoreleasedReturnValue([WeakRetained callback]);
    v2[2]();

    id WeakRetained = v3;
  }
}

void sub_10001EB54( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
}

id sub_10001EB70(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "locked_reinstantiateConfiguredBudgets");
}

void sub_10001EB78(uint64_t a1, void *a2, int a3)
{
  if (a3)
  {
    id v4 = a2;
    id v5 = (id)objc_claimAutoreleasedReturnValue( +[_DASDataProtectionStateMonitor dataProtectionClassC]( &OBJC_CLASS____DASDataProtectionStateMonitor,  "dataProtectionClassC"));

    if (v5 == v4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      double v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([WeakRetained log]);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Class C protected data now available, re-instantiating configured budgets",  buf,  2u);
      }

      unsigned __int16 v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([WeakRetained queue]);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10001ECA8;
      block[3] = &unk_1001150D0;
      id v12 = WeakRetained;
      id v9 = WeakRetained;
      dispatch_sync(v8, block);

      char v10 = (void *)objc_claimAutoreleasedReturnValue([v9 lockStateMonitor]);
      [v10 setChangeHandler:0];
    }
  }

void sub_10001ECA8(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 managedBudgets]);
  id v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "locked_instantiateBudgetsInto:withRemovals:", v3, 0));

  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) widgetBudgetModulator]);
  objc_msgSend(v4, "locked_addBudgetsToBeModulated:", v5);
}

void sub_10001ED24(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(a1 + 32),  "locked_instantiateBudgetsInto:withRemovals:",  *(void *)(*(void *)(a1 + 32) + 24),  0));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "locked_addBudgetsToBeModulated:", v2);
}

void sub_10001EDE8(uint64_t a1)
{
  uint64_t v1 = objc_opt_class(*(void *)(a1 + 32));
  uint64_t v2 = objc_opt_new(v1);
  id v3 = (void *)qword_1001575C0;
  qword_1001575C0 = v2;
}

void sub_10001EF38(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) managedBudgets]);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10001EFBC;
  v3[3] = &unk_100115498;
  id v4 = *(id *)(a1 + 40);
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
}

void sub_10001EFBC(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  v11[0] = @"name";
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  v12[0] = v5;
  v11[1] = @"balance";
  [v4 balance];
  dispatch_time_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v12[1] = v6;
  v11[2] = @"capacity";
  [v4 capacity];
  double v8 = v7;

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v8));
  v12[2] = v9;
  char v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  3LL));
  [v3 addObject:v10];
}

id sub_10001F144(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "locked_reinstantiateConfiguredBudgets");
}

LABEL_81:
      }

      v76 = [v119 countByEnumeratingWithState:&v129 objects:v156 count:16];
    }

    while (v76);
  }

  v127 = 0u;
  v128 = 0u;
  v125 = 0u;
  v126 = 0u;
  v120 = v114;
  v97 = [v120 countByEnumeratingWithState:&v125 objects:v151 count:16];
  if (v97)
  {
    v98 = v97;
    v99 = *(void *)v126;
    do
    {
      for (ii = 0LL; ii != v98; ii = (char *)ii + 1)
      {
        if (*(void *)v126 != v99) {
          objc_enumerationMutation(v120);
        }
        v101 = *(void **)(*((void *)&v125 + 1) + 8LL * (void)ii);
        v102 = self->_log;
        if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v153 = v101;
          _os_log_impl( (void *)&_mh_execute_header,  v102,  OS_LOG_TYPE_INFO,  "managing override list widget %@",  buf,  0xCu);
        }

        v103 = (void *)objc_claimAutoreleasedReturnValue( +[_DASWidgetRefreshBudgetManager budgetNameFromWidgetBudgetID:]( &OBJC_CLASS____DASWidgetRefreshBudgetManager,  "budgetNameFromWidgetBudgetID:",  v101));
        v104 = (double)-[_DASWidgetRefreshUsageTracker maxWidgetRefreshBudgetForIndividualDaily]( self->_widgetRefreshUsageTracker,  "maxWidgetRefreshBudgetForIndividualDaily");
        v105 = v104 * 0.125;
        v106 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v103]);

        if (v106)
        {
          v107 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v103]);
          [v107 setCapacity:v104];
          [v107 balance];
          if (v108 > v105)
          {
            [v107 balance];
            v105 = v109;
          }

          [v107 setBalance:v105];
          [v107 setAllocationType:1];
          v110 = self->_log;
          if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v153 = v107;
            _os_log_impl( (void *)&_mh_execute_header,  v110,  OS_LOG_TYPE_INFO,  "Modified capacity and allocation type of override list widget budget %{public}@",  buf,  0xCu);
          }
        }

        else
        {
          v107 = (void *)objc_claimAutoreleasedReturnValue( +[_DASWidgetRefreshBudget budgetWithName:widgetBudgetID:capacity:balance:allocationType:]( &OBJC_CLASS____DASWidgetRefreshBudget,  "budgetWithName:widgetBudgetID:capacity:balance:allocationType:",  v103,  v101,  1LL,  v104,  v105));
          v111 = self->_log;
          if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v153 = v107;
            _os_log_impl( (void *)&_mh_execute_header,  v111,  OS_LOG_TYPE_INFO,  "budget %{public}@ init - newly created override list widget budget",  buf,  0xCu);
          }

          [v6 setObject:v107 forKeyedSubscript:v103];
          -[NSMutableArray addObject:](v123, "addObject:", v107);
        }
      }

      v98 = [v120 countByEnumeratingWithState:&v125 objects:v151 count:16];
    }

    while (v98);
  }

  v112 = self->_log;
  if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_INFO, "Instantiation complete", buf, 2u);
  }

  return v123;
}

void sub_10001FFF4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = *(os_log_s **)(*(void *)(a1 + 32) + 8LL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1000B1EF8((uint64_t)v5, (uint64_t)v6, v7);
  }
}

void sub_100020060(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(os_log_s **)(*(void *)(a1 + 32) + 8LL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000B1F7C((uint64_t)v3, v4);
  }
}

void sub_100020108(uint64_t a1)
{
  id v2 = *(os_log_s **)(*(void *)(a1 + 32) + 8LL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Resetting budgets.", v7, 2u);
  }

  [*(id *)(*(void *)(a1 + 32) + 48) flushComputedBudgetCache];
  id v3 =  objc_msgSend( *(id *)(a1 + 32),  "locked_instantiateBudgetsInto:withRemovals:",  *(void *)(*(void *)(a1 + 32) + 24),  0);
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 32);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v4 + 24) allValues]);
  objc_msgSend(v5, "locked_replaceBudgetsToBeModulated:", v6);
}

void sub_1000203CC(uint64_t a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) managedBudgets]);
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:*(void *)(a1 + 40)]);
  [v2 balance];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v3;
}

void sub_1000204DC(uint64_t a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) managedBudgets]);
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:*(void *)(a1 + 40)]);
  [v2 capacity];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v3;
}

void sub_1000205EC(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) managedBudgets]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[_DASWidgetRefreshBudgetManager budgetNameFromWidgetBudgetID:]( &OBJC_CLASS____DASWidgetRefreshBudgetManager,  "budgetNameFromWidgetBudgetID:",  *(void *)(a1 + 40)));
  id v6 = (id)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:v3]);

  id v4 = v6;
  if (v6)
  {
    [v6 balance];
    id v4 = v6;
  }

  else
  {
    unint64_t v5 = 0xFFF0000000000000LL;
  }

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v5;
}

void sub_100020714(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) managedBudgets]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:*(void *)(a1 + 40)]);

  if (v3)
  {
    [v3 setBalance:*(double *)(a1 + 48)];
    [*(id *)(a1 + 32) updateBudget:v3];
    id v4 = *(void **)(*(void *)(a1 + 32) + 8LL);
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_INFO))
    {
      unint64_t v5 = v4;
      [v3 balance];
      uint64_t v6 = *(void *)(a1 + 40);
      int v11 = 134218242;
      uint64_t v12 = v7;
      __int16 v13 = 2114;
      uint64_t v14 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Set Balance: %.2lf for %{public}@",  (uint8_t *)&v11,  0x16u);
    }
  }

  else
  {
    double v8 = *(os_log_s **)(*(void *)(a1 + 32) + 8LL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      int v11 = 134218242;
      uint64_t v12 = v9;
      __int16 v13 = 2114;
      uint64_t v14 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Failed to set Balance: %.2lf for %{public}@ ; budget not found",
        (uint8_t *)&v11,
        0x16u);
    }
  }
}

void sub_10002090C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) managedBudgets]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:*(void *)(a1 + 40)]);

  if (v3)
  {
    [v3 decrementBy:*(double *)(a1 + 48)];
    [*(id *)(a1 + 32) updateBudget:v3];
    id v4 = *(void **)(*(void *)(a1 + 32) + 8LL);
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v5 = *(void *)(a1 + 48);
      uint64_t v7 = v4;
      [v3 balance];
      int v12 = 134218498;
      uint64_t v13 = v5;
      __int16 v14 = 2114;
      uint64_t v15 = v6;
      __int16 v16 = 2048;
      uint64_t v17 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Decrement budget by: %.2lf for %{public}@, new balance: %.2lf",  (uint8_t *)&v12,  0x20u);
    }
  }

  else
  {
    uint64_t v9 = *(os_log_s **)(*(void *)(a1 + 32) + 8LL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      int v12 = 134218242;
      uint64_t v13 = v10;
      __int16 v14 = 2114;
      uint64_t v15 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Failed to decrement budget by: %.2lf for %{public}@ ; budget not found",
        (uint8_t *)&v12,
        0x16u);
    }
  }
}

void sub_100020B18(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) managedBudgets]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:*(void *)(a1 + 40)]);

  if (v3)
  {
    [v3 setCapacity:*(double *)(a1 + 48)];
    [*(id *)(a1 + 32) updateBudget:v3];
    id v4 = *(void **)(*(void *)(a1 + 32) + 8LL);
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = v4;
      [v3 capacity];
      uint64_t v6 = *(void *)(a1 + 40);
      int v11 = 134218242;
      uint64_t v12 = v7;
      __int16 v13 = 2114;
      uint64_t v14 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Set capacity of budget to: %.2lf for %{public}@",  (uint8_t *)&v11,  0x16u);
    }
  }

  else
  {
    uint64_t v8 = *(os_log_s **)(*(void *)(a1 + 32) + 8LL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      int v11 = 134218242;
      uint64_t v12 = v9;
      __int16 v13 = 2114;
      uint64_t v14 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Failed to set capacity of budget to: %.2lf for %{public}@ ; budget not found",
        (uint8_t *)&v11,
        0x16u);
    }
  }
}

id sub_100020E44(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) startTrackingActivity:*(void *)(a1 + 40)];
}

void sub_100021330( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_100021354(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained handleDataProtectionChangeFor:v5 willBeAvailable:a3];
}

void sub_100021478(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 56) objectForKeyedSubscript:*(void *)(a1 + 40)]);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100021514;
  v6[3] = &unk_100115120;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v7 = v2;
  uint64_t v8 = v3;
  id v9 = v4;
  id v5 = v2;
  [v5 performWithOptions:4 andBlock:v6];
}

id sub_100021514(uint64_t a1)
{
  return [*(id *)(a1 + 40) invalidatePersistentStoreCoordinatorFor:*(void *)(a1 + 48)];
}

void sub_1000215C4(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 64) objectForKeyedSubscript:*(void *)(a1 + 40)]);
  uint64_t v3 = v2;
  if (v2)
  {
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "persistentStores", 0));
    id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0LL;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [v3 removePersistentStore:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8) error:0];
          uint64_t v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }

      while (v6);
    }

    [*(id *)(*(void *)(a1 + 32) + 64) removeObjectForKey:*(void *)(a1 + 40)];
  }
}

void sub_1000219A8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t sub_1000219CC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000219DC(uint64_t a1)
{
}

void sub_1000219E4(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 64) objectForKeyedSubscript:*(void *)(a1 + 40)]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
  if (*(_BYTE *)(a1 + 64))
  {
    if (!v5)
    {
      id v6 = (void *)objc_opt_class(*(void *)(a1 + 32));
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 16LL);
      id v35 = 0LL;
      unsigned __int8 v8 = [v6 createDatabaseDirectory:v7 error:&v35];
      id v9 = v35;
      id v10 = v9;
      if ((v8 & 1) != 0 || [v9 code] == (id)516)
      {
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) managedObjectModel]);
        if (v11)
        {
          __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:*(void *)(a1 + 40)]);
          __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v12));

          id v14 = [(id)objc_opt_class(*(void *)(a1 + 32)) persistentStoreOptionsFor:*(void *)(a1 + 40) readOnly:*(unsigned __int8 *)(*(void *)(a1 + 32) + 8)];
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
          id v34 = v10;
          __int16 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSPersistentStoreCoordinator metadataForPersistentStoreOfType:URL:options:error:]( &OBJC_CLASS___NSPersistentStoreCoordinator,  "metadataForPersistentStoreOfType:URL:options:error:",  NSSQLiteStoreType,  v13,  v15,  &v34));
          id v17 = v34;

          unsigned __int8 v18 = [v11 isConfiguration:0 compatibleWithStoreMetadata:v16];
          double v19 = -[NSPersistentStoreCoordinator initWithManagedObjectModel:]( objc_alloc(&OBJC_CLASS___NSPersistentStoreCoordinator),  "initWithManagedObjectModel:",  v11);
          uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8LL);
          int v21 = *(void **)(v20 + 40);
          *(void *)(v20 + 40) = v19;

          if ((v18 & 1) == 0)
          {
            id v22 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
            id v33 = v17;
            [v22 destroyPersistentStoreAtURL:v13 withType:NSSQLiteStoreType options:v15 error:&v33];
            id v23 = v33;

            id v17 = v23;
          }

          int v24 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
          id v32 = v17;
          double v25 = (void *)objc_claimAutoreleasedReturnValue( [v24 addPersistentStoreWithType:NSSQLiteStoreType configuration:0 URL:v13 options:v15 error:&v32]);
          id v10 = v32;

          if (!v25)
          {
            NSLog(@"Failed to add persistent store: %@", v10);
            [*(id *)(a1 + 32) handleDatabaseErrors:v10 forPSC:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) protectionClass:*(void *)(a1 + 40)];
            uint64_t v26 = *(void *)(*(void *)(a1 + 48) + 8LL);
            double v27 = *(void **)(v26 + 40);
            *(void *)(v26 + 40) = 0LL;
          }

          uint64_t v28 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
          if (v28) {
            [*(id *)(*(void *)(a1 + 32) + 64) setObject:v28 forKeyedSubscript:*(void *)(a1 + 40)];
          }
        }

        else
        {
          NSLog(@"Failed to load Managed Object Model from %@", *(void *)(*(void *)(a1 + 32) + 32LL));
        }
      }

      else
      {
        NSLog( @"%@ : did not exist and could not be created: %@",  *(void *)(*(void *)(a1 + 32) + 16LL),  v10);
        uint64_t v31 = *(void *)(*(void *)(a1 + 48) + 8LL);
        uint64_t v11 = *(void **)(v31 + 40);
        *(void *)(v31 + 40) = 0LL;
      }
    }
  }

  else if (v5)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
    uint64_t v29 = *(void *)(*(void *)(a1 + 48) + 8LL);
    v30 = *(void **)(v29 + 40);
    *(void *)(v29 + 40) = 0LL;
  }

void sub_100021E4C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_100021E70(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 56) objectForKeyedSubscript:*(void *)(a1 + 40)]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
  if (*(_BYTE *)(a1 + 64))
  {
    if (v5) {
      return;
    }
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) persistentStoreCoordinatorFor:*(void *)(a1 + 40)]);
    if (v6)
    {
      uint64_t v11 = v6;
      uint64_t v7 = -[NSManagedObjectContext initWithConcurrencyType:]( objc_alloc(&OBJC_CLASS___NSManagedObjectContext),  "initWithConcurrencyType:",  1LL);
      uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8LL);
      id v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setPersistentStoreCoordinator:v11];
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setUndoManager:0];
      [*(id *)(*(void *)(a1 + 32) + 56) setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKeyedSubscript:*(void *)(a1 + 40)];

      return;
    }
  }

  else
  {
    if (!v5) {
      return;
    }
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id v6 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = 0LL;
  }
}

void sub_100022234( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

id sub_10002224C(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) deleteDatabaseForPSC:*(void *)(a1 + 48) protectionClass:*(void *)(a1 + 40) obliterate:*(unsigned __int8 *)(a1 + 64)];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = (_BYTE)result;
  return result;
}

void sub_1000229D8(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS____APRSMetricRecorder);
  uint64_t v2 = (void *)qword_1001575D0;
  qword_1001575D0 = (uint64_t)v1;
}

void sub_100022A40(id a1)
{
  os_log_t v1 = os_log_create("com.apple.aprs", "appResume.caEvent");
  uint64_t v2 = (void *)qword_1001575E0;
  qword_1001575E0 = (uint64_t)v1;
}

id sub_100023030(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) commonAnalytics]);
  id v3 = [v2 mutableCopy];

  [v3 addEntriesFromDictionary:*(void *)(a1 + 40)];
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) log]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 48);
    int v7 = 138412546;
    id v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Reporting %@ for %@", (uint8_t *)&v7, 0x16u);
  }

  return v3;
}

void sub_1000237E0(id a1)
{
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS____DASLowPowerModePolicy);
  uint64_t v2 = (void *)qword_1001575F0;
  qword_1001575F0 = (uint64_t)v1;
}

void sub_100023FE0(uint64_t a1)
{
  id v3 = objc_opt_new(&OBJC_CLASS____DASActivityRecorder);
  id v2 =  -[_DASActivityRecorder createOrUpdateActivity:context:]( v3,  "createOrUpdateActivity:context:",  *(void *)(a1 + 32),  *(void *)(a1 + 40));
  [*(id *)(a1 + 48) mocSaveAndReset:*(void *)(a1 + 40)];
}

void sub_100024100(uint64_t a1)
{
  id v2 = objc_opt_new(&OBJC_CLASS____DASActivityRecorder);
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v3 = *(id *)(a1 + 32);
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      int v7 = 0LL;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 =  -[_DASActivityRecorder createOrUpdateActivity:context:]( v2,  "createOrUpdateActivity:context:",  *(void *)(*((void *)&v9 + 1) + 8LL * (void)v7),  *(void *)(a1 + 40),  (void)v9);
        int v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v5);
  }

  [*(id *)(a1 + 48) mocSaveAndReset:*(void *)(a1 + 40)];
}

id sub_100024314(uint64_t a1)
{
  return [*(id *)(a1 + 32) mocSaveAndReset:*(void *)(a1 + 40)];
}

void sub_1000244B4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t sub_1000244CC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000244DC(uint64_t a1)
{
}

id sub_1000244E4(uint64_t a1)
{
  id v2 = (char *)[*(id *)(a1 + 32) count];
  if (v2)
  {
    id v3 = v2;
    for (i = 0LL; i != v3; ++i)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectAtIndexedSubscript:i]);
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 groupName]);

      if (v6)
      {
        int v7 = *(void **)(a1 + 40);
        id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectAtIndexedSubscript:i]);
        __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
        uint64_t v10 = objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v9]);
        uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8LL);
        __int128 v12 = *(void **)(v11 + 40);
        *(void *)(v11 + 40) = v10;
      }

      __int16 v13 = *(void **)(a1 + 48);
      uint64_t v14 = *(void *)(a1 + 56);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectAtIndexedSubscript:i]);
      uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectAtIndexedSubscript:i]);
      [v13 createMOInMOC:v14 activity:v15 group:v16 triggers:v17];
    }
  }

  return [*(id *)(a1 + 48) mocSaveAndReset:*(void *)(a1 + 56)];
}

void sub_100024878(uint64_t a1)
{
  id v3 = objc_opt_new(&OBJC_CLASS____DASGroupRecorder);
  id v2 =  -[_DASGroupRecorder createOrUpdateGroup:context:]( v3,  "createOrUpdateGroup:context:",  *(void *)(a1 + 32),  *(void *)(a1 + 40));
  [*(id *)(a1 + 48) mocSaveAndReset:*(void *)(a1 + 40)];
}

id sub_1000249BC(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));
  [v2 createMOInMOC:v3 group:v4 activities:v5];

  return [*(id *)(a1 + 32) mocSaveAndReset:*(void *)(a1 + 40)];
}

id sub_100024B60(uint64_t a1)
{
  id v2 = (char *)[*(id *)(a1 + 32) count];
  if (v2)
  {
    uint64_t v3 = v2;
    for (i = 0LL; i != v3; ++i)
    {
      uint64_t v6 = *(void **)(a1 + 40);
      uint64_t v5 = *(void *)(a1 + 48);
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectAtIndexedSubscript:i]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) objectAtIndexedSubscript:i]);
      [v6 createMOInMOC:v5 group:v7 activities:v8];
    }
  }

  return [*(id *)(a1 + 40) mocSaveAndReset:*(void *)(a1 + 48)];
}

void sub_100024D14(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) fetchAllActivities:*(void *)(a1 + 40)]);
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)i);
        id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getActivityFromManagedObject:v7]);
        [*(id *)(a1 + 48) addObject:v8];
        __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v7 startDate]);

        if (v9) {
          [*(id *)(a1 + 56) addObject:v8];
        }
      }

      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v4);
  }
}

id sub_100024F80(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 72)) {
    [*(id *)(a1 + 32) updateActivityStarted:*(void *)(a1 + 48)];
  }
  return [*(id *)(a1 + 32) mocSaveAndReset:*(void *)(a1 + 40)];
}

void sub_1000251B0(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 40) fetchActivitiesUsingPredicate:*(void *)(a1 + 48) context:*(void *)(a1 + 56)]);
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(a1 + 64);
        id v8 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 40) getActivityFromManagedObject:*(void *)(*((void *)&v9 + 1) + 8 * (void)v6)]);
        [v7 addObject:v8];

        uint64_t v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v4);
  }
}

void sub_1000253EC(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) fetchActivitiesUsingPredicate:*(void *)(a1 + 40) context:*(void *)(a1 + 48)]);
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(a1 + 56);
        id v8 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) getActivityFromManagedObject:*(void *)(*((void *)&v9 + 1) + 8 * (void)v6)]);
        [v7 addObject:v8];

        uint64_t v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v4);
  }
}

void sub_1000255FC(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) fetchAllGroups:*(void *)(a1 + 40)]);
  id v3 = v2;
  if (v2)
  {
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        uint64_t v7 = 0LL;
        do
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(a1 + 48);
          __int128 v9 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) getGroupFromManagedObject:*(void *)(*((void *)&v10 + 1) + 8 * (void)v7)]);
          [v8 addObject:v9];

          uint64_t v7 = (char *)v7 + 1;
        }

        while (v5 != v7);
        id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }

      while (v5);
    }
  }
}

id sub_100025814(uint64_t a1)
{
  return [*(id *)(a1 + 56) mocSaveAndReset:*(void *)(a1 + 48)];
}

id sub_100025934(uint64_t a1)
{
  return [*(id *)(a1 + 56) mocSaveAndReset:*(void *)(a1 + 48)];
}

id sub_100025A54(uint64_t a1)
{
  return [*(id *)(a1 + 56) mocSaveAndReset:*(void *)(a1 + 48)];
}

id sub_100025C0C(uint64_t a1)
{
  return [*(id *)(a1 + 64) mocSaveAndReset:*(void *)(a1 + 56)];
}

id sub_100025D4C(uint64_t a1)
{
  return [*(id *)(a1 + 56) mocSaveAndReset:*(void *)(a1 + 48)];
}

id sub_100025E8C(uint64_t a1)
{
  return [*(id *)(a1 + 56) mocSaveAndReset:*(void *)(a1 + 48)];
}

void sub_10002621C(uint64_t a1)
{
  uint64_t state64 = 0LL;
  notify_get_state(*(_DWORD *)(*(void *)(a1 + 32) + 12LL), &state64);
  uint64_t v2 = arc4random_uniform(0x1ABu);
  if (state64 == 2)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    uint64_t v5 = 2LL;
    goto LABEL_5;
  }

  if (state64 == 1)
  {
    [*(id *)(a1 + 32) logPrewarm:@"com.apple.mobilemail" pid:v2];
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    uint64_t v5 = 1LL;
LABEL_5:
    [v3 logDock:@"com.apple.mobilemail" pid:v4 state:v5];
    return;
  }

  uint64_t v6 = *(os_log_s **)(*(void *)(a1 + 32) + 32LL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Error with notification com.apple.das.logPrewarmDock (Wrong state)",  v7,  2u);
  }

void sub_100026378(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  uint64_t v2 = (void *)qword_1001575F8;
  qword_1001575F8 = (uint64_t)v1;
}

int64_t sub_1000264A0(id a1, NSNumber *a2, NSNumber *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = a3;
  -[NSNumber doubleValue](v4, "doubleValue");
  double v7 = v6;
  -[NSNumber doubleValue](v5, "doubleValue");
  if (v7 <= v8)
  {
    -[NSNumber doubleValue](v4, "doubleValue");
    double v11 = v10;
    -[NSNumber doubleValue](v5, "doubleValue");
    int64_t v9 = v11 < v12;
  }

  else
  {
    int64_t v9 = -1LL;
  }

  return v9;
}

void sub_100026B00(uint64_t a1)
{
  uint64_t v1 = objc_opt_new(*(void *)(a1 + 32));
  uint64_t v2 = (void *)qword_100157608;
  qword_100157608 = v1;
}

void sub_100026DD4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100026DF0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleKeyBagLockNotification];
}

void sub_1000270D8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, char a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, char a45)
{
}

uint64_t sub_100027120(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100027130(uint64_t a1)
{
}

void sub_100027138(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [*(id *)(a1 + 32) isDataAvailableForClassA]));
  double v6 = *(void **)(*(void *)(a1 + 32) + 32LL);
  double v7 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDataProtectionStateMonitor dataProtectionClassA]( &OBJC_CLASS____DASDataProtectionStateMonitor,  "dataProtectionClassA"));
  [v6 setObject:v5 forKeyedSubscript:v7];

  double v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [*(id *)(a1 + 32) isDataAvailableForClassC]));
  int64_t v9 = *(void **)(*(void *)(a1 + 32) + 32LL);
  double v10 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDataProtectionStateMonitor dataProtectionClassC]( &OBJC_CLASS____DASDataProtectionStateMonitor,  "dataProtectionClassC"));
  [v9 setObject:v8 forKeyedSubscript:v10];

  uint64_t v11 = objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 24) allValues]);
  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8LL);
  __int128 v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;
}

void sub_10002724C(uint64_t a1)
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
  id v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)i);
        double v8 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40),  "objectForKeyedSubscript:",  v7,  (void)v13));
        unsigned int v9 = [v8 BOOLValue];

        double v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:v7]);
        id v11 = [v10 BOOLValue];

        if (v9 != (_DWORD)v11)
        {
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v11));
          [*(id *)(a1 + 40) setObject:v12 forKeyedSubscript:v7];
        }
      }

      id v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v4);
  }
}

void sub_1000275C0(void *a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]]);
  if (v2)
  {
    id v3 = v2;
    *(_BYTE *)(*(void *)(a1[6] + 8) + 24) = [v2 BOOLValue];
    id v2 = v3;
  }

  else
  {
    *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 0;
  }
}

void sub_1000276E8(uint64_t a1)
{
  id v2 = objc_retainBlock(*(id *)(a1 + 48));
  [*(id *)(*(void *)(a1 + 32) + 24) setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
}

id sub_1000277A8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:*(void *)(a1 + 40)];
}

void sub_100027D98(id a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(&OBJC_CLASS____DASActivityRateLimitPolicy));
  id v2 = (void *)qword_100157620;
  qword_100157620 = (uint64_t)v1;
}

void sub_1000280E8(uint64_t a1)
{
  uint64_t v1 = objc_opt_new(*(void *)(a1 + 32));
  id v2 = (void *)qword_100157630;
  qword_100157630 = v1;
}

void sub_100028308(_Unwind_Exception *a1)
{
}

id sub_100028320(uint64_t a1)
{
  return [*(id *)(a1 + 32) setupHighCarbonImpactWindow:*(double *)(*(void *)(a1 + 32) + 80)];
}

void sub_100028424(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 88LL);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](&OBJC_CLASS____CDContextQueries, "keyPathForPluginStatus"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:v3]);
  id v5 = [v4 BOOLValue];

  double v6 = *(void **)(*(void *)(a1 + 32) + 48LL);
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v6;
    double v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v5));
    int v14 = 138412290;
    __int128 v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Plugin status is now %@", (uint8_t *)&v14, 0xCu);
  }

  unsigned int v9 = *(void **)(a1 + 32);
  if ((v5 & 1) != 0)
  {
    double v10 = (void *)v9[11];
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForPluginStatus]( &OBJC_CLASS____CDContextQueries,  "keyPathForPluginStatus"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 lastModifiedDateForContextualKeyPath:v11]);

    [v12 timeIntervalSinceNow];
    if (v13 > -10.0)
    {
      [*(id *)(a1 + 32) resetState];
      [*(id *)(a1 + 32) updatePredictedInterval];
      [*(id *)(a1 + 32) setupHighCarbonImpactWindow:*(double *)(*(void *)(a1 + 32) + 80)];
    }
  }

  else
  {
    [v9 resetState];
  }

int64_t sub_100028B9C(id a1, NSNumber *a2, NSNumber *a3)
{
  if (-[NSNumber compare:](a2, "compare:", a3) == NSOrderedAscending) {
    return -1LL;
  }
  else {
    return 1LL;
  }
}

Class sub_100029070(uint64_t a1)
{
  id v4 = 0LL;
  if (!qword_100157640)
  {
    __int128 v5 = off_1001157C8;
    uint64_t v6 = 0LL;
    qword_100157640 = _sl_dlopen(&v5, &v4);
    id v2 = v4;
    if (!qword_100157640)
    {
      abort_report_np("%s", v4);
      goto LABEL_7;
    }

    if (v4) {
      goto LABEL_8;
    }
  }

  while (1)
  {
    Class result = objc_getClass("_OSChargingPredictor");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
      break;
    }
LABEL_7:
    id v2 = (char *)sub_1000B20F0();
LABEL_8:
    free(v2);
  }

  qword_100157638 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

LABEL_7:
}

  if (*(_BYTE *)(a1 + 40))
  {
    __int128 v15 = [v7 userRequestedBackupTask];
    __int128 v16 = [v8 userRequestedBackupTask];
    if (v15 && !v16) {
      goto LABEL_57;
    }
    if ((v16 ^ 1 | v15) != 1) {
      goto LABEL_53;
    }
  }

  if (*(_BYTE *)(a1 + 41))
  {
    if (+[_DASPhotosPolicy isiCPLActivity:](&OBJC_CLASS____DASPhotosPolicy, "isiCPLActivity:", v7)
      && !+[_DASPhotosPolicy isiCPLActivity:](&OBJC_CLASS____DASPhotosPolicy, "isiCPLActivity:", v8))
    {
      goto LABEL_57;
    }

    if (+[_DASPhotosPolicy isiCPLActivity:](&OBJC_CLASS____DASPhotosPolicy, "isiCPLActivity:", v8)
      && !+[_DASPhotosPolicy isiCPLActivity:](&OBJC_CLASS____DASPhotosPolicy, "isiCPLActivity:", v7))
    {
      goto LABEL_53;
    }
  }

  id v17 = objc_claimAutoreleasedReturnValue([v7 fastPass]);
  if (v17)
  {
    unsigned __int8 v18 = (void *)v17;
    double v19 = (void *)objc_claimAutoreleasedReturnValue([v8 fastPass]);

    if (!v19)
    {
LABEL_57:
      uint64_t v28 = -1LL;
      goto LABEL_58;
    }
  }

  uint64_t v20 = objc_claimAutoreleasedReturnValue([v8 fastPass]);
  if (v20)
  {
    int v21 = (void *)v20;
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v7 fastPass]);

    if (!v22) {
      goto LABEL_53;
    }
  }

  id v23 = objc_claimAutoreleasedReturnValue([v7 fastPass]);
  if (v23)
  {
    int v24 = (void *)v23;
    double v25 = (void *)objc_claimAutoreleasedReturnValue([v8 fastPass]);

    if (v25)
    {
      uint64_t v26 = [v7 staticPriority];
      double v27 = [v7 staticPriority];
      if ((uint64_t)v27 > (uint64_t)[v8 staticPriority])
      {
LABEL_53:
        uint64_t v28 = 1LL;
        goto LABEL_58;
      }
    }
  }

  if ([v7 requiresSignificantUserInactivity]
    && ![v8 requiresSignificantUserInactivity])
  {
    goto LABEL_57;
  }

  if ([v8 requiresSignificantUserInactivity]
    && ![v7 requiresSignificantUserInactivity])
  {
    goto LABEL_53;
  }

  if ([v7 isIntensive] && objc_msgSend(v8, "isIntensive"))
  {
    uint64_t v28 = (uint64_t)[*(id *)(*(void *)(a1 + 32) + 312) compareActivity:v7 withActivity:v8];
    goto LABEL_58;
  }

  if (![v7 requiresNetwork]
    || ![v8 requiresNetwork]
    || (id v35 = [v7 deferred], v35 == objc_msgSend(v8, "deferred")))
  {
    uint64_t v36 = [v7 schedulingPriority];
    if (v36 <= [v8 schedulingPriority])
    {
      uint64_t v37 = [v7 schedulingPriority];
      if (v37 < [v8 schedulingPriority]) {
        goto LABEL_53;
      }
      v38 = [v7 staticPriority];
      if ((uint64_t)v38 >= (uint64_t)[v8 staticPriority])
      {
        v39 = [v7 staticPriority];
        v40 = [v7 maximumRuntime];
        if ((uint64_t)v40 >= (uint64_t)[v8 maximumRuntime])
        {
          v42 = [v7 maximumRuntime];
          v43 = objc_claimAutoreleasedReturnValue([v7 rateLimitConfigurationName]);
          if (!v43
            || (v44 = (void *)v43,
                v45 = (void *)objc_claimAutoreleasedReturnValue([v8 rateLimitConfigurationName]),
                v45,
                v44,
                v45))
          {
            __int128 v46 = objc_claimAutoreleasedReturnValue([v8 rateLimitConfigurationName]);
            if (v46)
            {
              __int128 v47 = (void *)v46;
              __int128 v48 = (void *)objc_claimAutoreleasedReturnValue([v7 rateLimitConfigurationName]);

              if (!v48) {
                goto LABEL_53;
              }
            }

            id v32 = (void *)objc_claimAutoreleasedReturnValue([v7 startBefore]);
            id v33 = objc_claimAutoreleasedReturnValue([v8 startBefore]);
LABEL_44:
            id v34 = (void *)v33;
            uint64_t v28 = (uint64_t)[v32 compare:v33];

            goto LABEL_58;
          }
        }
      }
    }

    goto LABEL_57;
  }

  else {
    uint64_t v28 = 1LL;
  }
LABEL_58:

  return v28;
}

id sub_10002AE30(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) onBudgetChange:a2];
}

id sub_10002AE3C(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 registerSignificantBudgetChangeCallback:*(void *)(a1 + 32)];
}

void sub_10002AE4C(uint64_t a1, int token)
{
  id v3 = *(id **)(a1 + 32);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3[2] objectForKeyedSubscript:@"com.apple.dasd.systemEnergy"]);
  [v3 postNotificationWithBudget:v4];

  __int128 v5 = *(id **)(a1 + 32);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5[2] objectForKeyedSubscript:@"com.apple.dasd.systemCellular"]);
  [v5 postNotificationWithBudget:v6];
}

void sub_10002AF54(uint64_t a1)
{
  uint64_t v1 = objc_opt_class(*(void *)(a1 + 32));
  uint64_t v2 = objc_opt_new(v1);
  id v3 = (void *)qword_100157650;
  qword_100157650 = v2;
}

id sub_10002B184(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unlocked_instantiateConfiguredBudgets");
}

LABEL_10:
}

    id v11 = 0;
    goto LABEL_11;
  }

  uint64_t v12 = self->_log;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_1000B29E0(v12);
  }
  id v11 = 0;
LABEL_19:

  return v11;
}

  [v5 addObject:@"Disk"];
  if ((v3 & 8) != 0) {
    goto LABEL_11;
  }
LABEL_5:
  if ((v3 & 0x10) != 0) {
LABEL_6:
  }
    [v5 addObject:@"GPU"];
LABEL_7:
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "componentsJoinedByString:", @", "));

  return v6;
}

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemonClient applicationBundleIdentifier](self, "applicationBundleIdentifier"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemonClient mainApplicationBundleIdentifier](self, "mainApplicationBundleIdentifier"));
  if (v13)
  {
    unsigned __int8 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"BackgroundTasks"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_1000B89DC();
    }

    if (v12)
    {
      double v19 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon context](self->_daemon, "context"));
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASApplicationPolicy focalApplicationsWithContext:]( &OBJC_CLASS____DASApplicationPolicy,  "focalApplicationsWithContext:",  v19));

      if ((-[os_log_s containsObject:](v20, "containsObject:", v17) & 1) == 0)
      {
        int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"BackgroundTasks"));
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_1000B8978();
        }

        id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  _DASActivitySchedulerErrorDomain,  0LL,  0LL));
        v7[2](v7, v22);

        goto LABEL_53;
      }
    }

    else
    {
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"BackgroundTasks"));
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_1000B8948(v20, v28, v29, v30, v31, v32, v33, v34);
      }
    }
  }

  else
  {
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"BackgroundTasks"));
    uint64_t v20 = v26;
    if (!v12)
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_1000B8A3C(v20, v46, v47, v48, v49, v50, v51, v52);
      }

      v38 = _DASActivitySchedulerErrorDomain;
      v39 = 1LL;
      goto LABEL_52;
    }

    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      sub_1000B8A6C();
    }
  }

  id v35 = (void *)objc_claimAutoreleasedReturnValue([v8 clientProvidedIdentifier]);
  if (![v35 hasPrefix:@"com.apple."])
  {

    goto LABEL_35;
  }

  uint64_t v36 = [v12 hasPrefix:@"com.apple."];

  if ((v36 & 1) != 0)
  {
LABEL_35:
    if (v17)
    {
      v54 = v17;
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v54, 1LL));
      [v8 setRelatedApplications:v40];
    }

    if ((v13 & 1) == 0) {
      [v8 setRequestsApplicationLaunch:1];
    }
    objc_msgSend( v8,  "setUserIdentifier:",  -[NSXPCConnection effectiveUserIdentifier](self->_connection, "effectiveUserIdentifier"));
    -[_DASDaemonClient validateCTBGTaskRequestWithActivity:](self, "validateCTBGTaskRequestWithActivity:", v8);
    daemon = self->_daemon;
    __int128 v53 = 0LL;
    v42 = -[_DASDaemon canSubmitValidatedTaskRequest:withError:]( daemon,  "canSubmitValidatedTaskRequest:withError:",  v8,  &v53);
    uint64_t v20 = (os_log_s *)v53;
    v43 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"BackgroundTasks"));
    v44 = v43;
    if ((v42 & 1) != 0)
    {
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
        sub_1000B87B8();
      }

      if (v13) {
        -[_DASDaemonClient submitActivityInternal:](self, "submitActivityInternal:", v8);
      }
      -[_DASDaemon submitActivity:](self->_daemon, "submitActivity:", v8);
      v45 = 0LL;
    }

    else
    {
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        sub_1000B8818();
      }

      v45 = v20;
    }

    v7[2](v7, v45);
    goto LABEL_53;
  }

  uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"BackgroundTasks"));
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
    sub_1000B8888((uint64_t)v12, v8, v37);
  }

  v38 = _DASActivitySchedulerErrorDomain;
  v39 = 3LL;
LABEL_52:
  uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v38,  v39,  0LL));
  v7[2](v7, v20);
LABEL_53:

LABEL_54:
LABEL_59:
}

LABEL_6:
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleId]);
  if (v6)
  {
    uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 bundleId]);
  }

  else
  {
    if ([v3 pid])
    {
      uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue( +[_DASUtils processNameFromPID:]( _DASUtils,  "processNameFromPID:",  [v3 pid]));
      if (v7) {
        goto LABEL_18;
      }
      double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"systemBudgetManager"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1000B21C4(v3);
      }
    }

    unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"systemBudgetManager"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000B2114(v3);
    }

    uint64_t v7 = 0LL;
  }

  return v10;
}

  unsigned int v9 = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

  unsigned int v9 = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}
}

  v9[2](v9, 0LL);
}

  v11[2](v11, 0LL);
}

void sub_10002BF38(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  v11[0] = @"name";
  id v4 = a3;
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  v12[0] = v5;
  v11[1] = @"balance";
  [v4 balance];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v12[1] = v6;
  v11[2] = @"capacity";
  [v4 capacity];
  double v8 = v7;

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v8));
  v12[2] = v9;
  double v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  3LL));
  [v3 addObject:v10];
}

id sub_10002C418(uint64_t a1)
{
  double v3 = v2;
  uint64_t v4 = objc_claimAutoreleasedReturnValue( +[_DASSystemBudgetManager identifierWithActivity:]( &OBJC_CLASS____DASSystemBudgetManager,  "identifierWithActivity:",  *(void *)(a1 + 40)));
  __int128 v5 = (void *)v4;
  if (v3 == 0.0 || v4 == 0)
  {
    unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"networkbudgeting"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000B22E0((id *)(a1 + 40), v9);
    }
    double v7 = 0LL;
  }

  else
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    double v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(a1 + 48) * 10000.0 / v3));
    [v7 setObject:v8 forKeyedSubscript:@"NWBudgetUsage"];

    [v7 setObject:v5 forKeyedSubscript:@"ClientIdentifier"];
    unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASSystemBudgetManager involvedProcessesForActivity:withIdentifier:]( &OBJC_CLASS____DASSystemBudgetManager,  "involvedProcessesForActivity:withIdentifier:",  *(void *)(a1 + 40),  v5));
    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s anyObject](v9, "anyObject"));
    [v7 setObject:v10 forKeyedSubscript:@"RelatedApplication"];

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v3));
    [v7 setObject:v11 forKeyedSubscript:@"BudgetCapacity"];

    float v12 = *(double *)(a1 + 56) / *(double *)(a1 + 64);
    double v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(a1 + 48) * (float)(v12 * 10000.0) / v3));
    [v7 setObject:v13 forKeyedSubscript:@"CellUsage"];

    int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(a1 + 48) * (float)((float)(1.0 - v12) * 10000.0) / v3));
    [v7 setObject:v14 forKeyedSubscript:@"WifiUsage"];

    float v15 = *(double *)(a1 + 72) / *(double *)(a1 + 64);
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(a1 + 48) * (float)(v15 * 10000.0) / v3));
    [v7 setObject:v16 forKeyedSubscript:@"InexpensiveUsage"];

    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(a1 + 48) * (float)((float)(1.0 - v15) * 10000.0) / v3));
    [v7 setObject:v17 forKeyedSubscript:@"ExpensiveUsage"];

    unsigned __int8 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"networkbudgeting"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_1000B226C((uint64_t)v7, v18);
    }
  }

  return v7;
}

void sub_10002C7F4( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10002C918(uint64_t a1)
{
  uint64_t v1 = -[_DASRemoteDeviceWakeMonitor initWithDaemon:]( objc_alloc(&OBJC_CLASS____DASRemoteDeviceWakeMonitor),  "initWithDaemon:",  *(void *)(a1 + 32));
  double v2 = (void *)qword_100157670;
  qword_100157670 = (uint64_t)v1;
}

void sub_10002CC1C(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  double v2 = (void *)qword_100157680;
  qword_100157680 = (uint64_t)v1;
}

void sub_10002CD30(uint64_t a1)
{
  double v2 = (void *)os_transaction_create("com.apple.dasd.applicationpolicy.recentapps");
  double v3 = objc_autoreleasePoolPush();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPredictionManager sharedKnowledgeStore]( &OBJC_CLASS____DASPredictionManager,  "sharedKnowledgeStore"));
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams appInFocusStream](&OBJC_CLASS____DKSystemEventStreams, "appInFocusStream"));
  uint64_t v6 = objc_alloc(&OBJC_CLASS___NSDateInterval);
  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", -1800.0));
  double v8 = -[NSDateInterval initWithStartDate:duration:](v6, "initWithStartDate:duration:", v7, 1800.0);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( +[_DKHistogramQuery histogramQueryForStream:interval:]( &OBJC_CLASS____DKHistogramQuery,  "histogramQueryForStream:interval:",  v5,  v8));

  [v9 setIncludeRemoteResults:0];
  double v10 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPredictionManager predictionGenerationQueue]( &OBJC_CLASS____DASPredictionManager,  "predictionGenerationQueue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10002CEB0;
  v13[3] = &unk_1001158E8;
  id v11 = v2;
  uint64_t v12 = *(void *)(a1 + 32);
  id v14 = v11;
  uint64_t v15 = v12;
  [v4 executeQuery:v9 responseQueue:v10 withCompletion:v13];

  objc_autoreleasePoolPop(v3);
}

void sub_10002CEB0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v19 = a3;
  context = objc_autoreleasePoolPush();
  id v6 = *(id *)(*(void *)(a1 + 40) + 80LL);
  objc_sync_enter(v6);
  [*(id *)(*(void *)(a1 + 40) + 80) removeAllObjects];
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v5 countDictionary]);
  if ((unint64_t)[v7 count] < 0x1A)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10002D218;
    v21[3] = &unk_100115070;
    v21[4] = *(void *)(a1 + 40);
    [v7 enumerateKeysAndObjectsUsingBlock:v21];
  }

  else
  {
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_10002D19C;
    v26[3] = &unk_1001158C0;
    id v8 = v7;
    id v27 = v8;
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 keysSortedByValueUsingComparator:v26]);
    id v10 = [v9 mutableCopy];

    objc_msgSend( v10,  "removeObjectsInRange:",  25,  (unint64_t)((double)(unint64_t)objc_msgSend(v8, "count") + -25.0));
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v11 = v10;
    id v12 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v23;
      do
      {
        id v14 = 0LL;
        do
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void **)(*(void *)(a1 + 40) + 80LL);
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * (void)v14), "dk_dedup"));
          [v15 addObject:v16];

          id v14 = (char *)v14 + 1;
        }

        while (v12 != v14);
        id v12 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }

      while (v12);
    }
  }

  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar"));
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 80LL);
    *(_DWORD *)buf = 138412290;
    uint64_t v29 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Recent Applications: %@", buf, 0xCu);
  }

  objc_sync_exit(v6);
  objc_autoreleasePoolPop(context);
}

void sub_10002D168(_Unwind_Exception *a1)
{
}

id sub_10002D19C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v6]);

  id v9 = [v7 compare:v8];
  return v9;
}

void sub_10002D218(uint64_t a1, void *a2)
{
  double v2 = *(void **)(*(void *)(a1 + 32) + 80LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "dk_dedup"));
  [v2 addObject:v3];
}

void sub_10002D438(_Unwind_Exception *a1)
{
}

void sub_10002DB00( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

uint64_t sub_10002DB40(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10002DB50(uint64_t a1)
{
}

void sub_10002DB58(uint64_t a1)
{
  double v2 = (void *)os_transaction_create("com.apple.dasd.anyAppPredictions");
  id v3 = objc_autoreleasePoolPush();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) topNPrediction]);

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) topNPrediction]);
    unsigned int v6 = +[_DASPredictionManager predictionNeedsUpdating:atDate:lastUpdatedAt:]( &OBJC_CLASS____DASPredictionManager,  "predictionNeedsUpdating:atDate:lastUpdatedAt:",  v5,  *(void *)(a1 + 40),  *(void *)(*(void *)(a1 + 32) + 56LL));

    if (v6)
    {
      id v11 = _NSConcreteStackBlock;
      uint64_t v12 = 3221225472LL;
      uint64_t v13 = sub_10002DC80;
      id v14 = &unk_100115148;
      double v7 = *(void **)(a1 + 40);
      uint64_t v15 = *(void *)(a1 + 32);
      id v16 = v7;
      +[_DASPredictionManager asyncDo:](&OBJC_CLASS____DASPredictionManager, "asyncDo:", &v11);
    }
  }

  else
  {
    [*(id *)(a1 + 32) updatePredictionsAtDate:*(void *)(a1 + 40)];
  }

  uint64_t v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "topNPrediction", v11, v12, v13, v14, v15));
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  objc_autoreleasePoolPop(v3);
}

id sub_10002DC80(uint64_t a1)
{
  return [*(id *)(a1 + 32) updatePredictionsAtDate:*(void *)(a1 + 40)];
}

void sub_10002E538( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, char a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
}

void sub_10002E5B0(uint64_t a1, void *a2)
{
  id v4 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 72) + 8LL) + 32LL));
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 40LL), a2);
    [*(id *)(*(void *)(a1 + 40) + 40) setObject:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) forKeyedSubscript:*(void *)(a1 + 48)];
    [*(id *)(*(void *)(a1 + 40) + 64) setObject:*(void *)(a1 + 56) forKeyedSubscript:*(void *)(a1 + 48)];
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 72) + 8LL) + 32LL));
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"predictions"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 40LL);
    *(_DWORD *)buf = 138412546;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Timeline for %@: %@", buf, 0x16u);
  }

  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 40LL);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"application.%@",  *(void *)(a1 + 48)));
  +[_DASPredictionManager setPrediction:forKey:](&OBJC_CLASS____DASPredictionManager, "setPrediction:forKey:", v8, v9);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
}

LABEL_8:
  uint64_t v18 = [(id)objc_opt_class(self) focalApplicationsWithContext:v7];
  id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v6 relatedApplications]);
  int v21 = [v20 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v21)
  {
    __int128 v22 = v21;
    __int128 v23 = *(void *)v42;
LABEL_10:
    __int128 v24 = 0LL;
    while (1)
    {
      if (*(void *)v42 != v23) {
        objc_enumerationMutation(v20);
      }
      if (v22 == (id)++v24)
      {
        __int128 v22 = [v20 countByEnumeratingWithState:&v41 objects:v46 count:16];
        if (v22) {
          goto LABEL_10;
        }
        goto LABEL_16;
      }
    }

    if ([v6 requestsApplicationLaunch])
    {
      __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v6 launchReason]);
      if ([v25 isEqualToString:_DASLaunchReasonBackgroundFetch])
      {
      }

      else
      {
        id v27 = [v6 isBackgroundTaskActivity];

        if ((v27 & 1) == 0) {
          goto LABEL_24;
        }
      }

      id v16 = -[_DASPolicyResponseRationale initWithPolicyName:]( objc_alloc(&OBJC_CLASS____DASPolicyResponseRationale),  "initWithPolicyName:",  @"Application Policy");
      -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:]( v16,  "addRationaleForCondition:withRequiredValue:withCurrentValue:",  @"appIsForeground",  0.0,  1.0);
      uint64_t v28 = objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  33LL,  v16,  10800.0));
      goto LABEL_32;
    }

    [0 addRationaleForCondition:@"appIsForeground" withRequiredValue:1.0 withCurrentValue:1.0];
    uint64_t v26 = 67LL;
    goto LABEL_28;
  }

  id v14 = *((_BYTE *)v29 + 24);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v14;
}

  id v14 = *((_BYTE *)v29 + 24);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v14;
}
}

  id v19 = -1LL;
LABEL_11:

  objc_sync_exit(v8);
  return v19;
}

LABEL_16:
LABEL_24:
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v6 launchReason]);
  if ([v29 isEqualToString:_DASLaunchReasonBackgroundRemoteNotification])
  {

LABEL_27:
    uint64_t v26 = 0LL;
LABEL_28:
    id v32 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  v26,  0LL,  10800.0));
    goto LABEL_29;
  }

  v30 = (void *)objc_claimAutoreleasedReturnValue([v6 launchReason]);
  uint64_t v31 = [v30 isEqualToString:_DASLaunchReasonBackgroundNewsstand];

  if (v31) {
    goto LABEL_27;
  }
  id v33 = (void *)objc_claimAutoreleasedReturnValue(+[_DASFileProtectionPolicy policyInstance](&OBJC_CLASS____DASFileProtectionPolicy, "policyInstance"));
  id v34 = [v33 isClassCLocked];

  if (v34)
  {
    id v16 = -[_DASPolicyResponseRationale initWithPolicyName:]( objc_alloc(&OBJC_CLASS____DASPolicyResponseRationale),  "initWithPolicyName:",  @"Application Policy");
    -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:]( v16,  "addRationaleForCondition:withRequiredValue:withCurrentValue:",  @"classCLocked",  1.0,  0.0);
    uint64_t v28 = objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithScore:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithScore:validityDuration:rationale:",  v16,  0.5,  10800.0));
LABEL_32:
    id v32 = (void *)v28;
    goto LABEL_33;
  }

  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[_DASApplicationPolicy scoreForActivity:atDate:withRationale:]( self,  "scoreForActivity:atDate:withRationale:",  v6,  v36,  0LL);
  v38 = v37;
  if ([v6 beforeApplicationLaunch] && v38 <= 0.05)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"isPluggedIn == %@ AND likelihood == %lf",  &__kCFBooleanFalse,  *(void *)&v38));
    [0 addRationaleWithCondition:v39];

    v40 = objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  33LL,  0LL,  (double)0x384uLL));
  }

  else
  {
    v40 = objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithScore:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithScore:validityDuration:rationale:",  0LL,  v38,  (double)0x384uLL));
  }

  id v32 = (void *)v40;

LABEL_29:
  id v16 = 0LL;
LABEL_33:

LABEL_36:
  return v32;
}
  }

  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:"));
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown State %@ Count",  v4));

    return v3;
  }

  if ((uint64_t)a3 > 44)
  {
    if (a3 == 45)
    {
      id v3 = @"Limited";
      return v3;
    }

    if (a3 == 50)
    {
      id v3 = @"Canceled";
      return v3;
    }

    goto LABEL_16;
  }

  if (a3 == 30)
  {
    id v3 = @"Completed";
    return v3;
  }

  if (a3 != 40) {
    goto LABEL_16;
  }
  id v3 = @"Expired";
  return v3;
}

        [v26 addObject:v8];
      }

      id v27 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }

    while (v27);
  }

  return v26;
}

        [v26 addObject:v8];
      }

      id v27 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }

    while (v27);
  }

  return v26;
}

void sub_10002F0A8(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS____DASBatteryLevelPolicy);
  double v2 = (void *)qword_1001576A8;
  qword_1001576A8 = (uint64_t)v1;
}

id sub_10002F7E4(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateSystemConstraintsWithContext:*(void *)(a1 + 40)];
}

void sub_10002F9CC(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS____DASBootTimePolicy);
  double v2 = (void *)qword_1001576C0;
  qword_1001576C0 = (uint64_t)v1;
}

LABEL_28:
            uint64_t v13 = 0LL;
            self->_didExceedMinDurationAfterBootNonRepeatingNonDiscretionary = 1;
LABEL_29:
            -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:]( v6,  "addRationaleForCondition:withRequiredValue:withCurrentValue:",  @"Minimum seconds after boot",  v21);
            goto LABEL_9;
          }
        }

        else
        {
          self->_didExceedMinDurationAfterBoot = 1;
        }

        self->_didExceedMinDurationAfterBootNetworkActivites = 1;
        goto LABEL_28;
      }
    }
  }

  uint64_t v13 = 0LL;
LABEL_9:
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  v13,  v6,  (double)0x384uLL));

  return v14;
}
}
}

  __int128 v25 = objc_claimAutoreleasedReturnValue([v4 fastPass]);
  if (v25)
  {
    uint64_t v26 = (void *)v25;
    id v27 = -[_DASRuntimeLimiter featureHasNoRemainingRuntimeForActivity:]( self->_runtimeLimiter,  "featureHasNoRemainingRuntimeForActivity:",  v4);

    if (v27)
    {
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPostRestoreBUILogger sharedInstance]( &OBJC_CLASS____DASPostRestoreBUILogger,  "sharedInstance"));
      [v28 reportState:30 forActivity:v4];
    }
  }

  os_unfair_recursive_lock_unlock(v39);
  if (v23) {
    -[_DASDaemon recordToTaskRegistry:lifeCycleStateName:]( self,  "recordToTaskRegistry:lifeCycleStateName:",  v4,  @"suspended");
  }
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPLLogger sharedInstance](&OBJC_CLASS____DASPLLogger, "sharedInstance"));
  [v29 recordActivityLifeCycleEnd:v4];

  -[_DASDaemon recordToTaskRegistry:lifeCycleStateName:]( self,  "recordToTaskRegistry:lifeCycleStateName:",  v4,  @"canceled");
  -[_DASDaemon cleanupForActivity:wasCompleted:](self, "cleanupForActivity:wasCompleted:", v4, 0LL);
  v30 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityDurationTracker sharedInstance]( &OBJC_CLASS____DASActivityDurationTracker,  "sharedInstance"));
  [v30 activityCanceled:v4];

  if ([v4 userRequestedBackupTask])
  {
    [v4 setCompletionStatus:3];
    -[_DASUserRequestedBackupTaskManager reportActivityNoLongerRunning:]( self->_backupTaskManager,  "reportActivityNoLongerRunning:",  v4);
  }

  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v4 setEndTime:v31];

  -[_DASFeatureDurationTracker updateFeatureDurationActivityCompleted:]( self->_featureDurationTracker,  "updateFeatureDurationActivityCompleted:",  v4);
  if (arc4random_uniform(0xFA0u) == 1)
  {
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_100089CAC;
    v41[3] = &unk_100116FF0;
    v41[4] = self;
    v42 = v4;
    AnalyticsSendEventLazy(@"com.apple.dasd.taskmetrics", v41);
  }

  if (+[_DASPhotosPolicy isiCPLActivity:](&OBJC_CLASS____DASPhotosPolicy, "isiCPLActivity:", v4))
  {
    id v32 = (void *)objc_claimAutoreleasedReturnValue([v4 suspendRequestDate]);

    if (!v32)
    {
      id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        id v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_photosIsBlocked));
        *(_DWORD *)buf = 138543618;
        __int128 v49 = v4;
        __int128 v50 = 2112;
        __int128 v51 = v34;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Reporting photos activity no longer blocked: %{public}@ (was %@)",  buf,  0x16u);
      }

      -[_DASDaemon updateiCPLTasksBlocked:](self, "updateiCPLTasksBlocked:", 0LL);
    }
  }
}

      id v17 = (char *)v17 + 1;
    }

    while (v15 != v17);
    v39 = [v13 countByEnumeratingWithState:&v50 objects:v54 count:16];
    uint64_t v15 = v39;
  }

  while (v39);
LABEL_32:

  +[_DASMetricRecorder incrementOccurrencesForKey:byCount:]( _DASMetricRecorder,  "incrementOccurrencesForKey:byCount:",  @"com.apple.das.evaluationCount",  [v6 count]);
  -[_DASDaemon chooseActivitiesToRunFromCandidateActivities:toBeRunActivities:toLaunchApplications:toLaunchExtension:]( v47,  "chooseActivitiesToRunFromCandidateActivities:toBeRunActivities:toLaunchApplications:toLaunchExtension:",  v6,  v40,  v42,  v41);
  if ([v40 count]) {
    -[_DASDaemon runActivitiesAndRemoveUnknown:](v47, "runActivitiesAndRemoveUnknown:", v40);
  }
  id v5 = v43;
  id v4 = v44;
  if ([v42 count]) {
    -[_DASDaemon runApplicationLaunchActivities:](v47, "runApplicationLaunchActivities:", v42);
  }
  if ([v41 count]) {
    -[_DASDaemon runExtensionLaunchActivities:](v47, "runExtensionLaunchActivities:", v41);
  }
  if ([v46 count]) {
    -[_DASDaemon cancelActivities:](v47, "cancelActivities:", v46);
  }

LABEL_41:
  objc_autoreleasePoolPop(v5);
}

void sub_10002FFE8(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  double v2 = (void *)qword_1001576D8;
  qword_1001576D8 = (uint64_t)v1;
}

void sub_100030568( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
}

id sub_100030588(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCache];
}

void sub_1000305D0(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS____DASRequiresBuddyCompletePolicy);
  double v2 = (void *)qword_1001576E8;
  qword_1001576E8 = (uint64_t)v1;
}

void sub_100030740(uint64_t a1)
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 56) objectForKeyedSubscript:&off_100121B28]);
  if (!v2)
  {
    [*(id *)(*(void *)(a1 + 40) + 56) setObject:&__kCFBooleanFalse forKeyedSubscript:&off_100121B28];
    [*(id *)(a1 + 40) _updateCache];
    double v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 56) objectForKeyedSubscript:&off_100121B28]);
  }

  id v3 = v2;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 BOOLValue];
}

void *sub_1000309D0(uint64_t a1)
{
  id v5 = 0LL;
  if (!qword_1001576F8)
  {
    __int128 v6 = off_100115990;
    uint64_t v7 = 0LL;
    qword_1001576F8 = _sl_dlopen(&v6, &v5);
    id v3 = v5;
    double v2 = (void *)qword_1001576F8;
    if (qword_1001576F8)
    {
      if (!v5) {
        goto LABEL_5;
      }
    }

    else
    {
      id v3 = (char *)abort_report_np("%s", v5);
    }

    free(v3);
    goto LABEL_5;
  }

  double v2 = (void *)qword_1001576F8;
LABEL_5:
  Class result = dlsym(v2, "BYSetupAssistantNeedsToRun");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  off_1001576F0 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

void sub_100031278(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [v2 handleTimerFireAtDate:v3 withContext:*(void *)(*(void *)(a1 + 32) + 48)];
}

void sub_10003130C(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS____DASNetworkSynchronizationPolicy);
  double v2 = (void *)qword_100157708;
  qword_100157708 = (uint64_t)v1;
}

void sub_1000315F8(uint64_t a1)
{
  double v2 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.duetactivityscheduler");
  unsigned int v3 = -[NSUserDefaults BOOLForKey:](v2, "BOOLForKey:", @"postNWAlignmentNotifications");

  if (v3)
  {
    if (*(_BYTE *)(a1 + 32)) {
      id v4 = @"Denying tasks due to network alignment.";
    }
    else {
      id v4 = @"No longer denying tasks due to network alignment.";
    }
    id v5 = v4;
    id v7 = (id)objc_claimAutoreleasedReturnValue(+[_DASNotificationManager sharedManager](&OBJC_CLASS____DASNotificationManager, "sharedManager"));
    __int128 v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  10800.0));
    [v7 postNotificationAtDate:0 withTitle:@"Network Alignment" withTextContent:v5 icon:0 url:0 expirationDate:v6];
  }

void sub_100031AE4(_Unwind_Exception *a1)
{
}

void sub_100031D98( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100032064( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1000320F4(_Unwind_Exception *a1)
{
}

void sub_100032378(_Unwind_Exception *a1)
{
}

void sub_10003248C(_Unwind_Exception *a1)
{
}

void sub_10003253C(_Unwind_Exception *a1)
{
}

void sub_100032618(_Unwind_Exception *a1)
{
}

void sub_1000329BC(_Unwind_Exception *a1)
{
}

void sub_1000329E8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8LL));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained assertionArbiter:v2 didIssueWarningFor:v3];
}

void sub_100032A44(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8LL));
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained assertionArbiter:v4 didIssueInvalidationFor:v5 serverInitiated:a2];
}

LABEL_20:
    id v14 = 0LL;
    goto LABEL_21;
  }

  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue([v6 launchReason]);
  uint64_t v13 = [v12 isEqualToString:_DASLaunchReasonHealthResearch];

  if ((v13 & 1) != 0)
  {
LABEL_13:
    uint64_t v9 = @"BGProcessingTask-Unrestricted";
    goto LABEL_18;
  }

  if (!-[_DASAssertionArbiter doesPID:haveEntitlement:]( self,  "doesPID:haveEntitlement:",  v4,  @"com.apple.developer.web-browser-engine.networking"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 v23 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "Acquiring unrestricted assertion for Continued Processing",  v23,  2u);
    }

    goto LABEL_13;
  }

  id v14 = (_DASAssertion *)objc_claimAutoreleasedReturnValue( -[_DASAssertionArbiter assertionForWebBrowserContinuedProcessingTask:targetPID:]( self,  "assertionForWebBrowserContinuedProcessingTask:targetPID:",  v6,  [v6 pid]));
LABEL_21:

  return v14;
}

        uint64_t v18 = (double)0x384uLL;
        id v19 = 33LL;
        goto LABEL_21;
      }
    }
  }

  uint64_t v20 = [v6 schedulingPriority];
  int v21 = (double)v8;
  if ((unint64_t)v20 <= _DASSchedulingPriorityBackground)
  {
    __int128 v22 = 1.0;
    -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:]( v9,  "addRationaleForCondition:withRequiredValue:withCurrentValue:",  @"memoryPressure",  1.0,  v21);
    __int128 v23 = !+[_DASDeviceActivityPolicy isDeviceInUse:](&OBJC_CLASS____DASDeviceActivityPolicy, "isDeviceInUse:", v7);
    if ((v8 & 2) == 0) {
      __int128 v23 = 1;
    }
    if (v23 != 1 || (v8 & 4) != 0) {
      goto LABEL_20;
    }
  }

  else
  {
    -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:]( v9,  "addRationaleForCondition:withRequiredValue:withCurrentValue:",  @"memoryPressure",  2.0,  v21);
    if ((v8 & 4) != 0) {
      goto LABEL_20;
    }
    if (v8 <= 1) {
      __int128 v22 = 1.0;
    }
    else {
      __int128 v22 = 0.5;
    }
  }

  __int128 v24 = objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithScore:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithScore:validityDuration:rationale:",  v9,  v22,  (double)0x384uLL));
LABEL_22:
  uint64_t v26 = (void *)v24;

  return v26;
}

      if (v11 == (id)++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (!v11)
        {
LABEL_22:

          id v3 = v25;
          __int128 v6 = v26;
          goto LABEL_23;
        }

        goto LABEL_7;
      }
    }

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dk_dedup"));

    p_fetchEnabledApps = &self->_pushEnabledApps;
LABEL_19:
    -[NSMutableSet addObject:](*p_fetchEnabledApps, "addObject:", v16);

    goto LABEL_20;
  }

          __int128 v47 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27 launchReason]);
          [v85 addObject:v47];
          goto LABEL_21;
        }

        v45 = (void *)objc_claimAutoreleasedReturnValue([v27 launchReason]);
        __int128 v46 = [v45 isEqualToString:v78];

        if (v46)
        {
          id v32 = (id)objc_claimAutoreleasedReturnValue([v27 userInfo]);
          id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:v76]);
          [v79 addEntriesFromDictionary:v33];
          goto LABEL_19;
        }

        __int128 v48 = (void *)objc_claimAutoreleasedReturnValue([v27 launchReason]);
        __int128 v49 = [v48 isEqualToString:v77];

        if ((v49 & 1) != 0) {
          goto LABEL_20;
        }
        __int128 v50 = (void *)objc_claimAutoreleasedReturnValue([v27 launchReason]);
        __int128 v51 = [v50 isEqualToString:v75];

        if ((v51 & 1) != 0) {
          goto LABEL_20;
        }
        __int128 v52 = (void *)objc_claimAutoreleasedReturnValue([v27 launchReason]);
        __int128 v53 = [v52 isEqualToString:v74];

        if ((v53 & 1) != 0) {
          goto LABEL_20;
        }
        v54 = (void *)objc_claimAutoreleasedReturnValue([v27 launchReason]);
        uint64_t v55 = [v54 isEqualToString:v73];

        if ((v55 & 1) != 0) {
          goto LABEL_20;
        }
        __int128 v47 = v28;
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          __int16 v56 = (void *)objc_claimAutoreleasedReturnValue([v27 launchReason]);
          *(_DWORD *)buf = v64;
          v120 = v56;
          v121 = 2112;
          v122 = v88;
          _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_INFO,  "Encountered unexpected launch reason %@ for %@",  buf,  0x16u);
        }

  if (!-[NSMutableSet containsObject:](self->_runningTasks, "containsObject:", v4, p_activityStateLock))
  {
    if (!+[_DASCheckpointRecorder shouldLogCheckpointForActivity:]( &OBJC_CLASS____DASCheckpointRecorder,  "shouldLogCheckpointForActivity:",  v4))
    {
      __int128 v23 = 0;
      goto LABEL_28;
    }

    goto LABEL_25;
  }

  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v4 suspendRequestDate]);
  __int128 v23 = v22 != 0LL;

  if (+[_DASCheckpointRecorder shouldLogCheckpointForActivity:]( &OBJC_CLASS____DASCheckpointRecorder,  "shouldLogCheckpointForActivity:",  v4))
  {
    if (v22)
    {
      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(+[_DASCheckpointRecorder sharedInstance](&OBJC_CLASS____DASCheckpointRecorder, "sharedInstance"));
      [v24 reportTaskCheckpoint:40 forTask:v4 error:0];
      __int128 v23 = 1;
LABEL_26:

      goto LABEL_28;
    }

  return v4;
}

void sub_100033350(_Unwind_Exception *a1)
{
}

void sub_100033864(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void sub_100033878(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void sub_10003388C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100033AAC(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = (void *)qword_100157718;
  qword_100157718 = (uint64_t)v1;
}

void sub_100033F5C(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = (void *)qword_100157728;
  qword_100157728 = (uint64_t)v1;
}

void sub_1000343F0(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS____DASCPUUsagePolicy);
  uint64_t v2 = (void *)qword_100157738;
  qword_100157738 = (uint64_t)v1;
}

void sub_100034A14(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS____DASDataBudgetPolicy);
  uint64_t v2 = (void *)qword_100157748;
  qword_100157748 = (uint64_t)v1;
}

id sub_100034F9C(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateSystemConstraintsWithContext:*(void *)(a1 + 40)];
}

void sub_100035468(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = (void *)qword_100157760;
  qword_100157760 = (uint64_t)v1;
}

void sub_10003561C(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) deviceNearbyTimeline]);
  unsigned int v3 = +[_DASPredictionManager predictionNeedsUpdating:atDate:lastUpdatedAt:]( &OBJC_CLASS____DASPredictionManager,  "predictionNeedsUpdating:atDate:lastUpdatedAt:",  v2,  *(void *)(a1 + 40),  *(void *)(*(void *)(a1 + 32) + 48LL));

  if (v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) predictionForDeviceNearby]);
    [*(id *)(a1 + 32) setDeviceNearbyTimeline:v4];

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 48LL), *(id *)(a1 + 40));
  }

void sub_100035D54(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) predictionForDeviceActivity]);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 48LL), v2);
  +[_DASPredictionManager setPrediction:forKey:]( &OBJC_CLASS____DASPredictionManager,  "setPrediction:forKey:",  v2,  @"deviceActivity");
  unsigned int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"predictions"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000B2B68((uint64_t)v2, v3, v4);
  }

  uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v5;
}

void sub_100035EE8(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = (void *)qword_100157770;
  qword_100157770 = (uint64_t)v1;
}

void sub_100036218(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) deviceActivityTimeline]);
  unsigned int v4 = +[_DASPredictionManager predictionNeedsUpdating:atDate:lastUpdatedAt:]( &OBJC_CLASS____DASPredictionManager,  "predictionNeedsUpdating:atDate:lastUpdatedAt:",  v3,  v2[1],  *((void *)*v2 + 7));

  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*v2 predictionForDeviceActivity]);
    [*v2 setDeviceActivityTimeline:v5];

    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"predictions"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_1000B2BD4(v2, v6);
    }

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 56LL), *(id *)(a1 + 40));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) deviceActivityTimeline]);
    +[_DASPredictionManager setPrediction:forKey:]( &OBJC_CLASS____DASPredictionManager,  "setPrediction:forKey:",  v7,  @"deviceActivity");
  }

void sub_100036AD0(id a1)
{
  id v1 = objc_opt_new(&OBJC_CLASS____APRSFreezerInterface);
  uint64_t v2 = (void *)qword_100157778;
  qword_100157778 = (uint64_t)v1;
}

void sub_100036CC8(uint64_t a1)
{
  uint64_t v1 = objc_opt_new(*(void *)(a1 + 32));
  uint64_t v2 = (void *)qword_100157788;
  qword_100157788 = v1;
}

void sub_100036EBC(_Unwind_Exception *a1)
{
}

id sub_100036FA8()
{
  uint64_t v4 = 0LL;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000LL;
  v0 = (void *)qword_100157798;
  uint64_t v7 = qword_100157798;
  if (!qword_100157798)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_100039840;
    v3[3] = &unk_100115300;
    void v3[4] = &v4;
    sub_100039840((uint64_t)v3);
    v0 = (void *)v5[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100037044( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000378B8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

id sub_100037A8C(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  uint64_t v8 = off_1001577B8;
  id v17 = off_1001577B8;
  if (!off_1001577B8)
  {
    uint64_t v9 = (void *)sub_100039894();
    uint64_t v8 = dlsym(v9, "PPSCreateSubsystemCategoryPredicate");
    v15[3] = (uint64_t)v8;
    off_1001577B8 = v8;
  }

  _Block_object_dispose(&v14, 8);
  if (!v8)
  {
    uint64_t v13 = (_Unwind_Exception *)sub_1000B2404();
    _Block_object_dispose(&v14, 8);
    _Unwind_Resume(v13);
  }

  uint64_t v10 = ((uint64_t (*)(id, id, id))v8)(v5, v6, v7);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  return v11;
}

id sub_100037B74()
{
  uint64_t v4 = 0LL;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000LL;
  v0 = (void *)qword_1001577C0;
  uint64_t v7 = qword_1001577C0;
  if (!qword_1001577C0)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_100039998;
    v3[3] = &unk_100115300;
    void v3[4] = &v4;
    sub_100039998((uint64_t)v3);
    v0 = (void *)v5[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100037C10( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000381DC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_100038410( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_10003910C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, char a37)
{
}

Class sub_100039840(uint64_t a1)
{
  Class result = objc_getClass("PPSTimeSeries");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_100157798 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    sub_1000B2DDC();
    return (Class)sub_100039894();
  }

  return result;
}

uint64_t sub_100039894()
{
  unsigned int v3 = 0LL;
  if (!qword_1001577A0)
  {
    __int128 v4 = off_100115AB0;
    uint64_t v5 = 0LL;
    qword_1001577A0 = _sl_dlopen(&v4, &v3);
  }

  uint64_t v0 = qword_1001577A0;
  id v1 = v3;
  if (!qword_1001577A0)
  {
    id v1 = (char *)abort_report_np("%s", v3);
    goto LABEL_7;
  }

  if (v3) {
LABEL_7:
  }
    free(v1);
  return v0;
}

Class sub_100039944(uint64_t a1)
{
  Class result = objc_getClass("PPSRequestDispatcher");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_1001577A8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    uint64_t v3 = sub_1000B2E00();
    return (Class)sub_100039998(v3);
  }

  return result;
}

Class sub_100039998(uint64_t a1)
{
  Class result = objc_getClass("PPSTimeSeriesRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_1001577C0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    uint64_t v3 = sub_1000B2E24();
    return (Class)sub_1000399EC(v3);
  }

  return result;
}

Class sub_1000399EC(uint64_t a1)
{
  Class result = objc_getClass("PPSHistogramRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_1001577C8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    uint64_t v3 = sub_1000B2E48();
    return (Class)sub_100039A40(v3);
  }

  return result;
}

Class sub_100039A40(uint64_t a1)
{
  Class result = objc_getClass("PPSIntervalSetRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_1001577D0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    uint64_t v3 = sub_1000B2E6C();
    return (Class)sub_100039A94(v3);
  }

  return result;
}

_APRSSignpostReader *sub_100039A94(uint64_t a1)
{
  Class result = (_APRSSignpostReader *)objc_getClass("PPSEvent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_1001577D8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    uint64_t v3 = (_APRSSignpostReader *)sub_1000B2E90();
    return -[_APRSSignpostReader init](v3, v4);
  }

  return result;
}

void sub_10003A138(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void sub_10003A14C( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_10003A388(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS____DASEnergyBudgetPolicy);
  uint64_t v2 = (void *)qword_1001577E8;
  qword_1001577E8 = (uint64_t)v1;
}

id sub_10003A8BC(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateSystemConstraintsWithContext:*(void *)(a1 + 40)];
}

void sub_10003AC24(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 8LL) = 0;
  notify_cancel(*(_DWORD *)(*(void *)(a1 + 32) + 12LL));
  id v1 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"fileProtection"));
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Device is now ClassC unlocked", v2, 2u);
  }
}

void sub_10003AD20(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = (void *)qword_100157800;
  qword_100157800 = (uint64_t)v1;
}

void sub_10003B2AC(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS____DASFastPassPolicy);
  uint64_t v2 = (void *)qword_100157810;
  qword_100157810 = (uint64_t)v1;
}

uint64_t sub_10003B490(uint64_t result)
{
  *(_BYTE *)(*(void *)(result + 32) + 8LL) = 0;
  return result;
}

void sub_10003B844(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = (void *)qword_100157820;
  qword_100157820 = (uint64_t)v1;
}

void sub_10003BB60(uint64_t a1, void *a2)
{
  id v3 = a2;
  SEL v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  -1900800.0));
  if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 8LL), OS_LOG_TYPE_DEBUG)) {
    sub_1000B3258();
  }
  +[_APRSBiomeBase pruneEventsOlderThanDate:](&OBJC_CLASS____APRSBiomeAppKillEvent, "pruneEventsOlderThanDate:", v4);
  +[_APRSBiomeBase pruneEventsOlderThanDate:]( &OBJC_CLASS____APRSBiomeAppLaunchTimeEvent,  "pruneEventsOlderThanDate:",  v4);
  +[_APRSBiomeBase pruneEventsOlderThanDate:](&OBJC_CLASS____APRSBiomeAppStateEvent, "pruneEventsOlderThanDate:", v4);
  uint64_t v27 = 0LL;
  uint64_t v28 = (double *)&v27;
  uint64_t v29 = 0x2020000000LL;
  uint64_t v30 = 0LL;
  uint64_t v23 = 0LL;
  __int128 v24 = (double *)&v23;
  uint64_t v25 = 0x2020000000LL;
  uint64_t v26 = 0LL;
  uint64_t v19 = 0LL;
  uint64_t v20 = (double *)&v19;
  uint64_t v21 = 0x2020000000LL;
  uint64_t v22 = 0LL;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  -86400.0));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 appActivationTimeInfoStartingAtDate:v6 withBookmarkKey:0]);

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10003BE98;
  v18[3] = &unk_100115B28;
  v18[4] = &v27;
  v18[5] = &v23;
  v18[6] = &v19;
  [v7 enumerateKeysAndObjectsUsingBlock:v18];
  double v8 = v20[3];
  double v9 = v24[3] + v8;
  if (v9 == 0.0)
  {
    double v11 = 0.0;
    double v10 = 0.0;
  }

  else
  {
    double v10 = v8 / v9 * 100.0;
    double v11 = v28[3] / v9;
  }

  v31[0] = @"resumeRate";
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v10));
  v31[1] = @"avgActivationTime";
  v32[0] = v12;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v11));
  v32[1] = v13;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  2LL));

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10003BF58;
  v16[3] = &unk_1001153D8;
  id v15 = v14;
  id v17 = v15;
  AnalyticsSendEventLazy(@"com.apple.dasd.appResume.daily.metrics", v16);
  if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 8LL), OS_LOG_TYPE_DEBUG)) {
    sub_1000B31F8();
  }
  [v3 setTaskCompleted];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
}

void sub_10003BE5C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, char a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26, uint64_t a27, uint64_t a28, uint64_t a29, char a30)
{
}

void sub_10003BE98(void *a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  if ((int)[v7 launchCount] >= 1 && (int)objc_msgSend(v7, "resumeCount") >= 1)
  {
    [v7 totalLaunchActivationTime];
    double v5 = v4;
    [v7 totalResumeActivationTime];
    *(double *)(*(void *)(a1[4] + 8LL) + 24LL) = v5 + v6 + *(double *)(*(void *)(a1[4] + 8LL) + 24LL);
  }
}

id sub_10003BF58(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_10003C164( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

uint64_t sub_10003C180(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10003C190(uint64_t a1)
{
}

void sub_10003C198(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appActivationPublisherForEventsFrom:*(void *)(a1 + 40)]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10003C27C;
  v8[3] = &unk_100115B78;
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = *(id *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 32);
  id v9 = v4;
  uint64_t v10 = v5;
  id v11 = *(id *)(a1 + 64);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10003C2D4;
  v7[3] = &unk_100115BC8;
  v7[4] = *(void *)(a1 + 72);
  id v6 = [v2 sinkWithBookmark:v3 completion:v8 receiveInput:v7];
}

void sub_10003C27C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 16), "setObject:forKeyedSubscript:", a3);
  }
  [*(id *)(a1 + 40) logCompletion:v5 forAnalysisName:*(void *)(a1 + 48)];
}

id sub_10003C2D4(uint64_t a1, void *a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10003C32C;
  v3[3] = &unk_100115BA0;
  void v3[4] = *(void *)(a1 + 32);
  return [a2 enumerateKeysAndObjectsUsingBlock:v3];
}

void sub_10003C32C(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if ((int)[v5 launchCount] >= 1 && (int)objc_msgSend(v5, "resumeCount") >= 1)
  {
    [v5 totalLaunchActivationTime];
    double v7 = v6 / (double)(int)[v5 launchCount];
    [v5 totalResumeActivationTime];
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( NSNumber,  "numberWithDouble:",  v7 - v8 / (double)(int)[v5 resumeCount]));
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v9 forKeyedSubscript:v10];
  }
}

void sub_10003C5FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_10003C618(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appActivationPublisherForEventsFrom:*(void *)(a1 + 40)]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10003C6FC;
  v8[3] = &unk_100115B78;
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = *(id *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 32);
  id v9 = v4;
  uint64_t v10 = v5;
  id v11 = *(id *)(a1 + 64);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10003C754;
  v7[3] = &unk_100115BC8;
  v7[4] = *(void *)(a1 + 72);
  id v6 = [v2 sinkWithBookmark:v3 completion:v8 receiveInput:v7];
}

void sub_10003C6FC(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 16), "setObject:forKeyedSubscript:", a3);
  }
  [*(id *)(a1 + 40) logCompletion:v5 forAnalysisName:*(void *)(a1 + 48)];
}

void sub_10003C754(uint64_t a1, void *a2)
{
}

BOOL sub_10003C7FC(id a1, BMStoreEvent *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[BMStoreEvent eventBody](a2, "eventBody"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 bundleID]);
  BOOL v4 = v3 != 0LL;

  return v4;
}

NSMutableDictionary *__cdecl sub_10003C840(id a1, NSMutableDictionary *a2, BMStoreEvent *a3)
{
  BOOL v4 = a2;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[BMStoreEvent eventBody](v5, "eventBody"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleID]);

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v4, "objectForKey:", v7));
  if (!v8)
  {
    id v9 = objc_alloc_init(&OBJC_CLASS___AppActivationTimeInfo);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v9, v7);

    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v7));
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[BMStoreEvent eventBody](v5, "eventBody"));
  unsigned int v11 = [v10 launchReason];

  if (v11)
  {
    objc_msgSend(v8, "setResumeCount:", objc_msgSend(v8, "resumeCount") + 1);
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(-[BMStoreEvent eventBody](v5, "eventBody"));
    unsigned int v15 = [v12 activationTime];
    [v8 totalResumeActivationTime];
    [v8 setTotalResumeActivationTime:v16 + (double)v15];
  }

  else
  {
    objc_msgSend(v8, "setLaunchCount:", objc_msgSend(v8, "launchCount") + 1);
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(-[BMStoreEvent eventBody](v5, "eventBody"));
    unsigned int v13 = [v12 activationTime];
    [v8 totalLaunchActivationTime];
    [v8 setTotalLaunchActivationTime:v14 + (double)v13];
  }

  return v4;
}

void sub_10003CBB4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_10003CBD0(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appKillsInfoPublisherForEventsFrom:*(void *)(a1 + 40)]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10003CCB4;
  v8[3] = &unk_100115B78;
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = *(id *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 32);
  id v9 = v4;
  uint64_t v10 = v5;
  id v11 = *(id *)(a1 + 64);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10003CD0C;
  v7[3] = &unk_100115BC8;
  v7[4] = *(void *)(a1 + 72);
  id v6 = [v2 sinkWithBookmark:v3 completion:v8 receiveInput:v7];
}

void sub_10003CCB4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 16), "setObject:forKeyedSubscript:", a3);
  }
  [*(id *)(a1 + 40) logCompletion:v5 forAnalysisName:*(void *)(a1 + 48)];
}

void sub_10003CD0C(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 enumerateKeysAndObjectsUsingBlock:&stru_100115CB0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10003CD4C(id a1, NSString *a2, AppKillsInfo *a3, BOOL *a4)
{
  id v11 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[AppKillsInfo firstKillEventDate](v11, "firstKillEventDate"));
  [v4 timeIntervalSinceNow];
  int v6 = vcvtpd_s64_f64(v5 / -86400.0);

  -[AppKillsInfo meanSpringBoardKills](v11, "meanSpringBoardKills");
  -[AppKillsInfo setMeanSpringBoardKills:](v11, "setMeanSpringBoardKills:", v7 / (double)v6);
  -[AppKillsInfo meanRunningBoardKills](v11, "meanRunningBoardKills");
  -[AppKillsInfo setMeanRunningBoardKills:](v11, "setMeanRunningBoardKills:", v8 / (double)v6);
  -[AppKillsInfo meanJetsamKills](v11, "meanJetsamKills");
  -[AppKillsInfo setMeanJetsamKills:](v11, "setMeanJetsamKills:", v9 / (double)v6);
  -[AppKillsInfo meanOtherKills](v11, "meanOtherKills");
  -[AppKillsInfo setMeanOtherKills:](v11, "setMeanOtherKills:", v10 / (double)v6);
}

BOOL sub_10003CE7C(id a1, BMStoreEvent *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[BMStoreEvent eventBody](a2, "eventBody"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 bundleID]);
  BOOL v4 = v3 != 0LL;

  return v4;
}

NSMutableDictionary *__cdecl sub_10003CEC0(id a1, NSMutableDictionary *a2, BMStoreEvent *a3)
{
  BOOL v4 = a2;
  double v5 = a3;
  int v6 = (void *)objc_claimAutoreleasedReturnValue(-[BMStoreEvent eventBody](v5, "eventBody"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleID]);

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v4, "objectForKey:", v7));
  if (!v8)
  {
    double v9 = objc_alloc_init(&OBJC_CLASS___AppKillsInfo);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v9, v7);

    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v7));
    -[BMStoreEvent timestamp](v5, "timestamp");
    double v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
    [v8 setFirstKillEventDate:v10];
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[BMStoreEvent eventBody](v5, "eventBody"));
  unsigned int v12 = [v11 exitReason];

  if (v12 == 10)
  {
    [v8 meanSpringBoardKills];
    [v8 setMeanSpringBoardKills:v13 + 1.0];
  }

  else
  {
    double v14 = (void *)objc_claimAutoreleasedReturnValue(-[BMStoreEvent eventBody](v5, "eventBody"));
    unsigned int v15 = [v14 exitReason];

    if (v15 == 15)
    {
      [v8 meanRunningBoardKills];
      [v8 setMeanRunningBoardKills:v16 + 1.0];
    }

    else
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[BMStoreEvent eventBody](v5, "eventBody"));
      unsigned int v18 = [v17 exitReason];

      if (v18 == 1)
      {
        [v8 meanJetsamKills];
        [v8 setMeanJetsamKills:v19 + 1.0];
      }

      else
      {
        [v8 meanOtherKills];
        [v8 setMeanOtherKills:v20 + 1.0];
      }
    }
  }

  return v4;
}

void sub_10003D21C(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = (void *)qword_100157830;
  qword_100157830 = (uint64_t)v1;
}

void sub_10003D8C0(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = (void *)qword_100157840;
  qword_100157840 = (uint64_t)v1;
}

void sub_10003DDA0(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  uint64_t v2 = (void *)qword_100157850;
  qword_100157850 = (uint64_t)v1;
}

id sub_10003E2F8(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) systemMemoryPressure];
  *(void *)(*(void *)(a1 + 32) + 48LL) = result;
  return result;
}

void sub_10003E364(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS____DASMemoryPressurePolicy);
  uint64_t v2 = (void *)qword_100157860;
  qword_100157860 = (uint64_t)v1;
}

void sub_10003E93C(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = (void *)qword_100157870;
  qword_100157870 = (uint64_t)v1;
}

void sub_10003EB4C(_Unwind_Exception *a1)
{
}

void sub_10003EC84(_Unwind_Exception *a1)
{
}

void sub_10003EF60(_Unwind_Exception *a1)
{
}

void sub_10003F208(_Unwind_Exception *a1)
{
}

void sub_10003F2FC(_Unwind_Exception *a1)
{
}

void sub_10003F71C(_Unwind_Exception *a1)
{
}

void sub_10003F8C0(id a1)
{
}

void sub_10003F94C(uint64_t a1)
{
  uint64_t v1 = objc_opt_new(*(void *)(a1 + 32));
  uint64_t v2 = (void *)qword_100157888;
  qword_100157888 = v1;
}

void sub_1000401FC(uint64_t a1)
{
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v36 = [v2 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (!v36)
  {

    return;
  }

  uint64_t v31 = a1;
  char v3 = 0;
  char v4 = 0;
  char v5 = 0;
  char v6 = 0;
  id obj = v2;
  uint64_t v35 = *(void *)v40;
  double v7 = &AnalyticsSendEventLazy_ptr;
  do
  {
    for (i = 0LL; i != v36; i = (char *)i + 1)
    {
      if (*(void *)v40 != v35) {
        objc_enumerationMutation(obj);
      }
      double v9 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)i);
      if ((v6 & 1) != 0)
      {
        unsigned __int8 v38 = 0;
        if ((v5 & 1) != 0) {
          goto LABEL_26;
        }
      }

      else
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v7[133] keyPathForBatteryLevel]);
        if ([v9 isEqual:v11])
        {
          unsigned __int8 v38 = 1;
        }

        else
        {
          double v13 = (void *)objc_claimAutoreleasedReturnValue([v7[133] keyPathForLowPowerModeStatus]);
          if ([v9 isEqual:v13])
          {
            unsigned __int8 v38 = 1;
          }

          else
          {
            unsigned int v15 = v7;
            double v16 = (void *)objc_claimAutoreleasedReturnValue([v7[133] keyPathForPluginStatus]);
            if ([v9 isEqual:v16])
            {
              unsigned __int8 v38 = 1;
            }

            else
            {
              id v17 = (void *)objc_claimAutoreleasedReturnValue([v15[133] keyPathForBatteryStateDataDictionary]);
              unsigned __int8 v38 = [v9 isEqual:v17];
            }

            double v7 = &AnalyticsSendEventLazy_ptr;
          }
        }

        if ((v5 & 1) != 0)
        {
LABEL_26:
          unsigned __int8 v37 = 0;
          if ((v4 & 1) != 0) {
            goto LABEL_49;
          }
          goto LABEL_27;
        }
      }

      double v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7[133], "keyPathForMotionState", v31));
      if ([v9 isEqual:v10])
      {
        unsigned __int8 v37 = 1;
      }

      else
      {
        unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v7[133] keyPathForCallInProgressStatus]);
        if ([v9 isEqual:v12])
        {
          unsigned __int8 v37 = 1;
        }

        else
        {
          double v14 = (void *)objc_claimAutoreleasedReturnValue([v7[133] keyPathForCarplayConnectedStatus]);
          if ([v9 isEqual:v14])
          {
            unsigned __int8 v37 = 1;
          }

          else
          {
            id v32 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualKeyPath ephemeralKeyPathWithKey:]( &OBJC_CLASS____CDContextualKeyPath,  "ephemeralKeyPathWithKey:",  @"/car/isConnected"));
            if (objc_msgSend(v9, "isEqual:"))
            {
              unsigned __int8 v37 = 1;
            }

            else
            {
              uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualKeyPath ephemeralKeyPathWithKey:]( &OBJC_CLASS____CDContextualKeyPath,  "ephemeralKeyPathWithKey:",  @"/maps/navigationInProgress"));
              unsigned __int8 v37 = [v9 isEqual:v29];
            }

            double v7 = &AnalyticsSendEventLazy_ptr;
          }
        }
      }

      if ((v4 & 1) != 0)
      {
LABEL_49:
        unsigned __int8 v19 = 0;
        if ((v3 & 1) != 0) {
          goto LABEL_50;
        }
        goto LABEL_37;
      }

LABEL_37:
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7[133], "keyPathForNetworkingBudgetRemainingStatus", v31));
      if ([v9 isEqual:v22])
      {
        unsigned __int8 v23 = 1;
        unsigned __int8 v24 = v38;
      }

      else
      {
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[_CDNetworkContext keyPathForWiFiConnectionStatus]( &OBJC_CLASS____CDNetworkContext,  "keyPathForWiFiConnectionStatus"));
        if ([v9 isEqual:v25])
        {
          unsigned __int8 v23 = 1;
        }

        else
        {
          uint64_t v26 = objc_claimAutoreleasedReturnValue( +[_CDNetworkContext keyPathForCellConnectionStatus]( &OBJC_CLASS____CDNetworkContext,  "keyPathForCellConnectionStatus"));
          uint64_t v27 = v9;
          uint64_t v28 = (void *)v26;
          unsigned __int8 v23 = objc_msgSend(v27, "isEqual:");
        }

        unsigned __int8 v24 = v38;

        double v7 = &AnalyticsSendEventLazy_ptr;
      }

LABEL_51:
      v6 |= v24;
      v5 |= v37;
      v4 |= v19;
      v3 |= v23;
    }

    id v36 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
  }

  while (v36);

  if ((v4 & 1) != 0)
  {
    uint64_t v30 = v31;
    [*(id *)(v31 + 40) recordPowerManagementStatus];
    if ((v3 & 1) == 0) {
      goto LABEL_59;
    }
LABEL_58:
    objc_msgSend(*(id *)(v30 + 40), "recordNetworkStatus", v31);
  }

  else
  {
    uint64_t v30 = v31;
    if ((v3 & 1) != 0) {
      goto LABEL_58;
    }
  }

LABEL_59:
  if ((v5 & 1) != 0) {
    [*(id *)(v30 + 40) recordMotionStatus];
  }
}

    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    v57 = (void *)objc_claimAutoreleasedReturnValue([v84 allKeys]);
    __int16 v58 = [v57 countByEnumeratingWithState:&v86 objects:v104 count:16];
    if (v58)
    {
      v59 = v58;
      v60 = *(void *)v87;
      do
      {
        for (j = 0LL; j != v59; j = (char *)j + 1)
        {
          if (*(void *)v87 != v60) {
            objc_enumerationMutation(v57);
          }
          v62 = *(void *)(*((void *)&v86 + 1) + 8LL * (void)j);
          v63 = (void *)objc_claimAutoreleasedReturnValue([v84 objectForKeyedSubscript:v62]);
          v64 = (uint64_t)[v63 integerValue];

          if (v64 >= 36)
          {
            v65 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed count high for %@",  v62));

            __int16 v56 = 1;
            __int128 v41 = (__CFString *)v65;
          }
        }

        v59 = [v57 countByEnumeratingWithState:&v86 objects:v104 count:16];
      }

      while (v59);
    }

    uint64_t v35 = v77;
    id v33 = v80;
    if ((v56 & 1) == 0) {
      goto LABEL_77;
    }
LABEL_69:
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults valueForKey:](v76->_defaults, "valueForKey:", @"lastDateForMADProgressTTR"));
    unsigned __int8 v37 = v66;
    if (v66 && ([v66 timeIntervalSinceNow], v67 >= -2592000.0))
    {
      if (os_log_type_enabled(v76->_log, OS_LOG_TYPE_DEBUG)) {
        sub_1000B5D74();
      }
    }

    else
    {
      if (os_log_type_enabled(v76->_log, OS_LOG_TYPE_DEBUG)) {
        sub_1000B5D48();
      }
      v102[0] = @"count";
      v102[1] = @"pastProgress";
      v103[0] = v81;
      v103[1] = v33;
      v102[2] = @"currentProgress";
      v102[3] = @"failedProgress";
      v103[2] = v35;
      v103[3] = v84;
      v102[4] = @"trigger";
      v103[4] = v41;
      v68 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v103,  v102,  5LL));
      v69 = (void *)objc_claimAutoreleasedReturnValue( -[_DASIssueDetector ttrURLWithTitle:withDescription:withStateDictionary:componentID:componentName:componentVersion:]( v76,  "ttrURLWithTitle:withDescription:withStateDictionary:componentID:componentName:componentVersion:",  @"Tap to file Radar. Slow progress detected for MediaAnalysis background job",  @"PLEASE ANSWER THESE QUESTIONS TO AID DEBUGGING:\n\n* Is this your regular carry device? \n\n*Were a large number of photos/videos taken in the last 48 hours?\n\n\n",  v68,  787030LL,  @"Duet",  @"Activity Scheduler"));
      v70 = (void *)objc_claimAutoreleasedReturnValue(+[_DASNotificationManager sharedManager](&OBJC_CLASS____DASNotificationManager, "sharedManager"));
      v71 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  14400.0));
      [v70 postNotificationAtDate:0 withTitle:@"[Internal] Background Processing Issue" withTextContent:@"Tap to file Radar. Slow progress detected for MediaAnalysis background job" icon:@"TTR" url:v69 expirationDate:v71];

      defaults = v76->_defaults;
      v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      -[NSUserDefaults setValue:forKey:](defaults, "setValue:forKey:", v73, @"lastDateForMADProgressTTR");
    }

    goto LABEL_76;
  }

  __int128 v39 = v38;
  __int128 v40 = *(void *)v95;
  __int128 v41 = &stru_100118C98;
LABEL_37:
  __int128 v42 = 0LL;
  while (1)
  {
    if (*(void *)v95 != v40) {
      objc_enumerationMutation(v37);
    }
    v43 = *(void *)(*((void *)&v94 + 1) + 8 * v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue([v80 objectForKeyedSubscript:v43]);
    v45 = [v44 integerValue];

    __int128 v46 = (void *)objc_claimAutoreleasedReturnValue([v77 objectForKeyedSubscript:v43]);
    __int128 v47 = [v46 integerValue];

    if (v39 == (id)++v42)
    {
      __int128 v39 = [v37 countByEnumeratingWithState:&v94 objects:v106 count:16];
      if (v39) {
        goto LABEL_37;
      }
      goto LABEL_43;
    }
  }

  -[_DASDaemon logLimitations:](self, "logLimitations:", v6);
  if (v45) {
    -[_DASBatchingQueue addWorkItem:](self->_activityCompletedBatchingQueue, "addWorkItem:", v6);
  }

LABEL_62:
}

void sub_100040794(uint64_t a1)
{
  uint64_t v1 = objc_opt_new(*(void *)(a1 + 32));
  id v2 = (void *)qword_100157898;
  qword_100157898 = v1;
}

void sub_100040C58(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.dasd.aprsBiomeEventQueue", 0LL);
  id v2 = (void *)qword_1001578B8;
  qword_1001578B8 = (uint64_t)v1;
}

id sub_100040DB0(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendEvent:*(void *)(a1 + 40)];
}

id sub_100040EE8(uint64_t a1)
{
  dispatch_queue_t v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100040F44;
  v3[3] = &unk_100115DA0;
  void v3[4] = *(void *)(a1 + 40);
  return [v1 pruneWithPredicateBlock:v3];
}

BOOL sub_100040F44(uint64_t a1, void *a2, _BYTE *a3)
{
  double v6 = *(double *)(a1 + 32);
  if (v5 >= v6) {
    *a3 = 1;
  }
  return v5 < v6;
}

id sub_1000410D4(uint64_t a1)
{
  uint64_t v7 = 0LL;
  double v8 = &v7;
  uint64_t v9 = 0x2050000000LL;
  id v2 = (void *)qword_1001578D8;
  uint64_t v10 = qword_1001578D8;
  if (!qword_1001578D8)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100041B9C;
    v6[3] = &unk_100115300;
    void v6[4] = &v7;
    sub_100041B9C((uint64_t)v6);
    id v2 = (void *)v8[3];
  }

  id v3 = v2;
  _Block_object_dispose(&v7, 8);
  char v4 = (void *)objc_claimAutoreleasedReturnValue([v3 predictor]);
  *(void *)(*(void *)(a1 + 32) + 32) = [v4 historicalClassification];

  return [*(id *)(a1 + 40) setInteger:*(void *)(*(void *)(a1 + 32) + 32) forKey:@"drainBehavior"];
}

void sub_1000411A4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000411FC(id a1)
{
  dispatch_queue_t v1 = objc_opt_new(&OBJC_CLASS____APRSPrewarmInterface);
  id v2 = (void *)qword_1001578C8;
  qword_1001578C8 = (uint64_t)v1;
}

id sub_100041568(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidatePrewarmAssertionForApplication:*(void *)(a1 + 40)];
}

void sub_100041A90(uint64_t a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[_APRSMetricRecorder sharedInstance](&OBJC_CLASS____APRSMetricRecorder, "sharedInstance"));
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundle]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 identifier]);
  objc_msgSend(v4, "endEventForApp:pid:forEvent:", v3, objc_msgSend(*(id *)(a1 + 32), "pid"), 0);
}

Class sub_100041B9C(uint64_t a1)
{
  id v4 = 0LL;
  if (!qword_1001578E0)
  {
    __int128 v5 = off_100115E30;
    uint64_t v6 = 0LL;
    qword_1001578E0 = _sl_dlopen(&v5, &v4);
    id v2 = v4;
    if (!qword_1001578E0)
    {
      abort_report_np("%s", v4);
      goto LABEL_7;
    }

    if (v4) {
      goto LABEL_8;
    }
  }

  while (1)
  {
    Class result = objc_getClass("_OSBatteryDrainPredictor");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
      break;
    }
LABEL_7:
    id v2 = (char *)sub_1000B3538();
LABEL_8:
    free(v2);
  }

  qword_1001578D8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

void sub_100041E98(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  id v2 = (void *)qword_1001578F0;
  qword_1001578F0 = (uint64_t)v1;
}

uint64_t sub_10004254C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](&OBJC_CLASS____CDClientContext, "userContext"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:*(void *)(a1 + 40)]);
  __int128 v5 = *(void **)(a1 + 32);
  id v4 = (id *)(a1 + 32);
  [v5 setWifiPredictionTimeline:v3];

  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"predictions"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1000B35C8(v4, v6);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*v4 wifiPredictionTimeline]);
  +[_DASPredictionManager setPrediction:forKey:]( &OBJC_CLASS____DASPredictionManager,  "setPrediction:forKey:",  v7,  @"wifiPredictions");

  return 1LL;
}

void sub_100042B44(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS____DASNetworkQualityPolicy);
  id v2 = (void *)qword_100157908;
  qword_100157908 = (uint64_t)v1;

  [(id)qword_100157908 registerForPredictionChanges];
}

LABEL_21:
      double v8 = 100LL;
      goto LABEL_11;
    }

    unsigned int v18 = [v5 noTransferSizeSpecified];
    double v8 = 100LL;
    if (a4 != 2 && (v18 & 1) == 0)
    {
      goto LABEL_8;
    }
  }

  uint64_t v35 = self->_log;
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    __int128 v49 = v24;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "PluggedIn duration %f", buf, 0xCu);
  }

  if (v24 < (double)v39)
  {
    id v36 = self->_log;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Not enough plugged in time", buf, 2u);
    }
  }

  return v24 >= (double)v39;
}

        uint64_t v26 = (char *)v26 + 1;
      }

      while (v23 != v26);
      v57 = [obj countByEnumeratingWithState:&v109 objects:v117 count:16];
      unsigned __int8 v23 = v57;
      if (!v57)
      {
LABEL_30:

        __int16 v58 = (void *)objc_claimAutoreleasedReturnValue([v89 allValues]);
        double v20 = v71;
        [v71 setObject:v58 forKeyedSubscript:FBSOpenApplicationOptionKeyActions];

        if (!-[_DASBARScheduler applicationStateRequiresImmediateDelivery:]( self->_barScheduler,  "applicationStateRequiresImmediateDelivery:",  v88)) {
          [v71 setObject:&off_100121FA8 forKeyedSubscript:FBSOpenApplicationOptionKeyLaunchIntent];
        }
        [v71 setObject:v79 forKeyedSubscript:FBSOpenApplicationOptionKeyPayloadOptions];
        double v16 = v68;
        unsigned int v15 = v69;
        unsigned int v18 = v66;
        id v17 = v67;
        unsigned __int8 v19 = v65;
        if ([v85 count])
        {
          activityLaunchQueue = (dispatch_queue_s *)self->_activityLaunchQueue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_10007D42C;
          block[3] = &unk_100116E70;
          v91 = v65;
          v92 = v86;
          v93 = self;
          v94 = v88;
          v95 = v69;
          v96 = v71;
          v97 = oslog;
          v100 = v66;
          v101 = v68;
          v98 = obj;
          v99 = v89;
          v102 = v67;
          dispatch_async(activityLaunchQueue, block);
        }

        else
        {
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR)) {
            sub_1000B74A8();
          }
          v67[2](v67);
        }

        double v14 = v70;

        goto LABEL_48;
      }
    }
  }

  if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_INFO, "UIKit is not enabled!", buf, 2u);
  }

  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  v89 = v14;
  v60 = [v89 countByEnumeratingWithState:&v113 objects:v118 count:16];
  if (v60)
  {
    v61 = v60;
    v72 = v20;
    v62 = *(void *)v114;
    do
    {
      for (i = 0LL; i != v61; i = (char *)i + 1)
      {
        if (*(void *)v114 != v62) {
          objc_enumerationMutation(v89);
        }
        -[_DASDaemon activityCanceled:]( self,  "activityCanceled:",  *(void *)(*((void *)&v113 + 1) + 8LL * (void)i));
      }

      v61 = [v89 countByEnumeratingWithState:&v113 objects:v118 count:16];
    }

    while (v61);
    double v20 = v72;
  }

      double v13 = (char *)v13 + 1;
    }

    while (v11 != v13);
    unsigned __int8 v23 = [obj countByEnumeratingWithState:&v41 objects:v52 count:16];
    id v11 = v23;
  }

  while (v23);
LABEL_38:

  if ([v32 count])
  {
    unsigned __int8 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"scoring"));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v32;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Skipping processing for %@ since their group is full",  (uint8_t *)&buf,  0xCu);
    }
  }

  if ([v37 count])
  {
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"scoring"));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v37;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Skipping processing for %@ due to rate limiting",  (uint8_t *)&buf,  0xCu);
    }
  }

  if ((v35 & 1) != 0)
  {
    *(void *)&buf = 0LL;
    *((void *)&buf + 1) = &buf;
    __int128 v50 = 0x2020000000LL;
    __int128 v51 = 0;
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v45 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Taking an assertion", v45, 2u);
    }

    v47[0] = @"AssertType";
    v47[1] = @"AssertName";
    v48[0] = @"PreventUserIdleSystemSleep";
    v48[1] = @"com.apple.duetactivityscheduler.triggersRestart";
    v47[2] = @"AllowsDeviceRestart";
    v48[2] = kCFBooleanTrue;
    uint64_t v27 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v48,  v47,  3LL));
    uint64_t v28 = IOPMAssertionCreateWithProperties(v27, (IOPMAssertionID *)(*((void *)&buf + 1) + 24LL));
    if (v28)
    {
      uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v45 = 67109120;
        __int128 v46 = v28;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Failed to create SystemActive assertion. ret:0x%x",  v45,  8u);
      }
    }

    else
    {
      uint64_t v30 = dispatch_time(0LL, 30000000000LL);
      uint64_t v29 = (os_log_s *)dispatch_queue_create("com.apple.duetactivityscheduler.assertion", 0LL);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10009516C;
      block[3] = &unk_100115300;
      void block[4] = &buf;
      dispatch_after(v30, (dispatch_queue_t)v29, block);
    }

    _Block_object_dispose(&buf, 8);
  }
}

LABEL_22:
  return v16;
}
  }

  else
  {
    v43 = @"activityName";
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) description]);
    v44 = v15;
    double v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v44,  &v43,  1LL));
    id v17 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"_DASActivityDependencyManagerErrorDomain",  3LL,  v16));
    unsigned int v18 = *(void *)(*(void *)(a1 + 56) + 8LL);
    unsigned __int8 v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
  }

  return v13;
}

LABEL_23:
  v49[0] = NSExtensionPointName;
  v49[1] = NSExtensionIdentifierName;
  v50[0] = v41;
  v50[1] = v5;
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v50,  v49,  2LL));
  __int128 v42 = v7;
  id v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSExtension extensionsWithMatchingAttributes:error:]( &OBJC_CLASS___NSExtension,  "extensionsWithMatchingAttributes:error:",  v30,  &v42));
  uint64_t v31 = v42;

  if ((unint64_t)[v33 count] >= 2)
  {
    id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"plugin"));
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_1000B91D4();
    }
  }

  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v33 firstObject]);

  uint64_t v27 = 0LL;
LABEL_28:

  if (!v28)
  {
    uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"plugin"));
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      __int128 v52 = v27;
      __int128 v53 = 2112;
      v54 = v41;
      uint64_t v55 = 2112;
      __int16 v56 = (os_log_s *)v5;
      v57 = 2112;
      __int16 v58 = v31;
      _os_log_error_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "Unable to find extension %@ (%@) for %@: %@",  buf,  0x2Au);
    }
  }

LABEL_33:
  return v28;
}

id sub_100043500(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateSystemConstraintsWithContext:*(void *)(a1 + 40)];
}

void sub_100043A44(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  id v2 = (void *)qword_100157948;
  qword_100157948 = (uint64_t)v1;
}

void sub_100043D84(_Unwind_Exception *a1)
{
}

void sub_1000445EC(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  id v2 = (void *)qword_100157958;
  qword_100157958 = (uint64_t)v1;
}

void sub_100044C40(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS____DASRequiresPluggedInPolicy);
  id v2 = (void *)qword_100157968;
  qword_100157968 = (uint64_t)v1;
}

void sub_10004527C(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pluginTimeline]);
  unsigned int v4 = +[_DASPredictionManager predictionNeedsUpdating:atDate:lastUpdatedAt:]( &OBJC_CLASS____DASPredictionManager,  "predictionNeedsUpdating:atDate:lastUpdatedAt:",  v3,  v2[1],  *((void *)*v2 + 8));

  if (v4)
  {
    __int128 v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) predictionForDevicePluggedIn]);
    [*(id *)(a1 + 32) setPluginTimeline:v5];

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 64LL), *(id *)(a1 + 40));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pluginTimeline]);
    +[_DASPredictionManager setPrediction:forKey:]( &OBJC_CLASS____DASPredictionManager,  "setPrediction:forKey:",  v6,  @"plugin");

    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"predictions"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_1000B3704(v2, v7);
    }
  }

void sub_100045490(void *a1)
{
  id v3 = a1;
  if ([v3 state])
  {
    id v1 = (void *)objc_claimAutoreleasedReturnValue([v3 error]);
    id v2 = objc_claimAutoreleasedReturnValue([v1 description]);
    printf("Error: %s\n", (const char *)[v2 UTF8String]);
  }

  else
  {
    puts("Complete");
  }
}

void sub_10004577C(_Unwind_Exception *a1)
{
}

void sub_100045AEC(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 8LL) = +[PBSSystemStatus systemAttentionState]( &OBJC_CLASS___PBSSystemStatus,  "systemAttentionState") == (id)7;
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  *(unsigned __int8 *)(*(void *)(a1 + 32) + 8LL)));
    *(_DWORD *)buf = 138412290;
    double v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "isDeviceIdle is now %@", buf, 0xCu);
  }

  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](&OBJC_CLASS____DASDaemon, "sharedInstance"));
  uint64_t v6 = @"com.apple.das.restartpolicy.deviceIdle";
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  [v4 handleTriggersBatched:v5];
}

void sub_100045D68(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS____DASRequiresRestartPolicy);
  id v2 = (void *)qword_100157978;
  qword_100157978 = (uint64_t)v1;
}

id sub_100046284(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 components:96 fromDate:*(void *)(a1 + 32)]);

  objc_autoreleasePoolPop(v2);
  v10[0] = @"Default";
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 40)));
  v11[0] = v5;
  v10[1] = @"StartHour";
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 hour]));
  v11[1] = v6;
  v10[2] = @"StartMinute";
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v4 minute]));
  v11[2] = v7;
  double v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  3LL));

  return v8;
}

void sub_10004724C(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS____DASThermalPolicy);
  id v2 = (void *)qword_100157988;
  qword_100157988 = (uint64_t)v1;
}

id sub_100047E34(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateSystemConstraintsWithContext:*(void *)(a1 + 40)];
}

void sub_100048104(id a1)
{
  os_log_t v1 = os_log_create("com.apple.aprs", "appResume.AppKillWriter");
  id v2 = (void *)qword_1001579A0;
  qword_1001579A0 = (uint64_t)v1;
}

void sub_100048290(_Unwind_Exception *a1)
{
}

void sub_1000483D8(id a1)
{
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS____APRSBiomeAppKillEventWriter);
  id v2 = (void *)qword_1001579B0;
  qword_1001579B0 = (uint64_t)v1;
}

void sub_1000484CC(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessPredicate predicateMatchingProcessTypeApplication]( &OBJC_CLASS___RBSProcessPredicate,  "predicateMatchingProcessTypeApplication"));
  double v8 = v4;
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
  [v3 setPredicates:v5];

  [v3 setEvents:1];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000485D4;
  v6[3] = &unk_100115FA8;
  id v7 = *(id *)(a1 + 32);
  [v3 setUpdateHandler:v6];
}

void sub_1000485D4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a4 exitEvent]);
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 context]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 process]);
  id v10 = [v9 pid];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 bundle]);
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
  double v13 = (void *)objc_claimAutoreleasedReturnValue([v8 status]);
  double v14 = (void *)objc_claimAutoreleasedReturnValue( +[_APRSBiomeAppKillEvent eventWithAppBundleID:pid:exitReason:]( _APRSBiomeAppKillEvent,  "eventWithAppBundleID:pid:exitReason:",  v12,  v10,  [v13 domain]));

  +[_APRSBiomeBase postEvent:](&OBJC_CLASS____APRSBiomeAppKillEvent, "postEvent:", v14);
  unsigned int v15 = *(os_log_s **)(a1 + 32);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_1000B39CC((uint64_t)v14, v15);
  }
}

void sub_100049384(_Unwind_Exception *a1)
{
}

void sub_1000493B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  __int128 v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "scheduler_activity"));
    unsigned __int8 v7 = [v3 isEqual:v6];

    double v8 = (os_log_s *)qword_1001579B8;
    if ((v7 & 1) != 0)
    {
      if (os_log_type_enabled((os_log_t)qword_1001579B8, OS_LOG_TYPE_INFO))
      {
        int v10 = 138543362;
        id v11 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "DAS told us to run %{public}@",  (uint8_t *)&v10,  0xCu);
      }

      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[_DASBGSystemTaskHelper sharedInstance](&OBJC_CLASS____DASBGSystemTaskHelper, "sharedInstance"));
      [v9 runActivity:v5];
    }

    else if (os_log_type_enabled((os_log_t)qword_1001579B8, OS_LOG_TYPE_ERROR))
    {
      sub_1000B3AA0();
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1001579B8, OS_LOG_TYPE_ERROR))
  {
    sub_1000B3A3C();
  }
}

void sub_100049504(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  __int128 v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "scheduler_activity"));
    unsigned __int8 v7 = [v3 isEqual:v6];

    if ((v7 & 1) != 0)
    {
      id v8 = [v5 state];
      uint64_t v9 = (os_log_s *)qword_1001579B8;
      BOOL v10 = os_log_type_enabled((os_log_t)qword_1001579B8, OS_LOG_TYPE_INFO);
      if (v8 == (id)3)
      {
        if (v10)
        {
          int v14 = 138543362;
          unsigned int v15 = v5;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "DAS told us to suspend %{public}@",  (uint8_t *)&v14,  0xCu);
        }

        id v11 = [v3 lastDenialValue];
        unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "scheduler_activity"));
        [v12 setLastDenialValue:v11];

        double v13 = (void *)objc_claimAutoreleasedReturnValue(+[_DASBGSystemTaskHelper sharedInstance](&OBJC_CLASS____DASBGSystemTaskHelper, "sharedInstance"));
        [v13 suspendActivity:v5];
      }

      else if (v10)
      {
        int v14 = 138543362;
        unsigned int v15 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "DAS told us to suspend %{public}@, but task isn't running",  (uint8_t *)&v14,  0xCu);
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_1001579B8, OS_LOG_TYPE_ERROR))
    {
      sub_1000B3B68();
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1001579B8, OS_LOG_TYPE_ERROR))
  {
    sub_1000B3B04();
  }
}

id sub_10004996C(uint64_t a1)
{
  return [*(id *)(a1 + 32) garbageCollectActivityDates];
}

LABEL_51:
  if (v15->_type == 3)
  {
    featureCodes = v15->_featureCodes;
    if (!featureCodes)
    {
      if (os_log_type_enabled((os_log_t)qword_1001579B8, OS_LOG_TYPE_ERROR)) {
        sub_1000B3BCC();
      }
      goto LABEL_174;
    }

    if (!-[_DASBGSystemTask validateFastPassSubmissionForActivity:featureCodes:service:]( v15,  "validateFastPassSubmissionForActivity:featureCodes:service:",  v15->_identifier,  featureCodes,  v132))
    {
      if (os_log_type_enabled((os_log_t)qword_1001579B8, OS_LOG_TYPE_ERROR)) {
        sub_1000B3F5C();
      }
      goto LABEL_174;
    }

    -[_DASBGSystemTask updateFeatureCodesForActivity:](v15, "updateFeatureCodesForActivity:", v15->_identifier);
  }

  v15->_priority = 1LL;
  v15->_requiresExternalPower = 1;
  string = xpc_dictionary_get_string(v14, "Priority");
  __int16 v58 = string;
  if (!string)
  {
    if (v15->_type != 3) {
      goto LABEL_80;
    }
    goto LABEL_66;
  }

  if (!strcmp(v58, "Utility"))
  {
LABEL_66:
    v61 = 2LL;
LABEL_79:
    v15->_priority = v61;
    v15->_requiresExternalPower = 0;
    goto LABEL_80;
  }

  if (!strcmp(v58, "UserInitiated"))
  {
    v61 = 3LL;
    goto LABEL_79;
  }

  v59 = (os_log_s *)(id)qword_1001579B8;
  if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
    sub_1000B3E6C(v15, (uint64_t)v58, v59);
  }

LABEL_80:
  value = xpc_dictionary_get_value(v14, "RequiresExternalPower");
  v63 = (void *)objc_claimAutoreleasedReturnValue(value);

  if (v63) {
    v15->_requiresExternalPower = xpc_BOOL_get_value(v63);
  }
  v15->_random_initial_delay = (double)xpc_dictionary_get_int64(v14, "RandomInitialDelay");
  v15->_expected_duration = (double)xpc_dictionary_get_int64(v14, "ExpectedDuration");
  v64 = xpc_dictionary_get_array(v14, "RelatedApplications");
  v65 = (void *)objc_claimAutoreleasedReturnValue(v64);

  if (v65 && xpc_get_type(v65) == (xpc_type_t)&_xpc_type_array)
  {
    v66 = _CFXPCCreateCFObjectFromXPCObject(v65);
    related_applications = v15->_related_applications;
    v15->_related_applications = (NSArray *)v66;
  }

  v68 = xpc_dictionary_get_value(v14, "RunOnAppForeground");
  uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue(v68);

  if (v55)
  {
    if (xpc_get_type(v55) == (xpc_type_t)&_xpc_type_BOOL)
    {
      v69 = xpc_BOOL_get_value(v55);
      v70 = v69;
      if (v69)
      {
        if (!-[NSArray count](v15->_related_applications, "count"))
        {
          v126 = (void *)qword_1001579B8;
          if (os_log_type_enabled((os_log_t)qword_1001579B8, OS_LOG_TYPE_ERROR)) {
            sub_1000B3DDC(v126, v15);
          }
          goto LABEL_174;
        }

        v15->_runOnAppForeground = v70;
      }
    }
  }

  v71 = xpc_dictionary_get_value(v14, "RequestsApplicationLaunch");
  v72 = (void *)objc_claimAutoreleasedReturnValue(v71);

  if (v72)
  {
    if (xpc_get_type(v72) == (xpc_type_t)&_xpc_type_BOOL)
    {
      v73 = xpc_BOOL_get_value(v72);
      v74 = v73;
      if (v73)
      {
        if (!-[NSArray count](v15->_related_applications, "count"))
        {
          v127 = (void *)qword_1001579B8;
          if (os_log_type_enabled((os_log_t)qword_1001579B8, OS_LOG_TYPE_ERROR)) {
            sub_1000B3D4C(v127, v15);
          }

          goto LABEL_9;
        }

        v15->_requestsApplicationLaunch = v74;
      }
    }
  }

  v75 = xpc_dictionary_get_value(v14, "BeforeApplicationLaunch");
  uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue(v75);

  if (v55)
  {
    if (xpc_get_type(v55) == (xpc_type_t)&_xpc_type_BOOL)
    {
      v76 = xpc_BOOL_get_value(v55);
      v77 = v76;
      if (v76)
      {
        if (-[NSArray count](v15->_related_applications, "count"))
        {
          v15->_beforeApplicationLaunch = v77;
          goto LABEL_100;
        }

        v128 = (void *)qword_1001579B8;
        if (os_log_type_enabled((os_log_t)qword_1001579B8, OS_LOG_TYPE_ERROR)) {
          sub_1000B3CBC(v128, v15);
        }
LABEL_174:

        goto LABEL_9;
      }
    }
  }

LABEL_100:
  v78 = xpc_dictionary_get_value(v14, "UserRequestedBackupTask");
  v79 = (void *)objc_claimAutoreleasedReturnValue(v78);

  if (v79) {
    v15->_user_requested_backup_task = xpc_BOOL_get_value(v79);
  }
  v80 = xpc_dictionary_get_dictionary(v14, "NetworkEndpoint");
  v81 = (void *)objc_claimAutoreleasedReturnValue(v80);

  if (v81 && xpc_get_type(v81) == (xpc_type_t)&_xpc_type_dictionary)
  {
    v82 = nw_endpoint_create_from_dictionary(v81);
    network_endpoint = v15->_network_endpoint;
    v15->_network_endpoint = (OS_nw_endpoint *)v82;
  }

  v84 = xpc_dictionary_get_dictionary(v14, "NetworkParameters");
  v85 = (void *)objc_claimAutoreleasedReturnValue(v84);

  if (v85 && xpc_get_type(v85) == (xpc_type_t)&_xpc_type_dictionary)
  {
    v86 = nw_parameters_create_from_dictionary(v85);
    network_parameters = v15->_network_parameters;
    v15->_network_parameters = (OS_nw_parameters *)v86;
  }

  v15->_requires_buddy_complete = xpc_dictionary_get_BOOL(v14, "RequiresBuddyComplete");
  v88 = xpc_dictionary_get_string(v14, "GroupName");
  if (v88)
  {
    v89 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v88));
    group_name = v15->_group_name;
    v15->_group_name = (NSString *)v89;
  }

  if (v15->_group_name)
  {
    v91 = xpc_dictionary_get_value(v14, "GroupConcurrencyLimit");
    v92 = objc_claimAutoreleasedReturnValue(v91);

    if (v92) {

    }
      int64 = xpc_dictionary_get_int64(v14, "GroupConcurrencyLimit");
    else {
      int64 = 1LL;
    }
    v15->_group_concurrency_limit = int64;
    v85 = (void *)v92;
  }

  v94 = xpc_dictionary_get_string(v14, "RateLimitConfigurationName");
  if (v94)
  {
    v95 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v94));
    rateLimitConfigurationName = v15->_rateLimitConfigurationName;
    v15->_rateLimitConfigurationName = (NSString *)v95;
  }

  v15->_requires_significant_user_inactivity = xpc_dictionary_get_BOOL(v14, "RequiresSignificantUserInactivity");
  v15->_requiresUserInactivity = xpc_dictionary_get_BOOL(v14, "RequiresUserInactivity");
  v15->_power_nap = xpc_dictionary_get_BOOL(v14, "PowerNap");
  v15->_app_refresh = xpc_dictionary_get_BOOL(v14, "AppRefresh");
  v15->_prevents_device_sleep = xpc_dictionary_get_BOOL(v14, "PreventsDeviceSleep");
  v15->_resource_intensive = xpc_dictionary_get_BOOL(v14, "ResourceIntensive");
  v97 = xpc_dictionary_get_int64(v14, "Resources");
  if (v97 <= 1) {
    v98 = 1LL;
  }
  else {
    v98 = v97;
  }
  v15->_resources = v98;
  v15->_requires_inexpensive_network = xpc_dictionary_get_BOOL(v14, "RequiresInexpensiveNetworkConnectivity");
  v15->_requires_unconstrained_network = xpc_dictionary_get_BOOL(v14, "RequiresUnconstrainedNetworkConnectivity");
  v99 = xpc_dictionary_get_BOOL(v14, "RequiresNetworkConnectivity")
     || v15->_requires_inexpensive_network
     || v15->_requires_unconstrained_network;
  v15->_requires_network_connectivity = v99;
  v15->_expected_network_download_size_bytes = xpc_dictionary_get_int64(v14, "NetworkDownloadSize");
  v15->_expected_network_upload_size_bytes = xpc_dictionary_get_int64(v14, "NetworkUploadSize");
  v15->_may_reboot_device = xpc_dictionary_get_BOOL(v14, "MayRebootDevice");
  v100 = xpc_dictionary_get_array(v14, "ProducedResultIdentifiers");
  v101 = (void *)objc_claimAutoreleasedReturnValue(v100);

  if (v101 && xpc_get_type(v101) == (xpc_type_t)&_xpc_type_array)
  {
    v102 = (void *)_CFXPCCreateCFObjectFromXPCObject(v101);
    if (v102)
    {
      v103 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v102));
      produced_result_identifiers = v15->_produced_result_identifiers;
      v15->_produced_result_identifiers = (NSSet *)v103;
    }
  }

  v105 = xpc_dictionary_get_array(v14, "Dependencies");
  v106 = (void *)objc_claimAutoreleasedReturnValue(v105);

  if (v106 && xpc_get_type(v106) == (xpc_type_t)&_xpc_type_array)
  {
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000LL;
    v140 = sub_10004AD44;
    v141 = sub_10004AD54;
    v142 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472LL;
    applier[2] = sub_10004AD5C;
    applier[3] = &unk_100116020;
    v107 = v15;
    v137 = a5;
    v135 = v107;
    v136 = buf;
    if (!xpc_array_apply(v106, applier))
    {

      _Block_object_dispose(buf, 8);
      goto LABEL_9;
    }

    objc_storeStrong(v107 + 41, *(id *)(*(void *)&buf[8] + 40LL));

    _Block_object_dispose(buf, 8);
  }

  v108 = xpc_dictionary_get_string(v14, "DiskVolume");
  if (v108)
  {
    if (!v15->_expected_network_download_size_bytes)
    {
      v114 = (os_log_s *)(id)qword_1001579B8;
      if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR)) {
        sub_1000B3C30(v15, v114);
      }

      goto LABEL_9;
    }

    v109 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v108));
    diskVolume = v15->_diskVolume;
    v15->_diskVolume = (NSString *)v109;
  }

  v15->_communicates_with_paired_device = xpc_dictionary_get_BOOL(v14, "CommunicatesWithPairedDevice");
  v15->_targetDevice = 0LL;
  v111 = xpc_dictionary_get_string(v14, "TargetDevice");
  v112 = v111;
  if (v111)
  {
    if (!strncmp(v111, "TargetDeviceDefaultPaired", 0x19uLL))
    {
      v113 = 1LL;
      goto LABEL_147;
    }

    if (!strncmp(v112, "TargetDeviceAllPaired", 0x15uLL))
    {
      v113 = 2LL;
      goto LABEL_147;
    }

    if (!strncmp(v112, "TargetDeviceRemote", 0x12uLL))
    {
      v113 = 3LL;
LABEL_147:
      v15->_targetDevice = v113;
    }
  }

  v115 = xpc_dictionary_get_string(v14, "RemoteDeviceIdentifier");
  if (v115)
  {
    v116 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v115));
    remoteDevice = v15->_remoteDevice;
    v15->_remoteDevice = (NSString *)v116;
  }

  v15->_requiresRemoteDeviceWake = xpc_dictionary_get_BOOL(v14, "RequiresRemoteDeviceWake");
  v15->_duet_power_budgeted = xpc_dictionary_get_BOOL(v14, "PowerBudgeted");
  v15->_shouldWakeDevice = xpc_dictionary_get_BOOL(v14, "ShouldWakeDevice");
  v15->_requires_protection_class = 3LL;
  v118 = xpc_dictionary_get_string(v14, "RequiresProtectionClass");
  v15->_overrideRateLimiting = xpc_dictionary_get_BOOL(v14, "OverrideRateLimiting");
  v15->_magneticInterferenceSensitivity = xpc_dictionary_get_BOOL(v14, "MagneticInterferenceSensitivity");
  v15->_mailFetch = xpc_dictionary_get_BOOL(v14, "MailFetch");
  v15->_bypassPeakPower = xpc_dictionary_get_BOOL(v14, "BypassPeakPower");
  v15->_bypassBatteryAging = xpc_dictionary_get_BOOL(v14, "BypassBatteryAging");
  v15->_backlogged = xpc_dictionary_get_BOOL(v14, "Backlogged");
  v15->_requiresMinimumBatteryLevel = xpc_dictionary_get_int64(v14, "RequiresMinimumBatteryLevel");
  v15->_blockRebootActivitiesForSU = xpc_dictionary_get_BOOL(v14, "BlockRebootActivitiesForSU");
  if (v15->_requiresMinimumBatteryLevel >= 0x65) {
    v15->_requiresMinimumBatteryLevel = 0LL;
  }
  v119 = xpc_dictionary_get_int64(v14, "RequiresMinimumDataBudgetPercentage");
  if (v119 <= 0x64) {
    v120 = v119;
  }
  else {
    v120 = 0LL;
  }
  v15->_requiresMinimumDataBudgetPercentage = v120;
  v15->_state = 0LL;
  if (v133)
  {
    v121 = objc_claimAutoreleasedReturnValue([v133 baseTime]);
    baseTime = v15->_baseTime;
    v15->_baseTime = (NSDate *)v121;

    [v133 tempDelay];
    v15->_tempDelay = v123;
    if (v15->_type == 2)
    {
      v124 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      v125 = (void *)objc_claimAutoreleasedReturnValue([v124 dateByAddingTimeInterval:-v15->_interval]);
      if (-[NSDate compare:](v15->_baseTime, "compare:", v125) == NSOrderedAscending) {
        objc_storeStrong((id *)&v15->_baseTime, v125);
      }
    }

    v15->_state = (int64_t)[v133 state];
  }

  else
  {
    -[_DASBGSystemTask loadBaseTime](v15, "loadBaseTime");
  }

  objc_storeStrong((id *)&v15->_descriptor, a3);
  uint64_t v22 = v15;

LABEL_10:
  return v22;
}

void sub_10004AD24( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

uint64_t sub_10004AD44(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10004AD54(uint64_t a1)
{
}

BOOL sub_10004AD5C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary)
  {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityDependency dependencyFromDescriptor:withUID:]( &OBJC_CLASS____DASActivityDependency,  "dependencyFromDescriptor:withUID:",  v4,  *(unsigned int *)(a1 + 48)));
    BOOL v6 = v7 != 0LL;
    if (v7)
    {
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v7];
    }

    else
    {
      id v8 = (void *)qword_1001579B8;
      if (os_log_type_enabled((os_log_t)qword_1001579B8, OS_LOG_TYPE_ERROR)) {
        sub_1000B4290(a1, v8);
      }
    }
  }

  else
  {
    __int128 v5 = (void *)qword_1001579B8;
    if (os_log_type_enabled((os_log_t)qword_1001579B8, OS_LOG_TYPE_ERROR)) {
      sub_1000B4320(a1, v5, (uint64_t)v4);
    }
    BOOL v6 = 0LL;
  }

  return v6;
}

void sub_10004CAF8(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_10004CB04(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

void sub_10004CB30(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(va, 8) = a1;
}

id sub_10004D098(uint64_t a1)
{
  return [*(id *)(a1 + 32) setRecentTriggerEvent:0];
}

id sub_10004D0A4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setWaitingForInactivity:0];
}

void sub_10004D0B0(uint64_t a1, int token)
{
  if (!notify_get_state(token, &state64))
  {
    id v3 = *(void **)(a1 + 32);
    if (state64)
    {
      [v3 setRecentTriggerEvent:0];
      [*(id *)(a1 + 32) setWaitingForInactivity:0];
      *(_BYTE *)(*(void *)(a1 + 32) + 10LL) = 1;
      id v4 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.duetactivityscheduler");
      -[NSUserDefaults setBool:forKey:]( v4,  "setBool:forKey:",  *(unsigned __int8 *)(*(void *)(a1 + 32) + 10LL),  @"ignoreTH");
    }

    else
    {
      [v3 handleTriggerEvent];
      *(_BYTE *)(*(void *)(a1 + 32) + 10LL) = 0;
      id v4 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.duetactivityscheduler");
      -[NSUserDefaults removeObjectForKey:](v4, "removeObjectForKey:", @"ignoreTH");
    }
  }

void sub_10004D330(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS____DASThunderingHerdPolicy);
  id v2 = (void *)qword_1001579F8;
  qword_1001579F8 = (uint64_t)v1;
}

void sub_10004DAFC(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS____DASUserRequestedBackupPolicy);
  id v2 = (void *)qword_100157A08;
  qword_100157A08 = (uint64_t)v1;
}

void sub_10004DECC(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS____DASBackgroundAppKillDemo);
  id v2 = (void *)qword_100157A18;
  qword_100157A18 = (uint64_t)v1;
}

void sub_10004E3AC(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  id v2 = (void *)qword_100157A28;
  qword_100157A28 = (uint64_t)v1;
}

void sub_10004F4F0(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  id v2 = (void *)qword_100157A38;
  qword_100157A38 = (uint64_t)v1;
}

id sub_10004F790(uint64_t a1)
{
  return [*(id *)(a1 + 32) reportBlockingAnalyticsAndReset];
}

NSMutableDictionary *sub_10004FA7C(uint64_t a1)
{
  id v2 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  *(void *)(a1 + 32),  @"bucket");
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) policyName]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v3, @"policyName");

  id v4 = *(void **)(a1 + 56);
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) policyName]);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v4 containsObject:v5]));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v6, *(void *)(a1 + 48));

  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) treatmentID]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v7, @"treatmentID");

  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) experimentID]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v8, @"experimentID");

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [*(id *)(a1 + 64) deploymentID]));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v9, @"deploymentID");

  return v2;
}

LABEL_48:
  [v42 setLastComputedScore:v41];
  objc_autoreleasePoolPop(context);

  return v41;
}
}

void sub_1000506DC(_Unwind_Exception *a1)
{
}

void sub_100050714(uint64_t a1)
{
  id v2 = (void *)qword_100157A48;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [*(id *)(a1 + 32) schedulingPriority]));
  id v5 = (id)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:v3]);

  if (v5)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) policyName]);
    [v5 addObject:v4];
  }
}

void sub_100050F80(id a1)
{
  id v1 = objc_opt_new(&OBJC_CLASS___NSDateFormatter);
  id v2 = (void *)qword_100157A68;
  qword_100157A68 = (uint64_t)v1;

  [(id)qword_100157A68 setDateStyle:1];
  [(id)qword_100157A68 setTimeStyle:1];
  id v3 = (void *)qword_100157A68;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSTimeZone localTimeZone](&OBJC_CLASS___NSTimeZone, "localTimeZone"));
  [v3 setTimeZone:v4];
}

void sub_100051544(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS____DASActivityDependencyManager);
  id v2 = (void *)qword_100157A78;
  qword_100157A78 = (uint64_t)v1;
}

void sub_1000516A0(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 24LL);
  if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 8LL);
    id v4 = v2;
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 count]));
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    uint64_t v21 = v5;
    __int16 v22 = 2112;
    uint64_t v23 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Refreshing %@ dependency groups with updated file protection: %@",  buf,  0x16u);
  }

  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v8 = *(void **)(a1 + 40);
  uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 8LL);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100051828;
  v16[3] = &unk_100116168;
  id v10 = v8;
  uint64_t v11 = *(void *)(a1 + 32);
  id v17 = v10;
  uint64_t v18 = v11;
  id v12 = v7;
  id v19 = v12;
  [v9 enumerateKeysAndObjectsUsingBlock:v16];
  uint64_t v13 = *(void *)(a1 + 32);
  int v14 = *(void **)(v13 + 8);
  *(void *)(v13 + _Block_object_dispose(va, 8) = v12;
  id v15 = v12;
}

void sub_100051828(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 isPersistenceAvailableWithFileProtection:*(void *)(a1 + 32)])
  {
    unsigned __int8 v7 = &off_100114498;
    uint64_t v8 = objc_opt_class(&OBJC_CLASS____DASActivityResultDependencyGroup);
    if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0
      || (unsigned __int8 v7 = &off_100114468,
          uint64_t v9 = objc_opt_class(&OBJC_CLASS____DASActivityCompletionDependencyGroup),
          (objc_opt_isKindOfClass(v6, v9) & 1) != 0))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class groupFromPersistence:](*v7, "groupFromPersistence:", v5));
      id v12 = *(void **)(a1 + 48);
      uint64_t v11 = (void **)(a1 + 48);
      [v12 setObject:v10 forKeyedSubscript:v5];

      uint64_t v13 = (void *)*((void *)*(v11 - 1) + 3);
      if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEBUG)) {
        sub_1000B4604(v11, v13, (uint64_t)v5);
      }
    }

    else
    {
      int v14 = *(void **)(*(void *)(a1 + 40) + 24LL);
      if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR)) {
        sub_1000B46B4(v14);
      }
    }
  }

  else
  {
    if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 40) + 24LL), OS_LOG_TYPE_DEBUG)) {
      sub_1000B474C();
    }
    [*(id *)(a1 + 48) setObject:v6 forKeyedSubscript:v5];
  }
}

void sub_100051AD4(uint64_t a1)
{
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dependencies]);
  id v3 = [v2 countByEnumeratingWithState:&v26 objects:v37 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v27;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v27 != v5) {
          objc_enumerationMutation(v2);
        }
        unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(a1 + 40),  "queue_dependencyGroupCreateIfDoesNotExist:",  *(void *)(*((void *)&v26 + 1) + 8 * (void)i)));
        [v7 handleActivitySubmission:*(void *)(a1 + 32)];
      }

      id v4 = [v2 countByEnumeratingWithState:&v26 objects:v37 count:16];
    }

    while (v4);
  }

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) producedResultIdentifiers]);
  id v9 = [v8 countByEnumeratingWithState:&v22 objects:v36 count:16];
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v23;
    *(void *)&__int128 v10 = 136315650LL;
    __int128 v21 = v10;
    do
    {
      for (j = 0LL; j != v11; j = (char *)j + 1)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v8);
        }
        int v14 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)j);
        id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "name", v21));
        unsigned __int8 v16 = [v14 isEqualToString:v15];

        if ((v16 & 1) == 0)
        {
          id v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "queue_checkedResultDependencyGroupForIdentifier:", v14));
          uint64_t v18 = v17;
          if (v17)
          {
            [v17 registerProducer:*(void *)(a1 + 32) error:0];
          }

          else
          {
            id v19 = *(os_log_s **)(*(void *)(a1 + 40) + 24LL);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              uint64_t v20 = *(void *)(a1 + 32);
              *(_DWORD *)buf = v21;
              uint64_t v31 = "-[_DASActivityDependencyManager addActivityToDependencyGroups:]_block_invoke";
              __int16 v32 = 2112;
              uint64_t v33 = v20;
              __int16 v34 = 2112;
              uint64_t v35 = v14;
              _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s: Tried to add %@ to a result dependency group (%@) but we could not create the group (persistence type conflict)",  buf,  0x20u);
            }
          }
        }
      }

      id v11 = [v8 countByEnumeratingWithState:&v22 objects:v36 count:16];
    }

    while (v11);
  }
}

void sub_100051E58(uint64_t a1)
{
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dependencies]);
  id v3 = [v2 countByEnumeratingWithState:&v36 objects:v47 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v37;
    *(void *)&__int128 v4 = 136315650LL;
    __int128 v30 = v4;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v37 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
        id v9 = *(void **)(*(void *)(a1 + 40) + 8LL);
        __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier", v30));
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v10]);

        if (v11)
        {
          [v11 deregisterDependent:*(void *)(a1 + 32)];
        }

        else
        {
          uint64_t v12 = *(void **)(*(void *)(a1 + 40) + 24LL);
          if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
          {
            uint64_t v13 = *(void **)(a1 + 32);
            int v14 = v12;
            id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 description]);
            unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
            *(_DWORD *)buf = v30;
            __int128 v42 = "-[_DASActivityDependencyManager removeActivityFromDependencyGroups:]_block_invoke";
            __int16 v43 = 2112;
            v44 = v15;
            __int16 v45 = 2112;
            __int128 v46 = v16;
            _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s: Unable to deregister consuming activity %@ from dependency group for %@; group does not exist",
              buf,
              0x20u);
          }
        }
      }

      id v5 = [v2 countByEnumeratingWithState:&v36 objects:v47 count:16];
    }

    while (v5);
  }

  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) producedResultIdentifiers]);
  id v18 = [v17 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v18)
  {
    id v20 = v18;
    uint64_t v21 = *(void *)v33;
    *(void *)&__int128 v19 = 136315650LL;
    __int128 v31 = v19;
    do
    {
      for (j = 0LL; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v33 != v21) {
          objc_enumerationMutation(v17);
        }
        __int128 v23 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)j);
        __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "queue_checkedResultDependencyGroupForIdentifier:", v23, v31));
        __int128 v25 = v24;
        if (v24)
        {
          [v24 deregisterProducer:*(void *)(a1 + 32) error:0];
        }

        else
        {
          __int128 v26 = *(void **)(*(void *)(a1 + 40) + 24LL);
          if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR))
          {
            __int128 v27 = *(void **)(a1 + 32);
            __int128 v28 = v26;
            __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v27 description]);
            *(_DWORD *)buf = v31;
            __int128 v42 = "-[_DASActivityDependencyManager removeActivityFromDependencyGroups:]_block_invoke";
            __int16 v43 = 2112;
            v44 = v29;
            __int16 v45 = 2112;
            __int128 v46 = v23;
            _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "%s: Unable to deregister producing activity %@ from dependency group for %@; group does not exist",
              buf,
              0x20u);
          }
        }
      }

      id v20 = [v17 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }

    while (v20);
  }
}

uint64_t sub_1000523D4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000523E4(uint64_t a1)
{
}

void sub_1000523EC(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    id v2 = *(id *)(a1 + 32);
    id v3 = [v2 countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v46;
      while (2)
      {
        for (i = 0LL; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v46 != v5) {
            objc_enumerationMutation(v2);
          }
          unsigned __int8 v7 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)i);
          uint64_t v8 = *(void **)(a1 + 40);
          id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
          __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v8 dependencyForIdentifier:v9]);

          if (!v10)
          {
            v51[0] = @"dependencyIdentifier";
            __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
            v51[1] = @"activityName";
            v52[0] = v23;
            __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) description]);
            v52[1] = v24;
            __int128 v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v52,  v51,  2LL));
            uint64_t v26 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"_DASActivityDependencyManagerErrorDomain",  1LL,  v25));
            uint64_t v27 = *(void *)(*(void *)(a1 + 56) + 8LL);
            __int128 v28 = *(void **)(v27 + 40);
            *(void *)(v27 + 40) = v26;

            *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
            goto LABEL_24;
          }

          id v11 = *(void **)(a1 + 48);
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "queue_checkedResultDependencyGroupForIdentifier:", v12));

          if (!v13)
          {
            __int128 v29 = *(void **)(*(void *)(a1 + 48) + 24LL);
            if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_ERROR)) {
              sub_1000B4940(a1 + 40, v29);
            }
            v49[0] = @"dependencyIdentifier";
            __int16 v43 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
            v50[0] = v43;
            v49[1] = @"activityName";
            __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) description]);
            v50[1] = v30;
            v49[2] = @"knownType";
            __int128 v31 = *(void **)(*(void *)(a1 + 48) + 8LL);
            __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
            __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKeyedSubscript:v32]);
            id v34 = [(id)objc_opt_class(v33) description];
            __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
            __int128 v36 = v35;
            if (!v35) {
              __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
            }
            v50[2] = v36;
            v49[3] = @"attemptedType";
            id v37 = [(id)objc_opt_class(_DASActivityResultDependencyGroup) description];
            __int128 v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
            v50[3] = v38;
            __int128 v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v50,  v49,  4LL));
            uint64_t v40 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"_DASActivityDependencyManagerErrorDomain",  4LL,  v39));
            uint64_t v41 = *(void *)(*(void *)(a1 + 56) + 8LL);
            __int128 v42 = *(void **)(v41 + 40);
            *(void *)(v41 + 40) = v40;

            if (!v35) {
            uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8LL);
            }
LABEL_23:
            *(_BYTE *)(v17 + 24) = 0;

            goto LABEL_24;
          }

          uint64_t v14 = *(void *)(a1 + 40);
          uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8LL);
          id obj = *(id *)(v15 + 40);
          unsigned __int8 v16 = [v13 reportActivity:v14 consumedResult:v7 error:&obj];
          objc_storeStrong((id *)(v15 + 40), obj);
          *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = v16;
          uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8LL);
          if (!*(_BYTE *)(v17 + 24) || *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL)) {
            goto LABEL_23;
          }
        }

        id v4 = [v2 countByEnumeratingWithState:&v45 objects:v53 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }

void sub_100052AB4(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    id v2 = *(id *)(a1 + 32);
    id v3 = [v2 countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v37;
      while (2)
      {
        for (i = 0LL; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v37 != v5) {
            objc_enumerationMutation(v2);
          }
          unsigned __int8 v7 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
          uint64_t v8 = *(void **)(a1 + 48);
          id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
          __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "queue_checkedResultDependencyGroupForIdentifier:", v9));

          if (!v10)
          {
            uint64_t v20 = *(void **)(*(void *)(a1 + 48) + 24LL);
            if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR)) {
              sub_1000B4A40(a1 + 40, v20);
            }
            v40[0] = @"dependencyIdentifier";
            id v34 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
            v41[0] = v34;
            v40[1] = @"activityName";
            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) description]);
            v41[1] = v21;
            v40[2] = @"knownType";
            __int128 v22 = *(void **)(*(void *)(a1 + 48) + 8LL);
            __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
            __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v23]);
            id v25 = [(id)objc_opt_class(v24) description];
            uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
            uint64_t v27 = v26;
            if (!v26) {
              uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
            }
            v41[2] = v27;
            v40[3] = @"attemptedType";
            id v28 = [(id)objc_opt_class(_DASActivityResultDependencyGroup) description];
            __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
            v41[3] = v29;
            __int128 v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v41,  v40,  4LL));
            uint64_t v31 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"_DASActivityDependencyManagerErrorDomain",  4LL,  v30));
            uint64_t v32 = *(void *)(*(void *)(a1 + 56) + 8LL);
            __int128 v33 = *(void **)(v32 + 40);
            *(void *)(v32 + 40) = v31;

            if (!v26) {
            uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8LL);
            }
LABEL_21:
            *(_BYTE *)(v14 + 24) = 0;

            goto LABEL_22;
          }

          uint64_t v11 = *(void *)(a1 + 40);
          uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8LL);
          id obj = *(id *)(v12 + 40);
          unsigned __int8 v13 = [v10 reportActivity:v11 producedResult:v7 error:&obj];
          objc_storeStrong((id *)(v12 + 40), obj);
          *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = v13;
          uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8LL);
          if (!*(_BYTE *)(v14 + 24) || *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL)) {
            goto LABEL_21;
          }
        }

        id v4 = [v2 countByEnumeratingWithState:&v36 objects:v42 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }

void sub_100052F30(uint64_t a1)
{
  id v2 = *(os_log_s **)(*(void *)(a1 + 32) + 24LL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 136315394;
    __int128 v24 = "-[_DASActivityDependencyManager reportActivityDidFinishRunning:]_block_invoke";
    __int16 v25 = 2112;
    uint64_t v26 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "%s: Reporting activity did finish running for %@",  buf,  0x16u);
  }

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v4 = (void *)(a1 + 40);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "dependencies", 0));
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        __int128 v10 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        if ([v10 isActivityCompletionBased])
        {
          uint64_t v11 = *(void **)(a1 + 32);
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
          unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "queue_checkedCompletionDependencyGroupForIdentifier:", v12));

          [v13 reportDependentActivityDidRun:*(void *)(a1 + 40)];
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v7);
  }

  uint64_t v14 = *(void **)(a1 + 32);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) name]);
  unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "queue_checkedCompletionDependencyGroupForIdentifier:", v15));

  if (v16)
  {
    [v16 reportTrackedActivityDidRun:*v4];
  }

  else
  {
    uint64_t v17 = *(void **)(*(void *)(a1 + 32) + 24LL);
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR)) {
      sub_1000B4B2C((uint64_t)v4, v17);
    }
  }
}

void sub_1000532A0(uint64_t a1)
{
  __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v24 = (id *)(a1 + 32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dependencies]);
  id v4 = [v3 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v4)
  {
    id v6 = v4;
    char v7 = 0;
    uint64_t v8 = *(void *)v27;
    *(void *)&__int128 v5 = 136315650LL;
    __int128 v23 = v5;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v3);
        }
        __int128 v10 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "queue_dependencyGroupCreateIfDoesNotExist:", v10, v23));
        unsigned __int8 v12 = [v11 isDependencySatisfiedForActivity:*(void *)(a1 + 32)];
        unsigned int v13 = [v10 isActivityCompletionBased];
        if ((v12 & 1) != 0)
        {
          if (v13)
          {
            uint64_t v14 = *(os_log_s **)(*(void *)(a1 + 40) + 24LL);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              id v16 = *v24;
              *(_DWORD *)buf = v23;
              uint64_t v31 = "-[_DASActivityDependencyManager areDependenciesSatisfiedFor:]_block_invoke";
              __int16 v32 = 2112;
              id v33 = v11;
              __int16 v34 = 2112;
              id v35 = v16;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "%s: %@ is satisfied; overriding all dependencies on %@",
                buf,
                0x20u);
            }

            char v7 = 1;
          }
        }

        else
        {
          if (v13) {
            uint64_t v15 = v2;
          }
          else {
            uint64_t v15 = v25;
          }
          [v15 addObject:v10];
        }
      }

      id v6 = [v3 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }

    while (v6);

    if ((v7 & 1) != 0) {
      goto LABEL_27;
    }
  }

  else
  {
  }

  id v17 = [v2 count];
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([*v24 dependencies]);
  id v19 = [v18 count];

  if (v17 == v19)
  {
    __int128 v20 = *(os_log_s **)(*(void *)(a1 + 40) + 24LL);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      sub_1000B4C90((uint64_t *)v24, (uint64_t)v2, v20);
    }
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
  }

  else
  {
    if (![v25 count])
    {
LABEL_27:
      *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
      goto LABEL_28;
    }

    __int128 v21 = *(os_log_s **)(*(void *)(a1 + 40) + 24LL);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      id v22 = *v24;
      *(_DWORD *)buf = 136315906;
      uint64_t v31 = "-[_DASActivityDependencyManager areDependenciesSatisfiedFor:]_block_invoke";
      __int16 v32 = 2112;
      id v33 = v22;
      __int16 v34 = 2112;
      id v35 = v25;
      __int16 v36 = 2112;
      __int128 v37 = v2;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "%s: %@ has unsatisfied result dependencies: %@, Unsatisfied activity completion dependencies: %@",  buf,  0x2Au);
    }
  }

void sub_1000536F0(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:*(void *)(a1 + 40)]);
  [v1 resetAccumulation];
}

void sub_100053E60(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue_dependencyGroup:", *(void *)(a1 + 40)));
  [v1 resetAccumulation];
}

void sub_100053F68(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue_dependencyGroup:", *(void *)(a1 + 40)));
  uint64_t v2 = objc_claimAutoreleasedReturnValue([v5 dictionary]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

  ;
}

void sub_100053FD4( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

id sub_100053FF0(uint64_t a1, void *a2)
{
  return a2;
}

void sub_100053FFC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

void sub_10005402C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

uint64_t sub_10005403C()
{
  return v0;
}

void sub_100054070(id a1)
{
  id obja = (id)objc_claimAutoreleasedReturnValue(+[_DASApplicationPolicy policyInstance](&OBJC_CLASS____DASApplicationPolicy, "policyInstance"));
  v55[0] = obja;
  __int128 v42 = (void *)objc_claimAutoreleasedReturnValue(+[_DASBootTimePolicy policyInstance](&OBJC_CLASS____DASBootTimePolicy, "policyInstance"));
  v55[1] = v42;
  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(+[_DASCallInProgressPolicy policyInstance](&OBJC_CLASS____DASCallInProgressPolicy, "policyInstance"));
  v55[2] = v41;
  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(+[_DASCPUUsagePolicy policyInstance](&OBJC_CLASS____DASCPUUsagePolicy, "policyInstance"));
  v55[3] = v40;
  __int128 v39 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDeviceActivityPolicy policyInstance](&OBJC_CLASS____DASDeviceActivityPolicy, "policyInstance"));
  v55[4] = v39;
  __int128 v38 = (void *)objc_claimAutoreleasedReturnValue(+[_DASNetworkQualityPolicy policyInstance](&OBJC_CLASS____DASNetworkQualityPolicy, "policyInstance"));
  v55[5] = v38;
  __int128 v37 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPhotosPolicy policyInstance](&OBJC_CLASS____DASPhotosPolicy, "policyInstance"));
  v55[6] = v37;
  id v1 = (void *)objc_claimAutoreleasedReturnValue(+[_DASFileProtectionPolicy policyInstance](&OBJC_CLASS____DASFileProtectionPolicy, "policyInstance"));
  v55[7] = v1;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[_DASGroupSchedulingPolicy policyInstance](&OBJC_CLASS____DASGroupSchedulingPolicy, "policyInstance"));
  v55[8] = v2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[_DASRequiresBuddyCompletePolicy policyInstance]( &OBJC_CLASS____DASRequiresBuddyCompletePolicy,  "policyInstance"));
  v55[9] = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[_DASRequiresRestartPolicy policyInstance](&OBJC_CLASS____DASRequiresRestartPolicy, "policyInstance"));
  v55[10] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASThermalPolicy policyInstance](&OBJC_CLASS____DASThermalPolicy, "policyInstance"));
  v55[11] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[_DASResultDependencyPolicy policyInstance]( &OBJC_CLASS____DASResultDependencyPolicy,  "policyInstance"));
  v55[12] = v6;
  char v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DASFastPassPolicy policyInstance](&OBJC_CLASS____DASFastPassPolicy, "policyInstance"));
  v55[13] = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[_DASWidgetRefreshBudgetPolicy policyInstance]( &OBJC_CLASS____DASWidgetRefreshBudgetPolicy,  "policyInstance"));
  v55[14] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[_DASMemoryPressurePolicy policyInstance](&OBJC_CLASS____DASMemoryPressurePolicy, "policyInstance"));
  v55[15] = v9;
  uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v55, 16LL));
  uint64_t v11 = (void *)qword_100157A88;
  qword_100157A88 = v10;

  uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  unsigned int v13 = (void *)qword_100157A90;
  qword_100157A90 = v12;

  uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v15 = (void *)qword_100157A98;
  qword_100157A98 = v14;

  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  id obj = (id)qword_100157A88;
  id v16 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = 0LL;
    uint64_t v19 = *(void *)v50;
    do
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v50 != v19) {
          objc_enumerationMutation(obj);
        }
        __int128 v21 = *(void **)(*((void *)&v49 + 1) + 8LL * (void)i);
        id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 policyName]);
        __int128 v23 = (void *)qword_100157A90;
        __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", (char *)i + v18));
        [v23 setObject:v22 forKeyedSubscript:v24];

        __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", (char *)i + v18));
        __int128 v26 = (void *)qword_100157A98;
        __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v21 policyName]);
        [v26 setObject:v25 forKeyedSubscript:v27];
      }

      id v17 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
      uint64_t v18 = (v18 + (_DWORD)i);
    }

    while (v17);
  }

  [(id)qword_100157A90 setObject:@"Limitations" forKeyedSubscript:&off_100121E10];
  [(id)qword_100157A90 setObject:@"Incompatibility" forKeyedSubscript:&off_100121E28];
  [(id)qword_100157A90 setObject:@"Sysdiagnose" forKeyedSubscript:&off_100121E40];
  [(id)qword_100157A90 setObject:@"Preemption" forKeyedSubscript:&off_100121E58];
  [(id)qword_100157A98 setObject:&off_100121E10 forKeyedSubscript:@"Limitations"];
  [(id)qword_100157A98 setObject:&off_100121E28 forKeyedSubscript:@"Incompatibility"];
  [(id)qword_100157A98 setObject:&off_100121E40 forKeyedSubscript:@"Sysdiagnose"];
  [(id)qword_100157A98 setObject:&off_100121E58 forKeyedSubscript:@"Preemption"];
  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  id v29 = (id)qword_100157A88;
  id v30 = [v29 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v46;
    do
    {
      for (j = 0LL; j != v31; j = (char *)j + 1)
      {
        if (*(void *)v46 != v32) {
          objc_enumerationMutation(v29);
        }
        __int16 v34 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)j);
      }

      id v31 = [v29 countByEnumeratingWithState:&v45 objects:v53 count:16];
    }

    while (v31);
  }

  uint64_t v35 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v28));
  __int16 v36 = (void *)qword_100157AA0;
  qword_100157AA0 = v35;
}

void sub_100054708(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[_DKKnowledgeStore knowledgeStore](&OBJC_CLASS____DKKnowledgeStore, "knowledgeStore"));
  uint64_t v2 = (void *)qword_100157AC8;
  qword_100157AC8 = v1;
}

void sub_1000547A8(uint64_t a1)
{
  if (!qword_100157AB8)
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) sharedKnowledgeStore]);
    uint64_t v1 = objc_claimAutoreleasedReturnValue( +[_DASPredictor predictorWithKnowledgeStore:withQueue:]( &OBJC_CLASS____DASPredictor,  "predictorWithKnowledgeStore:withQueue:",  v3,  0LL));
    uint64_t v2 = (void *)qword_100157AB8;
    qword_100157AB8 = v1;
  }

void sub_100054860(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.duetactivityscheduler.predictionGenerationQueue", v4);
  id v3 = (void *)qword_100157AE0;
  qword_100157AE0 = (uint64_t)v2;
}

void sub_100054984(uint64_t a1)
{
  dispatch_queue_t v2 = objc_autoreleasePoolPush();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  objc_autoreleasePoolPop(v2);
}

void sub_1000549E0(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  dispatch_queue_t v2 = (void *)qword_100157AA8;
  qword_100157AA8 = v1;

  uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = (void *)qword_100157AB0;
  qword_100157AB0 = v3;
}

void sub_100054A78(_Unwind_Exception *a1)
{
}

void sub_100054B3C(_Unwind_Exception *a1)
{
}

LABEL_30:
  uint64_t v32 = (id)qword_100157AB0;
  objc_sync_enter(v32);
  [(id)qword_100157AB0 setObject:v9 forKeyedSubscript:v33];
  objc_sync_exit(v32);

LABEL_6:
  return v9;
}

void sub_100054EBC(_Unwind_Exception *a1)
{
}

void sub_100054FB4(_Unwind_Exception *a1)
{
}

void sub_1000550A4(_Unwind_Exception *a1)
{
}

void sub_10005512C(_Unwind_Exception *a1)
{
}

LABEL_3:
  uint64_t v12 = 0LL;
LABEL_4:

  return v12;
}

void sub_100055B30(_Unwind_Exception *a1)
{
}

uint64_t sub_100055B64(uint64_t result)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 1;
  return result;
}

void sub_100056714(_Unwind_Exception *a1)
{
}

uint64_t sub_100056774(uint64_t result)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 1;
  return result;
}

uint64_t sub_100056788(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  char v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:a2]);
  [v7 doubleValue];
  double v9 = v8;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v6]);

  [v10 doubleValue];
  double v12 = v11;

  if (v9 <= v12) {
    return 1LL;
  }
  else {
    return -1LL;
  }
}

id sub_100056818(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isDeletableApp:a2];
}

id sub_100056824(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isUserInstalledApp:a2];
}

id sub_100056AB4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) setWasDeferred:1];
}

void sub_100056AC4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  char v7 = *(void **)(a1 + 32);
  [v5 signpostTimestamp];
  double v9 = v8;
  [v6 signpostTimestamp];
  double v11 = v10;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100056B94;
  v14[3] = &unk_1001162F8;
  id v15 = v5;
  id v16 = v6;
  id v12 = v6;
  id v13 = v5;
  [v7 collectLaunchDataWithBootBatchTimestamp:v14 opportunisticBatchTimestamp:v9 completion:v11];
}

void sub_100056B94(uint64_t a1, void *a2, int a3, int a4, void *a5)
{
  id v9 = a2;
  uint64_t v43 = 0LL;
  v44 = &v43;
  uint64_t v45 = 0x2020000000LL;
  int v46 = 0;
  double v10 = &v39;
  uint64_t v39 = 0LL;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x2020000000LL;
  int v42 = 0;
  uint64_t v35 = 0LL;
  __int16 v36 = &v35;
  uint64_t v37 = 0x2020000000LL;
  int v38 = 0;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_100056FD8;
  v29[3] = &unk_1001162D0;
  id v30 = *(id *)(a1 + 32);
  uint64_t v32 = &v43;
  id v31 = *(id *)(a1 + 40);
  id v33 = &v39;
  __int16 v34 = &v35;
  [v9 enumerateKeysAndObjectsUsingBlock:v29];
  double v11 = (os_log_s *)(id)qword_100157AF8;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v10 = (uint64_t *)objc_claimAutoreleasedReturnValue([v9 allKeys]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIDs]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) bundleIDs]);
    *(_DWORD *)buf = 138412802;
    *(void *)__int128 v48 = v10;
    *(_WORD *)&v48[8] = 2112;
    __int128 v49 = v12;
    __int16 v50 = 2112;
    __int128 v51 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Closures built: %@, onBoot: %@, batch2: %@",  buf,  0x20u);
  }

  uint64_t v14 = (os_log_s *)(id)qword_100157AF0;
  os_signpost_id_t v15 = os_signpost_id_generate((os_log_t)qword_100157AF0);
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    double v10 = (uint64_t *)v15;
    if (os_signpost_enabled(v14))
    {
      if (a3) {
        int v16 = *((_DWORD *)v44 + 6);
      }
      else {
        int v16 = -1;
      }
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)__int128 v48 = v16;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v14,  OS_SIGNPOST_EVENT,  (os_signpost_id_t)v10,  "DuetClosuresBeforeOnBoot",  "appBundles=%{public, signpost.telemetry:number1}d enableTelemetry=YES ",  buf,  8u);
    }
  }

  id v17 = (os_log_s *)(id)qword_100157AF0;
  os_signpost_id_t v18 = os_signpost_id_generate((os_log_t)qword_100157AF0);
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v19 = v18;
    if (os_signpost_enabled(v17))
    {
      int v20 = a4 ? *((_DWORD *)v40 + 6) : -1;
      uint64_t v21 = *(void *)(a1 + 32);
      if (v21)
      {
        double v10 = (uint64_t *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIDs]);
        unsigned int v22 = [v10 count];
      }

      else
      {
        unsigned int v22 = -1;
      }

      *(_DWORD *)buf = 67240448;
      *(_DWORD *)__int128 v48 = v20;
      *(_WORD *)&v48[4] = 1026;
      *(_DWORD *)&v48[6] = v22;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v17,  OS_SIGNPOST_EVENT,  v19,  "DuetClosuresAfterOnBoot",  "appBundles=%{public, signpost.telemetry:number1}d prewarmed=%{public, signpost.telemetry:number2}d enableTelemetry=YES ",  buf,  0xEu);
      if (v21) {
    }
      }
  }

  __int128 v23 = (os_log_s *)(id)qword_100157AF0;
  os_signpost_id_t v24 = os_signpost_id_generate((os_log_t)qword_100157AF0);
  if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v25 = v24;
    if (os_signpost_enabled(v23))
    {
      if ((_DWORD)a5) {
        int v26 = *((_DWORD *)v36 + 6);
      }
      else {
        int v26 = -1;
      }
      __int128 v27 = *(void **)(a1 + 40);
      if (v27)
      {
        a5 = (void *)objc_claimAutoreleasedReturnValue([v27 bundleIDs]);
        unsigned int v28 = [a5 count];
      }

      else
      {
        unsigned int v28 = -1;
      }

      *(_DWORD *)buf = 67240448;
      *(_DWORD *)__int128 v48 = v26;
      *(_WORD *)&v48[4] = 1026;
      *(_DWORD *)&v48[6] = v28;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v23,  OS_SIGNPOST_EVENT,  v25,  "DuetClosuresAfterOpportunistic",  "appBundles=%{public, signpost.telemetry:number1}d prewarmed=%{public, signpost.telemetry:number2}d enableTelemetry=YES ",  buf,  0xEu);
      if (v27) {
    }
      }
  }

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);
}

void sub_100056F94( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20, uint64_t a21, uint64_t a22, char a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

void sub_100056FD8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  [a3 timeIntervalSince1970];
  double v7 = v6;
  [*(id *)(a1 + 32) signpostTimestamp];
  if (v7 >= v8 && *(void *)(a1 + 32))
  {
    [*(id *)(a1 + 40) signpostTimestamp];
    if (v7 >= v9 && *(void *)(a1 + 40))
    {
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
      double v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) bundleIDs]);
      unsigned int v11 = [v10 containsObject:v5];

      if (v11)
      {
        id v12 = (os_log_s *)qword_100157AF8;
        if (os_log_type_enabled((os_log_t)qword_100157AF8, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 138412290;
          id v17 = v5;
          id v13 = "Closure built for %@, although prewarmed opportunistically";
LABEL_13:
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v16, 0xCu);
        }
      }
    }

    else
    {
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIDs]);
      unsigned int v15 = [v14 containsObject:v5];

      if (v15)
      {
        id v12 = (os_log_s *)qword_100157AF8;
        if (os_log_type_enabled((os_log_t)qword_100157AF8, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 138412290;
          id v17 = v5;
          id v13 = "Closure built for %@, although prewarmed on boot";
          goto LABEL_13;
        }
      }
    }
  }

  else
  {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
  }
}

uint64_t sub_1000571E4(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  return result;
}

void sub_1000571FC(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, os_log_s *a4@<X8>)
{
}

void sub_100057280(uint64_t a1)
{
  uint64_t v1 = objc_opt_new(*(void *)(a1 + 32));
  dispatch_queue_t v2 = (void *)qword_100157B00;
  qword_100157B00 = v1;
}

id sub_1000578B4(uint64_t a1)
{
  return [*(id *)(a1 + 32) logFeatureAvailability:*(void *)(a1 + 40) forFeature:*(void *)(a1 + 48)];
}

void sub_100057A64(uint64_t a1)
{
  dispatch_queue_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPostRestoreBUILogger sharedInstance](&OBJC_CLASS____DASPostRestoreBUILogger, "sharedInstance"));
  [v2 reportState:*(void *)(a1 + 48) forActivity:*(void *)(a1 + 32)];

  id v4 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
  [v4 sendTaskCheckpoint:v3 forTask:v5 error:*(void *)(a1 + 56)];
}

void sub_100057B90(void *a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a1[7]));
  [*(id *)(a1[4] + 64) setObject:v2 forKeyedSubscript:a1[5]];
}

void sub_100057D3C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 56) allKeys]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v2));

  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 64) allKeys]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v4));
  [v3 unionSet:v5];

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v24;
    while (2)
    {
      double v10 = 0LL;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)v10);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary", (void)v23));
        [v12 setObject:v11 forKeyedSubscript:@"TaskName"];
        id v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 56) objectForKeyedSubscript:v11]);
        [v12 setObject:v13 forKeyedSubscript:@"FeatureCodes"];

        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 64) objectForKeyedSubscript:v11]);
        [v12 setObject:v14 forKeyedSubscript:@"Version"];

        if (([*(id *)(a1 + 32) sendDataToPPS:v12 subsystem:@"BackgroundProcessing" category:@"TaskFeatureCodes"] & 1) == 0)
        {
          unsigned int v15 = *(os_log_s **)(*(void *)(a1 + 32) + 40LL);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            sub_1000B4E50(v15, v16, v17, v18, v19, v20, v21, v22);
          }

          goto LABEL_13;
        }

        double v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  [*(id *)(*(void *)(a1 + 32) + 56) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 64) removeAllObjects];
LABEL_13:
}

void sub_100058428(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 48) objectForKey:@"availableStatus"]);
  id v3 = [v2 mutableCopy];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 72);
  *(void *)(v4 + 72) = v3;

  uint64_t v6 = *(void *)(a1 + 32);
  if (!*(void *)(v6 + 72))
  {
    [(id)v6 populateFeatureStatusFromPast];
    uint64_t v6 = *(void *)(a1 + 32);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v6 + 48) objectForKey:@"availableStatus"]);
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allKeys]);
  id v9 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v28;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v13]);
        objc_msgSend( *(id *)(a1 + 32),  "reportFeatureStatus:forFeature:statusChangedDate:error:",  50,  objc_msgSend(v13, "integerValue"),  v14,  0);
      }

      id v10 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }

    while (v10);
  }

  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 48) objectForKey:@"previewAvailableStatus"]);
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "allKeys", 0));
  id v17 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      for (j = 0LL; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)j);
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v21]);
        objc_msgSend( *(id *)(a1 + 32),  "reportFeatureStatus:forFeature:statusChangedDate:error:",  30,  objc_msgSend(v21, "integerValue"),  v22,  0);
      }

      id v18 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }

    while (v18);
  }
}

void sub_100058778(void *a1)
{
  id v2 = (void *)a1[4];
  if (v2) {
    id v3 = v2;
  }
  else {
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  }
  uint64_t v4 = v3;
  id v5 = (void *)a1[5];
  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  }
  id v7 = v6;
  v9[0] = v4;
  v9[1] = v6;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 2LL));
  [*(id *)(a1[6] + 88) setObject:v8 forKeyedSubscript:a1[7]];
}

void sub_1000588CC(id a1, BGRepeatingSystemTask *a2)
{
}

void sub_100058954(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 reportFeatureCodesForTasks];
  [*(id *)(a1 + 32) reportDependencyInfoForTasks];
  [v4 setTaskCompleted];
}

void sub_1000589F8(uint64_t a1)
{
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id obj = *(id *)(*(void *)(a1 + 32) + 88LL);
  id v2 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v24;
    while (2)
    {
      id v5 = 0LL;
      do
      {
        if (*(void *)v24 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)v5);
        id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        [v7 setObject:v6 forKeyedSubscript:@"TaskName"];
        id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 88) objectForKeyedSubscript:v6]);
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:0]);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 allObjects]);
        [v7 setObject:v10 forKeyedSubscript:@"ProducedResultIdentifiers"];

        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 88) objectForKeyedSubscript:v6]);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:1]);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 allObjects]);
        [v7 setObject:v13 forKeyedSubscript:@"DependencyIdentifiers"];

        if (([*(id *)(a1 + 32) sendDataToPPS:v7 subsystem:@"BackgroundProcessing" category:@"TaskDependencies"] & 1) == 0)
        {
          uint64_t v14 = *(os_log_s **)(*(void *)(a1 + 32) + 40LL);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            sub_1000B4FA4(v14, v15, v16, v17, v18, v19, v20, v21);
          }

          return;
        }

        id v5 = (char *)v5 + 1;
      }

      while (v3 != v5);
      id v3 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

  [*(id *)(*(void *)(a1 + 32) + 88) removeAllObjects];
}

void sub_100058F24(uint64_t a1)
{
  uint64_t v1 = objc_opt_class(*(void *)(a1 + 32));
  uint64_t v2 = objc_opt_new(v1);
  id v3 = (void *)qword_100157B18;
  qword_100157B18 = v2;
}

void sub_100059720(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessPredicate predicateMatchingProcessTypeApplication]( &OBJC_CLASS___RBSProcessPredicate,  "predicateMatchingProcessTypeApplication"));
  id v8 = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
  [v3 setPredicates:v5];

  [v3 setStateDescriptor:*(void *)(a1 + 32)];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100059828;
  v6[3] = &unk_100115FA8;
  id v7 = *(id *)(a1 + 40);
  [v3 setUpdateHandler:v6];
}

id sub_100059828(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleStateTransitionForProcess:withUpdate:");
}

void sub_10005989C(_Unwind_Exception *a1)
{
}

void sub_10005991C(_Unwind_Exception *a1)
{
}

void sub_100059B50(_Unwind_Exception *a1)
{
}

void sub_100059BAC(id a1)
{
  uint64_t v1 = objc_opt_new(&OBJC_CLASS____APRSRecommendationEngine);
  uint64_t v2 = (void *)qword_100157B28;
  qword_100157B28 = (uint64_t)v1;
}

void sub_10005A024(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = (void *)qword_100157B40;
  qword_100157B40 = (uint64_t)v1;
}

void sub_10005A97C(uint64_t a1, void *a2)
{
  uint64_t v3 = kSymptomDiagnosticReplySuccess;
  id v4 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v3]);
  unsigned int v6 = [v5 BOOLValue];

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kSymptomDiagnosticReplySessionID]);

    id v8 = *(os_log_s **)(a1 + 32);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_1000B50FC((uint64_t)v7, a1, v8);
    }
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kSymptomDiagnosticReplyReason]);

    int v10 = [v9 intValue];
    uint64_t v11 = *(os_log_s **)(a1 + 32);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000B5184(v10, a1, v11);
    }
  }

void sub_10005AE50( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
}

void sub_10005AE90(uint64_t a1)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  id v1 = *(os_log_s **)(a1 + 32);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_INFO,  "Asked to defer significantly overdue check",  v2,  2u);
  }

void sub_10005AFD0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_DEBUG)) {
    sub_1000B52CC();
  }
  [(id)objc_opt_class(*(void *)(a1 + 40)) checkAllTasksForBGSystemTask:v3];
}

void sub_10005B030( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10005B0E8(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v2 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_qos_class(v2, QOS_CLASS_BACKGROUND, 0);
  attr = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);

  dispatch_queue_t v4 = dispatch_queue_create("com.apple.dasscheduler.metricqueue", attr);
  id v5 = (void *)qword_100157B58;
  qword_100157B58 = (uint64_t)v4;
}

void sub_10005B1CC(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) metricQueue]);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10005B280;
  v5[3] = &unk_1001165F0;
  v5[4] = *(void *)(a1 + 32);
  uint64_t v3 = objc_claimAutoreleasedReturnValue( +[_DASBatchingQueue queueWithName:maxBatchingDelay:maxQueueDepth:queue:workItemsHandler:]( &OBJC_CLASS____DASBatchingQueue,  "queueWithName:maxBatchingDelay:maxQueueDepth:queue:workItemsHandler:",  @"metrics_recorder",  50LL,  v2,  v5,  1800.0));
  dispatch_queue_t v4 = (void *)qword_100157B68;
  qword_100157B68 = v3;
}

id sub_10005B280(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) aggregateAndPostCAEvents:a2];
}

id sub_10005B82C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v5[1] = @"value";
  v6[0] = v1;
  v5[0] = @"key";
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40)));
  v6[1] = v2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v6,  v5,  2LL));

  return v3;
}

void sub_10005BC90(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16LL);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) taskIdentifier]);
  dispatch_queue_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:v3]);

  if (!v4)
  {
    id v5 = *(void **)(a1 + 40);
    unsigned int v6 = *(void **)(*(void *)(a1 + 32) + 16LL);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 taskIdentifier]);
    [v6 setObject:v5 forKeyedSubscript:v7];

    id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    [*(id *)(*(void *)(a1 + 32) + 8) setObject:v8 forKeyedSubscript:*(void *)(a1 + 40)];
  }

void sub_10005BE10(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16LL);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) taskIdentifier]);
  dispatch_queue_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:v3]);

  if (!v4)
  {
    id v5 = *(void **)(a1 + 40);
    unsigned int v6 = *(void **)(*(void *)(a1 + 32) + 16LL);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 taskIdentifier]);
    [v6 setObject:v5 forKeyedSubscript:v7];

    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    [*(id *)(*(void *)(a1 + 32) + 8) setObject:v8 forKeyedSubscript:*(void *)(a1 + 40)];
  }

  id v9 = *(void **)(*(void *)(a1 + 32) + 16LL);
  int v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) taskIdentifier]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v10]);

  if (!v11)
  {
    id v12 = *(void **)(a1 + 48);
    id v13 = *(void **)(*(void *)(a1 + 32) + 16LL);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 taskIdentifier]);
    [v13 setObject:v12 forKeyedSubscript:v14];
  }

  id v15 = (id)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:*(void *)(a1 + 40)]);
  [v15 addObject:*(void *)(a1 + 48)];
}

uint64_t sub_10005C020(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10005C030(uint64_t a1)
{
}

void sub_10005C038(void *a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]]);
  uint64_t v3 = *(void *)(a1[6] + 8LL);
  dispatch_queue_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10005C74C(id a1)
{
  uint64_t v1 = objc_opt_new(&OBJC_CLASS____DASBatteryTemperatureRecorder);
  uint64_t v2 = (void *)qword_100157B78;
  qword_100157B78 = (uint64_t)v1;

  [(id)qword_100157B78 startRecording];
}

void sub_10005C87C(void *a1, uint64_t a2, int a3)
{
  id v5 = objc_autoreleasePoolPush();
  unsigned int v6 = (void *)os_transaction_create("com.apple.dasd.batterytemperature.datacollection");
  if (a3 == -536723200) {
    [a1 handleBatteryNotification];
  }

  objc_autoreleasePoolPop(v5);
}

LABEL_23:
      objc_autoreleasePoolPop(v6);
      uint64_t v22 = objc_claimAutoreleasedReturnValue([v3 nextObject]);

      id v5 = (void *)v22;
      if (!v22) {
        goto LABEL_24;
      }
    }

    __int128 v26 = v6;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 UIBackgroundModes]);
    __int128 v30 = 0u;
    id v31 = 0u;
    uint64_t v32 = 0u;
    id v33 = 0u;
    int v10 = [v9 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (!v10) {
      goto LABEL_22;
    }
    uint64_t v11 = v10;
    id v12 = *(void *)v31;
LABEL_7:
    id v13 = 0LL;
    while (1)
    {
      if (*(void *)v31 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = *(void **)(*((void *)&v30 + 1) + 8 * v13);
      if ([v14 isEqualToString:@"fetch"]
        && !-[_DASBARScheduler appUsesBackgroundTaskScheduler:](self, "appUsesBackgroundTaskScheduler:", v5))
      {
        uint64_t v19 = self->_log;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          log = v19;
          __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedName]);
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
          *(_DWORD *)buf = 138412546;
          uint64_t v35 = v27;
          __int16 v36 = 2112;
          uint64_t v37 = v21;
          _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "%@ (%@) eligible for BAR",  buf,  0x16u);
        }

        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "dk_dedup"));

        [v29 addObject:v16];
        p_fetchEnabledApps = &self->_fetchEnabledApps;
        goto LABEL_19;
      }

      if ([v14 isEqualToString:@"newsstand"])
      {
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "dk_dedup"));

        p_fetchEnabledApps = &self->_newsstandApps;
        goto LABEL_19;
      }

  __int128 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"limitations"));
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    sub_1000B7BBC(v3, v28);
  }

  [v2 setObject:&off_100122038 forKeyedSubscript:@"runtimeDuration"];
LABEL_26:
  __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"limitations"));
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([*v3 identifier]);
    uint64_t v32 = 138412546;
    id v33 = v2;
    __int16 v34 = 2112;
    uint64_t v35 = v30;
    _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Logging runtime durations to CA %@ for activity %@",  (uint8_t *)&v32,  0x16u);
  }

  return v2;
}

id sub_10005E014(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v6]);

  id v9 = [v7 compare:v8];
  return v9;
}

void sub_10005E6C0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "dk_dedup"));
  id v6 = [v5 integerValue];

  uint64_t v7 = 32LL;
  if (!v6) {
    uint64_t v7 = 40LL;
  }
  [*(id *)(a1 + v7) addObject:v8];
}

void sub_10005E830(uint64_t a1)
{
  uint64_t v2 = a1 + 40;
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(a1 + 32);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10005E8BC;
  void v11[3] = &unk_100115070;
  v11[4] = v1;
  [v3 enumerateKeysAndObjectsUsingBlock:v11];
  dispatch_queue_t v4 = *(os_log_s **)(*(void *)v2 + 184LL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000B565C(v2, v4, v5, v6, v7, v8, v9, v10);
  }
}

void sub_10005E8BC(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  if (![a3 integerValue])
  {
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 128LL);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dk_dedup"));
    [v5 addObject:v6];
  }
}

void sub_10005E924(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  objc_msgSend(v1, "queueHandleBARSettingsChangedNotification:", objc_msgSend(v2, "isAutomaticAppUpdatesAllowed"));
}

void sub_10005E9F0(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 96) arrayForKey:@"killed"]);
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*(void *)(a1 + 32) + 136LL);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v6), "dk_dedup"));
        [v7 addObject:v8];

        uint64_t v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v4);
  }

  if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 184LL), OS_LOG_TYPE_DEBUG)) {
    sub_1000B56C8();
  }
}

id sub_10005EC78(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) cancelAppRefreshTasksForApps:*(void *)(a1 + 40)];
}

id sub_10005F1F8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) cancelContactTracingTasksForApps:*(void *)(a1 + 40)];
}

void sub_10005F2A0(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v3 = *(id *)(a1 + 32);
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v7), "bundleIdentifier", (void)v9));
        [v2 addObject:v8];

        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v5);
  }

  [*(id *)(a1 + 40) queueHandleAppsUninstalled:v2];
}

void sub_10005F480(uint64_t a1)
{
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id obj = *(id *)(a1 + 40);
  id v2 = [obj countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v27;
    uint64_t v18 = *(void *)v27;
    do
    {
      id v5 = 0LL;
      id v19 = v3;
      do
      {
        if (*(void *)v27 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)v5);
        if ((objc_msgSend(v6, "isLaunchProhibited", v18) & 1) == 0)
        {
          uint64_t v21 = v5;
          id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UIBackgroundModes]);
          __int128 v22 = 0u;
          __int128 v23 = 0u;
          __int128 v24 = 0u;
          __int128 v25 = 0u;
          id v8 = [v7 countByEnumeratingWithState:&v22 objects:v34 count:16];
          if (!v8) {
            goto LABEL_23;
          }
          id v9 = v8;
          uint64_t v10 = *(void *)v23;
          while (1)
          {
            for (i = 0LL; i != v9; i = (char *)i + 1)
            {
              if (*(void *)v23 != v10) {
                objc_enumerationMutation(v7);
              }
              __int128 v12 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
              if ([v12 isEqualToString:@"fetch"]
                && ([*(id *)(a1 + 48) appUsesBackgroundTaskScheduler:v6] & 1) == 0)
              {
                id v13 = *(void **)(*(void *)(a1 + 48) + 104LL);
              }

              else if ([v12 isEqualToString:@"remote-notification"])
              {
                id v13 = *(void **)(*(void *)(a1 + 48) + 112LL);
              }

              else
              {
                id v13 = *(void **)(*(void *)(a1 + 48) + 120LL);
              }

              uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
              [v13 addObject:v14];

              id v15 = *(void **)(*(void *)(a1 + 48) + 184LL);
              if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v16 = v15;
                uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
                *(_DWORD *)buf = 138412546;
                id v31 = v17;
                __int16 v32 = 2112;
                id v33 = v12;
                _os_log_debug_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "App %@ with mode %@ installed",  buf,  0x16u);
              }
            }

            id v9 = [v7 countByEnumeratingWithState:&v22 objects:v34 count:16];
            if (!v9)
            {
LABEL_23:

              uint64_t v4 = v18;
              id v3 = v19;
              id v5 = v21;
              break;
            }
          }
        }

        id v5 = (char *)v5 + 1;
      }

      while (v5 != v3);
      id v3 = [obj countByEnumeratingWithState:&v26 objects:v35 count:16];
    }

    while (v3);
  }
}

BOOL sub_10005F8D4(id a1, BMStoreEvent *a2)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[BMStoreEvent eventBody](a2, "eventBody"));
  unsigned __int8 v3 = [v2 isStarting];

  return v3;
}

void sub_10005F90C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 error]);

  if (v4)
  {
    id v5 = *(void **)(*(void *)(a1 + 32) + 184LL);
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
      sub_1000B5788(v5, v3);
    }
  }
}

void sub_10005F978(uint64_t a1, void *a2)
{
  id v13 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v13 eventBody]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 parentBundleID]);
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v13 eventBody]);
    id v6 = (id)objc_claimAutoreleasedReturnValue([v7 bundleID]);
  }

  double v8 = *(double *)(a1 + 40);
  [v13 timestamp];
  LODWORD(v5) = vcvtpd_s64_f64((v8 - v9) / 86400.0);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v6]);
  __int128 v11 = v10;
  if (!v10 || (int)[v10 intValue] > (int)v5)
  {
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v5));
    [*(id *)(a1 + 32) setObject:v12 forKeyedSubscript:v6];
  }
}

void sub_10005FB60(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  [*(id *)(*(void *)(a1 + 32) + 144) addObject:v5];
}

void sub_10005FBC4(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 56) allPendingBackgroundTasks]);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  void v5[2] = sub_10005FC90;
  v5[3] = &unk_1001166F8;
  id v6 = *(id *)(a1 + 40);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v5));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 filteredSetUsingPredicate:v3]);

  [*(id *)(*(void *)(a1 + 32) + 56) cancelActivities:v4];
}

BOOL sub_10005FC90(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 relatedApplications]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([(id)v4 firstObject]);

  LOBYTE(v4) = [v3 allowsUnrestrictedBackgroundLaunches];
  BOOL v6 = 0LL;
  if ((v4 & 1) == 0 && v5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v5]);
    BOOL v6 = v7 == 0LL;
  }

  return v6;
}

void sub_10005FE04(uint64_t a1)
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      BOOL v6 = 0LL;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend( *(id *)(*(void *)(a1 + 40) + 56),  "activityCanceled:",  *(void *)(*((void *)&v7 + 1) + 8 * (void)v6),  (void)v7);
        BOOL v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }

    while (v4);
  }

  NSLog(@"Done canceling activities!");
}

id sub_10005FF5C(uint64_t a1)
{
  return [*(id *)(a1 + 32) queueCancelActivitiesForAllApps];
}

void sub_100060100(uint64_t a1)
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      BOOL v6 = 0LL;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend( *(id *)(*(void *)(a1 + 40) + 56),  "activityCanceled:",  *(void *)(*((void *)&v7 + 1) + 8 * (void)v6),  (void)v7);
        BOOL v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }

    while (v4);
  }
}

void sub_100060644(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v6 = *(void *)(a1 + 32);
  __int128 v7 = *(void **)(a1 + 40);
  __int128 v8 = *(dispatch_queue_s **)(v6 + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006070C;
  block[3] = &unk_100116408;
  void block[4] = v6;
  id v11 = v5;
  id v12 = v7;
  uint64_t v13 = v4;
  id v9 = v5;
  dispatch_sync(v8, block);
}

void sub_10006070C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", *(void *)(a1 + 48)));
  [v2 queueUpdateLastLaunchTimesToDate:v3 forApps:v4];

  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeInterval:sinceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeInterval:sinceDate:",  *(void *)(a1 + 40),  *(double *)(a1 + 56)));
  [v6 queueScheduleActivityForApp:v5 startingAfter:v7];
}

id sub_10006079C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) submitActivity:*(void *)(a1 + 40) inGroup:*(void *)(*(void *)(a1 + 32) + 64)];
}

id sub_100060830(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) createActivityGroup:*(void *)(*(void *)(a1 + 32) + 64)];
}

void sub_1000609E8(uint64_t a1)
{
  id v2 = (void *)os_transaction_create("com.apple.dasd.appLaunchTimer");
  if (byte_100157B80 == 1)
  {
    [*(id *)(a1 + 32) queueCancelActivitiesForAllApps];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) queueObtainAppsEligibleForBackgroundFetch]);
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v12;
      do
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8LL * (void)i);
          id v9 = *(void **)(a1 + 32);
          __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
          [v9 queueScheduleActivityForApp:v8 startingAfter:v10];
        }

        id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }

      while (v5);
    }
  }

  objc_msgSend(*(id *)(a1 + 32), "queue_cancelBackgroundTasksForUnusedApps");
  byte_100157B80 = 1;
}

id sub_100060BA8(uint64_t a1)
{
  return [*(id *)(a1 + 32) queueStartIfBAREnabled];
}

void sub_10006101C(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 40) + 160) mutableCopy];
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id v3 = *(id *)(a1 + 48);
  id v4 = [v3 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v37;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v37 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
        if (([*(id *)(*(void *)(a1 + 40) + 160) containsObject:v8] & 1) == 0)
        {
          if ([v8 length])
          {
            [v2 removeObject:v8];
            if (([*(id *)(*(void *)(a1 + 40) + 112) containsObject:v8] & 1) != 0
              || ([*(id *)(*(void *)(a1 + 40) + 120) containsObject:v8] & 1) != 0
              || [*(id *)(*(void *)(a1 + 40) + 104) containsObject:v8]
              && (id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 168) objectForKeyedSubscript:v8]),
                  v9,
                  v9))
            {
              __int128 v10 = *(void **)(a1 + 56);
              __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dk_dedup"));
              [v10 addObject:v11];
            }
          }
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v36 objects:v42 count:16];
    }

    while (v5);
  }

  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v13 = *(id *)(a1 + 48);
  id v14 = [v13 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v33;
    do
    {
      for (j = 0LL; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * (void)j), "dk_dedup"));
        [v12 addObject:v18];
      }

      id v15 = [v13 countByEnumeratingWithState:&v32 objects:v41 count:16];
    }

    while (v15);
  }

  [*(id *)(a1 + 40) queueHandleAppsRevived:v12];
  [*(id *)(a1 + 40) queueCancelActivitiesForApps:v12];
  id v19 = [v12 copy];
  uint64_t v20 = *(void *)(a1 + 40);
  uint64_t v21 = *(void **)(v20 + 160);
  *(void *)(v20 + 160) = v19;

  [*(id *)(a1 + 40) queueUpdateLastLaunchTimesToDate:*(void *)(a1 + 64) forApps:*(void *)(a1 + 56)];
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v22 = *(id *)(*(void *)(a1 + 40) + 176LL);
  id v23 = [v22 countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v29;
    do
    {
      for (k = 0LL; k != v24; k = (char *)k + 1)
      {
        if (*(void *)v29 != v25) {
          objc_enumerationMutation(v22);
        }
        objc_msgSend(v2, "removeObject:", *(void *)(*((void *)&v28 + 1) + 8 * (void)k), (void)v28);
      }

      id v24 = [v22 countByEnumeratingWithState:&v28 objects:v40 count:16];
    }

    while (v24);
  }

  uint64_t v27 = *(void *)(a1 + 40);
  if (*(_BYTE *)(v27 + 8))
  {
    if (os_log_type_enabled(*(os_log_t *)(v27 + 184), OS_LOG_TYPE_DEBUG)) {
      sub_1000B5890();
    }
    objc_msgSend(*(id *)(a1 + 40), "queueScheduleActivitiesForEligibleApps:withDelay:", v2, 1, (void)v28);
  }
}

uint64_t sub_100061468(void *a1)
{
  uint64_t v2 = a1[4];
  if (*(_BYTE *)(v2 + 8) && ([*(id *)(v2 + 128) containsObject:a1[5]] & 1) == 0)
  {
    else {
      uint64_t result = 1LL;
    }
  }

  else
  {
    uint64_t result = 0LL;
  }

  *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = result;
  return result;
}

void sub_100061898( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_1000618B8(void *a1)
{
  else {
    unsigned __int8 v2 = [*(id *)(a1[4] + 120) containsObject:a1[5]];
  }
  *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = v2;
  uint64_t v3 = a1[4];
  if (*(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL))
  {
    if ([*(id *)(v3 + 160) containsObject:a1[5]])
    {
      id v4 = (_BYTE *)a1[7];
      if (v4) {
        *id v4 = 1;
      }
      *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
      id v5 = *(os_log_s **)(a1[4] + 184LL);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        uint64_t v6 = a1[5];
        int v14 = 138412290;
        uint64_t v15 = v6;
        id v7 = "Remote Notification: %@ - Foreground";
LABEL_16:
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v14, 0xCu);
      }
    }

    else
    {
      unsigned __int8 v9 = [*(id *)(a1[4] + 144) containsObject:a1[5]];
      uint64_t v10 = a1[4];
      if ((v9 & 1) != 0)
      {
        if (([*(id *)(v10 + 128) containsObject:a1[5]] & 1) != 0
          || [*(id *)(a1[4] + 136) containsObject:a1[5]]
          && ([*(id *)(a1[4] + 152) containsObject:a1[5]] & 1) == 0)
        {
          *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 0;
          id v5 = *(os_log_s **)(a1[4] + 184LL);
          if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
          {
            uint64_t v11 = a1[5];
            int v14 = 138412290;
            uint64_t v15 = v11;
            id v7 = "Remote Notification: %@ - Disallowed/Killed";
            goto LABEL_16;
          }
        }
      }

      else
      {
        __int128 v12 = *(os_log_s **)(v10 + 184);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          uint64_t v13 = a1[5];
          int v14 = 138412290;
          uint64_t v15 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Remote Notification: %@ - Not launched",  (uint8_t *)&v14,  0xCu);
        }

        *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 0;
      }
    }
  }

  else
  {
    id v5 = *(os_log_s **)(v3 + 184);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = a1[5];
      int v14 = 138412290;
      uint64_t v15 = v8;
      id v7 = "Remote Notification: %@ - Not eligible";
      goto LABEL_16;
    }
  }

id sub_100061BC8(void *a1)
{
  id result = [*(id *)(a1[4] + 120) containsObject:a1[5]];
  *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = (_BYTE)result;
  return result;
}

id sub_100061C88(uint64_t a1)
{
  return [*(id *)(a1 + 32) queueHandleAppKilled:*(void *)(a1 + 40)];
}

id sub_100061CEC(uint64_t a1)
{
  return [*(id *)(a1 + 32) queueReloadRequestedDelays];
}

void sub_100061DEC(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "dk_dedup"));
  [v4 setObject:v5 forKeyedSubscript:v6];
}

void sub_100061F08(void *a1)
{
  unsigned __int8 v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 168) objectForKeyedSubscript:a1[5]]);
  if (v2)
  {
    id v4 = v2;
    [v2 doubleValue];
    unsigned __int8 v2 = v4;
    *(void *)(*(void *)(a1[6] + 8LL) + 24LL) = v3;
  }
}

void sub_100061FE4(uint64_t a1)
{
  unsigned __int8 v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "dk_dedup"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 168) objectForKeyedSubscript:*(void *)(a1 + 32)]);
  id v4 = *(void **)(*(void *)(a1 + 40) + 184LL);
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    double v6 = *(double *)(a1 + 48);
    id v7 = v4;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v6));
    int v23 = 138412546;
    uint64_t v24 = v5;
    __int16 v25 = 2112;
    __int128 v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ => %@", (uint8_t *)&v23, 0x16u);
  }

  double v9 = *(double *)(a1 + 48);
  if (v9 == 1.79769313e308)
  {
    if (!v3) {
      goto LABEL_18;
    }
    [*(id *)(*(void *)(a1 + 40) + 168) removeObjectForKey:*(void *)(a1 + 32)];
    uint64_t v10 = *(void **)(a1 + 40);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v2));
    [v10 queueCancelActivitiesForApps:v11];
    BOOL v12 = 0;
  }

  else
  {
    double v13 = fmax(v9, 450.0);
    BOOL v12 = v3 == 0LL;
    [v3 doubleValue];
    double v15 = v13 - v14;
    if (v15 < 0.0) {
      double v15 = -v15;
    }
    if (v15 <= 2.22044605e-16) {
      goto LABEL_13;
    }
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v13));
    [*(id *)(*(void *)(a1 + 40) + 168) setObject:v11 forKeyedSubscript:v2];
  }

  [*(id *)(*(void *)(a1 + 40) + 80) setObject:*(void *)(*(void *)(a1 + 40) + 168) forKey:@"delays"];
  uint64_t v16 = *(os_log_s **)(*(void *)(a1 + 40) + 184LL);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = *(void *)(a1 + 32);
    int v23 = 138412290;
    uint64_t v24 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Saved new value for %@", (uint8_t *)&v23, 0xCu);
  }

LABEL_13:
  uint64_t v18 = *(void *)(a1 + 40);
  if (*(_BYTE *)(v18 + 8) && v12)
  {
    id v19 = *(os_log_s **)(v18 + 184);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      int v23 = 138412290;
      uint64_t v24 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Scheduling update for %@",  (uint8_t *)&v23,  0xCu);
    }

    uint64_t v21 = *(void **)(a1 + 40);
    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v2));
    [v21 queueScheduleActivitiesForEligibleApps:v22 withDelay:1];
  }
            }
          }
        }
      }

      BOOL v12 = (char *)v12 + 1;
    }

    while (v10 != v12);
    __int128 v30 = [obj countByEnumeratingWithState:&v98 objects:v109 count:16];
    uint64_t v10 = v30;
  }

  while (v30);
LABEL_24:
  log = v76->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v108 = v81;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "MAD Progress Count: %@", buf, 0xCu);
  }

  __int128 v32 = v76->_log;
  __int128 v33 = v80;
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v108 = v80;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Past MAD Progress: %@", buf, 0xCu);
  }

  __int128 v34 = v76->_log;
  __int128 v35 = v77;
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v108 = v77;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Current MAD Progress: %@", buf, 0xCu);
  }

  __int128 v36 = v76->_log;
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v108 = v84;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Current MAD Failed: %@", buf, 0xCu);
  }

  if (![v80 count] || !objc_msgSend(v81, "count"))
  {
    if (os_log_type_enabled(v76->_log, OS_LOG_TYPE_DEBUG)) {
      sub_1000B5D1C();
    }
    goto LABEL_78;
  }

  if (![v81 count])
  {
    uint64_t v41 = &stru_100118C98;
    goto LABEL_69;
  }

  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([v77 allKeys]);
  __int128 v38 = [v37 countByEnumeratingWithState:&v94 objects:v106 count:16];
  if (!v38)
  {
LABEL_43:

    v92 = 0u;
    v93 = 0u;
    v90 = 0u;
    v91 = 0u;
    __int128 v48 = (void *)objc_claimAutoreleasedReturnValue([v80 allKeys]);
    __int128 v49 = [v48 countByEnumeratingWithState:&v90 objects:v105 count:16];
    if (v49)
    {
      __int16 v50 = v49;
      __int128 v51 = *(void *)v91;
      uint64_t v41 = &stru_100118C98;
      while (2)
      {
        for (i = 0LL; i != v50; i = (char *)i + 1)
        {
          if (*(void *)v91 != v51) {
            objc_enumerationMutation(v48);
          }
          __int128 v53 = *(void *)(*((void *)&v90 + 1) + 8LL * (void)i);
          v54 = (void *)objc_claimAutoreleasedReturnValue([v80 objectForKeyedSubscript:v53]);
          uint64_t v55 = (uint64_t)[v54 integerValue];

          if (v55 <= 89)
          {
            uint64_t v41 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No progress for %@",  v53));
            __int16 v56 = 1;
            goto LABEL_59;
          }
        }

        __int16 v50 = [v48 countByEnumeratingWithState:&v90 objects:v105 count:16];
        if (v50) {
          continue;
        }
        break;
      }

      __int16 v56 = 0;
    }

    else
    {
      __int16 v56 = 0;
      uint64_t v41 = &stru_100118C98;
    }

  return v7;
}

    if (v14 == (id)++v18)
    {
      uint64_t v27 = -[os_log_s countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v34,  v42,  16LL);
      double v14 = v27;
      if (!v27)
      {
        uint64_t v10 = 0;
        double v6 = v32;
        goto LABEL_26;
      }

      goto LABEL_7;
    }
  }

  __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
LABEL_23:
    *(_DWORD *)buf = 138412546;
    __int128 v39 = v19;
    uint64_t v40 = 2112;
    uint64_t v41 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Test Mode (%@) Applies To Activity: %@",  buf,  0x16u);
  }

  os_unfair_recursive_lock_unlock(p_activityStateLock);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPLLogger sharedInstance](&OBJC_CLASS____DASPLLogger, "sharedInstance"));
  [v16 recordActivityLifeCycleEnd:v4];

  -[_DASDaemon recordToTaskRegistry:lifeCycleStateName:]( self,  "recordToTaskRegistry:lifeCycleStateName:",  v4,  @"completed");
  -[_DASDaemon cleanupForActivity:wasCompleted:](self, "cleanupForActivity:wasCompleted:", v4, 1LL);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityDurationTracker sharedInstance]( &OBJC_CLASS____DASActivityDurationTracker,  "sharedInstance",  p_activityStateLock));
  [v17 activityCompleted:v4];

  -[_DASActivityDependencyManager reportActivityDidFinishRunning:]( self->_dependencyManager,  "reportActivityDidFinishRunning:",  v4);
  if (-[_DASSleepWakeMonitor inADarkWake](self->_sleepWakeMonitor, "inADarkWake")) {
    -[_DASSleepWakeMonitor recordNoLongerRunningActivity:]( self->_sleepWakeMonitor,  "recordNoLongerRunningActivity:",  v4);
  }
  if ([v4 userRequestedBackupTask]) {
    -[_DASUserRequestedBackupTaskManager reportActivityNoLongerRunning:]( self->_backupTaskManager,  "reportActivityNoLongerRunning:",  v4);
  }
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v4 setEndTime:v18];

  if (+[_DASCheckpointRecorder shouldLogCheckpointForActivity:]( &OBJC_CLASS____DASCheckpointRecorder,  "shouldLogCheckpointForActivity:",  v4))
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[_DASCheckpointRecorder sharedInstance](&OBJC_CLASS____DASCheckpointRecorder, "sharedInstance"));
    [v19 reportTaskCheckpoint:30 forTask:v4 error:0];
  }

  -[_DASFeatureDurationTracker updateFeatureDurationActivityCompleted:]( self->_featureDurationTracker,  "updateFeatureDurationActivityCompleted:",  v4);
  if (arc4random_uniform(0x64u) == 1)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100089154;
    v22[3] = &unk_100116FF0;
    v22[4] = self;
    int v23 = v4;
    AnalyticsSendEventLazy(@"com.apple.dasd.taskmetrics", v22);
  }
}

    [*(id *)(a1 + 40) reevaluateAllActivitiesWithDaemon:*(void *)(a1 + 56)];
    return;
  }

  if (!*(_BYTE *)(a1 + 64)) {
    return;
  }
  [*(id *)(a1 + 40) armResetTimer];
  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [*(id *)(*(void *)(a1 + 40) + 40) setObject:v6 forKeyedSubscript:*(void *)(a1 + 48)];

  id v7 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1 + 40) + 40) objectForKeyedSubscript:kDASSystemContextGPWorkloadRunningState]);
  if (!v7) {
    goto LABEL_13;
  }
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"customsysconstraints"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    id v4 = "Not evaluating because GP is already blocking!";
    uint64_t v5 = buf;
    goto LABEL_10;
  }

void sub_100062BA8( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t sub_100062BD4()
{
  return v0;
}

  ;
}

void sub_100062C60(uint64_t a1)
{
  uint64_t v1 = objc_opt_new(*(void *)(a1 + 32));
  unsigned __int8 v2 = (void *)qword_100157B88;
  qword_100157B88 = v1;
}

void sub_100062DB0(id a1, BGRepeatingSystemTask *a2)
{
  unsigned __int8 v2 = a2;
  +[_DASConfig isInternalBuild](&OBJC_CLASS____DASConfig, "isInternalBuild");
  -[BGRepeatingSystemTask setTaskCompleted](v2, "setTaskCompleted");
}

LABEL_76:
LABEL_77:
LABEL_78:
}

void sub_1000649BC(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  unsigned __int8 v2 = (void *)qword_100157BA0;
  qword_100157BA0 = (uint64_t)v1;
}

void sub_100064EB8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100064F44( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100065038(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  [*(id *)(a1 + 32) updateBudgetsForNextSlot];
  objc_sync_exit(obj);
}

void sub_100065080( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100065110( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

uint64_t sub_100065650(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Blue List notification called (%@)",  (uint8_t *)&v7,  0xCu);
  }

  id v5 = *(id *)(a1 + 32);
  objc_sync_enter(v5);
  objc_msgSend(*(id *)(a1 + 32), "updateBlueListStatus:", objc_msgSend(*(id *)(a1 + 32), "shouldBlueListPushes"));
  objc_sync_exit(v5);

  return 1LL;
}

void sub_10006574C(_Unwind_Exception *a1)
{
}

void sub_100065768(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  objc_msgSend(*(id *)(a1 + 32), "updateBlueListStatus:", objc_msgSend(*(id *)(a1 + 32), "shouldBlueListPushes"));
  objc_sync_exit(obj);
}

void sub_1000657C0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100065AA8(uint64_t a1)
{
  uint64_t v1 = objc_opt_new(*(void *)(a1 + 32));
  unsigned __int8 v2 = (void *)qword_100157BA8;
  qword_100157BA8 = v1;
}

void sub_100065FA4(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS____DASBGSystemTaskHelper);
  unsigned __int8 v2 = (void *)qword_100157BB8;
  qword_100157BB8 = (uint64_t)v1;
}

void sub_100066214(uint64_t a1, int a2, id a3, void *a4)
{
  id v7 = a4;
  if (a2)
  {
    if (a2 != 1)
    {
      if (a2 == 2)
      {
        id v8 = (os_log_s *)qword_100157BD0;
        if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "BGST Received XPC BARRIER", buf, 2u);
        }
      }

      goto LABEL_45;
    }

    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100157BD8, "allKeys", 0));
    id v15 = [v9 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v33;
      while (2)
      {
        for (i = 0LL; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(v9);
          }
          uint64_t v19 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)i);
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100157BD8 objectForKeyedSubscript:v19]);
          uint64_t v21 = v20;
          if (v20 && [v20 token] == a3)
          {
            id v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) serviceNameFromToken:a3]);
            int v23 = (os_log_s *)qword_100157BD0;
            if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              int v46 = v22;
              __int16 v47 = 2114;
              __int128 v48 = v21;
              _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Unregistered BGSystemTask on XPC remove event from service %{public}@: %{public}@",  buf,  0x16u);
            }

            [*(id *)(a1 + 32) dasCancelActivity:v21];
            [(id)qword_100157BD8 removeObjectForKey:v19];

            goto LABEL_44;
          }
        }

        id v16 = [v9 countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }

void sub_100066724(uint64_t a1)
{
  int v2 = xpc_event_publisher_set_event(qword_100157BE0, *(void *)(a1 + 40), 0LL, 0LL, v11);
  id v3 = (os_log_s *)qword_100157BD0;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_ERROR)) {
      sub_1000B6074(a1, v3, v4, v5, v6, v7, v8, v9);
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v13 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "XPC_EVENT_PUBLISHER_ACTION_ADD: Cleared subscription for %{public}@ due to error",  buf,  0xCu);
  }

void sub_100066974(id a1)
{
  uint64_t v1 = (os_log_s *)qword_100157BD0;
  if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Soliciting running BGSTs", v2, 2u);
  }

  notify_post((const char *)[@"com.apple.bg.system.task.resubmission" UTF8String]);
}

void sub_100067710( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t sub_100067734(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100067744(uint64_t a1)
{
}

void sub_10006774C(uint64_t a1)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue( +[_DASBGSystemTask taskNameWithIdentifier:UID:]( &OBJC_CLASS____DASBGSystemTask,  "taskNameWithIdentifier:UID:",  *(void *)(a1 + 32),  *(unsigned int *)(a1 + 64)));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100157BD8 objectForKeyedSubscript:v2]);
  uint64_t v4 = v3;
  if (v3)
  {
    if ([v3 state] == (id)2)
    {
      uint64_t v5 = qword_100157BE8;
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scheduler_activity"));
      LOBYTE(v5) = [(id)v5 wasActivityAllowedToRun:v6];

      if ((v5 & 1) != 0)
      {
        *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
        [v4 setState:3];
        [v4 setPid:*(unsigned int *)(a1 + 68)];
        id v7 = [v4 pid];
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scheduler_activity"));
        [v8 setPid:v7];

        uint64_t v9 = (void *)qword_100157BD0;
        if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = v9;
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)__int16 v47 = [v4 pid];
          *(_WORD *)&v47[4] = 2114;
          *(void *)&v47[6] = v4;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Client (PID %d) confirmed run for %{public}@",  buf,  0x12u);
        }

        uint64_t v11 = (void *)qword_100157BE8;
        BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scheduler_activity"));
        [v11 activityStarted:v12];

        uint64_t v13 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_proc,  *(int *)(a1 + 68),  0x80000000uLL,  (dispatch_queue_t)qword_100157BC8);
        if (v13)
        {
          handler[0] = _NSConcreteStackBlock;
          handler[1] = 3221225472LL;
          handler[2] = sub_100067C24;
          handler[3] = &unk_100116828;
          id v14 = *(id *)(a1 + 32);
          int v41 = *(_DWORD *)(a1 + 64);
          uint64_t v15 = *(void *)(a1 + 40);
          id v39 = v14;
          uint64_t v40 = v15;
          dispatch_source_set_event_handler(v13, handler);
          dispatch_resume(v13);
          [v4 setDispatchSourceProcessExit:v13];
        }
      }

      else
      {
        uint64_t v32 = *(void *)(a1 + 32);
        int v42 = @"taskIdentifier";
        uint64_t v43 = v32;
        __int128 v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v43,  &v42,  1LL));
        uint64_t v34 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"_DASBGSystemTaskHelperErrorDomain",  5LL,  v33));
        uint64_t v35 = *(void *)(*(void *)(a1 + 48) + 8LL);
        id v36 = *(void **)(v35 + 40);
        *(void *)(v35 + 40) = v34;

        *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
        __int128 v37 = (void *)qword_100157BD0;
        if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_ERROR)) {
          sub_1000B6294(v37);
        }
      }
    }

    else
    {
      v44[0] = @"currentState";
      __int128 v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v4 state]));
      v44[1] = @"expectedState";
      v45[0] = v26;
      v45[1] = &off_100121F60;
      unsigned __int8 v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v45,  v44,  2LL));
      uint64_t v28 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"_DASBGSystemTaskHelperErrorDomain",  2LL,  v27));
      uint64_t v29 = *(void *)(*(void *)(a1 + 48) + 8LL);
      __int128 v30 = *(void **)(v29 + 40);
      *(void *)(v29 + 40) = v28;

      *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
      __int128 v31 = (void *)qword_100157BD0;
      if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_ERROR)) {
        sub_1000B633C(v31, v4);
      }
    }
  }

  else
  {
    uint64_t v16 = *(void *)(a1 + 32);
    __int128 v52 = @"taskIdentifier";
    uint64_t v53 = v16;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v53,  &v52,  1LL));
    uint64_t v18 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"_DASBGSystemTaskHelperErrorDomain",  1LL,  v17));
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8LL);
    uint64_t v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
    uint64_t v21 = (os_log_s *)qword_100157BD0;
    if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = *(void *)(a1 + 32);
      int v23 = *(_DWORD *)(a1 + 64);
      int v24 = *(_DWORD *)(a1 + 68);
      uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
      *(_DWORD *)buf = 138544130;
      *(void *)__int16 v47 = v22;
      *(_WORD *)&v47[8] = 1024;
      *(_DWORD *)&v47[10] = v23;
      __int16 v48 = 1024;
      int v49 = v24;
      __int16 v50 = 2112;
      uint64_t v51 = v25;
      _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "acknowledgeSystemTaskLaunchWithIdentifier: Task %{public}@ from UID %d, PID %d not found: %@",  buf,  0x22u);
    }
  }
}

void sub_100067C24(uint64_t a1)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue( +[_DASBGSystemTask taskNameWithIdentifier:UID:]( &OBJC_CLASS____DASBGSystemTask,  "taskNameWithIdentifier:UID:",  *(void *)(a1 + 32),  *(unsigned int *)(a1 + 48)));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100157BD8 objectForKeyedSubscript:v2]);
  uint64_t v4 = v3;
  if (v3 && ([v3 state] == (id)3 || objc_msgSend(v4, "state") == (id)4))
  {
    uint64_t v5 = (void *)qword_100157BD0;
    if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = v5;
      LODWORD(v7) = 67109634;
      HIDWORD(v7) = [v4 pid];
      __int16 v8 = 2114;
      uint64_t v9 = v4;
      __int16 v10 = 1024;
      BOOL v11 = [v4 state] == (id)4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Client (PID %d) died while task %{public}@ was still running. Asked to suspend: %d",  (uint8_t *)&v7,  0x18u);
    }

    objc_msgSend(v4, "setState:", 0, v7);
    [*(id *)(a1 + 40) dasCancelActivity:v4];
    [*(id *)(a1 + 40) dasSubmitActivity:v4 withClientOffset:0 error:300.0];
  }
}

void sub_100067E98( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_100067EB0(uint64_t a1)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue( +[_DASBGSystemTask taskNameWithIdentifier:UID:]( &OBJC_CLASS____DASBGSystemTask,  "taskNameWithIdentifier:UID:",  *(void *)(a1 + 32),  *(unsigned int *)(a1 + 64)));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100157BD8 objectForKeyedSubscript:v2]);
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 state];
    uint64_t v6 = (void *)qword_100157BD0;
    if (v5 == (id)4)
    {
      if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = v6;
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)int v23 = [v4 pid];
        *(_WORD *)&v23[4] = 2114;
        *(void *)&v23[6] = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Client (PID %d) confirmed suspension for %{public}@",  buf,  0x12u);
      }

      if ([v4 suspensionReason] == (id)1
        && *(double *)(a1 + 56) < 300.0
        && (uint64_t)[v4 priority] <= 2
        && [v4 type] != (id)3
        && ([v4 requestsApplicationLaunch] & 1) == 0
        && ([v4 beforeApplicationLaunch] & 1) == 0
        && ([v4 runOnAppForeground] & 1) == 0
        && (uint64_t)objc_msgSend(v4, "requires_protection_class") >= 3)
      {
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0x4072C00000000000LL;
        __int16 v8 = (void *)qword_100157BD0;
        if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = (int)*(double *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
          __int16 v10 = v8;
          BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)int v23 = v9;
          *(_WORD *)&v23[4] = 2114;
          *(void *)&v23[6] = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Imposing a %ds cool-off on %{public}@ upon suspension due to runtime limits",  buf,  0x12u);
        }
      }

      [*(id *)(a1 + 40) dasCancelActivity:v4];
      BOOL v12 = *(void **)(a1 + 40);
      double v13 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
      id v21 = 0LL;
      unsigned int v14 = [v12 dasSubmitActivity:v4 withClientOffset:&v21 error:v13];
      id v15 = v21;
      if (v14) {
        uint64_t v16 = 5LL;
      }
      else {
        uint64_t v16 = 0LL;
      }
      [v4 setState:v16];
    }

    else if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_ERROR))
    {
      sub_1000B6400(v6);
    }
  }

  else
  {
    uint64_t v17 = (os_log_s *)qword_100157BD0;
    if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      int v19 = *(_DWORD *)(a1 + 64);
      int v20 = *(_DWORD *)(a1 + 68);
      *(_DWORD *)buf = 138543874;
      *(void *)int v23 = v18;
      *(_WORD *)&v23[8] = 1024;
      *(_DWORD *)&v23[10] = v19;
      __int16 v24 = 1024;
      int v25 = v20;
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "acknowledgeSystemTaskSuspensionWithIdentifier: Task %{public}@ from UID %d, PID %d not found",  buf,  0x18u);
    }
  }
}

void sub_1000682C4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_1000682DC(uint64_t a1)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue( +[_DASBGSystemTask taskNameWithIdentifier:UID:]( &OBJC_CLASS____DASBGSystemTask,  "taskNameWithIdentifier:UID:",  *(void *)(a1 + 32),  *(unsigned int *)(a1 + 64)));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100157BD8 objectForKeyedSubscript:v2]);
  uint64_t v4 = v3;
  if (!v3)
  {
    double v13 = (os_log_s *)qword_100157BD0;
    if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      int v15 = *(_DWORD *)(a1 + 64);
      int v16 = *(_DWORD *)(a1 + 68);
      *(_DWORD *)buf = 138543874;
      *(void *)int v19 = v14;
      *(_WORD *)&v19[8] = 1024;
      *(_DWORD *)&v19[10] = v15;
      __int16 v20 = 1024;
      int v21 = v16;
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "handleClientLedSystemTaskExpirationWithIdentifier: Task %{public}@ from UID %d, PID %d not found",  buf,  0x18u);
    }

    goto LABEL_13;
  }

  id v5 = [v3 state];
  uint64_t v6 = (void *)qword_100157BD0;
  if (v5 != (id)3)
  {
    if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_ERROR)) {
      sub_1000B6478(v6);
    }
LABEL_13:
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
    goto LABEL_14;
  }

  if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v6;
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)int v19 = [v4 pid];
    *(_WORD *)&v19[4] = 2114;
    *(void *)&v19[6] = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Client (PID %d) requested expiration for %{public}@",  buf,  0x12u);
  }

  [*(id *)(a1 + 40) dasCancelActivity:v4];
  __int16 v8 = *(void **)(a1 + 40);
  double v9 = *(double *)(a1 + 56);
  id v17 = 0LL;
  unsigned __int8 v10 = [v8 dasSubmitActivity:v4 withClientOffset:&v17 error:v9];
  id v11 = v17;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v10;
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL)) {
    uint64_t v12 = 7LL;
  }
  else {
    uint64_t v12 = 0LL;
  }
  [v4 setState:v12];

LABEL_14:
}

void sub_10006861C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_100068634(uint64_t a1)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue( +[_DASBGSystemTask taskNameWithIdentifier:UID:]( &OBJC_CLASS____DASBGSystemTask,  "taskNameWithIdentifier:UID:",  *(void *)(a1 + 32),  *(unsigned int *)(a1 + 64)));
  id v3 = (_DASBGSystemTask *)objc_claimAutoreleasedReturnValue([(id)qword_100157BD8 objectForKeyedSubscript:v2]);
  if (!v3)
  {
    if (xpc_event_publisher_create_subscription( qword_100157BE0, "com.apple.bg.system.task", [*(id *)(a1 + 32) UTF8String], *(void *)(a1 + 40), *(unsigned int *)(a1 + 68), &v27))
    {
      if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_ERROR)) {
        sub_1000B6618();
      }
      uint64_t v4 = 0LL;
      goto LABEL_11;
    }

    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_100068A10;
    v25[3] = &unk_1001168A0;
    v25[4] = *(void *)(a1 + 56);
    v25[5] = v27;
    int v26 = *(_DWORD *)(a1 + 68);
    unsigned __int8 v10 = objc_retainBlock(v25);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) serviceNameFromToken:v27]);
    if ([v11 length])
    {
      uint64_t v12 = objc_alloc(&OBJC_CLASS____DASBGSystemTask);
      double v13 = -[_DASBGSystemTask initWithDescriptor:withToken:withUID:withService:staticSubmission:]( v12,  "initWithDescriptor:withToken:withUID:withService:staticSubmission:",  *(void *)(a1 + 40),  v27,  *(unsigned int *)(a1 + 64),  v11,  0LL);
      if (v13)
      {
        uint64_t v4 = v13;
        uint64_t v14 = *(void **)(a1 + 48);
        id v24 = 0LL;
        unsigned __int8 v15 = [v14 dasSubmitActivity:v4 error:&v24];
        id v16 = v24;
        *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = v15;
        int v17 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
        uint64_t v18 = (os_log_s *)qword_100157BD0;
        if (v17)
        {
          if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v29 = v4;
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "submitTaskRequestWithIdentifier: Submitted BGSystemTask %{public}@",  buf,  0xCu);
          }

          int v19 = (void *)qword_100157BD8;
          __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBGSystemTask name](v4, "name"));
          [v19 setObject:v4 forKeyedSubscript:v20];
        }

        else
        {
          if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_ERROR)) {
            sub_1000B65B0();
          }
          ((void (*)(void *))v10[2])(v10);
        }

        goto LABEL_27;
      }

      if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_ERROR)) {
        sub_1000B6550();
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_ERROR))
    {
      sub_1000B64F0();
    }

    ((void (*)(void *))v10[2])(v10);
    uint64_t v4 = 0LL;
LABEL_27:

    goto LABEL_28;
  }

  uint64_t v4 = v3;
  id v5 = -[_DASBGSystemTask type](v3, "type");
  uint64_t v6 = (os_log_s *)qword_100157BD0;
  if (v5 != (id)3)
  {
    if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_ERROR))
    {
      int v21 = *(_DASBGSystemTask **)(a1 + 32);
      int v22 = *(_DWORD *)(a1 + 64);
      int v23 = *(_DWORD *)(a1 + 68);
      *(_DWORD *)buf = 138543874;
      uint64_t v29 = v21;
      __int16 v30 = 1024;
      int v31 = v22;
      __int16 v32 = 1024;
      int v33 = v23;
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "submitTaskRequestWithIdentifier: Task %{public}@ from UID %d, PID %d already exists",  buf,  0x18u);
    }

void sub_100068A10(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
  if (xpc_event_publisher_set_event(qword_100157BE0, v1, 0LL, *(unsigned int *)(a1 + 48), v2))
  {
    if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_ERROR)) {
      sub_1000B6644();
    }
  }

void sub_100068BA0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_100068BB8(uint64_t a1)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue( +[_DASBGSystemTask taskNameWithIdentifier:UID:]( &OBJC_CLASS____DASBGSystemTask,  "taskNameWithIdentifier:UID:",  *(void *)(a1 + 32),  *(unsigned int *)(a1 + 64)));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100157BD8 objectForKeyedSubscript:v2]);
  uint64_t v4 = v3;
  if (v3)
  {
    if ([v3 state] == (id)1
      || [v4 state] == (id)4
      || [v4 state] == (id)7
      || [v4 state] == (id)5)
    {
      int v5 = xpc_event_publisher_set_event( qword_100157BE0,  [v4 token],  *(void *)(a1 + 40),  *(unsigned int *)(a1 + 68),  &v21);
      uint64_t v6 = (void *)qword_100157BD0;
      if (v5)
      {
        if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_ERROR)) {
          sub_1000B66D8();
        }
      }

      else
      {
        if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_DEFAULT))
        {
          id v11 = v6;
          unsigned int v12 = [v4 pid];
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)int v23 = v12;
          *(_WORD *)&v23[4] = 2114;
          *(void *)&v23[6] = v4;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Client (PID %d) updated task request for %{public}@",  buf,  0x12u);
        }

        double v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) serviceNameFromToken:v21]);
        if ([v13 length])
        {
          uint64_t v14 = objc_alloc(&OBJC_CLASS____DASBGSystemTask);
          unsigned __int8 v15 = -[_DASBGSystemTask initWithDescriptor:withToken:withUID:withService:staticSubmission:task:]( v14,  "initWithDescriptor:withToken:withUID:withService:staticSubmission:task:",  *(void *)(a1 + 40),  v21,  *(unsigned int *)(a1 + 64),  v13,  0LL,  v4);
          if (v15)
          {
            [*(id *)(a1 + 48) dasCancelActivity:v4];
            [(id)qword_100157BD8 setObject:v15 forKeyedSubscript:v2];
            id v16 = *(void **)(a1 + 48);
            id v20 = 0LL;
            unsigned __int8 v17 = [v16 dasSubmitActivity:v15 error:&v20];
            id v18 = v20;
            *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = v17;
            if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL))
            {
              if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_ERROR)) {
                sub_1000B6670();
              }
              [(id)qword_100157BD8 setObject:0 forKeyedSubscript:v2];
            }
          }
        }

        else if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_ERROR))
        {
          sub_1000B5F20();
        }
      }
    }

    else
    {
      int v19 = (void *)qword_100157BD0;
      if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_ERROR)) {
        sub_1000B6704(v19);
      }
    }
  }

  else
  {
    uint64_t v7 = (os_log_s *)qword_100157BD0;
    if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = *(_DWORD *)(a1 + 64);
      int v10 = *(_DWORD *)(a1 + 68);
      *(_DWORD *)buf = 138543874;
      *(void *)int v23 = v8;
      *(_WORD *)&v23[8] = 1024;
      *(_DWORD *)&v23[10] = v9;
      __int16 v24 = 1024;
      int v25 = v10;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "updateTaskRequestWithIdentifier: Task %{public}@ from UID %d, PID %d not found",  buf,  0x18u);
    }
  }
}

void sub_100068FB8(uint64_t a1)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue( +[_DASBGSystemTask taskNameWithIdentifier:UID:]( &OBJC_CLASS____DASBGSystemTask,  "taskNameWithIdentifier:UID:",  *(void *)(a1 + 32),  *(unsigned int *)(a1 + 48)));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100157BD8 objectForKeyedSubscript:v2]);
  uint64_t v4 = v3;
  if (v3)
  {
    if ([v3 state] == (id)3 || objc_msgSend(v4, "state") == (id)2 || objc_msgSend(v4, "state") == (id)4)
    {
      int v5 = (os_log_s *)qword_100157BD0;
      if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138543362;
        uint64_t v14 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Completed %{public}@",  (uint8_t *)&v13,  0xCu);
      }

      [*(id *)(a1 + 40) dasCompleteActivity:v4];
      [v4 advanceBaseTime];
      if ([v4 type] == (id)2)
      {
        uint64_t v6 = (os_log_s *)qword_100157BD0;
        if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 138543362;
          uint64_t v14 = v4;
          _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Rescheduling repeating task %{public}@",  (uint8_t *)&v13,  0xCu);
        }

        [*(id *)(a1 + 40) dasSubmitActivity:v4 error:0];
        goto LABEL_26;
      }

      if ([v4 type] == (id)3)
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
        +[_DASBGSystemTask markFastPassActivityDone:semanticVersion:]( _DASBGSystemTask,  "markFastPassActivityDone:semanticVersion:",  v11,  [v4 semanticVersion]);
      }

      if (!xpc_event_publisher_set_event( qword_100157BE0,  [v4 token],  0,  *(unsigned int *)(a1 + 52),  &v13)
        || !os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_ERROR))
      {
LABEL_25:
        [(id)qword_100157BD8 removeObjectForKey:v2];
        goto LABEL_26;
      }
    }

    else
    {
      unsigned int v12 = (void *)qword_100157BD0;
      if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_ERROR)) {
        sub_1000B67A8(v12);
      }
      [*(id *)(a1 + 40) dasCancelActivity:v4];
      if (!xpc_event_publisher_set_event( qword_100157BE0,  [v4 token],  0,  *(unsigned int *)(a1 + 52),  &v13)
        || !os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_ERROR))
      {
        goto LABEL_25;
      }
    }

    sub_1000B677C();
    goto LABEL_25;
  }

  uint64_t v7 = (os_log_s *)qword_100157BD0;
  if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = *(void **)(a1 + 32);
    int v9 = *(_DWORD *)(a1 + 48);
    int v10 = *(_DWORD *)(a1 + 52);
    int v13 = 138543874;
    uint64_t v14 = v8;
    __int16 v15 = 1024;
    int v16 = v9;
    __int16 v17 = 1024;
    int v18 = v10;
    _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "completeSystemTaskWithIdentifier: Task %{public}@ from UID %d, PID %d not found",  (uint8_t *)&v13,  0x18u);
  }

void sub_1000693E0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_1000693F8(uint64_t a1)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue( +[_DASBGSystemTask taskNameWithIdentifier:UID:]( &OBJC_CLASS____DASBGSystemTask,  "taskNameWithIdentifier:UID:",  *(void *)(a1 + 32),  *(unsigned int *)(a1 + 56)));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100157BD8 objectForKeyedSubscript:v2]);
  id v4 = [v3 state];
  int v5 = (os_log_s *)qword_100157BD0;
  if (v4 == (id)7)
  {
    if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      uint64_t v7 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Resuming scheduling for %{public}@",  (uint8_t *)&v6,  0xCu);
    }

    [*(id *)(a1 + 40) dasCancelActivity:v3];
    [*(id *)(a1 + 40) dasSubmitActivity:v3 error:0];
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_ERROR)) {
      sub_1000B6820(v5);
    }
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
  }
}

void sub_100069628( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100069640(uint64_t a1)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue( +[_DASBGSystemTask taskNameWithIdentifier:UID:]( &OBJC_CLASS____DASBGSystemTask,  "taskNameWithIdentifier:UID:",  *(void *)(a1 + 32),  *(unsigned int *)(a1 + 56)));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100157BD8 objectForKeyedSubscript:v2]);
  if (v3)
  {
    [*(id *)(a1 + 40) dasCancelActivity:v3];
    id v4 = (os_log_s *)qword_100157BD0;
    if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      int v10 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Unregistering %{public}@",  (uint8_t *)&v9,  0xCu);
    }

    if (xpc_event_publisher_set_event( qword_100157BE0,  [v3 token],  0,  *(unsigned int *)(a1 + 60),  &v9))
    {
      if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_ERROR)) {
        sub_1000B6898();
      }
      *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
    }

    [(id)qword_100157BD8 removeObjectForKey:v2];
  }

  else
  {
    int v5 = (os_log_s *)qword_100157BD0;
    if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_ERROR))
    {
      int v6 = *(void **)(a1 + 32);
      int v7 = *(_DWORD *)(a1 + 56);
      int v8 = *(_DWORD *)(a1 + 60);
      int v9 = 138543874;
      int v10 = v6;
      __int16 v11 = 1024;
      int v12 = v7;
      __int16 v13 = 1024;
      int v14 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "unregisterSystemTaskWithIdentifier: Task %{public}@ from UID %d, PID %d not found",  (uint8_t *)&v9,  0x18u);
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
  }
}

void sub_100069924( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10006993C(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    id v2 = *(id *)(a1 + 32);
    id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        int v6 = 0LL;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void *)(*((void *)&v8 + 1) + 8LL * (void)v6);
          if (v7)
          {
            if (!+[_DASBGSystemTask resetFastPass:resetAll:]( &OBJC_CLASS____DASBGSystemTask,  "resetFastPass:resetAll:",  *(void *)(*((void *)&v8 + 1) + 8LL * (void)v6),  0LL,  (void)v8)) {
              [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v7];
            }
          }

          int v6 = (char *)v6 + 1;
        }

        while (v4 != v6);
        id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }

      while (v4);
    }
  }

  else
  {
    +[_DASBGSystemTask resetFastPass:resetAll:]( &OBJC_CLASS____DASBGSystemTask,  "resetFastPass:resetAll:",  &stru_100118C98,  *(unsigned __int8 *)(a1 + 48));
  }

void sub_100069BAC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100069BC4(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100157BD8 allKeys]);
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)i);
        if ([v7 containsString:*(void *)(a1 + 32)])
        {
          __int128 v8 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100157BD8 objectForKeyedSubscript:v7]);
          __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 aboutMe]);

          if (v9) {
            [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v9];
          }
        }
      }

      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v4);
  }
}

id sub_100069E00(uint64_t a1)
{
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id obj = *(id *)(a1 + 32);
  id v2 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  id v3 = &OBJC_PROTOCOL____DASActivityBackgroundLaunchScheduler;
  if (v2)
  {
    id v4 = v2;
    uint64_t v5 = *(void *)v30;
    p_cache = &OBJC_METACLASS____DASActivityRecorder.cache;
    uint64_t v7 = &OBJC_PROTOCOL____DASActivityBackgroundLaunchScheduler;
    do
    {
      __int128 v8 = 0LL;
      id v27 = v4;
      do
      {
        if (*(void *)v30 != v5) {
          objc_enumerationMutation(obj);
        }
        __int128 v9 = (void *)objc_claimAutoreleasedReturnValue( [p_cache + 473 taskNameWithIdentifier:*(void *)(*((void *)&v29 + 1) + 8 * (void)v8) UID:*(unsigned int *)(a1 + 48)]);
        __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v7[42].name objectForKeyedSubscript:v9]);
        __int128 v11 = v10;
        if (!v10)
        {
          isa = (os_log_s *)v3[42].isa;
          if (!os_log_type_enabled(isa, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_14;
          }
          *(_DWORD *)buf = 138543362;
          uint64_t v34 = v9;
          uint64_t v21 = isa;
          int v22 = "Resubmitted running BGST %{public}@ not found";
          goto LABEL_13;
        }

        if ([v10 state] == (id)1)
        {
          [v11 setPid:*(unsigned int *)(a1 + 52)];
          id v12 = [v11 pid];
          uint64_t v13 = v5;
          int v14 = v7;
          __int16 v15 = p_cache;
          int v16 = v3;
          __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "scheduler_activity"));
          [v17 setPid:v12];

          [v11 setState:3];
          int v18 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
          int v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "scheduler_activity"));
          [v18 addObject:v19];

          id v3 = v16;
          p_cache = v15;
          uint64_t v7 = v14;
          uint64_t v5 = v13;
          id v4 = v27;
          goto LABEL_14;
        }

        int v23 = (os_log_s *)v3[42].isa;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v34 = v9;
          uint64_t v21 = v23;
          int v22 = "Resubmitted running BGST %{public}@ has been scheduled after DAS came up, not restoring state to DAS";
LABEL_13:
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v22, buf, 0xCu);
        }

void sub_10006A248( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_10006A26C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[_DASBGSystemTask taskNameWithIdentifier:UID:]( &OBJC_CLASS____DASBGSystemTask,  "taskNameWithIdentifier:UID:",  *(void *)(a1 + 32),  *(unsigned int *)(a1 + 64)));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100157BD8 objectForKeyedSubscript:v2]);
  if (!v3)
  {
    __int128 v9 = (os_log_s *)qword_100157BD0;
    if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      int v17 = *(_DWORD *)(a1 + 64);
      int v18 = *(_DWORD *)(a1 + 68);
      *(_DWORD *)buf = 138543874;
      uint64_t v23 = v16;
      __int16 v24 = 1024;
      int v25 = v17;
      __int16 v26 = 1024;
      int v27 = v18;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "reportSystemTaskWithIdentifier:producedResults: Task %{public}@ from (UID %d, PID %d) not found",  buf,  0x18u);
    }

    uint64_t v10 = _DASActivitySchedulerErrorDomain;
    uint64_t v11 = *(void *)(a1 + 32);
    id v20 = @"taskIdentifier";
    uint64_t v21 = v11;
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v10,  3LL,  v12));
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8LL);
    __int16 v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    goto LABEL_8;
  }

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) || !*(void *)(a1 + 40))
  {
LABEL_8:
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
    goto LABEL_9;
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityDependencyManager sharedInstance]( &OBJC_CLASS____DASActivityDependencyManager,  "sharedInstance"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "scheduler_activity"));
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id obj = *(id *)(v7 + 40);
  unsigned __int8 v8 = [v4 reportActivity:v5 producedResults:v6 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = v8;

LABEL_9:
}

void sub_10006A5EC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_10006A610(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[_DASBGSystemTask taskNameWithIdentifier:UID:]( &OBJC_CLASS____DASBGSystemTask,  "taskNameWithIdentifier:UID:",  *(void *)(a1 + 32),  *(unsigned int *)(a1 + 64)));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100157BD8 objectForKeyedSubscript:v2]);
  if (!v3)
  {
    __int128 v9 = (os_log_s *)qword_100157BD0;
    if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      int v17 = *(_DWORD *)(a1 + 64);
      int v18 = *(_DWORD *)(a1 + 68);
      *(_DWORD *)buf = 138543874;
      uint64_t v23 = v16;
      __int16 v24 = 1024;
      int v25 = v17;
      __int16 v26 = 1024;
      int v27 = v18;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "reportSystemTaskWithIdentifier:consumedResults: Task %{public}@ from (UID %d, PID %d) not found",  buf,  0x18u);
    }

    uint64_t v10 = _DASActivitySchedulerErrorDomain;
    uint64_t v11 = *(void *)(a1 + 32);
    id v20 = @"taskIdentifier";
    uint64_t v21 = v11;
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v10,  3LL,  v12));
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8LL);
    __int16 v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    goto LABEL_8;
  }

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) || !*(void *)(a1 + 40))
  {
LABEL_8:
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
    goto LABEL_9;
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityDependencyManager sharedInstance]( &OBJC_CLASS____DASActivityDependencyManager,  "sharedInstance"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "scheduler_activity"));
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id obj = *(id *)(v7 + 40);
  unsigned __int8 v8 = [v4 reportActivity:v5 consumedResults:v6 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = v8;

LABEL_9:
}

void sub_10006A988( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_10006A9AC(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[_DASBGSystemTask taskNameWithIdentifier:UID:]( &OBJC_CLASS____DASBGSystemTask,  "taskNameWithIdentifier:UID:",  *(void *)(a1 + 32),  *(unsigned int *)(a1 + 64)));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100157BD8 objectForKeyedSubscript:v2]);
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityDependencyManager sharedInstance]( &OBJC_CLASS____DASActivityDependencyManager,  "sharedInstance"));
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "scheduler_activity"));
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id obj = *(id *)(v7 + 40);
    LOBYTE(v5) = [v4 resetDependenciesForIdentifier:v5 byActivity:v6 error:&obj];
    objc_storeStrong((id *)(v7 + 40), obj);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = v5;
  }

  else
  {
    unsigned __int8 v8 = (os_log_s *)qword_100157BD0;
    if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      int v16 = *(_DWORD *)(a1 + 64);
      int v17 = *(_DWORD *)(a1 + 68);
      *(_DWORD *)buf = 138543874;
      uint64_t v22 = v15;
      __int16 v23 = 1024;
      int v24 = v16;
      __int16 v25 = 1024;
      int v26 = v17;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "resetResultsForIdentifier:byTaskWithIdentifier: Task %{public}@ from UID %d, PID %d not found",  buf,  0x18u);
    }

    uint64_t v9 = _DASActivitySchedulerErrorDomain;
    uint64_t v10 = *(void *)(a1 + 32);
    int v19 = @"taskIdentifier";
    uint64_t v20 = v10;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v9,  3LL,  v11));
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8LL);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
  }
}

void sub_10006ACE0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_10006ACF8(uint64_t a1)
{
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v8 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"TaskName"];
  id v2 = objc_opt_new(&OBJC_CLASS___NSNumberFormatter);
  -[NSNumberFormatter setNumberStyle:](v2, "setNumberStyle:", 1LL);
  -[NSNumberFormatter setUsesSignificantDigits:](v2, "setUsesSignificantDigits:", 1LL);
  -[NSNumberFormatter setMinimumSignificantDigits:](v2, "setMinimumSignificantDigits:", 1LL);
  -[NSNumberFormatter setMaximumSignificantDigits:](v2, "setMaximumSignificantDigits:", 2LL);
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(a1 + 64)));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSNumberFormatter stringFromNumber:](v2, "stringFromNumber:", v3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSNumberFormatter numberFromString:](v2, "numberFromString:", v4));
  [v8 setObject:v5 forKeyedSubscript:@"Target"];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(a1 + 72)));
  [v8 setObject:v6 forKeyedSubscript:@"CompletedPercentage"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(a1 + 80)));
  [v8 setObject:v7 forKeyedSubscript:@"WorkloadCategory"];

  [v8 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"SubCategory"];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 48) sendToPPS:v8];
}

void sub_10006B118(uint64_t a1)
{
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v2 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100157BD8 allValues]);
  id v3 = [v2 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v18;
    *(void *)&__int128 v4 = 138543362LL;
    __int128 v16 = v4;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        if (objc_msgSend(v8, "state", v16) == (id)1
          || [v8 state] == (id)7
          || [v8 state] == (id)5)
        {
          if ([v8 type] == (id)2
            && (double v9 = fabs(*(double *)(a1 + 40)), [v8 interval], v9 >= v10 * 0.01)
            || ([v8 type] == (id)1 || objc_msgSend(v8, "type") == (id)3)
            && (double v11 = fabs(*(double *)(a1 + 40)),
                [v8 trySchedulingBefore],
                double v13 = v12,
                [v8 startAfter],
                v11 >= (v13 - v14) * 0.01))
          {
            uint64_t v15 = (os_log_s *)qword_100157BD0;
            if (os_log_type_enabled((os_log_t)qword_100157BD0, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v16;
              uint64_t v22 = v8;
              _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Time change: resubmitting activity %{public}@",  buf,  0xCu);
            }

            [*(id *)(a1 + 32) dasCancelActivity:v8];
            [v8 adjustBaseTimeByOffset:*(double *)(a1 + 40)];
            [*(id *)(a1 + 32) dasSubmitActivity:v8 error:0];
          }
        }
      }

      id v5 = [v2 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }

    while (v5);
  }
}

void sub_10006B4E0( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

id sub_10006B514()
{
  return [v0 state];
}

void sub_10006B520(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

id sub_10006B534()
{
  return [v0 pid];
}

id sub_10006B540(id a1)
{
  return a1;
}

void sub_10006B548( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

id sub_10006B7DC(uint64_t a1)
{
  return [*(id *)(a1 + 32) evaluateActivityOnTick];
}

id sub_10006C268(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_10006C270(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_10006C438(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_10006C5CC(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_10006C5D4(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_10006C70C(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_10006C714(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_10006C8A8(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_10006C8B0(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_10006CC4C(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_10006CC54(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_10006CD74()
{
  return [v0 count];
}

id sub_10006DD60(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) logAppResumePredictions:*(void *)(*(void *)(a1 + 32) + 48) durationCheck:1];
}

id sub_10006DD94(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) logAppResumePredictions:*(void *)(*(void *)(a1 + 32) + 48) durationCheck:0];
}

void sub_10006E2C4(uint64_t a1)
{
  id v1 = objc_alloc((Class)objc_opt_class(*(void *)(a1 + 32)));
  id v2 = objc_opt_new(&OBJC_CLASS____DASSwapModelApplicationUsage);
  v7[0] = v2;
  id v3 = objc_opt_new(&OBJC_CLASS____DASSwapModelApplicationKills);
  v7[1] = v3;
  __int128 v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v7, 2LL));
  id v5 = [v1 initWithAlgorithms:v4];
  uint64_t v6 = (void *)qword_100157BF0;
  qword_100157BF0 = (uint64_t)v5;
}

id sub_10006E6A8(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 eventBody]);
  __int128 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 resultIdentifier]);
  id v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

void sub_10006E700(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state] == (id)1)
  {
    __int128 v4 = *(void **)(a1 + 32);
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
      sub_1000B6D30(v4, v3);
    }
  }
}

void sub_10006E758(uint64_t a1, void *a2)
{
  id v3 = a2;
  __int128 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 eventBody]);
  id v5 = v4;
  if (v4)
  {
    unsigned int v6 = [v4 type];
    if (v6 == 2)
    {
      uint64_t v7 = -[_DASActivityResult initWithIdentifier:count:]( [_DASActivityResult alloc],  "initWithIdentifier:count:",  *(void *)(a1 + 48),  [v5 resultCount]);
      double v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) cumulativeResultConsumption]);
      double v11 = (void *)objc_claimAutoreleasedReturnValue([v5 activityIdentifier]);
      [v10 setObject:v7 forKeyedSubscript:v11];

      goto LABEL_8;
    }

    if (v6 == 1)
    {
      uint64_t v7 = -[_DASActivityResult initWithIdentifier:count:]( [_DASActivityResult alloc],  "initWithIdentifier:count:",  *(void *)(a1 + 48),  [v5 resultCount]);
      [*(id *)(a1 + 40) setCumulativelyProducedResult:v7];
LABEL_8:

      goto LABEL_11;
    }

    double v12 = *(void **)(a1 + 32);
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR)) {
      sub_1000B6E34(v5, v12);
    }
  }

  else
  {
    id v8 = *(os_log_s **)(a1 + 32);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000B6DC8((uint64_t)v3, v8, v9);
    }
  }

id sub_10006EB44(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) addObject:*(void *)(a1 + 40)];
}

uint64_t sub_10006ECB4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10006ECC4(uint64_t a1)
{
}

void sub_10006ECCC(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 40LL))
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
    uint64_t v2 = *(void *)(a1 + 32);
    v19[0] = *(void *)(v2 + 8);
    v18[0] = @"resultIdentifier";
    v18[1] = @"registeredProducerIdentifier";
    id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v2 + 40) description]);
    v19[1] = v3;
    v18[2] = @"attemptedProducerIdentifier";
    __int128 v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) description]);
    v19[2] = v4;
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  3LL));
    uint64_t v6 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"_DASResultDependencyGroupErrorDomain",  5LL,  v5));
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8LL);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }

  else
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) producedResultIdentifiers]);
    unsigned __int8 v10 = [v9 containsObject:*(void *)(*(void *)(a1 + 32) + 8)];

    if ((v10 & 1) != 0)
    {
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 40LL), *(id *)(a1 + 40));
    }

    else
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8LL);
      __int128 v16 = @"resultIdentifier";
      uint64_t v17 = v11;
      double v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
      uint64_t v13 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"_DASResultDependencyGroupErrorDomain",  2LL,  v12));
      uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8LL);
      uint64_t v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
  }

id sub_10006EF30(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) removeObject:*(void *)(a1 + 40)];
}

void sub_10006F0A0(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 40) isEqual:*(void *)(a1 + 40)])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0LL;
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
    v11[0] = @"registerdProducerIdentifier";
    __int128 v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 40) description]);
    id v5 = v4;
    if (!v4) {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    }
    v11[1] = @"attemptedProducerIdentifier";
    v12[0] = v5;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) description]);
    v12[1] = v6;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  2LL));
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"_DASResultDependencyGroupErrorDomain",  6LL,  v7));
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8LL);
    unsigned __int8 v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    if (!v4) {
  }
    }

void sub_10006F428(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "queue_isConsumerActivity:", *(void *)(a1 + 40)))
  {
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue_aggregateResultConsumptionForActivity:", *(void *)(a1 + 40)));
    id v3 = (char *)[v2 count];
    __int128 v4 = &v3[(void)[*(id *)(a1 + 48) count]];
    if ((uint64_t)v4 <= (uint64_t)[*(id *)(*(void *)(a1 + 32) + 16) count])
    {
      objc_msgSend(v2, "setCount:", (char *)objc_msgSend(*(id *)(a1 + 48), "count") + (void)objc_msgSend(v2, "count"));
      [*(id *)(a1 + 32) persistUpdatedResultConsumptionBy:*(void *)(a1 + 40) result:v2];
    }

    else
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void **)(v5 + 16);
      v22[0] = *(void *)(v5 + 8);
      v21[0] = @"dependencyIdentifier";
      v21[1] = @"cumulativelyProducedResults";
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v6 count]));
      v22[1] = v7;
      v21[2] = @"previouslyConsumedResultCount";
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v2 count]));
      v22[2] = v8;
      v21[3] = @"newlyConsumedResultCount";
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [*(id *)(a1 + 48) count]));
      v22[3] = v9;
      v21[4] = @"attemptedTotalConsumptionCount";
      unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v4));
      v22[4] = v10;
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  5LL));
      uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"_DASResultDependencyGroupErrorDomain",  4LL,  v11));
      uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8LL);
      uint64_t v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;

      *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
    }
  }

  else
  {
    uint64_t v15 = *(void **)(a1 + 40);
    v24[0] = *(void *)(*(void *)(a1 + 32) + 8LL);
    v23[0] = @"dependencyIdentifier";
    v23[1] = @"activityIdentifier";
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 description]);
    v24[1] = v16;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  2LL));
    uint64_t v18 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"_DASResultDependencyGroupErrorDomain",  1LL,  v17));
    uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8LL);
    __int128 v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
  }

void sub_10006F878(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "queue_isProducerActivity:", *(void *)(a1 + 40)))
  {
    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8LL);
    id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) identifier]);
    LOBYTE(v2) = [v2 isEqualToString:v3];

    if ((v2 & 1) != 0)
    {
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "setCount:", objc_msgSend(*(id *)(a1 + 48), "count"));
      [*(id *)(a1 + 32) persistUpdatedResultProductionBy:*(void *)(a1 + 40)];
      return;
    }

    v13[0] = @"reportedProducedResultIdentifier";
    __int128 v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) identifier]);
    v13[1] = @"dependencyGroupIdentifier";
    v14[0] = v4;
    v14[1] = *(void *)(*(void *)(a1 + 32) + 8LL);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  2LL));
    uint64_t v10 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"_DASResultDependencyGroupErrorDomain",  3LL,  v5));
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8LL);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }

  else
  {
    v15[0] = @"resultIdentifier";
    __int128 v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) identifier]);
    v15[1] = @"activityName";
    v16[0] = v4;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) description]);
    v16[1] = v5;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  2LL));
    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"_DASResultDependencyGroupErrorDomain",  2LL,  v6));
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8LL);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
}

uint64_t sub_10006FB74(uint64_t a1, void *a2)
{
  id v3 = a2;
  __int128 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 eventBody]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 resultIdentifier]);
  if ([v5 containsString:*(void *)(a1 + 32)])
  {
    uint64_t v6 = 1LL;
  }

  else
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 eventBody]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 activityIdentifier]);
    uint64_t v6 = (uint64_t)[v8 containsString:*(void *)(a1 + 32)];
  }

  return v6;
}

BOOL sub_10006FD30(uint64_t a1, void *a2)
{
  id v3 = a2;
  __int128 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 eventBody]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 resultIdentifier]);
  if ([v5 isEqualToString:*(void *)(*(void *)(a1 + 32) + 8)])
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 eventBody]);
    BOOL v7 = [v6 type] == 1;
  }

  else
  {
    BOOL v7 = 0LL;
  }

  return v7;
}

BOOL sub_10006FF60(uint64_t a1, void *a2)
{
  id v3 = a2;
  __int128 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 eventBody]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 activityIdentifier]);
  if ([v5 isEqualToString:*(void *)(a1 + 32)])
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 eventBody]);
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 resultIdentifier]);
    if ([v7 isEqualToString:*(void *)(*(void *)(a1 + 40) + 8)])
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 eventBody]);
      BOOL v9 = [v8 type] == 2;
    }

    else
    {
      BOOL v9 = 0LL;
    }
  }

  else
  {
    BOOL v9 = 0LL;
  }

  return v9;
}

void sub_1000701F4(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue_aggregateResultConsumptionForActivity:", *(void *)(a1 + 40)));
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) count];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v2 - (_BYTE *)[v3 count];
}

void sub_1000703BC(uint64_t a1)
{
  uint64_t v2 = objc_alloc(&OBJC_CLASS____DASActivityResult);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = a1 + 32;
  uint64_t v5 = -[_DASActivityResult initWithIdentifier:](v2, "initWithIdentifier:", *(void *)(v4 + 8));
  uint64_t v6 = *(void **)(*(void *)v3 + 16LL);
  *(void *)(*(void *)v3 + 16LL) = v5;

  uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v8 = *(void **)(*(void *)v3 + 24LL);
  *(void *)(*(void *)v3 + 24LL) = v7;

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)v3 + 48) pruner]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  void v11[2] = sub_1000704A4;
  void v11[3] = &unk_100116AD8;
  v11[4] = *(void *)v3;
  [v9 deleteEventsPassingTest:v11];

  uint64_t v10 = *(os_log_s **)(*(void *)v3 + 64LL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_1000B7094(v3, v10);
  }
}

id sub_1000704A4(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a2 eventBody]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 resultIdentifier]);
  id v5 = [v4 isEqualToString:*(void *)(*(void *)(a1 + 32) + 8)];

  return v5;
}

void sub_1000706C0(uint64_t a1)
{
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 24) allKeys]);
  id v3 = [v2 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)i);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:v7]);
        BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v8 count]));
        [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v7];
      }

      id v4 = [v2 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }

    while (v4);
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v10 = *(id *)(*(void *)(a1 + 32) + 32LL);
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (j = 0LL; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(a1 + 48);
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * (void)j), "name", (void)v17));
        [v15 addObject:v16];
      }

      id v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }

    while (v12);
  }
}

id sub_100070A3C(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendFormat:@"\nCumulative Result Consumption: %@ ", *(void *)(*(void *)(a1 + 40) + 24)];
}

id sub_100070B50(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendFormat:@"\nProducer: %@", *(void *)(*(void *)(a1 + 40) + 40)];
}

void sub_100070EC4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
}

id sub_100070EDC(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 eventBody]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 resultIdentifier]);
  id v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

void sub_100070F34(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state] == (id)1)
  {
    id v4 = *(void **)(a1 + 32);
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
      sub_1000B6D30(v4, v3);
    }
  }
}

uint64_t sub_100070F8C(uint64_t a1)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
  return 0LL;
}

  ;
}

void sub_100070FC0(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(va, 8) = a1;
}

void sub_100071048(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  uint64_t v2 = (void *)qword_100157C08;
  qword_100157C08 = (uint64_t)v1;
}

id sub_100071784(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 eventBody]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  id v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

void sub_1000717DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state] == (id)1)
  {
    id v4 = *(void **)(a1 + 32);
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
      sub_1000B7124(v4, v3);
    }
  }
}

void sub_100071834(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 eventBody]);
  id v5 = v4;
  if (v4)
  {
    unsigned int v6 = [v4 type];
    if (v6 == 2)
    {
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) haveRunActivities]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 consumerIdentifier]);
      [v9 addObject:v10];
    }

    else if (v6 == 1)
    {
      [*(id *)(a1 + 40) setHasDependencyRun:1];
    }

    else
    {
      id v11 = *(void **)(a1 + 32);
      if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR)) {
        sub_1000B71B8(v5, v11);
      }
    }
  }

  else
  {
    uint64_t v7 = *(os_log_s **)(a1 + 32);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000B6DC8((uint64_t)v3, v7, v8);
    }
  }
}

id sub_100071C20(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
}

id sub_100071D48(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
}

id sub_100071DD0(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 8LL) = 1;
  [*(id *)(*(void *)(a1 + 32) + 32) removeAllObjects];
  return [*(id *)(a1 + 32) updateStreamForTrackedActivityDidRun:*(void *)(a1 + 40)];
}

id sub_100071E84(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32LL);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) name]);
  [v2 addObject:v3];

  return [*(id *)(a1 + 32) persistActivityDidConsume:*(void *)(a1 + 40)];
}

void sub_100071FA0(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) name]);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 containsObject:v3];
}

id sub_10007204C(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  uint64_t v2 = *(os_log_s **)(*(void *)(a1 + 32) + 56LL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_1000B7254((uint64_t)v1, v2);
  }
  [*((id *)*v1 + 4) removeAllObjects];
  *((_BYTE *)*v1 + _Block_object_dispose(va, 8) = 0;
  return [*v1 pruneStreamOfGroup];
}

void sub_100072208(uint64_t a1)
{
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 24LL);
  id v3 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      unsigned int v6 = 0LL;
      do
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(a1 + 40);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v18 + 1) + 8 * (void)v6) name]);
        [v7 addObject:v8];

        unsigned int v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }

    while (v4);
  }

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v9 = *(id *)(*(void *)(a1 + 32) + 32LL);
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend( *(id *)(a1 + 48),  "addObject:",  *(void *)(*((void *)&v14 + 1) + 8 * (void)v13),  (void)v14);
        uint64_t v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }

    while (v11);
  }
}

uint64_t sub_100072484(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 eventBody]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  if ([v5 containsString:*(void *)(a1 + 32)])
  {
    uint64_t v6 = 1LL;
  }

  else
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 eventBody]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 consumerIdentifier]);
    uint64_t v6 = (uint64_t)[v8 containsString:*(void *)(a1 + 32)];
  }

  return v6;
}

id sub_1000725D8(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 eventBody]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  id v5 = [v4 isEqualToString:*(void *)(*(void *)(a1 + 32) + 16)];

  return v5;
}

id sub_100072888(uint64_t a1)
{
  if (*(_BYTE *)(*(void *)(a1 + 40) + 8LL)) {
    id v2 = @"YES";
  }
  else {
    id v2 = @"NO";
  }
  return [*(id *)(a1 + 32) appendFormat:@"\nHas the dependency run: %@", v2];
}

id sub_1000729B4(uint64_t a1)
{
  if (*(_BYTE *)(*(void *)(a1 + 40) + 8LL)) {
    id v2 = @"YES";
  }
  else {
    id v2 = @"NO";
  }
  return [*(id *)(a1 + 32) appendFormat:@"\nHas the dependency run: %@", v2];
}

void sub_100072CF8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
}

id sub_100072D10(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 eventBody]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  id v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

void sub_100072D68(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state] == (id)1)
  {
    id v4 = *(void **)(a1 + 32);
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
      sub_1000B7124(v4, v3);
    }
  }
}

uint64_t sub_100072DC0(uint64_t a1)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
  return 0LL;
}

id sub_100072F30(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_loadHistograms");
}

void sub_10007344C(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  [a3 doubleValue];
  double v6 = v5;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:v11]);
  [v7 doubleValue];
  double v9 = v8 * 0.5 + v6 * 0.5;

  if (v9 <= 0.1)
  {
    [*(id *)(a1 + 40) setObject:&off_100121F90 forKeyedSubscript:v11];
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v9));
    [*(id *)(a1 + 40) setObject:v10 forKeyedSubscript:v11];
  }
}

void sub_100073514(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  double v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v7]);

  if (!v6) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v7];
  }
}

void sub_100073588(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:"));

  if (!v3) {
    [*(id *)(a1 + 32) setObject:&off_100121F90 forKeyedSubscript:v4];
  }
}

id sub_100073640(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_queue_computeScores"));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;

  id v5 = *(os_log_s **)(*(void *)(a1 + 32) + 48LL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 24LL);
    int v8 = 138412290;
    uint64_t v9 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Updated Kill Histogram: %@",  (uint8_t *)&v8,  0xCu);
  }

  [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateHistograms");
}

void sub_1000738D8(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 updateModel];
  [v3 setTaskCompleted];
}

void sub_100073988(id a1)
{
}

void sub_100073B68(uint64_t a1)
{
  int v2 = memorystatus_control(3LL, 0LL, 128LL, 0LL, 0LL);
  if (v2 <= 0)
  {
    __int128 v32 = *(void **)(*(void *)(a1 + 32) + 48LL);
    if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR)) {
      sub_1000B72E4(v32);
    }
  }

  else
  {
    uint64_t v3 = v2;
    id v4 = (char *)malloc(v2);
    if ((int)memorystatus_control(3LL, 0LL, 128LL, v4, v3) <= 0)
    {
      int v33 = *(void **)(*(void *)(a1 + 32) + 48LL);
      if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_ERROR)) {
        sub_1000B7364(v33);
      }
    }

    else
    {
      id v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      unint64_t v6 = *((void *)v4 + 24);
      if (v6)
      {
        uint64_t v7 = 0LL;
        uint64_t v8 = 0LL;
        uint64_t v9 = 0LL;
        char v38 = 0;
        unint64_t v10 = 0LL;
        int v40 = 0;
        id v11 = v4 + 200;
        double v12 = 0.0;
        uint64_t v13 = &AnalyticsSendEventLazy_ptr;
        *(void *)&__int128 v5 = 138412290LL;
        __int128 v34 = v5;
        uint64_t v36 = a1;
        do
        {
          memcpy(__dst, v11, sizeof(__dst));
          if (__dst[10] && (__dst[5] & 0x1800000000LL) == 0)
          {
            __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13[98] stringWithUTF8String:(char *)__dst + 4]);
            if (v14)
            {
              if (!v8)
              {
                uint64_t v8 = mach_absolute_time();
                __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));

                [v15 timeIntervalSinceDate:*(void *)(*(void *)(a1 + 32) + 56)];
                double v12 = v16;
                uint64_t v9 = v15;
                uint64_t v13 = &AnalyticsSendEventLazy_ptr;
              }

              objc_msgSend(*(id *)(a1 + 32), "secondsFrom:until:", v8, __dst[25], v34);
              if (v17 <= v12)
              {
                double v18 = v17;
                if ((__dst[5] & 0x200000000LL) != 0)
                {
                  if ((__dst[5] & 0x400000000LL) != 0)
                  {
                    char v37 = 0;
                    v7 += __dst[30];
                  }

                  else
                  {
                    ++v40;
                    char v37 = 1;
                  }
                }

                else
                {
                  char v37 = 0;
                }

                __int128 v19 = *(void **)(*(void *)(a1 + 32) + 48LL);
                if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
                {
                  __int128 v20 = v19;
                  __int128 v21 = v9;
                  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v9 dateByAddingTimeInterval:-v18]);
                  *(_DWORD *)buf = 138412546;
                  int v42 = v14;
                  __int16 v43 = 2112;
                  v44 = v22;
                  _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%@ killed at %@", buf, 0x16u);

                  uint64_t v9 = v21;
                  uint64_t v13 = &AnalyticsSendEventLazy_ptr;
                  a1 = v36;
                }

                if ([*(id *)(a1 + 32) process:v14 inSet:*(void *)(a1 + 40)])
                {
                  if (HIDWORD(__dst[6]))
                  {
                    uint64_t v35 = v9;
                    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
                    [v23 setObject:v14 forKeyedSubscript:@"BundleID"];
                    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  LODWORD(__dst[0])));
                    [v23 setObject:v24 forKeyedSubscript:@"PID"];

                    __int16 v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  HIDWORD(__dst[6])));
                    [v23 setObject:v25 forKeyedSubscript:@"Reason"];

                    int v26 = *(os_log_s **)(*(void *)(a1 + 32) + 48LL);
                    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412546;
                      int v42 = v14;
                      __int16 v43 = 1024;
                      LODWORD(v44) = HIDWORD(__dst[6]);
                      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Skipped %@ (%d)", buf, 0x12u);
                    }

                    [v39 addObject:v23];

                    uint64_t v9 = v35;
                  }

                  if ((v37 & 1) == 0)
                  {
                    int v27 = v9;
                    uint64_t v28 = *(os_log_s **)(*(void *)(a1 + 32) + 48LL);
                    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = v34;
                      int v42 = v14;
                      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Adding %@ to today's kill dictionary",  buf,  0xCu);
                    }

                    __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:v14]);
                    [v29 doubleValue];
                    __int128 v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  v30 + 1.0));
                    [*(id *)(*(void *)(a1 + 32) + 16) setObject:v31 forKeyedSubscript:v14];

                    char v38 = 1;
                    uint64_t v9 = v27;
                    uint64_t v13 = &AnalyticsSendEventLazy_ptr;
                  }
                }

                else
                {
                  [*(id *)(*(void *)(a1 + 32) + 32) addObject:v14];
                }
              }
            }

            unint64_t v6 = *((void *)v4 + 24);
          }

          ++v10;
          v11 += 280;
        }

        while (v10 < v6);
      }

      else
      {
        char v38 = 0;
        uint64_t v9 = 0LL;
        int v40 = 0;
        uint64_t v7 = 0LL;
      }

      free(v4);
      +[_DASMetricRecorder setValue:forKey:]( &OBJC_CLASS____DASMetricRecorder,  "setValue:forKey:",  v7,  @"com.apple.dasd.swap.goodfreezecount");
      +[_DASMetricRecorder incrementOccurrencesForKey:byCount:]( &OBJC_CLASS____DASMetricRecorder,  "incrementOccurrencesForKey:byCount:",  @"com.apple.dasd.swap.badfreezecount",  v40);
      if ((v38 & 1) != 0)
      {
        objc_storeStrong((id *)(*(void *)(a1 + 32) + 56LL), v9);
        objc_msgSend(*(id *)(a1 + 32), "_queue_updateHistograms");
        [*(id *)(*(void *)(a1 + 32) + 40) logFreezerSkipReasons:v39];
      }
    }
  }

void sub_100074254(uint64_t a1)
{
  v7[0] = 0LL;
  v7[1] = v7;
  void v7[2] = 0x2020000000LL;
  v7[3] = 0LL;
  int v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_queue_computeScores"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  void v6[2] = sub_100074350;
  v6[3] = &unk_100116BC0;
  void v6[4] = v7;
  [v2 enumerateKeysAndObjectsUsingBlock:v6];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100074388;
  v3[3] = &unk_100116BE8;
  id v4 = *(id *)(a1 + 40);
  __int128 v5 = v7;
  [v2 enumerateKeysAndObjectsUsingBlock:v3];

  _Block_object_dispose(v7, 8);
}

void sub_100074338(_Unwind_Exception *a1)
{
}

double sub_100074350(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  double result = v5 + *(double *)(v4 + 24);
  *(double *)(v4 + 24) = result;
  return result;
}

void sub_100074388(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  [a3 doubleValue];
  id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  v6 / *(double *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)));
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v5];
}

id sub_100074648(uint64_t a1)
{
  id result = [(id)objc_opt_class(*(void *)(a1 + 32)) computeHasDeviceRecentlyUpdated];
  byte_100157C30 = (char)result;
  return result;
}

void sub_100074864(id a1)
{
  id v1 = (id)MGGetStringAnswer(@"DeviceClass");
  byte_100157C31 = [v1 isEqualToString:@"AudioAccessory"];
}

void sub_100074B94(_Unwind_Exception *a1)
{
}

void sub_100074CA0(uint64_t a1)
{
  id v1 = [objc_alloc((Class)objc_opt_class(*(void *)(a1 + 32))) initAsAnonymous:0 withContext:0];
  int v2 = (void *)qword_100157C48;
  qword_100157C48 = (uint64_t)v1;
}

void sub_1000756EC(uint64_t a1)
{
  id obj = *(id *)(*(void *)(a1 + 32) + 360LL);
  objc_sync_enter(obj);
  [*(id *)(*(void *)(a1 + 32) + 360) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 368) removeAllObjects];
  objc_sync_exit(obj);
}

void sub_100075748( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

id sub_10007575C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleTriggers:a2];
}

void sub_100075768(id a1, NSArray *a2)
{
  int v2 = a2;
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[_DASSystemConditionsRecorder sharedInstance]( &OBJC_CLASS____DASSystemConditionsRecorder,  "sharedInstance"));
  [v3 recordForKeyPaths:v2];
}

id sub_1000757B8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleCompletedActivities:a2];
}

void sub_1000757C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "NW Evaluation: %@", (uint8_t *)&v7, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v3));
  [v5 unprotectedEvaluateScoreAndRunActivities:v6];
}

id sub_1000758AC(uint64_t a1)
{
  return [*(id *)(a1 + 32) schedulingTimerFired];
}

void sub_100075D58(_Unwind_Exception *a1)
{
}

void sub_10007625C(_Unwind_Exception *a1)
{
}

void sub_100076454(_Unwind_Exception *a1)
{
}

void sub_1000766DC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100076980(_Unwind_Exception *a1)
{
}

id sub_100076B4C(uint64_t a1)
{
  return [*(id *)(a1 + 32) periodicCalculationForOptimal];
}

void sub_100076B54(uint64_t a1)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 88) allKeys]);
  uint64_t v43 = a1;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  id obj = v2;
  id v37 = [obj countByEnumeratingWithState:&v48 objects:v59 count:16];
  if (v37)
  {
    uint64_t v36 = *(void *)v49;
    *(void *)&__int128 v4 = 138412802LL;
    __int128 v34 = v4;
    do
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v49 != v36) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v48 + 1) + 8 * v5);
        os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(v43 + 32) + 12LL));
        int v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(v43 + 32) + 112) objectForKeyedSubscript:v6]);
        id v8 = [v7 copy];
        uint64_t v9 = v8;
        if (v8) {
          id v10 = v8;
        }
        else {
          id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
        }
        id v11 = v10;

        double v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(v43 + 32) + 104) objectForKeyedSubscript:v6]);
        id v13 = [v12 copy];
        __int128 v14 = v13;
        uint64_t v42 = v5;
        if (v13) {
          id v15 = v13;
        }
        else {
          id v15 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
        }
        double v16 = v15;

        int v41 = v11;
        uint64_t v39 = v6;
        int v40 = (void *)objc_claimAutoreleasedReturnValue([v16 setByAddingObjectsFromSet:v11]);
        id v38 = objc_msgSend(*(id *)(v43 + 32), "currentLoadFromActivities:inGroupWithName:");
        os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(v43 + 32) + 12LL));
        double v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        __int128 v44 = 0u;
        __int128 v45 = 0u;
        __int128 v46 = 0u;
        __int128 v47 = 0u;
        id v18 = v16;
        id v19 = [v18 countByEnumeratingWithState:&v44 objects:v58 count:16];
        if (v19)
        {
          id v20 = v19;
          uint64_t v21 = *(void *)v45;
          do
          {
            for (i = 0LL; i != v20; i = (char *)i + 1)
            {
              if (*(void *)v45 != v21) {
                objc_enumerationMutation(v18);
              }
              __int128 v23 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)i);
              uint64_t v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "startDate", v34));
              if (v24)
              {
                __int16 v25 = (void *)v24;
                int v26 = (void *)objc_claimAutoreleasedReturnValue([v23 startDate]);
                [v3 timeIntervalSinceDate:v26];
                double v28 = v27;

                if (v28 > 60.0)
                {
                  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v23 name]);
                  [v17 addObject:v29];

                  double v30 = *(void **)(v43 + 32);
                  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v23 startDate]);
                  __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
                  LODWORD(v30) = [v30 shouldSuspendLongRunningActivity:v23 withStartDate:v31 whileBlockingOtherTasks:0 atDate:v32];

                  if ((_DWORD)v30)
                  {
                    [*(id *)(v43 + 32) updateSuspendRequestDate:v3 forActivity:v23 withReason:@"Limitations"];
                    [*(id *)(v43 + 32) suspendActivity:v23];
                  }
                }
              }
            }

            id v20 = [v18 countByEnumeratingWithState:&v44 objects:v58 count:16];
          }

          while (v20);
        }

        if ([v17 count])
        {
          int v33 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle(activityGroup)"));
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v34;
            uint64_t v53 = v39;
            __int16 v54 = 2048;
            id v55 = v38;
            __int16 v56 = 2112;
            v57 = v17;
            _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_INFO,  "Current load for group %@ is %lld. Long running activities are %@",  buf,  0x20u);
          }
        }

        uint64_t v5 = v42 + 1;
      }

      while ((id)(v42 + 1) != v37);
      id v37 = [obj countByEnumeratingWithState:&v48 objects:v59 count:16];
    }

    while (v37);
  }
}

void sub_100077158(uint64_t a1)
{
  double v2 = *(double *)(a1 + 48);
  else {
    double v3 = 120.0;
  }
  if (v2 > v3 + -60.0) {
    double v2 = v3 + -60.0;
  }
  if (v2 >= 60.0) {
    double v4 = v2;
  }
  else {
    double v4 = 60.0;
  }
  double v5 = (double)arc4random_uniform(0xB4u) + 510.0;
  uint32_t v6 = arc4random_uniform(0xB4u);
  if (v4 >= v5) {
    double v4 = v5;
  }
  unsigned int v7 = +[_DASSystemContext isPluggedIn:]( &OBJC_CLASS____DASSystemContext,  "isPluggedIn:",  *(void *)(*(void *)(a1 + 32) + 576LL));
  if (*(_BYTE *)(a1 + 64)) {
    uint64_t v8 = 1LL;
  }
  else {
    uint64_t v8 = v7;
  }
  if (!*(_BYTE *)(a1 + 64) && v7 && v3 < 60.0) {
    double v3 = (double)arc4random_uniform(0xAu) + 60.0;
  }
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 dateByAddingTimeInterval:v3]);
  uint64_t v11 = *(void *)(a1 + 32);
  double v12 = *(void **)(v11 + 200);
  *(void *)(v11 + 200) = v10;

  uint64_t v13 = objc_claimAutoreleasedReturnValue([v9 dateByAddingTimeInterval:v4]);
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = *(void **)(v14 + 192);
  *(void *)(v14 + 192) = v13;

  [*(id *)(*(void *)(a1 + 32) + 184) scheduleOnBehalfOf:*(void *)(a1 + 40) between:v8 and:v4 waking:v3];
  double v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
  double v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = *(unsigned __int8 *)(a1 + 64);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 192) descriptionWithLocale:v16]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 200) descriptionWithLocale:v16]);
    uint64_t v21 = *(void *)(a1 + 40);
    v22[0] = 67110146;
    v22[1] = v8;
    __int16 v23 = 1024;
    int v24 = v18;
    __int16 v25 = 2112;
    int v26 = v19;
    __int16 v27 = 2112;
    double v28 = v20;
    __int16 v29 = 2112;
    uint64_t v30 = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Setting timer (isWaking=%u, activityRequiresWaking=%u) between %@ and %@ for %@",  (uint8_t *)v22,  0x2Cu);
  }
}

id sub_1000774C4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 240) deleteOldActivities];
}

void sub_1000779E0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
}

void sub_100077A08(uint64_t a1, void *a2, int a3)
{
  if (a3)
  {
    id v4 = a2;
    double v5 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDataProtectionStateMonitor dataProtectionClassC]( &OBJC_CLASS____DASDataProtectionStateMonitor,  "dataProtectionClassC"));
    unsigned int v6 = [v4 isEqualToString:v5];

    if (v6)
    {
      unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Class C now available. Loading activities.",  v10,  2u);
      }

      os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 40) + 8LL) + 32LL));
      if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
      {
        [*(id *)(a1 + 32) loadStateWhenAvailable];
        *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
      }

      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 40) + 8LL) + 32LL));
      uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 440LL);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[_DASFileProtection completeUntilFirstUserAuthentication]( &OBJC_CLASS____DASFileProtection,  "completeUntilFirstUserAuthentication"));
      [v8 refreshGroupsWithFileProtection:v9];
    }
  }

void sub_10007910C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)i);
        if ([v9 isBackgroundTaskActivity]
          && ([v9 isContactTracingBackgroundActivity] & 1) == 0)
        {
          [*(id *)(a1 + 32) addObject:v9];
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v6);
  }
}

LABEL_43:
  if (buf[0]) {
LABEL_44:
  }
    objc_msgSend(v15, "_DAS_addOrReplaceObject:", v4);
  os_unfair_recursive_lock_unlock(p_applicationLaunchRequestsLock);
  if (v35)
  {
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v35));
    -[_DASDaemon cancelActivities:](self, "cancelActivities:", v36);
  }

  double v28 = buf[0] != 0;
LABEL_48:

LABEL_49:
  return v28;
}

id sub_100079F18(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleSysdiagnoseStartEvent];
}

void sub_10007A240(_Unwind_Exception *a1)
{
}

void sub_10007A300(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    uint64_t v8 = _DASLaunchReasonBackgroundRemoteNotification;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        __int128 v10 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 launchReason]);
        unsigned int v12 = [v11 isEqualToString:v8];

        if (v12) {
          [*(id *)(a1 + 32) addObject:v10];
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v6);
  }
}

void sub_10007A4DC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)i);
      }

      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v6);
  }
}

void sub_10007A8B0(_Unwind_Exception *a1)
{
}

void sub_10007AEBC(_Unwind_Exception *a1)
{
}

void sub_10007AFF0(_Unwind_Exception *a1)
{
}

void sub_10007B12C(_Unwind_Exception *a1)
{
}

void sub_10007B2D0(_Unwind_Exception *a1)
{
}

void sub_10007B3D0(uint64_t a1)
{
  double v2 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_1000B7444();
  }

  double v3 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) startHandler]);
  v3[2](v3, *(void *)(a1 + 32));
}

void sub_10007BD28( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id *location, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,id a52)
{
}

id sub_10007BD68(uint64_t a1, void *a2)
{
  return [a2 runActivities:*(void *)(a1 + 32)];
}

void sub_10007BD74(uint64_t a1)
{
  double v2 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"BackgroundTasks"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    int v6 = 138412290;
    id v7 = WeakRetained;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "%@ about to expire, warning",  (uint8_t *)&v6,  0xCu);
  }

  id v4 = *(void **)(a1 + 32);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", *(void *)(a1 + 40)));
  [v4 warnBGTaskClientsForActivitiesAboutToExpire:v5];
}

void sub_10007BE64(uint64_t a1, int a2)
{
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"BackgroundTasks"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    int v6 = WeakRetained;
    id v7 = @"NO";
    if (a2) {
      id v7 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    id v16 = WeakRetained;
    __int16 v17 = 2112;
    int v18 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Assertion %@ invalidated, server-initiated: %@",  buf,  0x16u);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  void v13[2] = sub_10007C080;
  v13[3] = &unk_100115148;
  __int128 v14 = *(_OWORD *)(a1 + 32);
  dispatch_async(*(dispatch_queue_t *)(v14 + 272), v13);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*(void *)(a1 + 32) + 448),  "hostAssertionAssociatedWithActivity:targetPID:",  *(void *)(a1 + 40),  objc_msgSend(*(id *)(a1 + 40), "pid")));
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"BackgroundTasks"));
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      __int128 v11 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      id v16 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Invalidating host assertion along with the extension assertion for %@",  buf,  0xCu);
    }

    [*(id *)(*(void *)(a1 + 32) + 448) invalidateAssertionsForActivity:*(void *)(a1 + 40)];
  }

  else
  {
    if (v10)
    {
      __int128 v12 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      id v16 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "No host assertion associated with %@, skipping invalidation",  buf,  0xCu);
    }
  }
}

uint64_t sub_10007C080(uint64_t a1)
{
  return os_unfair_recursive_lock_unlock(*(void *)(a1 + 32) + 32LL);
}

id sub_10007C0CC(uint64_t a1, void *a2)
{
  return [a2 runActivitiesWithDelayedStart:*(void *)(a1 + 32)];
}

void sub_10007C868(_Unwind_Exception *a1)
{
}

void sub_10007D1D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___UISFetchContentInBackgroundActionResponse);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    id v5 = v3;
  }
  else {
    id v5 = 0LL;
  }
  id v6 = [v5 result];
  id v7 = *(void **)(a1 + 32);
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void **)(a1 + 40);
    uint64_t v8 = *(void **)(a1 + 48);
    BOOL v10 = v7;
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v8 launchReason]);
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v6));
    *(_DWORD *)buf = 138412802;
    int v24 = v9;
    __int16 v25 = 2112;
    int v26 = v11;
    __int16 v27 = 2112;
    double v28 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Launch for %@ with reason %@ result: %@",  buf,  0x20u);
  }

  dispatch_group_wait(*(dispatch_group_t *)(a1 + 56), 0xFFFFFFFFFFFFFFFFLL);
  os_unfair_recursive_lock_lock_with_options(*(void *)(a1 + 64) + 32LL, 0LL);
  __int128 v13 = *(void **)(a1 + 32);
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_INFO))
  {
    __int128 v14 = *(void **)(a1 + 48);
    __int128 v15 = v13;
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 assertion]);
    __int16 v17 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    int v24 = v16;
    __int16 v25 = 2112;
    int v26 = v17;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Invalidating assertion %@ for %@", buf, 0x16u);
  }

  int v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) assertion]);
  id v22 = 0LL;
  unsigned __int8 v19 = [v18 invalidateWithError:&v22];
  id v20 = v22;

  if ((v19 & 1) == 0)
  {
    if (v20)
    {
      uint64_t v21 = *(void **)(a1 + 32);
      if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR)) {
        sub_1000B750C((void **)(a1 + 48), v21, (uint64_t)v20);
      }
    }
  }

  os_unfair_recursive_lock_unlock(*(void *)(a1 + 64) + 32LL);
}

void sub_10007D42C(uint64_t a1)
{
  double v2 = *(void **)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 72);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10007D56C;
  v8[3] = &unk_100116E48;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 80);
  id v11 = *(id *)(a1 + 56);
  id v12 = *(id *)(a1 + 40);
  id v16 = *(id *)(a1 + 104);
  id v17 = *(id *)(a1 + 112);
  id v6 = *(id *)(a1 + 88);
  uint64_t v7 = *(void *)(a1 + 48);
  id v13 = v6;
  uint64_t v14 = v7;
  id v15 = *(id *)(a1 + 96);
  id v18 = *(id *)(a1 + 120);
  [v2 launchApplication:v3 applicationURL:v5 additionalOptions:v4 completion:v8];
}

void sub_10007D56C(uint64_t a1, unsigned int a2, void *a3)
{
  id v47 = a3;
  unsigned int v52 = a2;
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 96) + 16LL))();
    uint64_t v5 = *(os_log_s **)(a1 + 40);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      v80 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Successful launch for %@", buf, 0xCu);
    }

    if (os_log_type_enabled(*(os_log_t *)(a1 + 40), OS_LOG_TYPE_DEBUG)) {
      sub_1000B75E0();
    }
    __int128 v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set", v47));
    __int128 v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    __int128 v76 = 0u;
    __int128 v77 = 0u;
    __int128 v74 = 0u;
    __int128 v75 = 0u;
    id obj = *(id *)(a1 + 64);
    id v53 = [obj countByEnumeratingWithState:&v74 objects:v78 count:16];
    if (v53)
    {
      uint64_t v51 = *(void *)v75;
      do
      {
        for (i = 0LL; i != v53; i = (char *)i + 1)
        {
          if (*(void *)v75 != v51) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void **)(*((void *)&v74 + 1) + 8LL * (void)i);
          id v9 = *(os_log_s **)(a1 + 40);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v80 = v8;
            _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Current activity %@", buf, 0xCu);
          }

          id v10 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1 + 72) + 448) createUnmanagedAssertionForActivity:v8 targetPID:v52]);
          if (v10)
          {
            objc_initWeak(&location, v10);
            v67[0] = _NSConcreteStackBlock;
            v67[1] = 3221225472LL;
            v67[2] = sub_10007DF74;
            v67[3] = &unk_100116DD0;
            id v68 = *(id *)(a1 + 40);
            objc_copyWeak(&v72, &location);
            id v11 = *(id *)(a1 + 48);
            uint64_t v12 = *(void *)(a1 + 72);
            id v69 = v11;
            uint64_t v70 = v12;
            v71 = v8;
            [v10 setWarningHandler:v67];
            if ([v8 isBackgroundTaskActivity])
            {
              id v13 = 0LL;
            }

            else
            {
              id v13 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  1uLL,  *(dispatch_queue_t *)(*(void *)(a1 + 72) + 272LL));
              dispatch_time_t v15 = dispatch_time(0LL, 29000000000LL);
              dispatch_source_set_timer(v13, v15, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
              id v16 = *(void **)(a1 + 80);
              id v17 = (void *)objc_claimAutoreleasedReturnValue([v8 uuid]);
              id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v17]);

              handler[0] = _NSConcreteStackBlock;
              handler[1] = 3221225472LL;
              handler[2] = sub_10007E06C;
              handler[3] = &unk_1001150D0;
              id v66 = v18;
              id v19 = v18;
              dispatch_source_set_event_handler(v13, handler);
              dispatch_activate(v13);
            }

            v55[0] = _NSConcreteStackBlock;
            v55[1] = 3221225472LL;
            v55[2] = sub_10007E074;
            v55[3] = &unk_100116E20;
            id v56 = *(id *)(a1 + 32);
            objc_copyWeak(&v64, &location);
            id v57 = *(id *)(a1 + 40);
            id v58 = *(id *)(a1 + 48);
            id v20 = v13;
            uint64_t v21 = *(void *)(a1 + 72);
            v59 = v20;
            uint64_t v60 = v21;
            v61 = v8;
            id v22 = v50;
            id v62 = v22;
            id v63 = *(id *)(a1 + 104);
            [v10 setInvalidationHandler:v55];
            os_unfair_recursive_lock_lock_with_options(*(void *)(a1 + 72) + 32LL, 0LL);
            __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v8 assertion]);
            unsigned int v24 = [v23 isValid];

            if (v24)
            {
              __int16 v25 = (os_log_s *)*(id *)(a1 + 40);
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                int v33 = (void *)objc_claimAutoreleasedReturnValue([v8 assertion]);
                *(_DWORD *)buf = 138412546;
                v80 = v8;
                __int16 v81 = 2112;
                id v82 = v33;
                _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "Activity %@ was launched while it has an existing valid assertion: %@. Skipping this activity",  buf,  0x16u);
              }

              os_unfair_recursive_lock_unlock(*(void *)(a1 + 72) + 32LL);
              goto LABEL_32;
            }

            id v54 = 0LL;
            unsigned int v26 = [v10 acquireWithError:&v54];
            id v27 = v54;
            if (v26)
            {
              [v8 setAssertion:v10];
              [v22 addObject:v10];
              double v28 = *(os_log_s **)(a1 + 40);
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v80 = v10;
                __int16 v81 = 2112;
                id v82 = v8;
                _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Assertion %@ acquired for task %@",  buf,  0x16u);
              }
            }

            else
            {
              __int16 v29 = *(os_log_s **)(a1 + 40);
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                __int128 v34 = *(void **)(a1 + 48);
                *(_DWORD *)buf = 138412546;
                v80 = v34;
                __int16 v81 = 2112;
                id v82 = v27;
                _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "Failed to acquire assertion for %@, error: %@",  buf,  0x16u);
              }
            }

            os_unfair_recursive_lock_unlock(*(void *)(a1 + 72) + 32LL);
            if (v26)
            {
              [*(id *)(*(void *)(a1 + 72) + 432) reportActivityRunning:v8];
            }

            else
            {
LABEL_32:
              if (v20)
              {
                uint64_t v30 = *(void **)(a1 + 80);
                __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v8 uuid]);
                __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:v31]);
                [v32 invalidate];

                dispatch_source_cancel(v20);
              }
            }

            objc_destroyWeak(&v64);
            objc_destroyWeak(&v72);

            objc_destroyWeak(&location);
            goto LABEL_35;
          }

          uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"BackgroundTasks"));
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v80 = v8;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "No host assertion associated with %@, skipping continuing",  buf,  0xCu);
          }

LABEL_35:
        }

        id v53 = [obj countByEnumeratingWithState:&v74 objects:v78 count:16];
      }

      while (v53);
    }

    if ([v50 count])
    {
      if ([v48 count])
      {
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 72) connectedBGTaskClients]);
        objc_sync_enter(v35);
        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 72) connectedBGTaskClients]);
        id v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v52));
        id v38 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKeyedSubscript:v37]);

        if (v38)
        {
          [v38 handleLaunchFromDaemonForActivities:v48];
        }

        else
        {
          int v41 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 72) activitiesWaitingForBGTaskClients]);
          uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v52));
          uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v41 objectForKeyedSubscript:v42]);

          if (!v43)
          {
            uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
            __int128 v44 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 72) activitiesWaitingForBGTaskClients]);
            __int128 v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v52));
            [v44 setObject:v43 forKeyedSubscript:v45];
          }

          __int128 v46 = *(os_log_s **)(a1 + 40);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v80 = v48;
            __int16 v81 = 1024;
            LODWORD(v82) = v52;
            _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "Queueing activities %@ until app with pid %d launches",  buf,  0x12u);
          }

          [v43 unionSet:v48];
          [*(id *)(a1 + 72) scheduleConnectionTimeoutForPid:v52];
        }

        objc_sync_exit(v35);
      }

      dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
    }

    else
    {
      if (os_log_type_enabled(*(os_log_t *)(a1 + 40), OS_LOG_TYPE_ERROR)) {
        sub_1000B75B4();
      }
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
      (*(void (**)(void))(*(void *)(a1 + 104) + 16LL))();
    }
  }

  else
  {
    uint64_t v39 = *(os_log_s **)(a1 + 40);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      int v40 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      v80 = v40;
      __int16 v81 = 2112;
      id v82 = v47;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Error launching %@: %@", buf, 0x16u);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
    (*(void (**)(void))(*(void *)(a1 + 88) + 16LL))();
  }
}

void sub_10007DF0C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, id location)
{
}

void sub_10007DF74(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = v2;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    uint64_t v5 = *(void *)(a1 + 40);
    int v8 = 138412546;
    id v9 = WeakRetained;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Assertion %@ for app %@ about to expire, warning",  (uint8_t *)&v8,  0x16u);
  }

  id v6 = *(void **)(a1 + 48);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", *(void *)(a1 + 56)));
  [v6 warnBGTaskClientsForActivitiesAboutToExpire:v7];
}

id sub_10007E06C(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

void sub_10007E074(uint64_t a1, int a2)
{
  uint64_t v4 = (id *)(a1 + 96);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  id v6 = *(void **)(a1 + 40);
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v6;
    id v8 = objc_loadWeakRetained(v4);
    uint64_t v9 = *(void *)(a1 + 48);
    __int16 v10 = @"NO";
    *(_DWORD *)buf = 138412802;
    id v22 = v8;
    if (a2) {
      __int16 v10 = @"YES";
    }
    __int16 v23 = 2112;
    uint64_t v24 = v9;
    __int16 v25 = 2112;
    unsigned int v26 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Assertion %@ for app %@ invalidated, server-initiated: %@",  buf,  0x20u);
  }

  uint64_t v11 = *(dispatch_source_s **)(a1 + 56);
  if (v11) {
    dispatch_source_cancel(v11);
  }
  uint64_t v12 = *(dispatch_queue_s **)(*(void *)(a1 + 64) + 272LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007E234;
  block[3] = &unk_100116DF8;
  id v15 = *(id *)(a1 + 32);
  __int128 v16 = *(_OWORD *)(a1 + 64);
  id v17 = *(id *)(a1 + 80);
  id v18 = WeakRetained;
  id v19 = *(id *)(a1 + 40);
  id v20 = *(id *)(a1 + 88);
  id v13 = WeakRetained;
  dispatch_async(v12, block);
}

id sub_10007E234(uint64_t a1)
{
  id result = [*(id *)(a1 + 56) count];
  if (!result)
  {
    uint64_t v3 = *(os_log_s **)(a1 + 72);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Calling completion", v4, 2u);
    }

    return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 80) + 16LL))();
  }

  return result;
}

void sub_10007E4EC(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (os_log_s *)a1[4];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v5;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Process: %@, Error: %@", (uint8_t *)&v10, 0x16u);
  }

  if ([v6 code] == (id)6 || objc_msgSend(v6, "code") == (id)7)
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = (void *)a1[5];
      int v10 = 138412546;
      id v11 = v9;
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Error servicing launch request for %@: %@",  (uint8_t *)&v10,  0x16u);
    }

    (*(void (**)(void, void, id))(a1[6] + 16LL))(a1[6], 0LL, v6);
  }

  else
  {
    (*(void (**)(void, id, id))(a1[6] + 16))(a1[6], [v5 pid], v6);
  }
}

id sub_10007EA38(uint64_t a1)
{
  double v2 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Suspending extension launch activity %@",  (uint8_t *)&v5,  0xCu);
  }

  return [*(id *)(a1 + 40) suspendActivity:*(void *)(a1 + 32)];
}

LABEL_41:
            }

            __int128 v16 = [v15 countByEnumeratingWithState:&v78 objects:v97 count:16];
          }

          while (v16);
        }

        if ([v59 count])
        {
          [v47 minusSet:v59];
          v75[0] = _NSConcreteStackBlock;
          v75[1] = 3221225472LL;
          v75[2] = sub_10007F5D0;
          v75[3] = &unk_100115120;
          v75[4] = self;
          v75[5] = v54;
          id v22 = v59;
          __int128 v76 = v22;
          __int16 v23 = objc_retainBlock(v75);
          v70[0] = _NSConcreteStackBlock;
          v70[1] = 3221225472LL;
          v70[2] = sub_10007F89C;
          v70[3] = &unk_100115630;
          uint64_t v24 = v46;
          v71 = v24;
          id v72 = self;
          v73 = v54;
          __int16 v25 = v22;
          __int128 v74 = v25;
          unsigned int v26 = objc_retainBlock(v70);
          v65[0] = _NSConcreteStackBlock;
          v65[1] = 3221225472LL;
          v65[2] = sub_10007FBB4;
          v65[3] = &unk_100115630;
          id v66 = v24;
          id v27 = v25;
          v67 = v27;
          id v68 = self;
          id v69 = v54;
          double v28 = objc_retainBlock(v65);
          -[_DASDaemon runLaunchTasks:forApplication:forApplicationURL:onLaunch:onCompletion:onFailure:]( self,  "runLaunchTasks:forApplication:forApplicationURL:onLaunch:onCompletion:onFailure:",  v27,  v54,  0LL,  v23,  v26,  v28);
          __int16 v29 = self->_recentlyLaunchedApps;
          objc_sync_enter(v29);
          -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_recentlyLaunchedApps,  "setObject:forKeyedSubscript:",  v6,  v54);
          -[NSCountedSet addObject:](self->_launchesPerApp, "addObject:", v54);
          objc_sync_exit(v29);

          -[_DASDaemon clearRecentlyLaunchedApps](self, "clearRecentlyLaunchedApps");
        }
      }

      __int128 v49 = [v45 countByEnumeratingWithState:&v82 objects:v98 count:16];
    }

    while (v49);
  }

  id v63 = 0u;
  id v64 = 0u;
  v61 = 0u;
  id v62 = 0u;
  id v55 = v47;
  uint64_t v60 = [v55 countByEnumeratingWithState:&v61 objects:v96 count:16];
  if (v60)
  {
    id v57 = *(void *)v62;
    do
    {
      for (m = 0LL; m != v60; m = (char *)m + 1)
      {
        if (*(void *)v62 != v57) {
          objc_enumerationMutation(v55);
        }
        __int128 v31 = *(NSMutableSet **)(*((void *)&v61 + 1) + 8LL * (void)m);
        __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet groupName](v31, "groupName"));

        if (v32)
        {
          int v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet groupName](v31, "groupName"));
          os_unfair_lock_lock(&self->_groupLock);
          __int128 v34 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupToRunningTasks,  "objectForKeyedSubscript:",  v33));
          [v34 removeObject:v31];

          uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupToPrerunningTasks,  "objectForKeyedSubscript:",  v33));
          [v35 removeObject:v31];

          uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle(activityGroup)"));
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            id v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet groupName](v31, "groupName"));
            id v38 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupToRunningTasks,  "objectForKeyedSubscript:",  v33));
            uint64_t v39 = [v38 count];
            *(_DWORD *)buf = 138543874;
            v91 = v31;
            v92 = 2112;
            v93 = v37;
            v94 = 2048;
            v95 = v39;
            _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "NO LONGER RUNNING [Not in application -> activity mapping] %{public}@ ...Tasks running in group [%@] are %ld!",  buf,  0x20u);
          }

          int v40 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupToPendingTasks,  "objectForKeyedSubscript:",  v33));
          int v41 = v40;
          if (v40)
          {
            [v40 addObject:v31];
          }

          else
          {
            int v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](&OBJC_CLASS___NSMutableSet, "setWithObject:", v31));
            -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_groupToPendingTasks,  "setObject:forKeyedSubscript:",  v41,  v33);
          }

          os_unfair_lock_unlock(&self->_groupLock);
          os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0LL);
          uint64_t v42 = -[NSMutableSet count](self->_runningTasks, "count") == 0LL;
          -[NSMutableSet removeObject:](self->_prerunningTasks, "removeObject:", v31);
          -[NSMutableSet removeObject:](self->_runningTasks, "removeObject:", v31);
          -[NSMutableSet addObject:](self->_pendingTasks, "addObject:", v31);
          if (!v42) {
            -[NSMutableSet count](self->_runningTasks, "count");
          }
          uint64_t v43 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"runningTasks"));
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          {
            runningTasks = self->_runningTasks;
            *(_DWORD *)buf = 138543362;
            v91 = runningTasks;
            _os_log_debug_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
          }

          os_unfair_recursive_lock_unlock(&self->_activityStateLock);
        }
      }

      uint64_t v60 = [v55 countByEnumeratingWithState:&v61 objects:v96 count:16];
    }

    while (v60);
  }

  -[_DASDaemon cancelActivities:](self, "cancelActivities:", v58);
}

void sub_10007F5B4(_Unwind_Exception *a1)
{
}

void sub_10007F5D0(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007F64C;
  block[3] = &unk_100115120;
  __int128 v3 = *(_OWORD *)(a1 + 32);
  id v1 = *(dispatch_queue_s **)(v3 + 272);
  id v4 = *(id *)(a1 + 48);
  dispatch_async(v1, block);
}

void sub_10007F64C(uint64_t a1)
{
  double v2 = objc_autoreleasePoolPush();
  os_unfair_recursive_lock_lock_with_options(*(void *)(a1 + 32) + 120LL, 0LL);
  __int128 v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 128) objectForKeyedSubscript:*(void *)(a1 + 40)]);
  [v3 minusSet:*(void *)(a1 + 48)];

  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 136) objectForKeyedSubscript:*(void *)(a1 + 40)]);
  if (!v4)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    [*(id *)(*(void *)(a1 + 32) + 136) setObject:v4 forKeyedSubscript:*(void *)(a1 + 40)];
  }

  [v4 unionSet:*(void *)(a1 + 48)];

  os_unfair_recursive_lock_unlock(*(void *)(a1 + 32) + 120LL);
  id v5 = [*(id *)(a1 + 48) mutableCopy];
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v6 = *(id *)(a1 + 48);
  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        __int16 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 startHandler]);

        if (v12) {
          [v5 removeObject:v11];
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }

    while (v8);
  }

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v13 = v5;
  id v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      for (j = 0LL; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend( *(id *)(a1 + 32),  "moveActivityToRunning:",  *(void *)(*((void *)&v18 + 1) + 8 * (void)j),  (void)v18);
      }

      id v15 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }

    while (v15);
  }

  objc_autoreleasePoolPop(v2);
}

void sub_10007F89C(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[2] = sub_10007F91C;
  block[3] = &unk_100115120;
  uint64_t v2 = *(void *)(a1 + 48);
  __int128 v3 = *(dispatch_queue_s **)(*(void *)(a1 + 40) + 272LL);
  block[1] = 3221225472LL;
  void block[4] = v2;
  id v4 = *(id *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  dispatch_async(v3, block);
}

void sub_10007F91C(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_1000B7644();
  }

  __int128 v3 = objc_autoreleasePoolPush();
  id v4 = [*(id *)(a1 + 40) mutableCopy];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  os_unfair_recursive_lock_lock_with_options(*(void *)(a1 + 48) + 32LL, 0LL);
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v6 = *(id *)(a1 + 40);
  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        if ([v11 isBackgroundTaskActivity])
        {
          [v4 removeObject:v11];
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }

    while (v8);
  }

  os_unfair_recursive_lock_unlock(*(void *)(a1 + 48) + 32LL);
  [*(id *)(a1 + 48) runActivitiesAndRemoveUnknown:v4];
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v12 = v5;
  id v13 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (j = 0LL; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend( *(id *)(a1 + 48),  "activityCompleted:",  *(void *)(*((void *)&v18 + 1) + 8 * (void)j),  (void)v18);
      }

      id v14 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }

    while (v14);
  }

  os_unfair_recursive_lock_lock_with_options(*(void *)(a1 + 48) + 120LL, 0LL);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 48) + 136) objectForKeyedSubscript:*(void *)(a1 + 32)]);
  [v17 minusSet:*(void *)(a1 + 40)];

  os_unfair_recursive_lock_unlock(*(void *)(a1 + 48) + 120LL);
  objc_autoreleasePoolPop(v3);
}

void sub_10007FBB4(uint64_t a1)
{
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id obj = *(id *)(a1 + 40);
  id v2 = [obj countByEnumeratingWithState:&v31 objects:v43 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v32;
    uint64_t v5 = (os_unfair_lock_s **)(a1 + 48);
    uint64_t v29 = kNWEndpointKey;
    p_info = &OBJC_METACLASS____DASBackgroundAppKillDemo.info;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v32 != v4) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)v7);
        os_unfair_recursive_lock_lock_with_options(&(*v5)[8], 0LL);
        id v9 = [*(id *)&(*v5)[14]._os_unfair_lock_opaque count];
        [*(id *)&(*v5)[12]._os_unfair_lock_opaque removeObject:v8];
        [*(id *)&(*v5)[14]._os_unfair_lock_opaque removeObject:v8];
        [*(id *)&(*v5)[10]._os_unfair_lock_opaque addObject:v8];
        if (v9) {
          [*(id *)&(*v5)[14]._os_unfair_lock_opaque count];
        }
        int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([p_info + 436 logForCategory:@"runningTasks"]);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          sub_1000B76B8(v41, a1 + 48, &v42, v10);
        }

        os_unfair_recursive_lock_unlock(*(void *)(a1 + 48) + 32LL);
        os_unfair_recursive_lock_lock_with_options(*(void *)(a1 + 48) + 120LL, 0LL);
        id v11 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1 + 48) + 128) objectForKeyedSubscript:*(void *)(a1 + 56)]);
        [v11 unionSet:*(void *)(a1 + 40)];

        id v12 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1 + 48) + 136) objectForKeyedSubscript:*(void *)(a1 + 56)]);
        [v12 minusSet:*(void *)(a1 + 40)];

        os_unfair_recursive_lock_unlock(*(void *)(a1 + 48) + 120LL);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 groupName]);

        if (v13)
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 groupName]);
          os_unfair_lock_lock(*v5 + 3);
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)&(*v5)[26]._os_unfair_lock_opaque objectForKeyedSubscript:v14]);
          [v15 removeObject:v8];

          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)&(*v5)[28]._os_unfair_lock_opaque objectForKeyedSubscript:v14]);
          [v16 removeObject:v8];

          id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([p_info + 436 logForCategory:@"lifecycle(activityGroup)"]);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v8 groupName]);
            __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)&(*v5)[26]._os_unfair_lock_opaque objectForKeyedSubscript:v14]);
            id v20 = [v19 count];
            *(_DWORD *)buf = 138543874;
            uint64_t v36 = v8;
            __int16 v37 = 2112;
            id v38 = v18;
            __int16 v39 = 2048;
            id v40 = v20;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "NO LONGER RUNNING [Failed to activate] %{public}@ ...Tasks running in group [%@] are %ld!",  buf,  0x20u);

            p_info = (__objc2_class_ro **)(&OBJC_METACLASS____DASBackgroundAppKillDemo + 32);
          }

          __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)&(*v5)[24]._os_unfair_lock_opaque objectForKeyedSubscript:v14]);
          if (v21)
          {
            __int128 v22 = v21;
            [v21 addObject:v8];
          }

          else
          {
            __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](&OBJC_CLASS___NSMutableSet, "setWithObject:", v8));
            [*(id *)&(*v5)[24]._os_unfair_lock_opaque setObject:v22 forKeyedSubscript:v14];
          }

          os_unfair_lock_unlock(*v5 + 3);
        }

        if ([*(id *)&(*v5)[52]._os_unfair_lock_opaque requiresNetworkPathMonitoring:v8])
        {
          __int128 v23 = *(void **)&(*v5)[52]._os_unfair_lock_opaque;
          __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v8 uuid]);
          __int128 v25 = (void *)objc_claimAutoreleasedReturnValue( +[_DASNetworkEvaluationMonitor nwParametersForActivity:]( &OBJC_CLASS____DASNetworkEvaluationMonitor,  "nwParametersForActivity:",  v8));
          unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue([v8 userInfo]);
          id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:v29]);
          double v28 = v23;
          p_info = (__objc2_class_ro **)(&OBJC_METACLASS____DASBackgroundAppKillDemo + 32);
          [v28 startMonitoringActivity:v24 withNetworkParameters:v25 withEndpoint:v27];
        }

        id v7 = (char *)v7 + 1;
      }

      while (v3 != v7);
      id v3 = [obj countByEnumeratingWithState:&v31 objects:v43 count:16];
    }

    while (v3);
  }
}

id sub_1000801A4(uint64_t a1)
{
  if ((int)[*(id *)(a1 + 32) pid] >= 1)
  {
    id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle"));
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_1000B7780(a1, v2);
    }
  }

  return [*(id *)(a1 + 40) unload];
}

void sub_100080350(_Unwind_Exception *a1)
{
}

id sub_100080B3C(uint64_t a1, void *a2)
{
  return [a2 suspendActivities:*(void *)(a1 + 32)];
}

uint64_t sub_100080B48(uint64_t a1)
{
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  uint64_t v23 = a1;
  id v2 = *(id *)(a1 + 40);
  id v3 = [v2 countByEnumeratingWithState:&v27 objects:v37 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v28;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v28 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
        if ([v7 isBackgroundTaskActivity])
        {
          id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 assertion]);
          unsigned int v9 = [v8 isValid];

          if (v9)
          {
            int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar"));
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 assertion]);
              signed int v12 = [v11 pid];
              *(_DWORD *)buf = 138412546;
              __int128 v34 = v7;
              __int16 v35 = 2048;
              uint64_t v36 = v12;
              _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "BGTask activity %@ did not respond to suspension. Dropping assertion for app with pid: %ld",  buf,  0x16u);
            }

            id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 assertion]);
            id v26 = 0LL;
            unsigned __int8 v14 = [v13 invalidateWithError:&v26];
            id v15 = v26;

            if ((v14 & 1) == 0)
            {
              uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar"));
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
                sub_1000B7804(v31, v7, &v32, v16);
              }
            }

            id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 clientProvidedIdentifier]);
            __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"setTaskCompleted was not called in time after the BGTask with identifier (%@)'s expiration handler was called.",  v17));

            dispatch_queue_global_t global_queue = dispatch_get_global_queue(-32768LL, 0LL);
            id v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_100080E54;
            block[3] = &unk_100115148;
            void block[4] = v7;
            id v25 = v18;
            id v21 = v18;
            dispatch_async(v20, block);
          }
        }
      }

      id v4 = [v2 countByEnumeratingWithState:&v27 objects:v37 count:16];
    }

    while (v4);
  }

  return os_unfair_recursive_lock_unlock(*(void *)(v23 + 32) + 32LL);
}

void sub_100080E54(uint64_t a1)
{
  uint64_t v1 = a1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) assertion]);
  LOBYTE(v1) = SimulateCrash([v2 pid], 228926736, *(void *)(v1 + 40));

  if ((v1 & 1) == 0)
  {
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1000B7880();
    }
  }

uint64_t sub_100080ED0(uint64_t a1)
{
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v2 = *(id *)(a1 + 40);
  id v3 = [v2 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v36;
    uint64_t v31 = _DASLaunchReasonBackgroundFetch;
    id v30 = v2;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v36 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
        [*(id *)(a1 + 32) releaseAssertion:v7];
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
        unsigned __int8 v9 = [v8 hasPrefix:@"com.apple.dasd"];

        if ((v9 & 1) == 0)
        {
          if (![v7 requestsApplicationLaunch]
            || (uint64_t v10 = objc_claimAutoreleasedReturnValue([v7 startHandler])) == 0
            || (id v11 = (void *)v10,
                signed int v12 = (void *)objc_claimAutoreleasedReturnValue([v7 launchReason]),
                unsigned __int8 v13 = [v12 isEqualToString:v31],
                v12,
                v11,
                (v13 & 1) == 0))
          {
            if ((int)[v7 pid] >= 1)
            {
              uint64_t v14 = objc_claimAutoreleasedReturnValue([v7 suspendRequestDate]);
              if (v14)
              {
                id v15 = (void *)v14;
                unsigned int v16 = [*(id *)(*(void *)(a1 + 32) + 56) containsObject:v7];

                if (v16)
                {
                  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger defaultCategory]( &OBJC_CLASS____DASDaemonLogger,  "defaultCategory"));
                  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                  {
                    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
                    *(_DWORD *)buf = 138412290;
                    id v40 = v18;
                    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Activity %@ asked to suspend 10s ago but has not yet suspended. Generating crash report.",  buf,  0xCu);
                  }

                  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
                  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"XPC Activity %@ did not terminate in timely fashion when asked to suspend. The activity should be frequently checking xpc_activity_should_defer() and correspondingly setting the state to XPC_ACTIVITY_STATE_DEFER or XPC_ACTIVITY_STATE_DONE as appropriate.",  v19));

                  dispatch_queue_global_t global_queue = dispatch_get_global_queue(-32768LL, 0LL);
                  __int128 v22 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
                  block[0] = _NSConcreteStackBlock;
                  block[1] = 3221225472LL;
                  block[2] = sub_1000812B4;
                  block[3] = &unk_100115148;
                  void block[4] = v7;
                  id v34 = v20;
                  id v23 = v20;
                  dispatch_async(v22, block);

                  +[_DASMetricRecorder recordOccurrenceForKey:]( &OBJC_CLASS____DASMetricRecorder,  "recordOccurrenceForKey:",  @"com.apple.dasd.xpc.notdeferred");
                  __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
                  id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.dasd.xpc.notdeferred.%@",  v24));

                  +[_DASMetricRecorder recordOccurrenceForKey:]( &OBJC_CLASS____DASMetricRecorder,  "recordOccurrenceForKey:",  @"com.apple.dasd.xpc.notdeferred");
                  +[_DASMetricRecorder recordOccurrenceForKey:]( &OBJC_CLASS____DASMetricRecorder,  "recordOccurrenceForKey:",  v25);

                  id v2 = v30;
                }
              }
            }

            uint64_t v26 = objc_claimAutoreleasedReturnValue([v7 suspendRequestDate]);
            if (v26)
            {
              __int128 v27 = (void *)v26;
              __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v7 startDate]);

              if (v28)
              {
                v32[0] = _NSConcreteStackBlock;
                v32[1] = 3221225472LL;
                void v32[2] = sub_10008131C;
                v32[3] = &unk_100116EC0;
                v32[4] = *(void *)(a1 + 32);
                v32[5] = v7;
                AnalyticsSendEventLazy(@"com.apple.dasd.delayedSuspension", v32);
              }
            }
          }
        }
      }

      id v4 = [v2 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }

    while (v4);
  }

  return os_unfair_recursive_lock_unlock(*(void *)(a1 + 32) + 32LL);
}

void sub_1000812B4(uint64_t a1)
{
  if ((SimulateCrash([*(id *)(a1 + 32) pid], 14310317, *(void *)(a1 + 40)) & 1) == 0)
  {
    uint64_t v1 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      sub_1000B7880();
    }
  }

id sub_10008131C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  else {
    id v3 = &__kCFBooleanTrue;
  }
  [v2 setObject:v3 forKeyedSubscript:@"suspended"];
  [v2 setObject:&off_100121FC0 forKeyedSubscript:@"limit"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) identifier]);
  id v5 = [v4 copy];
  if ([v4 hasPrefix:@"com.apple."])
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringFromIndex:", objc_msgSend(@"com.apple.", "length")));

    id v5 = (id)v6;
  }

  if ((unint64_t)[v5 length] >= 0x1E)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 substringToIndex:30]);

    id v5 = (id)v7;
  }

  [v2 setObject:v5 forKeyedSubscript:@"identifier"];

  return v2;
}

id sub_100081440(uint64_t a1)
{
  return [*(id *)(a1 + 32) releaseAssertions:*(void *)(a1 + 40)];
}

id sub_1000815FC(uint64_t a1, void *a2)
{
  return [a2 cancelActivities:*(void *)(a1 + 32)];
}

id sub_1000816A8(uint64_t a1, void *a2)
{
  return [a2 activity:*(void *)(a1 + 32) blockedOnPolicies:*(void *)(a1 + 40)];
}

id sub_100081754(uint64_t a1, void *a2)
{
  return [a2 activity:*(void *)(a1 + 32) runWithoutHonoringPolicies:*(void *)(a1 + 40)];
}

void sub_100082124(_Unwind_Exception *a1)
{
}

void sub_1000826A0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_1000826FC(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v63 = a2;
  [a3 score];
  if (+[_DASPolicyResponse isScoreBlocking:](&OBJC_CLASS____DASPolicyResponse, "isScoreBlocking:"))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DASLowPowerModePolicy policyInstance](&OBJC_CLASS____DASLowPowerModePolicy, "policyInstance"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 policyName]);
    if ([v63 isEqualToString:v8])
    {
      int v9 = *(unsigned __int8 *)(a1 + 48);

      if (v9)
      {
LABEL_8:
        uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8LL);
        uint64_t v14 = *(void *)(v13 + 24) | 0x20LL;
LABEL_46:
        *(void *)(v13 + 24) = v14;
        goto LABEL_47;
      }
    }

    else
    {
    }

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPhotosPolicy policyInstance](&OBJC_CLASS____DASPhotosPolicy, "policyInstance"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 policyName]);
    if ([v63 isEqualToString:v11])
    {
      int v12 = *(unsigned __int8 *)(a1 + 49);

      if (v12) {
        goto LABEL_8;
      }
    }

    else
    {
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPhotosPolicy policyInstance](&OBJC_CLASS____DASPhotosPolicy, "policyInstance"));
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 policyName]);
    if ([v63 isEqualToString:v16])
    {
      int v17 = *(unsigned __int8 *)(a1 + 50);

      if (v17)
      {
LABEL_12:
        uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8LL);
        uint64_t v14 = *(void *)(v13 + 24) | 4LL;
        goto LABEL_46;
      }
    }

    else
    {
    }

    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[_DASBatteryLevelPolicy policyInstance](&OBJC_CLASS____DASBatteryLevelPolicy, "policyInstance"));
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 policyName]);
    unsigned int v20 = [v63 isEqualToString:v19];

    if (v20)
    {
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8LL);
      uint64_t v14 = *(void *)(v13 + 24) | 8LL;
      goto LABEL_46;
    }

    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[_DASEnergyBudgetPolicy policyInstance](&OBJC_CLASS____DASEnergyBudgetPolicy, "policyInstance"));
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 policyName]);
    unsigned int v23 = [v63 isEqualToString:v22];

    if (v23)
    {
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8LL);
      uint64_t v14 = *(void *)(v13 + 24) | 2LL;
      goto LABEL_46;
    }

    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDataBudgetPolicy policyInstance](&OBJC_CLASS____DASDataBudgetPolicy, "policyInstance"));
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 policyName]);
    unsigned int v26 = [v63 isEqualToString:v25];

    if (v26)
    {
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8LL);
      uint64_t v14 = *(void *)(v13 + 24) | 1LL;
      goto LABEL_46;
    }

    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(+[_DASNetworkQualityPolicy policyInstance](&OBJC_CLASS____DASNetworkQualityPolicy, "policyInstance"));
    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 policyName]);
    if ([v63 isEqualToString:v28])
    {
      int v29 = *(unsigned __int8 *)(a1 + 51);

      if (v29)
      {
        uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8LL);
        uint64_t v14 = *(void *)(v13 + 24) | 0x10LL;
        goto LABEL_46;
      }
    }

    else
    {
    }

    id v30 = (void *)objc_claimAutoreleasedReturnValue(+[_DASNetworkQualityPolicy policyInstance](&OBJC_CLASS____DASNetworkQualityPolicy, "policyInstance"));
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 policyName]);
    if ([v63 isEqualToString:v31])
    {
      int v32 = *(unsigned __int8 *)(a1 + 52);

      if (v32)
      {
LABEL_30:
        uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8LL);
        uint64_t v14 = *(void *)(v13 + 24) | 0x100LL;
        goto LABEL_46;
      }
    }

    else
    {
    }

    __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(+[_DASNetworkQualityPolicy policyInstance](&OBJC_CLASS____DASNetworkQualityPolicy, "policyInstance"));
    id v34 = (void *)objc_claimAutoreleasedReturnValue([v33 policyName]);
    if ([v63 isEqualToString:v34])
    {
      __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v63]);
      id v36 = [v35 decision];

      if (v36 != (id)100) {
        goto LABEL_30;
      }
    }

    else
    {
    }

    __int128 v37 = (void *)objc_claimAutoreleasedReturnValue(+[_DASCPUUsagePolicy policyInstance](&OBJC_CLASS____DASCPUUsagePolicy, "policyInstance"));
    __int128 v38 = (void *)objc_claimAutoreleasedReturnValue([v37 policyName]);
    unsigned int v39 = [v63 isEqualToString:v38];

    if (v39)
    {
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8LL);
      uint64_t v14 = *(void *)(v13 + 24) | 0x40LL;
      goto LABEL_46;
    }

    id v40 = (void *)objc_claimAutoreleasedReturnValue(+[_DASMemoryPressurePolicy policyInstance](&OBJC_CLASS____DASMemoryPressurePolicy, "policyInstance"));
    int v41 = (void *)objc_claimAutoreleasedReturnValue([v40 policyName]);
    unsigned int v42 = [v63 isEqualToString:v41];

    if (v42)
    {
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8LL);
      uint64_t v14 = *(void *)(v13 + 24) | 0x80LL;
      goto LABEL_46;
    }

    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(+[_DASThermalPolicy policyInstance](&OBJC_CLASS____DASThermalPolicy, "policyInstance"));
    __int128 v44 = (void *)objc_claimAutoreleasedReturnValue([v43 policyName]);
    if ([v63 isEqualToString:v44])
    {
      int v45 = *(unsigned __int8 *)(a1 + 53);

      if (v45)
      {
        uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8LL);
        uint64_t v14 = *(void *)(v13 + 24) | 0x1000LL;
        goto LABEL_46;
      }
    }

    else
    {
    }

    __int128 v46 = (void *)objc_claimAutoreleasedReturnValue(+[_DASThermalPolicy policyInstance](&OBJC_CLASS____DASThermalPolicy, "policyInstance"));
    id v47 = (void *)objc_claimAutoreleasedReturnValue([v46 policyName]);
    unsigned int v48 = [v63 isEqualToString:v47];

    if (v48)
    {
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8LL);
      uint64_t v14 = *(void *)(v13 + 24) | 0x800LL;
      goto LABEL_46;
    }

    __int128 v49 = (void *)objc_claimAutoreleasedReturnValue(+[_DASThunderingHerdPolicy policyInstance](&OBJC_CLASS____DASThunderingHerdPolicy, "policyInstance"));
    __int128 v50 = (void *)objc_claimAutoreleasedReturnValue([v49 policyName]);
    unsigned int v51 = [v63 isEqualToString:v50];

    if (v51)
    {
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8LL);
      uint64_t v14 = *(void *)(v13 + 24) | 0x400LL;
      goto LABEL_46;
    }

    unsigned int v52 = (void *)objc_claimAutoreleasedReturnValue( +[_DASGroupSchedulingPolicy policyInstance]( &OBJC_CLASS____DASGroupSchedulingPolicy,  "policyInstance"));
    id v53 = (void *)objc_claimAutoreleasedReturnValue([v52 policyName]);
    unsigned int v54 = [v63 isEqualToString:v53];

    if (v54)
    {
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8LL);
      uint64_t v14 = *(void *)(v13 + 24) | 0x4000LL;
      goto LABEL_46;
    }

    id v55 = (void *)objc_claimAutoreleasedReturnValue( +[_DASRequiresPluggedInPolicy policyInstance]( &OBJC_CLASS____DASRequiresPluggedInPolicy,  "policyInstance"));
    id v56 = (void *)objc_claimAutoreleasedReturnValue([v55 policyName]);
    if ([v63 isEqualToString:v56])
    {
      int v57 = *(unsigned __int8 *)(a1 + 54);

      if (v57) {
        goto LABEL_12;
      }
    }

    else
    {
    }

    id v58 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDeviceActivityPolicy policyInstance](&OBJC_CLASS____DASDeviceActivityPolicy, "policyInstance"));
    v59 = (void *)objc_claimAutoreleasedReturnValue([v58 policyName]);
    unsigned int v60 = [v63 isEqualToString:v59];

    if (v60)
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) |= 0x8000uLL;
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) |= 4LL * *(unsigned __int8 *)(a1 + 55);
      goto LABEL_47;
    }

    v61 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v63]);
    id v62 = [v61 decision];

    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8LL);
    if (v62 == (id)100)
    {
      *(void *)(v13 + 24) = 0LL;
      *a4 = 1;
      goto LABEL_47;
    }

    uint64_t v14 = *(void *)(v13 + 24) | 0x2000LL;
    goto LABEL_46;
  }

LABEL_47:
}

LABEL_90:
        uint64_t v43 = v57;
        id v11 = 0;
        goto LABEL_91;
      }

      unsigned int v52 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
      id v53 = [v52 containsString:v49];

      if (v53)
      {
        id v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          __int128 v75 = v4;
          goto LABEL_89;
        }

        goto LABEL_90;
      }

      if (v46 != (id)++v48) {
        continue;
      }
      break;
    }

    __int128 v46 = [v44 countByEnumeratingWithState:&v59 objects:v71 count:16];
    id v11 = 1;
    uint64_t v43 = v57;
    if (v46) {
      continue;
    }
    break;
  }

LABEL_91:
  unsigned int v20 = v58;
LABEL_79:

  uint64_t v13 = v56;
LABEL_80:

LABEL_81:
LABEL_82:

  return v11;
}

void sub_100083BD8(id *a1, void *a2, void *a3)
{
  id v7 = a2;
  [a3 doubleValue];
  if (v5 < 2.22507386e-308)
  {
    else {
      uint64_t v6 = a1 + 5;
    }
    [*v6 addObject:v7];
  }
}

void sub_100084704(_Unwind_Exception *a1)
{
}

void sub_100084914(uint64_t a1)
{
  unsigned int v2 = [*(id *)(*(void *)(a1 + 32) + 48) containsObject:*(void *)(a1 + 40)];
  os_unfair_recursive_lock_unlock(*(void *)(a1 + 32) + 32LL);
  if (v2)
  {
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1000B78AC();
    }

    id v4 = *(void **)(a1 + 32);
    double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", *(void *)(a1 + 40)));
    [v4 cancelActivities:v5];
  }

void sub_100084B24( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100084B3C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100084B4C(uint64_t a1)
{
}

void sub_100084B54(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6 = a2;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
  unsigned int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v12 = 138412546;
      id v13 = v6;
      __int16 v14 = 2112;
      uint64_t v15 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%@ was in pre-running. Removing due to submission of %@",  (uint8_t *)&v12,  0x16u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
    *a3 = 1;
  }
}

void sub_100085114(_Unwind_Exception *a1)
{
}

void sub_1000854F4(_Unwind_Exception *a1)
{
}

void sub_100085AA4(_Unwind_Exception *a1)
{
}

void sub_100085ACC(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = (id)objc_claimAutoreleasedReturnValue([v1 tasksNoLongerEligible]);
  [v1 suspendActivities:v2];
}

void sub_100086598(_Unwind_Exception *a1)
{
}

LABEL_45:
  id v56 = (void *)objc_claimAutoreleasedReturnValue([v6 startDate]);
  if (v56)
  {
    int v57 = (void *)objc_claimAutoreleasedReturnValue([v6 startDate]);
    [v46 timeIntervalSinceDate:v57];
    v59 = v58 / 60.0;

    if (v59 > 60.0)
    {
      unsigned int v60 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle"));
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v94 = v6;
        v95 = 2048;
        v96 = v59;
        _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_DEFAULT,  "Activity %{public}@ ran for %lf minutes",  buf,  0x16u);
      }
    }
  }

  v61 = (void *)objc_claimAutoreleasedReturnValue([v6 startDate]);
  if (v61)
  {
    id v62 = (void *)objc_claimAutoreleasedReturnValue([v6 suspendRequestDate]);
    if (v62)
    {

LABEL_58:
      goto LABEL_59;
    }
  }

  id v63 = (void *)objc_claimAutoreleasedReturnValue(+[_DASUrgencyOverridePolicy policyInstance](&OBJC_CLASS____DASUrgencyOverridePolicy, "policyInstance"));
  id v64 = [v63 appliesToActivity:v6];

  if (v61)
  {

    if ((v64 & 1) == 0) {
      goto LABEL_59;
    }
    goto LABEL_57;
  }

  if (v64)
  {
LABEL_57:
    v65 = (void *)objc_claimAutoreleasedReturnValue( +[_DASUrgencyOverridePolicy policyInstance]( &OBJC_CLASS____DASUrgencyOverridePolicy,  "policyInstance"));
    id v66 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
    [v65 removeActivity:v66];

    v61 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPhotosPolicy policyInstance](&OBJC_CLASS____DASPhotosPolicy, "policyInstance"));
    [v61 setIntentSyncIsEngaged:0];
    goto LABEL_58;
  }

id sub_100087094(uint64_t a1)
{
  return [*(id *)(a1 + 32) unprotectedEvaluateScoreAndRunActivities:*(void *)(a1 + 40)];
}

void sub_100087198(_Unwind_Exception *a1)
{
}

id sub_1000871AC(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 removeObject:*(void *)(a1 + 32)];
}

id sub_100087258(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 removeObject:*(void *)(a1 + 32)];
}

void sub_10008730C(_Unwind_Exception *a1)
{
}

id sub_100087320(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 removeObject:*(void *)(a1 + 32)];
}

id sub_1000875AC(uint64_t a1, void *a2, _BYTE *a3)
{
  double v5 = (void *)objc_claimAutoreleasedReturnValue([a2 uuid]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
  id v7 = [v5 isEqual:v6];

  if ((_DWORD)v7) {
    *a3 = 1;
  }
  return v7;
}

void sub_10008761C(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v4, 1LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v1 tasksNoLongerEligibleFromTasks:v2]);
  [v1 suspendActivities:v3];
}

id sub_100087A7C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) limitationResponse]);
  unsigned __int8 v3 = +[_DASLimiterResponse bitmaskFromResponses:]( &OBJC_CLASS____DASLimiterResponse,  "bitmaskFromResponses:",  v2);

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
  id v6 = [v5 copy];
  if ([v5 hasPrefix:@"com.apple."])
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringFromIndex:", objc_msgSend(@"com.apple.", "length")));

    id v6 = (id)v7;
  }

  if ((unint64_t)[v6 length] >= 0x1E)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 substringToIndex:30]);

    id v6 = (id)v8;
  }

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) limitationResponse]);
  unsigned int v10 = +[_DASLimiterResponse queryActivityDecision:fromResponses:]( &OBJC_CLASS____DASLimiterResponse,  "queryActivityDecision:fromResponses:",  5LL,  v9);

  if (v10)
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[_DASRateLimiterUtilities rateLimitIdentifierForActivity:]( &OBJC_CLASS____DASRateLimiterUtilities,  "rateLimitIdentifierForActivity:",  *(void *)(a1 + 32)));

    id v6 = (id)v11;
  }

  [v4 setObject:v6 forKeyedSubscript:@"name"];
  int v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", v3));
  [v4 setObject:v12 forKeyedSubscript:@"limitationsValue"];

  if (v3)
  {
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"limitations"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
      int v16 = 138412546;
      int v17 = v4;
      __int16 v18 = 2112;
      __int128 v19 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Logging limit distribution to CA %@ for activity %@",  (uint8_t *)&v16,  0x16u);
    }
  }

  return v4;
}

id sub_100087CCC(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v4 = *(void *)(a1 + 40);
  unsigned __int8 v3 = (id *)(a1 + 40);
  [*((id *)*(v3 - 1) + 42) maximumRuntimeForActivity:v4];
  double v6 = v5;
  unsigned int v7 = [*((id *)*(v3 - 1) + 42) hasDynamicOverrides:*v3];
  unsigned int v8 = [*((id *)*(v3 - 1) + 42) hasStaticOverrides:*v3];
  unsigned int v9 = @"none";
  if (v8) {
    unsigned int v9 = @"static";
  }
  if (v7) {
    unsigned int v10 = @"dynamic";
  }
  else {
    unsigned int v10 = v9;
  }
  [v2 setObject:v10 forKeyedSubscript:@"overrides"];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v6));
  [v2 setObject:v11 forKeyedSubscript:@"durationLimit"];

  [v2 setObject:&__kCFBooleanTrue forKeyedSubscript:@"runtimeLimitApplies"];
  int v12 = (void *)objc_claimAutoreleasedReturnValue([*v3 limitationResponse]);
  LODWORD(v11) = +[_DASLimiterResponse queryActivityDecision:fromResponses:]( &OBJC_CLASS____DASLimiterResponse,  "queryActivityDecision:fromResponses:",  3LL,  v12);

  if ((_DWORD)v11)
  {
    [v2 setObject:&off_100122050 forKeyedSubscript:@"runtimeLimitCount"];
    [v2 setObject:&__kCFBooleanTrue forKeyedSubscript:@"runtimeSuspended"];
  }

  else if ((v7 | v8) != 1)
  {
    goto LABEL_14;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([*v3 identifier]);
  id v14 = [v13 copy];
  if ([v13 hasPrefix:@"com.apple."])
  {
    uint64_t v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "substringFromIndex:", objc_msgSend(@"com.apple.", "length")));

    id v14 = (id)v15;
  }

  if ((unint64_t)[v14 length] >= 0x1E)
  {
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v14 substringToIndex:30]);

    id v14 = (id)v16;
  }

  [v2 setObject:v14 forKeyedSubscript:@"name"];

LABEL_14:
  uint64_t v17 = objc_claimAutoreleasedReturnValue([*v3 endTime]);
  if (v17
    && (__int16 v18 = (void *)v17,
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([*v3 startDate]),
        v19,
        v18,
        v19))
  {
    unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([*v3 endTime]);
    id v21 = (void *)objc_claimAutoreleasedReturnValue([*v3 startDate]);
    [v21 timeIntervalSinceDate:v20];
    double v23 = v22;
  }

  else
  {
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([*v3 startDate]);

    if (!v24) {
      goto LABEL_23;
    }
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"limitations"));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      sub_1000B7C68(v3, v25);
    }

    unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([*v3 startDate]);
    [v20 timeIntervalSinceNow];
    double v23 = -v26;
  }

  if (v23 > 0.0)
  {
    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v23));
    [v2 setObject:v27 forKeyedSubscript:@"runtimeDuration"];

    goto LABEL_26;
  }

id sub_100089154(uint64_t a1)
{
  return [*(id *)(a1 + 32) activityAnalyticsWithActivity:*(void *)(a1 + 40) didComplete:1];
}

LABEL_25:
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(+[_DASCheckpointRecorder sharedInstance](&OBJC_CLASS____DASCheckpointRecorder, "sharedInstance"));
    [v24 reportTaskCheckpoint:50 forTask:v4 error:0];
    double v23 = 0;
    goto LABEL_26;
  }

                  uint64_t v16 = (char *)v16 + 1;
                }

                while (v14 != v16);
                id v14 = [v36 countByEnumeratingWithState:&v37 objects:v45 count:16];
              }

              while (v14);
            }
          }

          unsigned int v7 = v30;
          double v6 = v31;
          unsigned int v9 = v33;
        }

        unsigned int v9 = (char *)v9 + 1;
      }

      while (v9 != v6);
      double v6 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    }

    while (v6);
  }

  if ([v4 count]) {
    -[_DASDaemon associateActivity:withTriggerKeys:](v29, "associateActivity:withTriggerKeys:", v3, v4);
  }
}

LABEL_28:
    }
  }

  else if (((1LL << v30) & 0x10000100000LL) == 0)
  {
LABEL_14:
    __int128 v28 = -1.0;
    goto LABEL_31;
  }

  if (v73)
  {
    __int128 v28 = v28 / (float)((float)v73 / 100.0);
    goto LABEL_31;
  }

  id v66 = v74;
  v65 = v75;
  v67 = &AnalyticsSendEventLazy_ptr;
  if (v72)
  {
    uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue(+[_DASRuntimeLimiter sharedLimiter](&OBJC_CLASS____DASRuntimeLimiter, "sharedLimiter"));
    [v70 maximumRuntimeForActivity:v74];
    __int128 v28 = v71;
  }

  else
  {
    __int128 v28 = v28 + 3600.0;
  }

id sub_100089CAC(uint64_t a1)
{
  return [*(id *)(a1 + 32) activityAnalyticsWithActivity:*(void *)(a1 + 40) didComplete:0];
}

void sub_10008A484(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  double v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 96) objectForKeyedSubscript:v7]);
  if (!v6)
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    [*(id *)(*(void *)(a1 + 32) + 96) setObject:v6 forKeyedSubscript:v7];
  }

  objc_msgSend(v6, "_DAS_unionSetOverridingExisting:", v5);
}

void sub_10008B6EC(_Unwind_Exception *a1)
{
}

void sub_10008B774(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) groupName]);
  if (v2) {
    [*(id *)(a1 + 40) addPendingActivity:*(void *)(a1 + 32) toGroupWithName:v2];
  }
  +[_DASConditionScore computeOptimalScoreAndDateForActivity:]( &OBJC_CLASS____DASConditionScore,  "computeOptimalScoreAndDateForActivity:",  *(void *)(a1 + 32));
  os_unfair_recursive_lock_lock_with_options(*(void *)(a1 + 40) + 32LL, 0LL);
  [*(id *)(*(void *)(a1 + 40) + 40) addObject:*(void *)(a1 + 32)];
  os_unfair_recursive_lock_unlock(*(void *)(a1 + 40) + 32LL);
  [*(id *)(a1 + 40) addTriggersToActivity:*(void *)(a1 + 32)];
  if ([*(id *)(a1 + 40) shouldEvaluateTask:*(void *)(a1 + 32) atDate:*(void *)(a1 + 48)]
    && [*(id *)(a1 + 40) shouldRunActivityNow:*(void *)(a1 + 32)]
    && [*(id *)(*(void *)(a1 + 40) + 320) executeActivity:*(void *)(a1 + 32)])
  {
    unsigned __int8 v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Running %@ immediately on submission",  (uint8_t *)&v5,  0xCu);
    }

    [*(id *)(a1 + 40) immediatelyBeginWorkForActivity:*(void *)(a1 + 32)];
  }
}

void sub_10008B8C0(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v23 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) startBefore]);
  objc_msgSend(v2, "timeIntervalSinceDate:");
  if (v3 >= 0.0) {
    goto LABEL_14;
  }
  [*(id *)(*(void *)(a1 + 48) + 200) timeIntervalSinceDate:*(void *)(a1 + 32)];
  if (v4 <= 120.0) {
    goto LABEL_14;
  }
  int v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) startBefore]);
  [v5 timeIntervalSinceDate:*(void *)(*(void *)(a1 + 48) + 200)];
  double v7 = v6;

  if (v7 >= 0.0) {
    return;
  }
  if ([*(id *)(a1 + 40) timewiseEligibleAtDate:*(void *)(a1 + 32)])
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) groupName]);
    if (v8)
    {
      unsigned int v9 = (void *)v8;
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) fastPass]);
      if (v10)
      {
      }

      else
      {
        int v12 = *(void **)(a1 + 40);
        uint64_t v11 = *(void **)(a1 + 48);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 groupName]);
        uint64_t v14 = (uint64_t)[v11 additionalCapacityForActivity:v12 inGroupWithName:v13 shouldTryToSuspend:0];

        if (v14 < 1) {
          return;
        }
      }
    }
  }

  if (![*(id *)(a1 + 40) requiresNetwork]
    || [*(id *)(*(void *)(a1 + 48) + 208) isNetworkPathAvailableForActivity:*(void *)(a1 + 40)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL), *(id *)(*(void *)(a1 + 48) + 192LL));
    id v23 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) predictedOptimalStartDate]);
    [v23 timeIntervalSinceDate:*(void *)(*(void *)(a1 + 48) + 192)];
    if (v15 > 0.0)
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) startBefore]);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) predictedOptimalStartDate]);
      [v16 timeIntervalSinceDate:v17];
      double v19 = v18;

      if (v19 > 60.0)
      {
        uint64_t v20 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) predictedOptimalStartDate]);
        uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8LL);
        double v22 = *(void **)(v21 + 40);
        *(void *)(v21 + 40) = v20;
      }

      return;
    }

void sub_10008BBD0(void *a1)
{
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    *(_DWORD *)buf = 138412546;
    uint64_t v26 = v3;
    __int16 v27 = 2112;
    uint64_t v28 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "endLaunchWithReason: Requesting end launch for Application %@ with Reason %@",  buf,  0x16u);
  }

  os_unfair_recursive_lock_lock_with_options(a1[6] + 120LL, 0LL);
  int v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1[6] + 136) objectForKeyedSubscript:a1[4]]);
  double v6 = v5;
  if (v5)
  {
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v7 = [v5 countByEnumeratingWithState:&v21 objects:v31 count:16];
    if (!v7) {
      goto LABEL_17;
    }
    id v9 = v7;
    uint64_t v10 = *(void *)v22;
    *(void *)&__int128 v8 = 138412802LL;
    __int128 v20 = v8;
    while (1)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v6);
        }
        int v12 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "launchReason", v20));
        if ([v13 isEqualToString:a1[5]])
        {
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 assertion]);

          if (!v14) {
            continue;
          }
          double v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v16 = a1[4];
            uint64_t v17 = a1[5];
            *(_DWORD *)buf = v20;
            uint64_t v26 = v16;
            __int16 v27 = 2112;
            uint64_t v28 = v17;
            __int16 v29 = 2112;
            id v30 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "endLaunchWithReason: Ending launch for Application %@ with Reason %@ and Activity %@",  buf,  0x20u);
          }

          id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 assertion]);
          [v13 invalidateWithError:0];
        }
      }

      id v9 = [v6 countByEnumeratingWithState:&v21 objects:v31 count:16];
      if (!v9)
      {
LABEL_17:
        os_unfair_recursive_lock_unlock(a1[6] + 120LL);
        goto LABEL_21;
      }
    }
  }

  os_unfair_recursive_lock_unlock(a1[6] + 120LL);
  double v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = a1[4];
    *(_DWORD *)buf = 138412290;
    uint64_t v26 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "endLaunchWithReason: No activities found for Application %@",  buf,  0xCu);
  }

LABEL_21:
}

LABEL_65:
      id v7 = 0;
      goto LABEL_76;
    }
  }

  if (!-[_DASBARScheduler backgroundLaunchAllowedForBGTaskActivity:]( self->_barScheduler,  "backgroundLaunchAllowedForBGTaskActivity:",  v6))
  {
    if (a4)
    {
      uint64_t v16 = _DASActivitySchedulerErrorDomain;
      uint64_t v17 = 2LL;
LABEL_64:
      id v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v16,  v17,  0LL));
      goto LABEL_76;
    }

    goto LABEL_65;
  }

  id v56 = a4;
  os_unfair_recursive_lock_lock_with_options(&self->_applicationLaunchRequestsLock, 0LL);
  id v55 = self;
  int v57 = v9;
  int v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_applicationLaunchRequests,  "objectForKeyedSubscript:",  v9));
  id v13 = [v12 mutableCopy];
  uint64_t v14 = v13;
  v61 = v6;
  if (v13) {
    double v15 = v13;
  }
  else {
    double v15 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  }
  double v18 = v15;

  os_unfair_recursive_lock_unlock(&self->_applicationLaunchRequestsLock);
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v67 = 0u;
  id v68 = 0u;
  id v69 = 0u;
  uint64_t v70 = 0u;
  uint64_t v19 = v18;
  __int128 v20 = [v19 countByEnumeratingWithState:&v67 objects:v74 count:16];
  if (v20)
  {
    __int128 v21 = v20;
    __int128 v22 = *(void *)v68;
    do
    {
      __int128 v23 = 0LL;
      do
      {
        if (*(void *)v68 != v22) {
          objc_enumerationMutation(v19);
        }
        __int128 v24 = *(void **)(*((void *)&v67 + 1) + 8LL * (void)v23);
        if ([v24 isBackgroundTaskActivity])
        {
          id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 clientProvidedIdentifier]);
          self = (_DASDaemon *)objc_claimAutoreleasedReturnValue(-[_DASDaemon clientProvidedIdentifier](v61, "clientProvidedIdentifier"));
          uint64_t v26 = [v25 isEqualToString:self];

          __int16 v27 = -[_DASDaemon isContactTracingBackgroundActivity]( v61,  "isContactTracingBackgroundActivity");
          if (v26)
          {
            if (v27 && [v24 isContactTracingBackgroundActivity])
            {
              uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue([v24 clientProvidedStartDate]);
              if (v28) {
                goto LABEL_24;
              }
              uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[_DASDaemon clientProvidedStartDate](v61, "clientProvidedStartDate"));
              if (v28) {
                goto LABEL_24;
              }
              self = (_DASDaemon *)[v24 requiresPlugin];
              id v30 = [v24 requiresNetwork];
              if (v30 == -[_DASDaemon requiresNetwork](v61, "requiresNetwork"))
              {
                uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v24 startAfter]);
                self = v61;
                -[_DASDaemon setStartAfter:](v61, "setStartAfter:", v31);

                int v32 = (void *)objc_claimAutoreleasedReturnValue([v24 startBefore]);
                -[_DASDaemon setStartBefore:](v61, "setStartBefore:", v32);

                uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"exposure-notification"));
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Pending identical task", buf, 2u);
                }

LABEL_31:
        __int128 v23 = (char *)v23 + 1;
      }

      while (v21 != v23);
      __int128 v33 = [v19 countByEnumeratingWithState:&v67 objects:v74 count:16];
      __int128 v21 = v33;
    }

    while (v33);
  }

  [v19 minusSet:v59];
  [v19 addObject:v61];
  v65 = 0u;
  id v66 = 0u;
  id v63 = 0u;
  id v64 = 0u;
  id obj = v19;
  __int16 v34 = [obj countByEnumeratingWithState:&v63 objects:v73 count:16];
  if (!v34)
  {
    id v36 = 0LL;
    unsigned int v60 = 0LL;
    goto LABEL_51;
  }

  __int128 v35 = v34;
  id v36 = 0LL;
  unsigned int v60 = 0LL;
  __int128 v37 = *(void *)v64;
  __int128 v38 = _DASLaunchReasonBackgroundProcessing;
  unsigned int v39 = _DASLaunchReasonHealthResearch;
  id v58 = _DASLaunchReasonBackgroundRefresh;
  do
  {
    for (i = 0LL; i != v35; i = (char *)i + 1)
    {
      if (*(void *)v64 != v37) {
        objc_enumerationMutation(obj);
      }
      int v41 = *(void **)(*((void *)&v63 + 1) + 8LL * (void)i);
      unsigned int v42 = (void *)objc_claimAutoreleasedReturnValue([v41 launchReason]);
      if ([v42 isEqualToString:v38])
      {

LABEL_45:
        ++v36;
        continue;
      }

      self = (_DASDaemon *)objc_claimAutoreleasedReturnValue([v41 launchReason]);
      uint64_t v43 = -[_DASDaemon isEqualToString:](self, "isEqualToString:", v39);

      if (v43) {
        goto LABEL_45;
      }
      __int128 v44 = (void *)objc_claimAutoreleasedReturnValue([v41 launchReason]);
      self = (_DASDaemon *)[v44 isEqualToString:v58];

      v60 += self;
    }

    __int128 v35 = [obj countByEnumeratingWithState:&v63 objects:v73 count:16];
  }

  while (v35);
LABEL_51:

  double v6 = v61;
  if ([v59 count])
  {
    int v45 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"BackgroundTasks"));
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v72 = v59;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Removing pending tasks: %@", buf, 0xCu);
    }

    __int128 v46 = [v59 copy];
    -[_DASDaemon cancelActivities:](v55, "cancelActivities:", v46);
  }

  id v47 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon launchReason](v61, "launchReason"));
  unsigned int v48 = [v47 isEqualToString:_DASLaunchReasonBackgroundProcessing];
  if ((v48 & 1) != 0)
  {
    __int128 v49 = v36 > 0xA;
    __int128 v50 = v56;
    id v9 = v57;
    if (v49)
    {
      unsigned int v51 = 1;
    }

    else
    {
LABEL_67:
      unsigned int v52 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon launchReason](v61, "launchReason"));
      id v53 = [v52 isEqualToString:_DASLaunchReasonBackgroundRefresh];
      if (v60 > 1) {
        unsigned int v51 = v53;
      }
      else {
        unsigned int v51 = 0;
      }

      if ((v48 & 1) == 0) {
        goto LABEL_71;
      }
    }
  }

  else
  {
    self = (_DASDaemon *)objc_claimAutoreleasedReturnValue(-[_DASDaemon launchReason](v61, "launchReason"));
    if (!-[_DASDaemon isEqualToString:](self, "isEqualToString:", _DASLaunchReasonHealthResearch)
      || v36 <= 0xA)
    {
      __int128 v50 = v56;
      id v9 = v57;
      goto LABEL_67;
    }

    unsigned int v51 = 1;
    __int128 v50 = v56;
    id v9 = v57;
LABEL_71:
  }

  id v7 = v51 ^ 1;
  if (v50 && v51) {
    *__int128 v50 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  _DASActivitySchedulerErrorDomain,  4LL,  0LL));
  }

LABEL_76:
LABEL_77:

  return v7;
}

void sub_10008CC78(uint64_t a1)
{
  uint64_t v1 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar"));
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    sub_1000B7F5C(a1, v1, v2, v3, v4, v5, v6, v7);
  }

  id obj = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connectedBGTaskClients]);
  objc_sync_enter(obj);
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activitiesWaitingForBGTaskClients]);
  __int128 v24 = (int *)(a1 + 40);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40)));
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v9]);

  if ([v26 count])
  {
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000B7EE8(v24, v10);
    }

    os_unfair_recursive_lock_lock_with_options(*(void *)(a1 + 32) + 32LL, 0LL);
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id v11 = v26;
    id v12 = [v11 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v30;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v30 != v13) {
            objc_enumerationMutation(v11);
          }
          double v15 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 assertion]);
          id v28 = 0LL;
          unsigned __int8 v17 = [v16 invalidateWithError:&v28];
          id v18 = v28;

          if (v18) {
            char v19 = v17;
          }
          else {
            char v19 = 1;
          }
          if ((v19 & 1) == 0)
          {
            __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar"));
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v15 assertion]);
              *(_DWORD *)buf = 138412546;
              __int16 v34 = v21;
              __int16 v35 = 2112;
              id v36 = v18;
              _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Error invalidating assertion %@: %@",  buf,  0x16u);
            }
          }
        }

        id v12 = [v11 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }

      while (v12);
    }

    os_unfair_recursive_lock_unlock(*(void *)(a1 + 32) + 32LL);
  }

  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activitiesWaitingForBGTaskClients]);
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *v24));
  [v22 removeObjectForKey:v23];

  objc_sync_exit(obj);
}

void sub_10008CFA0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10008D368(_Unwind_Exception *a1)
{
}

int64_t sub_10008D650(id a1, _DASActivity *a2, _DASActivity *a3)
{
  uint64_t v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivity startBefore](a2, "startBefore"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivity startBefore](v4, "startBefore"));

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

int64_t sub_10008D75C(id a1, _DASActivity *a2, _DASActivity *a3)
{
  uint64_t v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivity startBefore](a2, "startBefore"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivity startBefore](v4, "startBefore"));

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

void sub_10008D8A0(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v7 startedTasks]);
  objc_sync_enter(v3);
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v7 startedTasks]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allObjects]);
  [v4 addObjectsFromArray:v6];

  objc_sync_exit(v3);
}

void sub_10008D928(_Unwind_Exception *a1)
{
}

int64_t sub_10008D93C(id a1, _DASActivity *a2, _DASActivity *a3)
{
  uint64_t v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivity startBefore](a2, "startBefore"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivity startBefore](v4, "startBefore"));

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

id sub_10008DFB0(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) shouldRunActivityNow:*(void *)(a1 + 40)];
  if ((_DWORD)result)
  {
    id result = [*(id *)(*(void *)(a1 + 32) + 320) executeActivity:*(void *)(a1 + 40)];
    if ((_DWORD)result)
    {
      uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 48);
        uint64_t v4 = *(void *)(a1 + 56);
        v6[0] = 67109378;
        v6[1] = v4;
        __int16 v7 = 2112;
        uint64_t v8 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "With %i urgency level, running %@ immediately on submission",  (uint8_t *)v6,  0x12u);
      }

      return [*(id *)(a1 + 32) immediatelyBeginWorkForActivity:*(void *)(a1 + 40)];
    }
  }

  return result;
}

void sub_10008E628(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( NSNumber,  "numberWithDouble:",  (double)(unint64_t)[v3 countForObject:v4]));
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v4];
}

uint64_t sub_10008E6A0(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  __int16 v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:a2]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v6]);

  id v9 = [v7 compare:v8];
  if (v9 == (id)1) {
    return -1LL;
  }
  else {
    return 1LL;
  }
}

void sub_10008ECD4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( NSNumber,  "numberWithDouble:",  (double)(unint64_t)[v3 countForObject:v4]));
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v4];

  id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( NSNumber,  "numberWithDouble:",  (double)(unint64_t)[*(id *)(a1 + 56) countForObject:v4]));
  [*(id *)(a1 + 48) setObject:v6 forKeyedSubscript:v4];
}

uint64_t sub_10008ED8C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  __int16 v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:a2]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v6]);

  id v9 = [v7 compare:v8];
  if (v9 == (id)1) {
    return -1LL;
  }
  else {
    return 1LL;
  }
}

void sub_10008FB78( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10008FB90(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) evaluatePolicies:*(void *)(a1 + 40)]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10008FCA8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_10008FCC0(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 pendingTasks]);
  *(_BYTE *)(*(void *)(a1[6] + 8) + 24) = [v2 evaluateAllActivitiesFor:v3 writingToFile:a1[5]];

  id v4 = (void *)a1[4];
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 prerunningTasks]);
  unsigned int v6 = [v4 evaluateAllActivitiesFor:v5 writingToFile:a1[5]];
  BOOL v7 = 0;
  uint64_t v8 = *(void *)(a1[6] + 8LL);
  if (v6) {
    BOOL v7 = *(_BYTE *)(v8 + 24) != 0;
  }
  *(_BYTE *)(v8 + 24) = v7;

  id v9 = (void *)a1[4];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 runningTasks]);
  unsigned int v11 = [v9 evaluateAllActivitiesFor:v10 writingToFile:a1[5]];
  uint64_t v12 = *(void *)(a1[6] + 8LL);
  if (v11) {
    BOOL v13 = *(_BYTE *)(v12 + 24) != 0;
  }
  else {
    BOOL v13 = 0;
  }
  *(_BYTE *)(v12 + 24) = v13;

  return os_unfair_recursive_lock_unlock(a1[4] + 32LL);
}

void sub_10008FE4C(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6 = a2;
  BOOL v7 = objc_autoreleasePoolPush();
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v8 = (void **)(a1 + 40);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([@"\n" dataUsingEncoding:4]);
  unsigned int v11 = *v8;
  id v17 = 0LL;
  unsigned int v12 = [v11 writeData:v10 error:&v17];
  id v13 = v17;
  uint64_t v14 = v13;
  if (v12) {
    BOOL v15 = v13 == 0LL;
  }
  else {
    BOOL v15 = 0;
  }
  if (!v15)
  {
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1000B8084();
    }

    *a4 = 1;
  }

  objc_autoreleasePoolPop(v7);
}

void sub_1000906A8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, char a43)
{
}

void sub_1000906F0(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) evaluatePolicies:*(void *)(a1 + 40)]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100092604(uint64_t a1, void *a2)
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v3 = a2;
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8LL * (void)i);
        uint64_t v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getActivityWithUUID:", v8, (void)v12));
        uint64_t v10 = *(void *)(a1 + 32);
        if (!v9)
        {
          [*(id *)(v10 + 208) stopMonitoringActivity:v8];
          goto LABEL_11;
        }

        unsigned int v11 = (void *)v9;
        [*(id *)(v10 + 304) addWorkItem:v9];
      }

      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

LABEL_36:
LABEL_37:
          v65 = self->_triggerToActivitiesMap;
          objc_sync_enter(v65);
          __int128 v29 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_triggerToActivitiesMap,  "objectForKeyedSubscript:",  v59));

          if (v29)
          {
            __int128 v30 = [v59 isEqualToString:@"com.apple.das.fileprotectionpolicy.statuschanged"];
            triggerToActivitiesMap = self->_triggerToActivitiesMap;
            if (v30)
            {
              __int128 v32 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( triggerToActivitiesMap,  "objectForKeyedSubscript:",  v59));
              __int128 v74 = 0u;
              __int128 v75 = 0u;
              id v72 = 0u;
              v73 = 0u;
              id v69 = v32;
              __int128 v33 = [v69 countByEnumeratingWithState:&v72 objects:v92 count:16];
              if (!v33) {
                goto LABEL_50;
              }
              __int16 v34 = *(void *)v73;
              while (1)
              {
                for (j = 0LL; j != v33; j = (char *)j + 1)
                {
                  if (*(void *)v73 != v34) {
                    objc_enumerationMutation(v69);
                  }
                  id v36 = *(void **)(*((void *)&v72 + 1) + 8LL * (void)j);
                  __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([v36 fileProtection]);
                  __int128 v38 = (void *)objc_claimAutoreleasedReturnValue(+[_DASFileProtection complete](&OBJC_CLASS____DASFileProtection, "complete"));
                  if ([v37 isEqual:v38])
                  {
                  }

                  else
                  {
                    unsigned int v39 = (void *)objc_claimAutoreleasedReturnValue([v36 fileProtection]);
                    id v40 = (void *)objc_claimAutoreleasedReturnValue( +[_DASFileProtection completeUnlessOpen]( &OBJC_CLASS____DASFileProtection,  "completeUnlessOpen"));
                    int v41 = [v39 isEqual:v40];

                    if (!v41) {
                      continue;
                    }
                  }

                  [v63 addObject:v36];
                }

                __int128 v33 = [v69 countByEnumeratingWithState:&v72 objects:v92 count:16];
                if (!v33)
                {
LABEL_50:

                  unsigned int v42 = v69;
                  goto LABEL_52;
                }
              }
            }

            unsigned int v42 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( triggerToActivitiesMap,  "objectForKeyedSubscript:",  v59));
            [v63 unionSet:v42];
LABEL_52:
          }

          uint64_t v9 = (os_log_s *)v65;
          objc_sync_exit(v65);
LABEL_54:

          continue;
        }
      }

      id v55 = [obj countByEnumeratingWithState:&v84 objects:v95 count:16];
    }

    while (v55);
  }

  uint64_t v43 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle"));
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v44 = [v63 count];
    *(_DWORD *)buf = 134217984;
    v89 = v44;
    _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "Evaluating %llu activities based on triggers",  buf,  0xCu);
  }

  context = self->_context;
  __int128 v46 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForCallInProgressStatus]( &OBJC_CLASS____CDContextQueries,  "keyPathForCallInProgressStatus"));
  id v47 = (void *)objc_claimAutoreleasedReturnValue(-[_CDLocalContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v46));
  LOBYTE(context) = [v47 BOOLValue];

  if ([v57 containsObject:@"com.apple.duetactivityscheduler.pluggedinpolicy.ispluggedin"])
  {
    -[_DASDaemon determineNextTimerFireDateAndSchedule](self, "determineNextTimerFireDateAndSchedule");
    -[_DASDaemon evaluateAssertions](self, "evaluateAssertions");
  }

  if (([v57 containsObject:@"com.apple.duetactivityscheduler.databudgetpolicy.status"] & 1) != 0 || (objc_msgSend( v57,  "containsObject:",  @"com.apple.duetactivityscheduler.energybudgetpolicy.status") & 1) != 0 || objc_msgSend( v57,  "containsObject:",  @"com.apple.dueatctivityscheduler.photospolicy.photoswork"))
  {
    if (self->_photosIsBlocked)
    {
      if (+[_DASDataBudgetPolicy budgetIsPositive:]( &OBJC_CLASS____DASDataBudgetPolicy,  "budgetIsPositive:",  self->_context))
      {
        if (+[_DASEnergyBudgetPolicy budgetIsPositive:]( &OBJC_CLASS____DASEnergyBudgetPolicy,  "budgetIsPositive:",  self->_context))
        {
          unsigned int v48 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPhotosPolicy policyInstance](&OBJC_CLASS____DASPhotosPolicy, "policyInstance"));
          __int128 v49 = [v48 haveSignificantWorkRemaining:self->_context];

          if ((v49 & 1) == 0)
          {
            __int128 v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              unsigned int v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_photosIsBlocked));
              *(_DWORD *)buf = 138543618;
              v89 = obj;
              v90 = 2112;
              v91 = v51;
              _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "Reporting photos activity no longer blocked: %{public}@ (was %@)",  buf,  0x16u);
            }

            -[_DASDaemon updateiCPLTasksBlocked:](self, "updateiCPLTasksBlocked:", 0LL);
          }
        }
      }
    }
  }

  +[_DASMetricRecorder incrementOccurrencesForKey:byCount:]( &OBJC_CLASS____DASMetricRecorder,  "incrementOccurrencesForKey:byCount:",  @"com.apple.das.triggercount",  1LL);
}

void sub_1000930F8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, id obj)
{
}

void sub_100093598(_Unwind_Exception *a1)
{
}

void sub_1000936C0(uint64_t a1, void *a2)
{
  id v22 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) keyPaths]);
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id obj = v3;
  id v4 = [v3 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v29;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v29 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 576) objectForKeyedSubscript:v8]);
          *(_DWORD *)buf = 138412546;
          __int16 v34 = v8;
          __int16 v35 = 2112;
          id v36 = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Trigger: %@ is now [%@]", buf, 0x16u);
        }

        [*(id *)(*(void *)(a1 + 40) + 288) addWorkItem:v8];
      }

      id v5 = [obj countByEnumeratingWithState:&v28 objects:v37 count:16];
    }

    while (v5);
  }

  [*(id *)(*(void *)(a1 + 40) + 280) addWorkItem:v22];
  if ([*(id *)(a1 + 48) isEqualToString:@"com.apple.das.apppolicy.appchanged"])
  {
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( +[_DASApplicationPolicy focalApplicationsWithContext:]( &OBJC_CLASS____DASApplicationPolicy,  "focalApplicationsWithContext:",  *(void *)(*(void *)(a1 + 40) + 576LL)));
    id v13 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v25;
      do
      {
        for (j = 0LL; j != v14; j = (char *)j + 1)
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)j);
          if ([v17 length])
          {
            id v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dk_dedup"));
            [v11 addObject:v18];
          }
        }

        id v14 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }

      while (v14);
    }

    char v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v34 = v11;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Foreground apps changed—-%@", buf, 0xCu);
    }

    __int128 v20 = *(void **)(*(void *)(a1 + 40) + 584LL);
    id v21 = [v11 copy];
    [v20 handleAppsForegrounded:v21];
  }
}

void sub_100094260(_Unwind_Exception *a1)
{
}

LABEL_46:
}

void sub_100095140( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, char a45)
{
}

uint64_t sub_10009516C(uint64_t a1)
{
  uint64_t result = IOPMAssertionRelease(*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
  return result;
}

uint64_t sub_1000952B4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  id v8 = v6;
  id v9 = [v7 schedulingPriority];
  if ((unint64_t)v9 >= _DASSchedulingPriorityUserInitiated)
  {
    id v10 = [v8 schedulingPriority];
  }

  id v11 = [v8 schedulingPriority];
  if ((unint64_t)v11 >= _DASSchedulingPriorityUserInitiated)
  {
    id v12 = [v7 schedulingPriority];
  }

  id v13 = [v7 schedulingPriority];
  if ((unint64_t)v13 >= _DASSchedulingPriorityUserInitiated)
  {
    id v14 = [v8 schedulingPriority];
    if ((unint64_t)v14 >= _DASSchedulingPriorityUserInitiated)
    {
      __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
      if ([v29 hasPrefix:@"nsurl-av"])
      {
        __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
        unsigned __int8 v31 = [v30 hasPrefix:@"nsurl-av"];

        if ((v31 & 1) != 0) {
          goto LABEL_7;
        }
      }

      else
      {
      }

      __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v8 submitDate]);
      uint64_t v33 = objc_claimAutoreleasedReturnValue([v7 submitDate]);
      goto LABEL_44;
    }
  }

id sub_100095864(uint64_t a1)
{
  return [*(id *)(a1 + 40) unprotectedEvaluateScoreAndRunActivities:*(void *)(a1 + 48)];
}

void sub_100095E04(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 40) + 40) mutableCopy];
  os_unfair_recursive_lock_unlock(*(void *)(a1 + 40) + 32LL);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [v2 count];
    uint64_t v5 = *(void *)(a1 + 48);
    int v6 = 134218242;
    id v7 = v4;
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Rescoring all %lu activities [%@]",  (uint8_t *)&v6,  0x16u);
  }

  [*(id *)(a1 + 40) unprotectedEvaluateScoreAndRunActivities:v2];
}

LABEL_19:
  return v8;
}

void sub_100097294( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1000972C4(void *a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if ([v10 isEqualToString:_DASUpdateActivityXPCActivityNameKey])
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      uint64_t v7 = a1[4];
LABEL_10:
      objc_storeStrong((id *)(*(void *)(v7 + 8) + 40LL), a3);
    }
  }

  else if ([v10 isEqualToString:_DASUpdateActivityErrorKey])
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSError);
    if ((objc_opt_isKindOfClass(v5, v8) & 1) != 0)
    {
      uint64_t v7 = a1[5];
      goto LABEL_10;
    }
  }

  else if ([v10 isEqualToString:_DASUpdateActivityXPCActivityClientStringKey])
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v5, v9) & 1) != 0)
    {
      uint64_t v7 = a1[6];
      goto LABEL_10;
    }
  }
}

NSMutableDictionary *sub_100097470(uint64_t a1)
{
  id v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v3 = objc_alloc(&OBJC_CLASS___NSString);
  [*(id *)(a1 + 32) timeIntervalSince1970];
  id v5 = -[NSString initWithFormat:](v3, "initWithFormat:", @"%f", v4);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v5, @"startDate");

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) name]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v6, @"name");

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) bundleId]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v7, @"bundleID");

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) clientName]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v8, @"clientName");

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) clientProvidedStartDate]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v9,  @"clientProvidedStartDate");

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [*(id *)(a1 + 40) delayedStart]));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v10, @"delayedStart");

  uint64_t v11 = -[NSString initWithFormat:]( [NSString alloc],  "initWithFormat:",  @"%lu",  [*(id *)(a1 + 40) downloadSize]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v11, @"downloadSize");

  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [*(id *)(a1 + 40) diskIntensive]));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v12, @"diskIntensive");

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [*(id *)(a1 + 40) darkWakeEligible]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v13,  @"darkWakeEligible");

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) groupName]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v14, @"groupName");

  [*(id *)(a1 + 40) interval];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v15, @"interval");

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [*(id *)(a1 + 40) memoryIntensive]));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v16, @"memoryIntensive");

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [*(id *)(a1 + 40) preventDeviceSleep]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v17,  @"preventDeviceSleep");

  id v18 = objc_alloc(&OBJC_CLASS___NSString);
  [*(id *)(a1 + 40) percentCompleted];
  uint64_t v20 = -[NSString initWithFormat:](v18, "initWithFormat:", @"%f", v19);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v20,  @"percentCompleted");

  id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [*(id *)(a1 + 40) preClearedMode]));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v21, @"preClearedMode");

  id v22 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) predictedOptimalStartDate]);
  [v23 timeIntervalSince1970];
  __int128 v25 = -[NSString initWithFormat:](v22, "initWithFormat:", @"%f", v24);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v25,  @"predictedOptimalStartDate");

  id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [*(id *)(a1 + 40) requiresNetwork]));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v26, @"requiresNetwork");

  id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [*(id *)(a1 + 40) requiresDeviceInactivity]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v27,  @"requiresDeviceInactivity");

  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [*(id *)(a1 + 40) requestsApplicationLaunch]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v28,  @"requestsApplicationLaunch");

  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [*(id *)(a1 + 40) requiresInexpensiveNetworking]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v29,  @"requiresInexpensiveNetworking");

  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [*(id *)(a1 + 40) requiresUnconstrainedNetworking]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v30,  @"requiresUnconstrainedNetworking");

  unsigned __int8 v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [*(id *)(a1 + 40) runOnAppForeground]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v31,  @"runOnAppForeground");

  __int128 v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [*(id *)(a1 + 40) requiresSignificantUserInactivity]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v32,  @"requiresSignificantUserInactivity");

  uint64_t v33 = objc_alloc(&OBJC_CLASS___NSString);
  __int16 v34 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) startAfter]);
  [v34 timeIntervalSince1970];
  id v36 = -[NSString initWithFormat:](v33, "initWithFormat:", @"%f", v35);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v36, @"startAfter");

  id v37 = objc_alloc(&OBJC_CLASS___NSString);
  id v38 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) submitDate]);
  [v38 timeIntervalSince1970];
  id v40 = -[NSString initWithFormat:](v37, "initWithFormat:", @"%f", v39);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v40, @"submitDate");

  int v41 = objc_alloc(&OBJC_CLASS___NSString);
  id v42 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) startBefore]);
  [v42 timeIntervalSince1970];
  __int128 v44 = -[NSString initWithFormat:](v41, "initWithFormat:", @"%f", v43);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v44, @"startBefore");

  int v45 = -[NSString initWithFormat:]( [NSString alloc],  "initWithFormat:",  @"%lu",  [*(id *)(a1 + 40) uploadSize]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v45, @"uploadSize");

  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [*(id *)(a1 + 40) wasForceRun]));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v46, @"wasForceRun");

  return v2;
}

void sub_100098464(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  id v5 = *(os_unfair_lock_s **)(a1 + 32);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    os_unfair_lock_lock(v5 + 5);
    [*(id *)(*(void *)(a1 + 32) + 560) addObject:v3];
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
    uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    xpc_connection_set_target_queue((xpc_connection_t)v3, v7);

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    void v9[2] = sub_10009856C;
    v9[3] = &unk_100117248;
    v9[4] = *(void *)(a1 + 32);
    id v8 = v3;
    id v10 = v8;
    xpc_connection_set_event_handler((xpc_connection_t)v8, v9);
    xpc_connection_activate((xpc_connection_t)v8);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 20LL));
  }

  else
  {
    -[os_unfair_lock_s _unexpectedXPCObject:WithLog:]( v5,  "_unexpectedXPCObject:WithLog:",  v3,  @"Prewarm suspend listener received unexpected message");
  }
}

id sub_10009856C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _prewarmSuspendHandleIncoming:a2 onConnection:*(void *)(a1 + 40)];
}

void sub_100098E74(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

void sub_100098EB8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.duetactivityscheduler", "default");
  id v2 = (void *)qword_100157C60;
  qword_100157C60 = (uint64_t)v1;

  uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v4 = (void *)qword_100157C68;
  qword_100157C68 = v3;

  uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v6 = (void *)qword_100157C70;
  qword_100157C70 = v5;

  uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v8 = (void *)qword_100157C78;
  qword_100157C78 = v7;

  dword_100157C80 = 0;
}

void sub_100099378( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100099398(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained handleClientInterruption];
    id WeakRetained = v2;
  }
}

void sub_100099550(_Unwind_Exception *a1)
{
}

void sub_100099640( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

id sub_100099658(void *a1, void *a2, _BYTE *a3)
{
  uint64_t v5 = (void *)a1[4];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a2 name]);
  id v7 = [v5 containsObject:v6];

  if ((_DWORD)v7)
  {
    if (++*(void *)(*(void *)(a1[5] + 8LL) + 24LL) == a1[6]) {
      *a3 = 1;
    }
  }

  return v7;
}

void sub_100099A44(_Unwind_Exception *a1)
{
}

void sub_100099C1C(_Unwind_Exception *a1)
{
}

void sub_100099DD8(_Unwind_Exception *a1)
{
}

void sub_10009A068(_Unwind_Exception *a1)
{
}

void sub_10009A23C(_Unwind_Exception *a1)
{
}

void sub_10009A3BC(_Unwind_Exception *a1)
{
}

void sub_10009A588(_Unwind_Exception *a1)
{
}

void sub_10009A688(_Unwind_Exception *a1)
{
}

void sub_10009A770(_Unwind_Exception *a1)
{
}

void sub_10009A938(_Unwind_Exception *a1)
{
}

void sub_10009AAD0(_Unwind_Exception *a1)
{
}

void sub_10009ABC4(_Unwind_Exception *a1)
{
}

void sub_10009AD90(_Unwind_Exception *a1)
{
}

void sub_10009AEE0(_Unwind_Exception *a1)
{
}

void sub_10009AF70(_Unwind_Exception *a1)
{
}

void sub_10009B50C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
}

uint64_t sub_10009B550(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10009B560(uint64_t a1)
{
}

void sub_10009B568(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), obj);
}

void sub_10009C588(_Unwind_Exception *a1)
{
}

void sub_10009C788(_Unwind_Exception *a1)
{
}

void sub_10009CA40(_Unwind_Exception *a1)
{
}

void sub_10009F2AC(id a1)
{
  os_log_t v1 = objc_autoreleasePoolPush();
  uint64_t v2 = objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL____DASActivitySchedulerClient));
  uint64_t v3 = (void *)qword_100157C90;
  qword_100157C90 = v2;

  uint64_t v4 = (void *)qword_100157C90;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSMutableSet);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSSet);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS____DASActivity);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 3LL));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5, v7, v8));
  [v4 setClasses:v6 forSelector:"handleLaunchFromDaemonForActivities:" argumentIndex:0 ofReply:0];

  objc_autoreleasePoolPop(v1);
}

void sub_10009F3C4(id a1)
{
  os_log_t v1 = objc_autoreleasePoolPush();
  uint64_t v2 = objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL____DASActivityOmnibusScheduling));
  uint64_t v3 = (void *)qword_100157CA0;
  qword_100157CA0 = v2;

  uint64_t v4 = (void *)qword_100157CA0;
  v27[0] = objc_opt_class(&OBJC_CLASS___NSArray);
  v27[1] = objc_opt_class(&OBJC_CLASS____DASActivity);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v27, 2LL));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5));
  [v4 setClasses:v6 forSelector:"submitActivities:" argumentIndex:0 ofReply:0];

  uint64_t v7 = (void *)qword_100157CA0;
  v26[0] = objc_opt_class(&OBJC_CLASS___NSArray);
  v26[1] = objc_opt_class(&OBJC_CLASS____DASActivity);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 2LL));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v8));
  [v7 setClasses:v9 forSelector:"startedActivities:" argumentIndex:0 ofReply:0];

  id v10 = (void *)qword_100157CA0;
  v25[0] = objc_opt_class(&OBJC_CLASS___NSArray);
  v25[1] = objc_opt_class(&OBJC_CLASS____DASActivity);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, 2LL));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v11));
  [v10 setClasses:v12 forSelector:"delayedStartActivities:" argumentIndex:0 ofReply:0];

  uint64_t v13 = (void *)qword_100157CA0;
  v24[0] = objc_opt_class(&OBJC_CLASS___NSSet);
  v24[1] = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 2LL));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v14));
  [v13 setClasses:v15 forSelector:"enableTaskRegistryMode:processes:handler:" argumentIndex:1 ofReply:0];

  [(id)qword_100157CA0 setXPCType:&_xpc_type_dictionary forSelector:"submitTaskRequestWithIdentifier:descriptor:completionHandler:" argumentIndex:1 ofReply:0];
  [(id)qword_100157CA0 setXPCType:&_xpc_type_dictionary forSelector:"updateTaskRequestWithIdentifier:descriptor:completionHandler:" argumentIndex:1 ofReply:0];
  uint64_t v16 = (void *)qword_100157CA0;
  v23[0] = objc_opt_class(&OBJC_CLASS___NSSet);
  v23[1] = objc_opt_class(&OBJC_CLASS____DASActivityResult);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 2LL));
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v17));
  [v16 setClasses:v18 forSelector:"reportSystemTaskWithIdentifier:consumedResults:completionHandler:" argumentIndex:1 ofReply:0];

  uint64_t v19 = (void *)qword_100157CA0;
  v22[0] = objc_opt_class(&OBJC_CLASS___NSSet);
  v22[1] = objc_opt_class(&OBJC_CLASS____DASActivityResult);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 2LL));
  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v20));
  [v19 setClasses:v21 forSelector:"reportSystemTaskWithIdentifier:producedResults:completionHandler:" argumentIndex:1 ofReply:0];

  objc_autoreleasePoolPop(v1);
}

void sub_10009F754( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

id sub_10009F780()
{
  return [*(id *)(v0 + 16) processIdentifier];
}

void sub_10009FA88( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t sub_10009FAB8(uint64_t result)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 1;
  return result;
}

id sub_10009FCC8(uint64_t a1)
{
  return [*(id *)(a1 + 32) extractResumeLaunchSignposts:0];
}

id sub_10009FCD4(uint64_t a1)
{
  return [*(id *)(a1 + 32) feedNewRecommendations];
}

void sub_10009FD1C(id a1)
{
  os_log_t v1 = objc_opt_new(&OBJC_CLASS____APRSManager);
  uint64_t v2 = (void *)qword_100157CA8;
  qword_100157CA8 = (uint64_t)v1;
}

void sub_10009FF88( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, id location)
{
}

uint64_t sub_10009FFA8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10009FFB4(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  if (a3)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDataProtectionStateMonitor dataProtectionClassC]( &OBJC_CLASS____DASDataProtectionStateMonitor,  "dataProtectionClassC"));
    unsigned int v7 = [v5 isEqualToString:v6];

    if (v7)
    {
      objc_copyWeak(&to, (id *)(a1 + 32));
      id v8 = objc_loadWeakRetained(&to);

      if (v8)
      {
        id v9 = objc_loadWeakRetained(&to);
        id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 log]);

        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v15 = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Class C now available.", v15, 2u);
        }

        id v11 = objc_loadWeakRetained(&to);
        [v11 setClassCUnlocked:1];

        id v12 = objc_loadWeakRetained(&to);
        [v12 setDataProtectionStateMonitor:0];

        id v13 = objc_loadWeakRetained(&to);
        uint64_t v14 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue([v13 timer]);
        dispatch_activate(v14);
      }

      objc_destroyWeak(&to);
    }
  }
}

void sub_1000A00F4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

uint64_t sub_1000A010C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000A0574(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = *(id *)(*(void *)(a1 + 32) + 8LL);
    objc_sync_enter(v3);
    [*(id *)(*(void *)(a1 + 32) + 8) removeAllObjects];
    objc_sync_exit(v3);

    [v4 clearPriorityQueue];
    id WeakRetained = v4;
  }
}

void sub_1000A05E0(_Unwind_Exception *a1)
{
}

void sub_1000A0644( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1000A06AC(_Unwind_Exception *a1)
{
}

void sub_1000A0710( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1000A0980(_Unwind_Exception *a1)
{
}

void sub_1000A0B6C(_Unwind_Exception *a1)
{
}

void sub_1000A0D24(_Unwind_Exception *a1)
{
}

void sub_1000A0FA8(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = (void *)qword_100157CC0;
  qword_100157CC0 = (uint64_t)v1;
}

void sub_1000A1348(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"customsysconstraints"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Timer fired to reset workloads",  (uint8_t *)&v17,  2u);
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:kDASSystemContextMCWorkloadRunningState]);
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:kDASSystemContextMCWorkloadRunningState]);
    [v4 timeIntervalSinceNow];
    BOOL v6 = v5 < -600.0;
    if (v5 < -600.0)
    {
      [*(id *)(*(void *)(a1 + 32) + 40) setObject:0 forKeyedSubscript:kDASSystemContextMCWorkloadRunningState];
      unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"customsysconstraints"));
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412290;
        id v18 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Resetting MC, set at %@",  (uint8_t *)&v17,  0xCu);
      }
    }
  }

  else
  {
    BOOL v6 = 0;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:kDASSystemContextGPWorkloadRunningState]);

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:kDASSystemContextGPWorkloadRunningState]);
    [v9 timeIntervalSinceNow];
    if (v10 >= -600.0)
    {

      if (!v6) {
        return;
      }
    }

    else
    {
      [*(id *)(*(void *)(a1 + 32) + 40) setObject:0 forKeyedSubscript:kDASSystemContextGPWorkloadRunningState];
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(v11 + 48);
      if (v12 <= 1) {
        uint64_t v12 = 1LL;
      }
      *(void *)(v11 + 4_Block_object_dispose(va, 8) = v12 - 1;
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"customsysconstraints"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412290;
        id v18 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Resetting GP, set at %@",  (uint8_t *)&v17,  0xCu);
      }
    }
  }

  else if (!v6)
  {
    return;
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:kDASSystemContextGPWorkloadRunningState]);
  if (v14)
  {
  }

  else
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:kDASSystemContextMCWorkloadRunningState]);

    if (!v15)
    {
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"customsysconstraints"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Reevaluating activities due to system constraint reset",  (uint8_t *)&v17,  2u);
      }

      [*(id *)(a1 + 32) reevaluateAllActivitiesWithDaemon:*(void *)(*(void *)(a1 + 32) + 72)];
      [*(id *)(a1 + 32) cancelResetTimer];
    }
  }

void sub_1000A1878(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"customsysconstraints"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Setting _heavyDiskUsage = 0", v3, 2u);
  }

  *(_BYTE *)(*(void *)(a1 + 32) + 8LL) = 0;
}

void sub_1000A1B54(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    if (*(_BYTE *)(a1 + 64)) {
      return;
    }
    [*(id *)(a1 + 40) cancelResetTimer];
    [*(id *)(*(void *)(a1 + 40) + 40) setObject:0 forKeyedSubscript:*(void *)(a1 + 48)];
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1 + 40) + 40) objectForKeyedSubscript:kDASSystemContextGPWorkloadRunningState]);

    if (v2)
    {
      id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"customsysconstraints"));
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        __int16 v8 = 0;
        id v4 = "Not evaluating because GP is still blocking!";
        double v5 = (uint8_t *)&v8;
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, v4, v5, 2u);
        goto LABEL_11;
      }

      goto LABEL_11;
    }

void sub_1000A1CD4(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 56);
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = v3[6];
  if (v2)
  {
    if (v4)
    {
LABEL_7:
      v3[6] = v4 + 1;
      return;
    }

    [v3 armResetTimer];
    double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    [*(id *)(*(void *)(a1 + 32) + 40) setObject:v5 forKeyedSubscript:*(void *)(a1 + 40)];

    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:kDASSystemContextMCWorkloadRunningState]);
    if (v6)
    {
      unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"customsysconstraints"));
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(v15) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Not evaluating because MC is already blocking!",  (uint8_t *)&v15,  2u);
      }

      id v3 = *(void **)(a1 + 32);
      uint64_t v4 = v3[6];
      goto LABEL_7;
    }

    ++*(void *)(*(void *)(a1 + 32) + 48LL);
    goto LABEL_21;
  }

  if (v4 != 1) {
    goto LABEL_13;
  }
  [v3 cancelResetTimer];
  [*(id *)(*(void *)(a1 + 32) + 40) setObject:0 forKeyedSubscript:kDASSystemContextGPWorkloadRunningState];
  __int16 v8 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:kDASSystemContextMCWorkloadRunningState]);

  if (v8)
  {
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"customsysconstraints"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v15) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Not evaluating because MC is still blocking!",  (uint8_t *)&v15,  2u);
    }

LABEL_13:
    int v10 = 0;
    goto LABEL_14;
  }

  int v10 = 1;
LABEL_14:
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void *)(v11 + 48);
  if (v12 <= 1) {
    uint64_t v12 = 1LL;
  }
  *(void *)(v11 + 4_Block_object_dispose(va, 8) = v12 - 1;
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"customsysconstraints"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  *(void *)(*(void *)(a1 + 32) + 48LL)));
    int v15 = 138412290;
    uint64_t v16 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "GP is now %@", (uint8_t *)&v15, 0xCu);
  }

  if (v10) {
LABEL_21:
  }
    [*(id *)(a1 + 32) reevaluateAllActivitiesWithDaemon:*(void *)(a1 + 48)];
}

void sub_1000A2158(_Unwind_Exception *a1)
{
}

void sub_1000A2480(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (nw_path_get_status(v3) != nw_path_status_unsatisfied)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    double v5 = (id *)(a1 + 32);
    if (*(void *)(a1 + 40))
    {
      BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v4 activityIDs]);
      objc_sync_enter(v6);
      unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([*v5 activityIDs]);
      id v8 = [v7 copy];

      objc_sync_exit(v6);
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
      int v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      void v13[2] = sub_1000A25C8;
      v13[3] = &unk_100115470;
      id v11 = *(id *)(a1 + 40);
      id v14 = v8;
      id v15 = v11;
      uint64_t v12 = (os_log_s *)v8;
      dispatch_async(v10, v13);
    }

    else
    {
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 log]);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1000B8DCC(v5, v12);
      }
    }
  }
}

void sub_1000A25B4(_Unwind_Exception *a1)
{
}

uint64_t sub_1000A25C8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void sub_1000A2630(_Unwind_Exception *a1)
{
}

void sub_1000A26C0(_Unwind_Exception *a1)
{
}

void sub_1000A2734(_Unwind_Exception *a1)
{
}

void sub_1000A2980(_Unwind_Exception *a1)
{
}

void sub_1000A2A18(_Unwind_Exception *a1)
{
}

void sub_1000A2AAC(_Unwind_Exception *a1)
{
}

void sub_1000A2B48(_Unwind_Exception *a1)
{
}

void sub_1000A2CD4(id a1)
{
  id v1 = objc_opt_new(&OBJC_CLASS____DASNetworkEvaluationMonitor);
  int v2 = (void *)qword_100157CD0;
  qword_100157CD0 = (uint64_t)v1;
}

void sub_1000A2D3C(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NWPathEvaluator sharedDefaultEvaluator](&OBJC_CLASS___NWPathEvaluator, "sharedDefaultEvaluator"));
  int v2 = (void *)qword_100157CE0;
  qword_100157CE0 = v1;
}

void sub_1000A2DA8(id a1)
{
  uint64_t v1 = objc_autoreleasePoolPush();
  int v2 = objc_alloc_init(&OBJC_CLASS___NWParameters);
  -[NWParameters setProhibitExpensivePaths:](v2, "setProhibitExpensivePaths:", 1LL);
  id v3 = [[NWPathEvaluator alloc] initWithEndpoint:0 parameters:v2];
  uint64_t v4 = (void *)qword_100157CF0;
  qword_100157CF0 = (uint64_t)v3;

  objc_autoreleasePoolPop(v1);
}

void sub_1000A2E50(id a1)
{
  uint64_t v1 = objc_autoreleasePoolPush();
  int v2 = objc_alloc_init(&OBJC_CLASS___NWParameters);
  -[NWParameters setProhibitConstrainedPaths:](v2, "setProhibitConstrainedPaths:", 1LL);
  id v3 = [[NWPathEvaluator alloc] initWithEndpoint:0 parameters:v2];
  uint64_t v4 = (void *)qword_100157D00;
  qword_100157D00 = (uint64_t)v3;

  objc_autoreleasePoolPop(v1);
}

void sub_1000A2F90(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___NWParameters);
  int v2 = (void *)qword_100157D10;
  qword_100157D10 = (uint64_t)v1;

  [(id)qword_100157D10 setProhibitExpensivePaths:1];
}

void sub_1000A2FCC(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___NWParameters);
  int v2 = (void *)qword_100157D20;
  qword_100157D20 = (uint64_t)v1;

  [(id)qword_100157D20 setProhibitExpensivePaths:0];
}

void sub_1000A3988(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  int v2 = (void *)qword_100157D30;
  qword_100157D30 = (uint64_t)v1;
}

void sub_1000A3B1C(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  int v2 = (void *)qword_100157D40;
  qword_100157D40 = (uint64_t)v1;
}

id sub_1000A3F58()
{
  uint64_t v4 = 0LL;
  double v5 = &v4;
  uint64_t v6 = 0x2050000000LL;
  uint64_t v0 = (void *)qword_100157D58;
  uint64_t v7 = qword_100157D58;
  if (!qword_100157D58)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_1000AAB4C;
    v3[3] = &unk_100115300;
    void v3[4] = &v4;
    sub_1000AAB4C((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1000A3FF4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000A419C(uint64_t a1)
{
  uint64_t v1 = objc_opt_new(*(void *)(a1 + 32));
  int v2 = (void *)qword_100157D48;
  qword_100157D48 = v1;
}

LABEL_32:
  id v68 = (void *)objc_claimAutoreleasedReturnValue([v67[90] numberWithDouble:v28]);
  [v15 setObject:v68 forKeyedSubscript:@"Estimated Runtime"];

  return v15;
}

LABEL_39:
        [v90 addObject:v49];
      }

      v94 = [v87 countByEnumeratingWithState:&v107 objects:v125 count:16];
    }

    while (v94);
  }

  id v66 = (void *)objc_claimAutoreleasedReturnValue([v86 loadTaskProgress:v82 metrics:0 timeFilter:v85 filepath:v84]);
  v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  v95 = v66;
  id v68 = [v95 countByEnumeratingWithState:&v99 objects:v123 count:16];
  if (v68)
  {
    id v69 = v68;
    uint64_t v70 = *(void *)v100;
    do
    {
      for (ii = 0LL; ii != v69; ii = (char *)ii + 1)
      {
        if (*(void *)v100 != v70) {
          objc_enumerationMutation(v95);
        }
        id v72 = *(void **)(*((void *)&v99 + 1) + 8LL * (void)ii);
        v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary", v80));
        __int128 v74 = (void *)objc_claimAutoreleasedReturnValue([v72 metricKeysAndValues]);
        __int128 v75 = (void *)objc_claimAutoreleasedReturnValue([v74 objectForKeyedSubscript:@"CompletedPercentage"]);
        [v73 setObject:v75 forKeyedSubscript:@"CompletedPercentage"];

        [v72 epochTimestamp];
        __int128 v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
        [v73 setObject:v76 forKeyedSubscript:@"epoch"];

        __int128 v77 = (void *)objc_claimAutoreleasedReturnValue([v72 metricKeysAndValues]);
        v78 = (void *)objc_claimAutoreleasedReturnValue([v77 objectForKeyedSubscript:@"TaskName"]);
        [v73 setObject:v78 forKeyedSubscript:@"TaskName"];

        [v67 addObject:v73];
      }

      id v69 = [v95 countByEnumeratingWithState:&v99 objects:v123 count:16];
    }

    while (v69);
  }

  [v83 setObject:v91 forKeyedSubscript:@"Feature Checkpoints"];
  [v83 setObject:v97 forKeyedSubscript:@"Feature To Tasks Mapping"];
  [v83 setObject:v90 forKeyedSubscript:@"Task Checkpoints"];
  [v83 setObject:v67 forKeyedSubscript:@"Progress Checkpoints"];

  return v83;
}

Class sub_1000AAB4C(uint64_t a1)
{
  uint64_t v4 = 0LL;
  if (!qword_100157D60)
  {
    __int128 v5 = off_100117510;
    uint64_t v6 = 0LL;
    qword_100157D60 = _sl_dlopen(&v5, &v4);
    int v2 = v4;
    if (!qword_100157D60)
    {
      abort_report_np("%s", v4);
      goto LABEL_7;
    }

    if (v4) {
      goto LABEL_8;
    }
  }

  while (1)
  {
    Class result = objc_getClass("PPSEvent");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
      break;
    }
LABEL_7:
    int v2 = (char *)sub_1000B2E90();
LABEL_8:
    free(v2);
  }

  qword_100157D58 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

void sub_1000AADCC(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[_CDContextualKeyPath keyPathWithKey:]( &OBJC_CLASS____CDContextualKeyPath,  "keyPathWithKey:",  @"/backup/userRequested"));
  int v2 = (void *)qword_100157D70;
  qword_100157D70 = v1;
}

void sub_1000AB3AC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_1000AB3D4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(os_log_s **)(*(void *)(a1 + 32) + 16LL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ has state %@", (uint8_t *)&v8, 0x16u);
  }

  if (objc_msgSend( *(id *)(a1 + 32),  "isBackupStatusCompleted:",  objc_msgSend(v6, "unsignedIntegerValue"))) {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  }
}

void sub_1000AC278(_Unwind_Exception *a1)
{
}

void sub_1000AC2A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v4);

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained(v4);
    uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 queue]);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    void v9[2] = sub_1000AC370;
    v9[3] = &unk_100115148;
    id v10 = v6;
    id v11 = v3;
    id v8 = v6;
    dispatch_async(v7, v9);
  }
}

void sub_1000AC370(uint64_t a1)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) sessionID]);
  unsigned int v3 = [v2 isEqual:*(void *)(a1 + 40)];

  if (v3)
  {
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"plugin"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000B92F4(v4);
    }

    [*(id *)(a1 + 32) setSessionID:0];
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pluginDelegate]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentActivity]);
    uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegateQueue]);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000AC49C;
    void v10[3] = &unk_100115148;
    id v11 = v5;
    id v12 = v6;
    id v8 = v6;
    id v9 = v5;
    dispatch_async(v7, v10);
  }

uint64_t sub_1000AC49C(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector(*(void *)(a1 + 32), "extensionActivity:finishedWithStatus:");
  if ((result & 1) != 0) {
    return (uint64_t)[*(id *)(a1 + 32) extensionActivity:*(void *)(a1 + 40) finishedWithStatus:3];
  }
  return result;
}

void sub_1000AC4E0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"plugin"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_1000B9334();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained extension]);
  id v10 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v9 requestInterruptionBlock]);
  ((void (**)(void, id))v10)[2](v10, v6);
}

uint64_t sub_1000ACC30(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector(*(void *)(a1 + 32), "extensionActivity:finishedWithStatus:");
  if ((result & 1) != 0) {
    return (uint64_t)[*(id *)(a1 + 32) extensionActivity:*(void *)(a1 + 40) finishedWithStatus:*(unsigned __int8 *)(a1 + 48)];
  }
  return result;
}

void sub_1000ACCE0(uint64_t a1)
{
  int v2 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"plugin"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v11 = 138412290;
    uint64_t v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Killing plugin %@", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) sessionID]);
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) extension]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) sessionID]);
    [v5 cancelExtensionRequestWithIdentifier:v6];

    [*(id *)(a1 + 32) setSessionID:0];
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) extension]);
  [v7 _kill:9];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentActivity]);
  [v8 setPid:0];

  [*(id *)(a1 + 32) setCurrentActivity:0];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_100157D78);
  id v9 = (void *)qword_100157D80;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pluginMapKey]);
  [v9 removeObjectForKey:v10];

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_100157D78);
}

void sub_1000AD190(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL____DASHostExtensionContextProtocol));
  int v2 = (void *)qword_100157D90;
  qword_100157D90 = v1;
}

void sub_1000AD204(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL____DASRemoteExtensionContextProtocol));
  int v2 = (void *)qword_100157DA0;
  qword_100157DA0 = v1;
}

void sub_1000AD340( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_1000AD358(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000AD368(uint64_t a1)
{
}

void sub_1000AD370(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"plugin"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1000B9590((uint64_t)v4, v5);
  }
}

id sub_1000AD6DC(uint64_t a1)
{
  return [*(id *)(a1 + 32) logActivities];
}

void sub_1000AD730(id a1)
{
  uint64_t v1 = objc_opt_new(&OBJC_CLASS____DASPLLogger);
  int v2 = (void *)qword_100157DB0;
  qword_100157DB0 = (uint64_t)v1;
}

void sub_1000AD820(_Unwind_Exception *a1)
{
}

void sub_1000ADA2C(_Unwind_Exception *a1)
{
}

void sub_1000ADC80(_Unwind_Exception *a1)
{
}

void sub_1000ADD24(_Unwind_Exception *a1)
{
}

void sub_1000AE47C(_Unwind_Exception *a1)
{
}

void sub_1000AE494(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"score%@", a2));
  id v6 = *(void **)(a1 + 40);
  [v5 score];
  double v8 = v7;

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 numberFromDouble:v8 * 100.0]);
  [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v10];
}

NSMutableDictionary *sub_1000AEA00(uint64_t a1)
{
  int v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  *(void *)(a1 + 40),  *(void *)(a1 + 32));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [*(id *)(a1 + 56) requiresPlugin]));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v3, *(void *)(a1 + 48));

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [*(id *)(a1 + 56) requiresNetwork]));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v4, *(void *)(a1 + 64));

  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [*(id *)(a1 + 56) isIntensive]));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v5, *(void *)(a1 + 72));

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [*(id *)(a1 + 56) requiresDeviceInactivity]));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v6, *(void *)(a1 + 80));

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  *(void *)(a1 + 96),  *(void *)(a1 + 88));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  *(void *)(a1 + 112),  *(void *)(a1 + 104));
  double v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 120) experimentID]);

  if (v7)
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 120) experimentID]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v8, *(void *)(a1 + 128));

    id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 120) treatmentID]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v9, *(void *)(a1 + 136));

    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [*(id *)(a1 + 120) deploymentID]));
    int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 stringValue]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v11, *(void *)(a1 + 144));
  }

  return v2;
}

void start()
{
  uint64_t v0 = os_log_create("com.apple.dasd", "main");
  uint64_t v1 = getpid();
  int v2 = memorystatus_control(14LL, v1, 1LL, 0LL, 0LL);
  if (v2)
  {
    int v3 = v2;
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    {
      v6[0] = 67109120;
      v6[1] = v3;
      _os_log_error_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_ERROR,  "Failed to elevate inactive jetsam priority, error: %d",  (uint8_t *)v6,  8u);
    }
  }

  else if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_DEFAULT,  "Succeeded to elevate inactive jetsam priority",  (uint8_t *)v6,  2u);
  }

  id v4 = objc_autoreleasePoolPush();
  xpc_set_event_stream_handler("com.apple.notifyd.matching", &_dispatch_main_q, &stru_1001177B8);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](&OBJC_CLASS____DASDaemon, "sharedInstance"));
  [v5 start];

  objc_autoreleasePoolPop(v4);
  CFRunLoopRun();
  exit(1);
}

void sub_1000AF04C(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  int v2 = (void *)qword_100157DC0;
  qword_100157DC0 = (uint64_t)v1;
}

id sub_1000AF76C(uint64_t a1)
{
  return [*(id *)(a1 + 32) deleteOldDurations];
}

id sub_1000AF774(uint64_t a1)
{
  return [*(id *)(a1 + 32) deleteOldDurations];
}

id sub_1000AF77C(uint64_t a1)
{
  return [*(id *)(a1 + 32) loadState];
}

void sub_1000AFB98(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  int v2 = (void *)qword_100157DD0;
  qword_100157DD0 = (uint64_t)v1;
}

void sub_1000AFE58(uint64_t a1)
{
  if (+[_DASActivityDurationTracker shouldTrackActivity:]( &OBJC_CLASS____DASActivityDurationTracker,  "shouldTrackActivity:",  *(void *)(a1 + 32)))
  {
    int v2 = *(void **)(a1 + 40);
    id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) startDate]);
    [v4 timeIntervalSinceNow];
    [v2 addTimeInterval:*(void *)(a1 + 32) forActivity:-v3];
  }

id sub_1000AFF44(uint64_t a1)
{
  id result = (id)+[_DASActivityDurationTracker shouldTrackActivity:]( &OBJC_CLASS____DASActivityDurationTracker,  "shouldTrackActivity:",  *(void *)(a1 + 32));
  if ((_DWORD)result)
  {
    double v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) startDate]);
    [v3 timeIntervalSinceNow];
    double v5 = -v4;

    return objc_msgSend(*(id *)(a1 + 40), "addTimeInterval:forActivity:", *(void *)(a1 + 32), fmax(v5, 3600.0));
  }

  return result;
}

void sub_1000B03C4(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  int v2 = (void *)qword_100157DE0;
  qword_100157DE0 = (uint64_t)v1;
}

void sub_1000B0A4C(void *a1, void *a2, uint64_t a3)
{
  double v5 = a1;
  int v6 = 134218242;
  uint64_t v7 = (int)[a2 pid];
  __int16 v8 = 2112;
  uint64_t v9 = a3;
  _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Could not terminate app with pid %ld due to error: %@, invalidating instead",  (uint8_t *)&v6,  0x16u);
}

void sub_1000B0B00(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "DASAssertion dealloced before being invalidated! %@",  (uint8_t *)&v2,  0xCu);
}

void sub_1000B0B74()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  sub_100008614();
  sub_1000085F8((void *)&_mh_execute_header, v1, v2, "Dynamic limit for %@ set to be %@", v3, v4, v5, v6, v7);

  sub_10000862C();
}

void sub_1000B0BFC()
{
}

void sub_1000B0C68()
{
  os_log_t v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  sub_100008614();
  sub_1000085F8((void *)&_mh_execute_header, v1, v2, "Static limit for %@ set to be %@", v3, v4, v5, v6, v7);

  sub_10000862C();
}

void sub_1000B0CF0()
{
}

void sub_1000B0D50()
{
}

void sub_1000B0DB0()
{
}

void sub_1000B0E10( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000B0E74( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000B0ED8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Unable to construct app usage timeline",  v1,  2u);
}

void sub_1000B0F18()
{
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_ERROR,  "'%{public}@' could not be marked completed because can't find rate limit configuration %@",  v2,  0x16u);
  sub_10000860C();
}

void sub_1000B0F94()
{
}

void sub_1000B0FF4()
{
}

void sub_1000B1054()
{
}

void sub_1000B10B4(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Prediction likelihood: %@",  (uint8_t *)&v2,  0xCu);
}

void sub_1000B1128(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Prediction timeline query %@ failed with error %@",  (uint8_t *)&v3,  0x16u);
}

void sub_1000B11AC(char a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Inferred carry status is %d",  (uint8_t *)v2,  8u);
}

void sub_1000B1224()
{
}

void sub_1000B1284()
{
}

void sub_1000B12E4()
{
}

void sub_1000B131C()
{
}

void sub_1000B137C()
{
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_1000138D4();
}

void sub_1000B13A8()
{
}

void sub_1000B13D4()
{
}

void sub_1000B1434(void *a1)
{
  uint64_t v2 = sub_100015DA4();
  sub_100015D9C(v2);
  sub_100015D7C( (void *)&_mh_execute_header,  v3,  v4,  "Failed to open shared memory for budgeting: %s",  v5,  v6,  v7,  v8,  2u);

  sub_100015D90();
}

void sub_1000B14A8(void *a1)
{
  uint64_t v2 = sub_100015DA4();
  sub_100015D9C(v2);
  sub_100015D7C( (void *)&_mh_execute_header,  v3,  v4,  "Failed to truncate shared memory for budgeting: %s",  v5,  v6,  v7,  v8,  2u);

  sub_100015D90();
}

void sub_1000B151C(void *a1)
{
  uint64_t v2 = sub_100015DA4();
  sub_100015D9C(v2);
  sub_100015D7C((void *)&_mh_execute_header, v3, v4, "mmap failed for budgeting: %s", v5, v6, v7, v8, 2u);

  sub_100015D90();
}

void sub_1000B1590(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid budget name encountered", v1, 2u);
}

void sub_1000B15D0(uint64_t a1, id *a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  **(unsigned __int8 **)(*(void *)a1 + 8LL)));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [*a2 count]));
  int v7 = 138412546;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  id v10 = v6;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Stored budget count %@ != expected count %@",  (uint8_t *)&v7,  0x16u);
}

void sub_1000B16BC(uint8_t *a1, void *a2, void *a3, void *a4)
{
  int v7 = a2;
  id v8 = [a3 count];
  *(_DWORD *)a1 = 134217984;
  *a4 = v8;
  _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "read %lu views", a1, 0xCu);
}

void sub_1000B1730()
{
}

void sub_1000B179C()
{
}

void sub_1000B1808()
{
}

void sub_1000B1834( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000B1898()
{
}

void sub_1000B1904()
{
}

void sub_1000B196C()
{
}

void sub_1000B19D8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000B1A44( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000B1AB0()
{
}

void sub_1000B1B1C()
{
}

void sub_1000B1B48()
{
}

void sub_1000B1B74(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 objectForKeyedSubscript:@"Temperature"]);
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "BatteryTemperatureReader returning value %@",  (uint8_t *)&v4,  0xCu);
}

void sub_1000B1C10(os_log_t log, double a2, double a3)
{
  int v3 = 134218240;
  double v4 = a2;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Battery temperature reference Value %lf Current value %lf",  (uint8_t *)&v3,  0x16u);
}

void sub_1000B1C94(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Initializing _DASBARMetricRecorder!", v1, 2u);
}

void sub_1000B1CD4(uint64_t *a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  int v4 = 138412290;
  uint64_t v5 = v3;
  sub_10001C924((void *)&_mh_execute_header, a2, a3, "Loaded bar metric dict from defaults %@", (uint8_t *)&v4);
  sub_10000860C();
}

void sub_1000B1D40(void *a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  sub_10001C924((void *)&_mh_execute_header, a3, (uint64_t)a3, "Saved bar metric dict to defaults %@", (uint8_t *)a2);
}

void sub_1000B1D8C(uint64_t *a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  int v4 = 138412290;
  uint64_t v5 = v3;
  sub_10001C924((void *)&_mh_execute_header, a2, a3, "Reset _barMetricDict data successfully %@", (uint8_t *)&v4);
  sub_10000860C();
}

void sub_1000B1DF8(uint64_t a1, os_log_s *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Wrong argument 'stage': %ld passed to recordBARMetric.",  (uint8_t *)&v2,  0xCu);
  sub_10000860C();
}

void sub_1000B1E68( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000B1E98( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000B1EC8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000B1EF8(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "key = %@, value = %@", (uint8_t *)&v3, 0x16u);
}

void sub_1000B1F7C(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v2, 0xCu);
}

void sub_1000B1FF0(int a1, os_log_s *a2)
{
  int v2 = 138412546;
  uint64_t v3 = @"com.apple.powerui.nudge.LPM";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "notify_register_check for %@ failed (%d)\n",  (uint8_t *)&v2,  0x12u);
}

void sub_1000B2078(os_log_t log)
{
  int v1 = 138412290;
  uint64_t v2 = 0LL;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Unable to load model path %@",  (uint8_t *)&v1,  0xCu);
}

uint64_t sub_1000B20F0()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "_OSChargingPredictor");
  return sub_1000B2114(v0);
}

void sub_1000B2114(void *a1)
{
  int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [a1 pid]));
  sub_10002C7F4((void *)&_mh_execute_header, v1, v2, "No identifier for activity %@ with PID %@", v3, v4, v5, v6, 2u);
}

void sub_1000B21C4(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [a1 pid]));
  uint64_t v2 = __error();
  strerror(*v2);
  sub_10002C7F4((void *)&_mh_execute_header, v3, v4, "Failed to obtain process name for PID %@: %s", v5, v6, v7, v8, 2u);

  sub_100015D90();
}

void sub_1000B226C(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Reporting to CA network usage %@",  (uint8_t *)&v2,  0xCu);
}

void sub_1000B22E0(id *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*a1 name]);
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Error reporting to CA with capacity or identifier for %@",  (uint8_t *)&v4,  0xCu);

  sub_100015D90();
}

void sub_1000B2370(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 topNPrediction]);
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "TopN: %@", (uint8_t *)&v4, 0xCu);
}

uint64_t sub_1000B2404()
{
  uint64_t v0 = dlerror();
  uint64_t v1 = abort_report_np("%s", v0);
  return sub_1000B2424(v1);
}

void sub_1000B2424( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000B2458(uint64_t a1, os_log_s *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Found at index=%llu", (uint8_t *)&v2, 0xCu);
}

void sub_1000B24CC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000B2500()
{
}

void sub_1000B2560()
{
}

void sub_1000B25C0()
{
}

void sub_1000B2620()
{
}

void sub_1000B2680()
{
}

void sub_1000B26E0()
{
}

void sub_1000B2740()
{
}

void sub_1000B27A0()
{
}

void sub_1000B2800()
{
}

void sub_1000B2860()
{
}

void sub_1000B28C0()
{
}

void sub_1000B2920()
{
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_1000138D4();
}

void sub_1000B2980()
{
}

void sub_1000B29E0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Unable to create SecTask with audit token",  v1,  2u);
  sub_1000138D4();
}

void sub_1000B2A1C()
{
}

void sub_1000B2A7C()
{
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEBUG,  "Received value of %@ for %@ entitlement",  v2,  0x16u);
  sub_10000860C();
}

void sub_1000B2AF8(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  LODWORD(v3) = 67109378;
  HIDWORD(v3) = a2;
  LOWORD(v4) = 2112;
  *(void *)((char *)&v4 + 2) = a1;
  sub_100033878( (void *)&_mh_execute_header,  a2,  a3,  "Unable to grab RBS Process Handle for pid %d with error: %@",  v3,  (void)v4,  WORD4(v4));
  sub_10000860C();
}

void sub_1000B2B68(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = a1;
  sub_10001C924((void *)&_mh_execute_header, a2, a3, "Device Activity: %@", (uint8_t *)&v3);
}

void sub_1000B2BD4(id *a1, os_log_s *a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue([*a1 deviceActivityTimeline]);
  int v5 = 138412290;
  uint8_t v6 = v3;
  sub_10001C924((void *)&_mh_execute_header, a2, v4, "Device Activity: %@", (uint8_t *)&v5);
}

void sub_1000B2C64( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000B2C94(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Unable to get PPS Data: %@!",  (uint8_t *)&v2,  0xCu);
}

void sub_1000B2D08( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000B2D38( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000B2D68(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Reporting %@ to PPS", (uint8_t *)&v2, 0xCu);
}

uint64_t sub_1000B2DDC()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "PPSTimeSeries");
  return sub_1000B2E00(v0);
}

uint64_t sub_1000B2E00()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "PPSRequestDispatcher");
  return sub_1000B2E24(v0);
}

uint64_t sub_1000B2E24()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "PPSTimeSeriesRequest");
  return sub_1000B2E48(v0);
}

uint64_t sub_1000B2E48()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "PPSHistogramRequest");
  return sub_1000B2E6C(v0);
}

uint64_t sub_1000B2E6C()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "PPSIntervalSetRequest");
  return sub_1000B2E90(v0);
}

uint64_t sub_1000B2E90()
{
  uint64_t v0 = (os_log_s *)abort_report_np("Unable to find class %s", "PPSEvent");
  return sub_1000B2EB4(v0);
}

void sub_1000B2EB4(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "No value found for some signpostinterval dictionary entries",  v1,  2u);
}

void sub_1000B2EF4(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&void v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  sub_10003A138( (void *)&_mh_execute_header,  a2,  a3,  "Converted app name %@ to bundle id %@",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16]);
  sub_10000860C();
}

void sub_1000B2F64()
{
}

void sub_1000B2FC4(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a2 objectForKeyedSubscript:@"ProcessName"]);
  sub_10003A14C((void *)&_mh_execute_header, v5, v6, "Read %@ as an App Resume", v7, v8, v9, v10, 2u);

  sub_100015D90();
}

void sub_1000B3058(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a2 objectForKeyedSubscript:@"ProcessName"]);
  sub_10003A14C((void *)&_mh_execute_header, v5, v6, "Read %@ as an App Foreground Launch", v7, v8, v9, v10, 2u);

  sub_100015D90();
}

void sub_1000B30EC(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "fastpass_yield feature flag disabled",  v1,  2u);
}

void sub_1000B312C()
{
}

void sub_1000B318C()
{
}

void sub_1000B31F8()
{
}

void sub_1000B3258()
{
}

void sub_1000B32B8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000B32E8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000B3318()
{
}

void sub_1000B3378()
{
}

void sub_1000B33D8(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error loading feature codes.", v1, 2u);
  sub_1000138D4();
}

void sub_1000B3414( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000B347C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000B34E4(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Activity %@ is not in activity plist",  buf,  0xCu);
}

uint64_t sub_1000B3538()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "_OSBatteryDrainPredictor");
  return sub_1000B355C(v0);
}

void sub_1000B355C(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = a1;
  sub_10001C924((void *)&_mh_execute_header, a2, a3, "Updating 'WiFiQualityPredictions' to %@", (uint8_t *)&v3);
}

void sub_1000B35C8(id *a1, os_log_s *a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue([*a1 wifiPredictionTimeline]);
  int v5 = 138412290;
  uint8_t v6 = v3;
  sub_10001C924((void *)&_mh_execute_header, a2, v4, "Updating 'WiFiQualityPredictions' to %@", (uint8_t *)&v5);
}

void sub_1000B3658(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = a1;
  sub_10001C924((void *)&_mh_execute_header, a2, a3, "Plugin Likelihood: %@", (uint8_t *)&v3);
}

void sub_1000B36C4(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Fast pass activities are allowed to run on battery. Ignoring requiresExternalPower setting.",  v1,  2u);
}

void sub_1000B3704(id *a1, os_log_s *a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue([*a1 pluginTimeline]);
  int v5 = 138412290;
  uint8_t v6 = v3;
  sub_10001C924((void *)&_mh_execute_header, a2, v4, "Plugin Likelihood: %@", (uint8_t *)&v5);
}

void sub_1000B3794(uint64_t *a1, os_log_s *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to serialize bundleID: %@",  (uint8_t *)&v3,  0xCu);
}

void sub_1000B380C(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Truncating bundleID for serialization: %@ -> %@",  (uint8_t *)&v4,  0x16u);
}

void sub_1000B3894(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "No Auto SU times returned--using default!",  v1,  2u);
}

void sub_1000B38D4(uint64_t *a1, os_log_s *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to serialize bundleID: %@",  (uint8_t *)&v3,  0xCu);
  sub_10000860C();
}

void sub_1000B3948(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Truncating bundleID for serialization: %@ -> %@",  (uint8_t *)&v4,  0x16u);
  sub_10000860C();
}

void sub_1000B39CC(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Writing app kill event: %@",  (uint8_t *)&v2,  0xCu);
  sub_10000860C();
}

void sub_1000B3A3C()
{
}

void sub_1000B3AA0()
{
}

void sub_1000B3B04()
{
}

void sub_1000B3B68()
{
}

void sub_1000B3BCC()
{
}

void sub_1000B3C30(void *a1, os_log_s *a2)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([a1 name]);
  sub_10000863C();
  sub_10004CAF8( (void *)&_mh_execute_header,  a2,  v4,  "%{public}@: Expected download size needs to be set when disk volume is set",  v5);

  sub_100015D90();
}

void sub_1000B3CBC(void *a1, void *a2)
{
  id v3 = (os_log_s *)sub_100015DAC(a1);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a2 name]);
  sub_10000863C();
  sub_10004CAF8( (void *)&_mh_execute_header,  v3,  v5,  "%{public}@: relatedApplications cannot be empty when beforeApplicationLaunch is set to true",  v6);

  sub_100015D90();
}

void sub_1000B3D4C(void *a1, void *a2)
{
  id v3 = (os_log_s *)sub_100015DAC(a1);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a2 name]);
  sub_10000863C();
  sub_10004CAF8( (void *)&_mh_execute_header,  v3,  v5,  "%{public}@: relatedApplications cannot be empty when requestsApplicationLaunch is set to true",  v6);

  sub_100015D90();
}

void sub_1000B3DDC(void *a1, void *a2)
{
  id v3 = (os_log_s *)sub_100015DAC(a1);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a2 name]);
  sub_10000863C();
  sub_10004CAF8( (void *)&_mh_execute_header,  v3,  v5,  "%{public}@: relatedApplications cannot be empty when runOnAppForeground is set to true",  v6);

  sub_100015D90();
}

void sub_1000B3E6C(void *a1, uint64_t a2, os_log_s *a3)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([a1 name]);
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a2));
  int v7 = 138543874;
  id v8 = v5;
  __int16 v9 = 2112;
  id v10 = v6;
  __int16 v11 = 2080;
  uint64_t v12 = "Maintenance";
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "%{public}@: Invalid priority value %@, Defaulting to %s",  (uint8_t *)&v7,  0x20u);
}

void sub_1000B3F5C()
{
}

void sub_1000B3FC0()
{
}

void sub_1000B4024()
{
}

void sub_1000B4088(void *a1, void *a2)
{
  id v3 = (os_log_s *)sub_100015DAC(a1);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a2 name]);
  sub_10000863C();
  sub_10004CAF8((void *)&_mh_execute_header, v3, v5, "FastPass %{public}@ should not ask to rerun via plist", v6);

  sub_100015D90();
}

void sub_1000B4118(void *a1, void *a2)
{
  id v3 = (os_log_s *)sub_100015DAC(a1);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a2 name]);
  sub_10000863C();
  sub_10004CAF8( (void *)&_mh_execute_header,  v3,  v5,  "%{public}@: Repeating activites must have an interval of more than 300 sec",  v6);

  sub_100015D90();
}

void sub_1000B41A8(void *a1, void *a2)
{
  id v3 = (os_log_s *)sub_100015DAC(a1);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a2 name]);
  sub_10000863C();
  sub_10004CAF8((void *)&_mh_execute_header, v3, v5, "%{public}@: postinstall activites are not allowed to repeat", v6);

  sub_100015D90();
}

void sub_1000B4238(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "xpc_get_event_name failed", v1, 2u);
}

void sub_1000B4278()
{
  uint64_t v0 = _os_assert_log(0LL);
  _os_crash(v0);
  __break(1u);
}

void sub_1000B4290(uint64_t a1, void *a2)
{
  int v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 name]);
  sub_10000863C();
  sub_10004CAF8((void *)&_mh_execute_header, v3, v5, "%{public}@: Dependencies require a valid identifier", v6);

  sub_100015D90();
}

void sub_1000B4320(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = a2;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  sub_10004CB1C();
  uint64_t v9 = a3;
  sub_10004CB04( (void *)&_mh_execute_header,  v5,  v7,  "%{public}@: %{public}@ is an invalid dependency form, must be a dictionary",  v8);

  sub_10000862C();
}

void sub_1000B43BC()
{
}

void sub_1000B4420()
{
}

void sub_1000B4484(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (os_log_s *)sub_100015DAC(a1);
  v6[0] = 67109378;
  v6[1] = [a2 intValue];
  __int16 v7 = 2114;
  uint64_t v8 = a3;
  _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "FastPass feature code %d not found for task %{public}@",  (uint8_t *)v6,  0x12u);

  sub_10000862C();
}

void sub_1000B4524()
{
  uint64_t v3 = v0;
  sub_10004CB04( (void *)&_mh_execute_header,  v1,  (uint64_t)v1,  "FastPass service name mismatch for input service name %{public}@ for task %{public}@",  v2);
  sub_10000860C();
}

void sub_1000B4590(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "%{public}@ bypasses predictions",  (uint8_t *)&v2,  0xCu);
}

void sub_1000B4604(void **a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *a1;
  uint64_t v5 = a2;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:a3]);
  sub_10000863C();
  _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "Refreshed %@ from Biome persistence",  v7,  0xCu);
}

void sub_1000B46B4(void *a1)
{
  id v2 = a1;
  uint64_t v3 = sub_10005403C();
  objc_opt_class(v3);
  sub_10000863C();
  id v5 = v4;
  _os_log_error_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_ERROR,  "Tried to refresh state of an invalid class type: %@. Dropping group",  v6,  0xCu);

  sub_100053FE8();
}

void sub_1000B474C()
{
}

void sub_1000B47AC()
{
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_10000860C();
}

void sub_1000B480C()
{
}

void sub_1000B486C()
{
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_10000860C();
}

void sub_1000B48CC()
{
  int v2 = 136315650;
  sub_100054010();
  sub_100053FFC( (void *)&_mh_execute_header,  v0,  v1,  "%s: Failed to report result consumption on behalf of %@ with error: %@",  v2);
  sub_100053FE8();
}

void sub_1000B4940(uint64_t a1, void *a2)
{
  id v3 = [(id)sub_10005403C() description];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_100053FC0();
  sub_100053FD4( (void *)&_mh_execute_header,  v5,  v6,  "%s: Dependency group for (identifier: %@) is not of the correct type",  v7,  v8,  v9,  v10,  2u);

  sub_100053FE8();
}

void sub_1000B49CC()
{
  int v2 = 136315650;
  sub_100054010();
  sub_100053FFC( (void *)&_mh_execute_header,  v0,  v1,  "%s: Failed to report result production on behalf of %@ with error: %@",  v2);
  sub_100053FE8();
}

void sub_1000B4A40(uint64_t a1, void *a2)
{
  id v3 = [(id)sub_10005403C() description];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_100053FC0();
  sub_100053FD4( (void *)&_mh_execute_header,  v5,  v6,  "%s: Dependency group for (identifier: %@) is not of the correct type",  v7,  v8,  v9,  v10,  2u);

  sub_100053FE8();
}

void sub_1000B4ACC()
{
}

void sub_1000B4B2C(uint64_t a1, void *a2)
{
  id v3 = [(id)sub_10005403C() description];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_100053FC0();
  sub_100053FD4( (void *)&_mh_execute_header,  v5,  v6,  "%s: Dependency group for (identifier: %@) is not of the correct type",  v7,  v8,  v9,  v10,  2u);

  sub_100053FE8();
}

void sub_1000B4BB8()
{
}

void sub_1000B4C24()
{
}

void sub_1000B4C90(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *a1;
  int v4 = 136315650;
  uint64_t v5 = "-[_DASActivityDependencyManager areDependenciesSatisfiedFor:]_block_invoke";
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "%s: %@ has unsatisfied activity completion dependencies: %@",  (uint8_t *)&v4,  0x20u);
  sub_100053FE8();
}

void sub_1000B4D24(void *a1, uint64_t a2, uint64_t a3)
{
}

void sub_1000B4D6C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000B4DA0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000B4DD4()
{
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "%@ %lu is an invalid feature code", v2, 0x16u);
  sub_10000860C();
}

void sub_1000B4E50( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000B4E84()
{
}

void sub_1000B4EE4()
{
}

void sub_1000B4F44()
{
}

void sub_1000B4FA4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000B4FD8(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Unable to gather application name from bundleIdentifier: %@",  (uint8_t *)&v2,  0xCu);
}

void sub_1000B504C()
{
}

void sub_1000B5078()
{
}

void sub_1000B50A4()
{
}

void sub_1000B50D0()
{
}

void sub_1000B50FC(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a2 + 40);
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Successfully reported ABC case with session ID %@ for activities %@",  (uint8_t *)&v4,  0x16u);
}

void sub_1000B5184(int a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a2 + 40);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2048;
  uint64_t v7 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "ABC case rejected for activities %@ with reason %lld",  (uint8_t *)&v4,  0x16u);
}

void sub_1000B5210()
{
}

void sub_1000B523C(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "Failed to expire task:%@ with error:%@",  buf,  0x16u);
}

void sub_1000B52A0()
{
}

void sub_1000B52CC()
{
}

void sub_1000B52F8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000B5328(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *a1;
  int v4 = 134218496;
  uint64_t v5 = a2;
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  __int16 v8 = 2048;
  uint64_t v9 = 0LL;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Current temp %ld, recent temp %ld, change %ld",  (uint8_t *)&v4,  0x20u);
}

void sub_1000B53B8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000B5420(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Unable to get battery properties: %d",  (uint8_t *)v2,  8u);
  sub_1000138D4();
}

void sub_1000B5490( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000B54C0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000B5528()
{
}

void sub_1000B5588()
{
}

void sub_1000B55E8(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "BAR WiFi Only => %u", (uint8_t *)v2, 8u);
}

void sub_1000B565C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000B56C8()
{
}

void sub_1000B5728()
{
}

void sub_1000B5788(void *a1, void *a2)
{
  uint64_t v3 = (os_log_s *)sub_100015DAC(a1);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a2 error]);
  sub_10000863C();
  sub_10004CAF8((void *)&_mh_execute_header, v3, v5, "Error obtaining recently launched apps: %@", v6);
}

void sub_1000B581C(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = @"We tried to launch Buddy for Background App Refresh. Please file a bug!";
  sub_10004CAF8((void *)&_mh_execute_header, a1, a3, "%@", (uint8_t *)&v3);
  sub_10000860C();
}

void sub_1000B5890()
{
}

void sub_1000B58F0()
{
}

void sub_1000B5950()
{
}

void sub_1000B59B4()
{
}

void sub_1000B5A14()
{
  id v2 = [(id)sub_100062BD4() name];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_100062BBC();
  sub_100062BA8( (void *)&_mh_execute_header,  v4,  v5,  "No permitted identifiers found for activity %{public}@ app %{public}@",  v6,  v7,  v8,  v9,  v10);

  sub_10000862C();
}

void sub_1000B5A98()
{
  id v2 = [(id)sub_100062BD4() name];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_100062BBC();
  sub_100062BA8( (void *)&_mh_execute_header,  v4,  v5,  "No relevant background execution modes found for activity %{public}@ app %{public}@",  v6,  v7,  v8,  v9,  v10);

  sub_10000862C();
}

void sub_1000B5B1C()
{
  id v2 = [(id)sub_100062BD4() name];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_100062BBC();
  sub_100062BA8( (void *)&_mh_execute_header,  v4,  v5,  "Activity %{public}@ background launch not allowed for app %{public}@",  v6,  v7,  v8,  v9,  v10);

  sub_10000862C();
}

void sub_1000B5BA0()
{
  id v2 = [(id)sub_100062BD4() name];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_100062BBC();
  sub_100062BA8( (void *)&_mh_execute_header,  v4,  v5,  "Activity %{public}@: app %{public}@ is not installed",  v6,  v7,  v8,  v9,  v10);

  sub_10000862C();
}

void sub_1000B5C24()
{
  id v2 = [(id)sub_100062BD4() name];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_100062BBC();
  sub_100062BA8( (void *)&_mh_execute_header,  v4,  v5,  "Activity %{public}@: app %{public}@ has invalid state",  v6,  v7,  v8,  v9,  v10);

  sub_10000862C();
}

void sub_1000B5CA8(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Fetched %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000B5D1C()
{
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_1000138D4();
}

void sub_1000B5D48()
{
}

void sub_1000B5D74()
{
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_1000138D4();
}

void sub_1000B5DA0()
{
}

void sub_1000B5DCC()
{
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_1000138D4();
}

void sub_1000B5DF8()
{
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_1000138D4();
}

void sub_1000B5E24()
{
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_1000138D4();
}

void sub_1000B5E50()
{
}

void sub_1000B5E7C(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a2 identifier]);
  int v5 = 138412290;
  uint8_t v6 = v4;
  _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "Missing service name for %@",  (uint8_t *)&v5,  0xCu);
}

void sub_1000B5F20()
{
}

void sub_1000B5F80()
{
}

void sub_1000B5FE0()
{
}

void sub_1000B6048()
{
}

void sub_1000B6074( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000B60DC(void *a1)
{
  id v2 = objc_msgSend((id)sub_100062BD4(), "scheduler_activity");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000863C();
  sub_10006B55C();
  _os_log_error_impl(v4, v5, v6, v7, v8, 0x20u);

  sub_10006B4D0();
}

void sub_1000B6184(void *a1)
{
  id v2 = [(id)sub_100062BD4() name];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10006B56C();
  sub_10006B548( (void *)&_mh_execute_header,  v4,  v5,  "xpc_event_publisher_fire failed to run %{public}@ with error %d",  v6,  v7,  v8,  v9,  v10);

  sub_10000862C();
}

void sub_1000B620C(void *a1)
{
  id v2 = [(id)sub_100062BD4() name];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10006B56C();
  sub_10006B548( (void *)&_mh_execute_header,  v4,  v5,  "xpc_event_publisher_fire failed to suspend %{public}@ with error %d",  v6,  v7,  v8,  v9,  v10);

  sub_10000862C();
}

void sub_1000B6294(void *a1)
{
  id v2 = objc_msgSend((id)sub_100062BD4(), "scheduler_activity");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000863C();
  sub_10006B55C();
  _os_log_error_impl(v4, v5, v6, v7, v8, 0x16u);

  sub_10000862C();
}

void sub_1000B633C(void *a1, void *a2)
{
  sub_10006B4D0();
}

void sub_1000B6400(void *a1)
{
  sub_10006B4D0();
}

void sub_1000B6478(void *a1)
{
  sub_10006B4D0();
}

void sub_1000B64F0()
{
}

void sub_1000B6550()
{
}

void sub_1000B65B0()
{
}

void sub_1000B6618()
{
}

void sub_1000B6644()
{
}

void sub_1000B6670()
{
}

void sub_1000B66D8()
{
}

void sub_1000B6704(void *a1)
{
  sub_10006B4D0();
}

void sub_1000B677C()
{
}

void sub_1000B67A8(void *a1)
{
  sub_10006B4D0();
}

void sub_1000B6820(void *a1)
{
  sub_10006B4D0();
}

void sub_1000B6898()
{
}

void sub_1000B68C4(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a2 startDate]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a2 endDate]);
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "SUTelemetryTask: PredictedWindow start: %@ end: %@",  (uint8_t *)&v6,  0x16u);
}

void sub_1000B6990()
{
}

void sub_1000B69BC()
{
}

void sub_1000B69E8()
{
}

void sub_1000B6A14()
{
}

void sub_1000B6A40()
{
}

void sub_1000B6A6C()
{
}

void sub_1000B6A98()
{
}

void sub_1000B6AC4()
{
}

void sub_1000B6AF0()
{
}

void sub_1000B6B1C(void *a1)
{
  id v2 = a1;
  sub_10006CD74();
  sub_10003A14C( (void *)&_mh_execute_header,  v3,  v4,  "SUTelemetryTask: Reporting %lu blockers to CoreAnalytics.",  v5,  v6,  v7,  v8,  0);

  sub_100015D90();
}

void sub_1000B6B94()
{
}

void sub_1000B6BC0()
{
}

void sub_1000B6BEC()
{
}

void sub_1000B6C18()
{
}

void sub_1000B6C44(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_10006CD74();
  sub_10003A14C( (void *)&_mh_execute_header,  v4,  v5,  "SUTelemetryTask: Reporting %lu persistentBlockers to CoreAnalytics.",  v6,  v7,  v8,  v9,  0);

  sub_100015D90();
}

void sub_1000B6CBC(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Unable to update scores for error: %d",  (uint8_t *)v2,  8u);
}

void sub_1000B6D30(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a2 error]);
  int v6 = 138412290;
  uint64_t v7 = v4;
  sub_10004CAF8((void *)&_mh_execute_header, v3, v5, "Unable to open sink with error: %@", (uint8_t *)&v6);

  sub_100053FE8();
}

void sub_1000B6DC8(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = a1;
  sub_10004CAF8((void *)&_mh_execute_header, a2, a3, "%@ is missing the event body!", (uint8_t *)&v3);
}

void sub_1000B6E34(void *a1, void *a2)
{
  int v3 = a2;
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 1024;
  unsigned int v7 = [a1 type];
  _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "Invalid type of result event for %@: %d",  (uint8_t *)&v4,  0x12u);

  sub_100053FE8();
}

void sub_1000B6ED4()
{
  int v2 = 136315650;
  sub_100070FA4();
  sub_100053FFC( (void *)&_mh_execute_header,  v0,  v1,  "%s: Unable to register producing activity for %@ with error: %@",  v2);
  sub_100053FE8();
}

void sub_1000B6F40()
{
  int v2 = 136315650;
  sub_100070FA4();
  sub_100053FFC( (void *)&_mh_execute_header,  v0,  v1,  "%s: Unable to deregister producing activity for %@ with error: %@",  v2);
  sub_100053FE8();
}

void sub_1000B6FAC()
{
  int v2 = 136315650;
  sub_100054010();
  sub_100053FFC((void *)&_mh_execute_header, v0, v1, "%s: Unable to report %@ result consumption with error: %@", v2);
  sub_100053FE8();
}

void sub_1000B7020()
{
  int v2 = 136315650;
  sub_100054010();
  sub_100053FFC((void *)&_mh_execute_header, v0, v1, "%s: Unable to report %@ result production with error: %@", v2);
  sub_100053FE8();
}

void sub_1000B7094(uint64_t a1, os_log_s *a2)
{
  uint64_t v2 = *(void *)(*(void *)a1 + 8LL);
  int v3 = 136315394;
  int v4 = "-[_DASActivityResultDependencyGroup resetAccumulation]_block_invoke";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "%s: Result dependencies have been reset for %@",  (uint8_t *)&v3,  0x16u);
}

void sub_1000B7124(void *a1, void *a2)
{
  int v3 = a1;
  int v4 = (void *)objc_claimAutoreleasedReturnValue([a2 error]);
  int v6 = 138412290;
  unsigned int v7 = v4;
  sub_10004CAF8((void *)&_mh_execute_header, v3, v5, "Unable to open sink with error: %@", (uint8_t *)&v6);

  sub_100015D90();
}

void sub_1000B71B8(void *a1, void *a2)
{
  int v3 = a2;
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 1024;
  unsigned int v7 = [a1 type];
  _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "Invalid type of completion event for %@: %d",  (uint8_t *)&v4,  0x12u);

  sub_100015D90();
}

void sub_1000B7254(uint64_t a1, os_log_s *a2)
{
  uint64_t v2 = *(void *)(*(void *)a1 + 16LL);
  int v3 = 136315394;
  int v4 = "-[_DASActivityCompletionDependencyGroup resetAccumulation]_block_invoke";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "%s: Resetting completion dependencies for %@",  (uint8_t *)&v3,  0x16u);
}

void sub_1000B72E4(void *a1)
{
  id v1 = a1;
  uint64_t v2 = __error();
  strerror(*v2);
  sub_100015D7C((void *)&_mh_execute_header, v3, v4, "Failed to obtain size for snapshot: %s", v5, v6, v7, v8, 2u);

  sub_100015D90();
}

void sub_1000B7364(void *a1)
{
  id v1 = a1;
  uint64_t v2 = __error();
  strerror(*v2);
  sub_100015D7C((void *)&_mh_execute_header, v3, v4, "Failed to obtain snapshot: %s", v5, v6, v7, v8, 2u);

  sub_100015D90();
}

void sub_1000B73E4()
{
}

void sub_1000B7444()
{
}

void sub_1000B74A8()
{
  sub_10004CAF8((void *)&_mh_execute_header, v0, v1, "No launch reasons, calling completion and returning for %@", v2);
  sub_10000860C();
}

void sub_1000B750C(void **a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *a1;
  uint64_t v5 = a2;
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 assertion]);
  int v8 = 138412546;
  uint64_t v9 = v6;
  __int16 v10 = 2112;
  uint64_t v11 = a3;
  sub_10004CB04((void *)&_mh_execute_header, v5, v7, "Error invalidating assertion %@: %@", (uint8_t *)&v8);

  sub_10000862C();
}

void sub_1000B75B4()
{
}

void sub_1000B75E0()
{
}

void sub_1000B7644()
{
  __int16 v4 = 2112;
  uint64_t v5 = v0;
  sub_100098E74((void *)&_mh_execute_header, v1, v2, "Running completion for app: %@ for activities: %@", v3);
  sub_10000860C();
}

void sub_1000B76B8(uint8_t *a1, uint64_t a2, void *a3, os_log_s *a4)
{
  uint64_t v4 = *(void *)(*(void *)a2 + 56LL);
  *(_DWORD *)a1 = 138543362;
  *a3 = v4;
  sub_10001C924((void *)&_mh_execute_header, a4, (uint64_t)a3, "%{public}@", a1);
}

void sub_1000B7700(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 extensionName]);
  sub_10000863C();
  sub_10001C924((void *)&_mh_execute_header, a2, v4, "Sending suspend signal to extension %{public}@", v5);

  sub_100015D90();
}

void sub_1000B7780(uint64_t a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) extensionName]);
  sub_10000863C();
  sub_10004CAF8( (void *)&_mh_execute_header,  a2,  v4,  "Extension %{public}@ did not suspend in time. Forcefully unloading.",  v5);

  sub_100015D90();
}

void sub_1000B7804(uint8_t *a1, void *a2, void *a3, os_log_s *a4)
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a2 assertion]);
  signed int v8 = [v7 pid];
  *(_DWORD *)a1 = 134217984;
  *a3 = v8;
  _os_log_error_impl( (void *)&_mh_execute_header,  a4,  OS_LOG_TYPE_ERROR,  "Failed to drop assertion for app with pid: %ld",  a1,  0xCu);
}

void sub_1000B7880()
{
}

void sub_1000B78AC()
{
}

void sub_1000B7910()
{
}

void sub_1000B7970(void *a1, os_log_s *a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 name]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 debugDescription]);
  int v7 = 138412546;
  signed int v8 = v4;
  sub_100098E80();
  sub_10004CB04( (void *)&_mh_execute_header,  a2,  v6,  "ERROR Submitting Activity: %@ due to configuration limits. Please contact das-core@group.apple.com to prevent this a ctivity from getting rejected. Configuration: %@",  (uint8_t *)&v7);

  sub_10000862C();
}

void sub_1000B7A14(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 debugDescription]);
  sub_10000863C();
  sub_10004CAF8((void *)&_mh_execute_header, a2, v4, "WARNING Submitting Activity: %@ due to configuration limits", v5);

  sub_100015D90();
}

void sub_1000B7A94()
{
}

void sub_1000B7AF4()
{
}

void sub_1000B7B5C()
{
}

void sub_1000B7BBC(id *a1, os_log_s *a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*a1 debugDescription]);
  int v7 = 138412546;
  signed int v8 = v4;
  sub_100098E80();
  sub_10004CB04((void *)&_mh_execute_header, a2, v6, "Bad duration %@ for activity %@", (uint8_t *)&v7);

  sub_10000862C();
}

void sub_1000B7C68(id *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*a1 identifier]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 0.0));
  int v6 = 138412546;
  int v7 = v3;
  sub_100098E80();
  sub_100098E74( (void *)&_mh_execute_header,  a2,  v5,  "No endtime for activity %@, using now as end date. Duration is %@",  (uint8_t *)&v6);

  sub_10000862C();
}

void sub_1000B7D14()
{
}

void sub_1000B7D7C()
{
}

void sub_1000B7DDC(void *a1, uint64_t a2, os_log_s *a3, void *a4)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  sub_10004CAF8( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Identical launch request already scheduled for %@",  (uint8_t *)a2);
}

void sub_1000B7E30(void *a1, uint64_t a2, os_log_s *a3, void *a4)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  sub_10004CAF8( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Not Supported: High-priority silent push. (App=%{public}@)",  (uint8_t *)a2);
}

void sub_1000B7E84( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000B7EE8(int *a1, os_log_s *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to connect to app with pid %d after 10 seconds, dropping all assertions",  (uint8_t *)v3,  8u);
  sub_1000138D4();
}

void sub_1000B7F5C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000B7FC4()
{
}

void sub_1000B8024()
{
}

void sub_1000B8084()
{
}

void sub_1000B80E8()
{
}

void sub_1000B814C()
{
}

void sub_1000B81B0(void *a1, os_log_s *a2)
{
  id v3 = objc_claimAutoreleasedReturnValue([a1 description]);
  [v3 UTF8String];
  sub_10000863C();
  sub_10004CAF8((void *)&_mh_execute_header, a2, v4, "Unable to remove temporary file: %s", v5);

  sub_100015D90();
}

void sub_1000B8238()
{
  __int16 v3 = 2080;
  uint64_t v4 = v0;
  sub_10004CB04((void *)&_mh_execute_header, v1, (uint64_t)v1, "%@ (%s)", v2);
  sub_10000860C();
}

void sub_1000B82AC()
{
}

void sub_1000B82D8(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_10000863C();
  sub_100015D7C((void *)&_mh_execute_header, v3, v4, "Illegal call to %@, invalidating", v5, v6, v7, v8, v9);

  sub_100015D90();
}

void sub_1000B8350(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_10000863C();
  sub_100015D7C((void *)&_mh_execute_header, v3, v4, "Illegal call to %@, invalidating", v5, v6, v7, v8, v9);

  sub_100015D90();
}

void sub_1000B83CC(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_10000863C();
  sub_100015D7C((void *)&_mh_execute_header, v3, v4, "Illegal call to %@, invalidating", v5, v6, v7, v8, v9);

  sub_100015D90();
}

void sub_1000B8448(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_10000863C();
  sub_100015D7C((void *)&_mh_execute_header, v3, v4, "Illegal call to %@, invalidating", v5, v6, v7, v8, v9);

  sub_100015D90();
}

void sub_1000B84C4(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_10000863C();
  sub_100015D7C((void *)&_mh_execute_header, v3, v4, "Illegal call to %@, invalidating", v5, v6, v7, v8, v9);

  sub_100015D90();
}

void sub_1000B8540(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_10000863C();
  sub_100015D7C((void *)&_mh_execute_header, v3, v4, "Illegal call to %@, invalidating", v5, v6, v7, v8, v9);

  sub_100015D90();
}

void sub_1000B85BC()
{
}

void sub_1000B8620( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000B8650()
{
}

void sub_1000B86B4()
{
}

void sub_1000B8734()
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 name]);
  [*v0 processIdentifier];
  sub_10009F768();
  sub_10009F754((void *)&_mh_execute_header, v3, v4, "%{public}@: Process %d not entitled", v5, v6, v7, v8, v9);

  sub_10000862C();
}

void sub_1000B87B8()
{
}

void sub_1000B8818()
{
}

void sub_1000B8888(uint64_t a1, void *a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a2 clientProvidedIdentifier]);
  int v6 = 138543874;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  uint8_t v9 = @"com.apple.";
  __int16 v10 = 2114;
  uint64_t v11 = v5;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "%{public}@ using %{public}@ prefix for task %{public}@ that is only reserved for Apple apps",  (uint8_t *)&v6,  0x20u);
}

void sub_1000B8948( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000B8978()
{
}

void sub_1000B89DC()
{
}

void sub_1000B8A3C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000B8A6C()
{
}

void sub_1000B8AD8()
{
  sub_10000862C();
}

void sub_1000B8B54()
{
  sub_10000862C();
}

void sub_1000B8BD0()
{
}

void sub_1000B8C34(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412546;
  uint64_t v3 = @"com.apple.appResume.signpostReader";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "Failed to expire task:%@ with error:%@",  (uint8_t *)&v2,  0x16u);
}

void sub_1000B8CBC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "MC timer fired but can't evaluate all activities, no daemon!",  v1,  2u);
}

void sub_1000B8CFC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Trying to cancel timer", v1, 2u);
}

void sub_1000B8D3C(void *a1, void *a2)
{
  uint64_t v3 = a1;
  __int16 v4 = (void *)objc_claimAutoreleasedReturnValue([a2 description]);
  sub_10000863C();
  sub_10004CAF8((void *)&_mh_execute_header, v3, v5, "Unable to setup network evaluation for %@", v6);

  sub_100015D90();
}

void sub_1000B8DCC(id *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*a1 description]);
  sub_10000863C();
  sub_10004CAF8( (void *)&_mh_execute_header,  a2,  v4,  "Network evaluation callback is not currently registered for %@!",  v5);

  sub_100015D90();
}

void sub_1000B8E54()
{
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_1000B8EB8()
{
}

void sub_1000B8F1C(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = a1;
  sub_10001C924((void *)&_mh_execute_header, a2, a3, "Finding the last DASTaskCheckpoint event for %@", (uint8_t *)&v3);
}

void sub_1000B8F88(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = a1;
  sub_10001C924( (void *)&_mh_execute_header,  a2,  a3,  "Searching for _DASActivity objects with names: %@",  (uint8_t *)&v3);
}

void sub_1000B8FF4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Flushing PPS caches", v1, 2u);
}

void sub_1000B9034(void *a1, void *a2)
{
  int v3 = a1;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a2 name]);
  int v6 = 138412290;
  uint64_t v7 = v4;
  sub_10001C924( (void *)&_mh_execute_header,  v3,  v5,  "Computing conditions penalty for activity name: %@",  (uint8_t *)&v6);
}

void sub_1000B90D0(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%@ encountered an error while running, adding to errored activities",  (uint8_t *)&v2,  0xCu);
}

void sub_1000B9144(os_log_s *a1)
{
  int v2 = __error();
  uint64_t v3 = strerror(*v2);
  int v4 = 136315138;
  uint64_t v5 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a1,  OS_LOG_TYPE_ERROR,  "Failed to obtain process name: %s",  (uint8_t *)&v4,  0xCu);
}

void sub_1000B91D4()
{
}

void sub_1000B9234()
{
}

void sub_1000B9294()
{
}

void sub_1000B92F4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Plugin interrupted. Nilling out session ID.",  v1,  2u);
}

void sub_1000B9334()
{
}

void sub_1000B9394()
{
}

void sub_1000B93F4(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 sessionID]);
  sub_10000863C();
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Unable to get context for session with ID %@",  v4,  0xCu);
}

void sub_1000B9484()
{
}

void sub_1000B94E4(void *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 currentActivity]);
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_FAULT,  "Request for plugin to start activity while already running. Current: %@. New: %@",  (uint8_t *)&v6,  0x16u);
}

void sub_1000B9590(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Error getting remote context %@",  (uint8_t *)&v2,  0xCu);
}

void sub_1000B9604( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000B966C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

id objc_msgSend_acknowledgeSystemTaskLaunchWithIdentifier_withPID_withUID_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "acknowledgeSystemTaskLaunchWithIdentifier:withPID:withUID:completionHandler:");
}

id objc_msgSend_acknowledgeSystemTaskSuspensionWithIdentifier_withPID_withUID_retryAfter_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "acknowledgeSystemTaskSuspensionWithIdentifier:withPID:withUID:retryAfter:completionHandler:");
}

id objc_msgSend_addDependencyInfoForTask_producedResultIdentifiers_dependencyIdentifiers_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDependencyInfoForTask:producedResultIdentifiers:dependencyIdentifiers:");
}

id objc_msgSend_addPermanentObserverForProperty_notifyInitial_invokeOnMainThread_handler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addPermanentObserverForProperty:notifyInitial:invokeOnMainThread:handler:");
}

id objc_msgSend_allocatedBudgetsWithAverageViews_groupTotalBudget_individualMaxBudgets_individualMinBudget_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allocatedBudgetsWithAverageViews:groupTotalBudget:individualMaxBudgets:individualMinBudget:");
}

id objc_msgSend_applicationLaunchActivityWithName_priority_forApplication_withReason_duration_startingAfter_startingBefore_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "applicationLaunchActivityWithName:priority:forApplication:withReason:duration:startingAfter:startingBefore:");
}

id objc_msgSend_backgroundTaskAllowedWithType_withRationale_withBatteryLevel_isPluggedIn_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backgroundTaskAllowedWithType:withRationale:withBatteryLevel:isPluggedIn:");
}

id objc_msgSend_backgroundTaskAllowedWithType_withRequiredFileProtection_withRationale_withState_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backgroundTaskAllowedWithType:withRequiredFileProtection:withRationale:withState:");
}

id objc_msgSend_chooseActivitiesToRunFromCandidateActivities_toBeRunActivities_toLaunchApplications_toLaunchExtension_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "chooseActivitiesToRunFromCandidateActivities:toBeRunActivities:toLaunchApplications:toLaunchExtension:");
}

id objc_msgSend_collectLaunchDataWithBootBatchTimestamp_opportunisticBatchTimestamp_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "collectLaunchDataWithBootBatchTimestamp:opportunisticBatchTimestamp:completion:");
}

id objc_msgSend_computeEstimatedMADCompletionTime_checkpointTimeSeries_progressTimeSeries_blockingReasonsTimeSeries_activity_osUpgradeTimestamp_endDate_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "computeEstimatedMADCompletionTime:checkpointTimeSeries:progressTimeSeries:blockingReasonsTimeSeries:activity: osUpgradeTimestamp:endDate:");
}

id objc_msgSend_computeEstimatedRunTime_checkpointTimeSeries_progressTimeSeries_activity_endDate_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "computeEstimatedRunTime:checkpointTimeSeries:progressTimeSeries:activity:endDate:");
}

id objc_msgSend_computeSpotlightProgressParamsForTimeSeries_AndReturnNumSamples_initialProcessingCount_finalProcessingCount_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "computeSpotlightProgressParamsForTimeSeries:AndReturnNumSamples:initialProcessingCount:finalProcessingCount:");
}

id objc_msgSend_deviceHasEnoughPluggedInTimeWithMinimumDays_withContext_withKnowledgeStore_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceHasEnoughPluggedInTimeWithMinimumDays:withContext:withKnowledgeStore:");
}

id objc_msgSend_getPPSTimeSeries_category_valueFilter_metrics_timeFilter_limitCount_offsetCount_readDirection_filepath_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "getPPSTimeSeries:category:valueFilter:metrics:timeFilter:limitCount:offsetCount:readDirection:filepath:error:");
}

id objc_msgSend_handleClientLedSystemTaskExpirationWithIdentifier_withPID_withUID_retryAfter_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "handleClientLedSystemTaskExpirationWithIdentifier:withPID:withUID:retryAfter:completionHandler:");
}

id objc_msgSend_hasEnoughTotalPluggedInTimeOfDuration_withMinimumSessionDuration_inLastHours_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasEnoughTotalPluggedInTimeOfDuration:withMinimumSessionDuration:inLastHours:");
}

id objc_msgSend_initWithMetrics_predicate_timeFilter_limitCount_offsetCount_readDirection_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMetrics:predicate:timeFilter:limitCount:offsetCount:readDirection:");
}

id objc_msgSend_launchLikelihoodForTopNApplications_withLikelihoodGreaterThan_withTemporalResolution_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchLikelihoodForTopNApplications:withLikelihoodGreaterThan:withTemporalResolution:");
}

id objc_msgSend_localWakingRegistrationWithIdentifier_contextualPredicate_clientIdentifier_callback_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:");
}

id objc_msgSend_postNotificationAtDate_withTitle_withTextContent_icon_url_expirationDate_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postNotificationAtDate:withTitle:withTextContent:icon:url:expirationDate:");
}

id objc_msgSend_predicateForKeyPath_withPredicate_withPredicateForPreviousState_withMinimumDurationInPreviousState_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "predicateForKeyPath:withPredicate:withPredicateForPreviousState:withMinimumDurationInPreviousState:");
}

id objc_msgSend_recordTaskWorkloadProgress_target_completed_category_subCategory_withPID_withUID_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "recordTaskWorkloadProgress:target:completed:category:subCategory:withPID:withUID:completionHandler:");
}

id objc_msgSend_registerWithContextStoreForId_contextualPredicate_dismissalCondition_deviceSet_mustWake_qualityOfService_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "registerWithContextStoreForId:contextualPredicate:dismissalCondition:deviceSet:mustWake:qualityOfService:");
}

id objc_msgSend_registrationWithIdentifier_contextualPredicate_dismissalPolicy_deviceSet_clientIdentifier_mustWake_qualityOfService_callback_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "registrationWithIdentifier:contextualPredicate:dismissalPolicy:deviceSet:clientIdentifier:mustWake:qualityOfS ervice:callback:");
}

id objc_msgSend_reportSystemTaskWithIdentifier_consumedResults_withPID_withUID_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reportSystemTaskWithIdentifier:consumedResults:withPID:withUID:completionHandler:");
}

id objc_msgSend_reportSystemTaskWithIdentifier_producedResults_withPID_withUID_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reportSystemTaskWithIdentifier:producedResults:withPID:withUID:completionHandler:");
}

id objc_msgSend_resetResultsForIdentifier_byTaskWithIdentifier_withPID_withUID_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetResultsForIdentifier:byTaskWithIdentifier:withPID:withUID:completionHandler:");
}

id objc_msgSend_runLaunchTasks_forApplication_forApplicationURL_onLaunch_onCompletion_onFailure_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runLaunchTasks:forApplication:forApplicationURL:onLaunch:onCompletion:onFailure:");
}

id objc_msgSend_sendAnalyticsEventForStream_withActivity_withMetricValueKey_withMetricValue_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendAnalyticsEventForStream:withActivity:withMetricValueKey:withMetricValue:");
}

id objc_msgSend_shouldGenerateSpotlightProgressTTRForSamples_initialProcessingCount_finalProcessingCount_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldGenerateSpotlightProgressTTRForSamples:initialProcessingCount:finalProcessingCount:");
}

id objc_msgSend_shouldSuspendLongRunningActivity_withStartDate_whileBlockingOtherTasks_atDate_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldSuspendLongRunningActivity:withStartDate:whileBlockingOtherTasks:atDate:");
}

id objc_msgSend_signatureWithDomain_type_subType_subtypeContext_detectedProcess_triggerThresholdValues_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:");
}

id objc_msgSend_submitTaskRequestWithIdentifier_descriptor_withPID_withUID_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "submitTaskRequestWithIdentifier:descriptor:withPID:withUID:completionHandler:");
}

id objc_msgSend_testModeConstraintsRequireOverridingDecisionWithScores_ignoredPolicies_honoredPolicies_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testModeConstraintsRequireOverridingDecisionWithScores:ignoredPolicies:honoredPolicies:");
}

id objc_msgSend_ttrURLWithTitle_withDescription_withStateDictionary_componentID_componentName_componentVersion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "ttrURLWithTitle:withDescription:withStateDictionary:componentID:componentName:componentVersion:");
}

id objc_msgSend_updateTaskRequestWithIdentifier_descriptor_withPID_withUID_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateTaskRequestWithIdentifier:descriptor:withPID:withUID:completionHandler:");
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:");
}