const char *TCCAuthGetReasonDescription(uint64_t a1)
{
  const char *result;
  result = "None";
  switch(a1)
  {
    case 0LL:
      return result;
    case 1LL:
      result = "Recorded";
      break;
    case 2LL:
      result = "Service Default";
      break;
    case 3LL:
      result = "Service Policy";
      break;
    case 4LL:
      result = "Compatibility Policy";
      break;
    case 5LL:
      result = "Override Policy";
      break;
    case 6LL:
      result = "Set";
      break;
    default:
      switch(a1)
      {
        case 1000LL:
          result = "Error";
          break;
        case 1001LL:
          result = "Service Override";
          break;
        case 1002LL:
          result = "Missing Usage String";
          break;
        case 1003LL:
          result = "Prompt Timeout";
          break;
        case 1004LL:
          result = "Preflight Unknown";
          break;
        default:
          if (a1 == 2000) {
            result = "Entitled";
          }
          else {
            result = "<Unknown Reason>";
          }
          break;
      }

      break;
  }

  return result;
}

char *TCCAuthCopyDescription(uint64_t a1)
{
  v2 = 0LL;
  if ((a1 & 0x100000000000000LL) != 0)
  {
    if ((a1 & 0x200000000000000LL) != 0)
    {
      asprintf(&v2, "Auth:{Access:Unknown}");
    }

    else
    {
      TCCAuthGetReasonDescription(WORD2(a1));
      asprintf(&v2, "{Access:%s, reason:%s}");
    }
  }

  else
  {
    asprintf(&v2, "Auth:{Invalid}");
  }

  return v2;
}

void sub_100003570( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

id sub_100003588(uint64_t a1)
{
  if (![*(id *)(a1 + 32) registryDBHandle])
  {
    id result = [*(id *)(a1 + 32) setupDB];
    if ((_DWORD)result) {
      goto LABEL_6;
    }
  }

  if (sqlite3_prepare_v2( (sqlite3 *)[*(id *)(a1 + 32) registryDBHandle],  *(const char **)(a1 + 64),  -1,  &ppStmt,  0))
  {
LABEL_7:
    id result = [*(id *)(a1 + 32) handleDBErrorAndForceCrash:0];
LABEL_6:
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
    return result;
  }

  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    goto LABEL_8;
  }
  while (1)
  {
    int v4 = sqlite3_step(ppStmt);
    if (v4 != 100) {
      break;
    }
    uint64_t v2 = *(void *)(a1 + 48);
LABEL_8:
    (*(void (**)(uint64_t, sqlite3_stmt *))(v2 + 16))(v2, ppStmt);
  }

  int v5 = v4;
  if (v4 != 101)
  {
    v6 = sqlite3_expanded_sql(ppStmt);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 server]);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 logHandle]);

    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      if (v10) {
        sub_10003C2BC((uint64_t)v6, v5, v9);
      }

      sqlite3_free(v6);
      [*(id *)(a1 + 32) handleDBErrorAndForceCrash:0];
    }

    else
    {
      if (v10) {
        sub_10003C250((uint64_t *)(a1 + 64), v9, v11);
      }
    }

    sqlite3_finalize(ppStmt);
    goto LABEL_7;
  }

  return (id)sqlite3_finalize(ppStmt);
}

uint64_t sub_100003BB8(uint64_t result, sqlite3_stmt *a2)
{
  if (a2)
  {
    uint64_t v3 = result;
    id result = sqlite3_bind_int(a2, 4, 1);
    if ((_DWORD)result) {
      return (uint64_t)[*(id *)(v3 + 32) handleDBErrorAndForceCrash:1];
    }
  }

  return result;
}

void sub_100003D80( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100003D9C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100003DAC(uint64_t a1)
{
}

void sub_100003DB4(uint64_t a1, sqlite3_stmt *a2)
{
  int v4 = sqlite3_column_text(a2, 0);
  BOOL v5 = sqlite3_column_int(a2, 3) != 0;
  double v6 = sqlite3_column_double(a2, 1);
  v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s firstSeen = %f previouslySeen = %f known? %d",  v4,  *(void *)&v6,  sqlite3_column_double(a2, 2),  v5);
  id v14 = (id)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v8 = objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) stringByAppendingString:v14]);
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8LL);
  BOOL v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  uint64_t v11 = objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) stringByAppendingString:@"\n"]);
  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8LL);
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;
}

uint64_t sub_100003FD8(uint64_t result, sqlite3_stmt *a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    id result = sqlite3_bind_text(a2, 1, *(const char **)(result + 40), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    if ((_DWORD)result) {
      return (uint64_t)[*(id *)(v2 + 32) handleDBErrorAndForceCrash:1];
    }
  }

  return result;
}

void sub_100004028(uint64_t a1, sqlite3_stmt *a2)
{
  **(_BYTE **)(a1 + 32) = sqlite3_column_int(a2, 3) != 0;
  double v4 = sqlite3_column_double(a2, 1);
  double v5 = sqlite3_column_double(a2, 2);
  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 server]);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 logHandle]);

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 40);
    int v10 = 136446722;
    uint64_t v11 = v9;
    __int16 v12 = 2050;
    double v13 = v4;
    __int16 v14 = 2050;
    double v15 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "found database %{public}s in registry -- first seen at %{public}f, last seen at %{public}f",  (uint8_t *)&v10,  0x20u);
  }
}

void sub_100004270(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) registryEntryFromStep:a2]);
  if (v3)
  {
    double v4 = v3;
    [*(id *)(a1 + 40) addObject:v3];
    uint64_t v3 = v4;
  }
}

uint64_t sub_1000045F4(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t result = sqlite3_column_int(a2, 0);
  *(_DWORD *)(*(void *)(a1 + 32) + 8LL) = result;
  return result;
}

void sub_1000046F0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

id sub_100004708(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) evalDB:"BEGIN" locked:1 bind:0 step:0];
  if ((_DWORD)result
    || (id result = (id)(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))(), (_DWORD)result)
    || (id result = [*(id *)(a1 + 32) evalDB:"END" locked:1 bind:0 step:0], (_DWORD)result))
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
  }

  return result;
}

void sub_10000489C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_1000048B8(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t result = sqlite3_column_int(a2, 0);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

void sub_1000049FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100004A18(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t result = sqlite3_column_int(a2, 0);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

id sub_100004AE0(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 server]);
  double v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 logHandle]);

  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10003C654();
  }

  sqlite3_close((sqlite3 *)[*(id *)(a1 + 32) registryDBHandle]);
  return [*(id *)(a1 + 32) setRegistryDBHandle:0];
}
}

void sub_100004C40( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100004C50( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100004C68(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

  ;
}

void sub_100004C90(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_100004EEC(void *a1)
{
  uint64_t v2 = (void *)a1[6];
  if (v2)
  {
    id v3 = objc_retainBlock(v2);
    [*(id *)(a1[4] + 8) setObject:v3 forKeyedSubscript:a1[5]];
  }

  else
  {
    [*(id *)(a1[4] + 8) removeObjectForKey:a1[5]];
  }

void sub_100004F4C(uint64_t a1)
{
  uint64_t v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) queue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004FC0;
  block[3] = &unk_100064D50;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

id sub_100004FC0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _makeReadyToReceiveMessages];
}

void sub_10000513C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

CFStringRef sub_10000514C(unint64_t a1)
{
  if (a1 > 2) {
    return @"<Unknown>";
  }
  else {
    return *(&off_100064DE8 + a1);
  }
}

_BYTE *sub_100005170(const __CFString *a1)
{
  CFIndex Length = CFStringGetLength(a1);
  v7.location = 0LL;
  v7.length = Length;
  id v3 = 0LL;
  if (CFStringGetBytes(a1, v7, 0x8000100u, 0, 0, 0LL, 0LL, &usedBufLen) == Length
    && (CFIndex v4 = usedBufLen, (v3 = malloc(usedBufLen + 1)) != 0LL)
    && (v8.location = 0LL, v8.length = Length, CFStringGetBytes(a1, v8, 0x8000100u, 0, 0, v3, v4, &usedBufLen) == Length))
  {
    v3[usedBufLen] = 0;
  }

  else
  {
    free(v3);
    return 0LL;
  }

  return v3;
}

void sub_10000524C(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  double v5 = -[TCCDAttributionChain initWithMessage:](objc_alloc(&OBJC_CLASS___TCCDAttributionChain), "initWithMessage:", v3);
  if (v5)
  {
    double v6 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v3, "function"));
    CFRange v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    id v47 = 0LL;
    CFRange v8 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 serviceFromMessage:v3 error:&v47]);
    uint64_t v9 = (NSMutableString *)v47;
    if (!v8)
    {
      v31 = objc_opt_new(&OBJC_CLASS___NSMutableString);
      [(id)qword_100078468 buildErrorString:v31 forError:v9 contextString:0];
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 logHandle]);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        sub_10003C8A8();
      }
      uint64_t v11 = v9;
      goto LABEL_31;
    }

    id v46 = 0LL;
    v44 = v9;
    id v45 = 0LL;
    int v10 = (void *)objc_claimAutoreleasedReturnValue( [(id)qword_100078468 recordFromMessage:v3 accessIdentity:&v46 indirectObjectIdentity:&v45 error:&v44]);
    v41 = (NSMutableString *)v46;
    v39 = (os_log_s *)v45;
    uint64_t v11 = v44;

    xpc_object_t xdict = v4;
    if (v10)
    {
      unint64_t v12 = (unint64_t)[v8 authorizationRightsMask];
      unsigned __int8 v13 = [v10 authorizationValue];
      __int16 v14 = (void *)qword_100078468;
      if ((v12 & (1 << v13)) != 0)
      {
        double v15 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDAttributionChain requestingProcess](v5, "requestingProcess"));
        unsigned __int8 v16 = [v14 canProcess:v15 callFunction:v7 forService:v8 withAccessIdentity:v41];

        if ((v16 & 1) != 0)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue([v10 subjectIdentity]);
          id v18 = [v17 identityType];

          if (v18)
          {
LABEL_30:

            id v4 = xdict;
            v31 = v41;
            v32 = v39;
LABEL_31:

            goto LABEL_32;
          }

          v19 = (NSMutableString *)objc_claimAutoreleasedReturnValue([v10 subjectIdentity]);
          v20 = (void *)qword_100078468;
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDAttributionChain requestingProcess](v5, "requestingProcess"));
          unsigned int v37 = [v20 isProcessServiceCompositionManager:v21];

          v23 = (void *)qword_100078468;
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDAttributionChain requestingProcess](v5, "requestingProcess"));
          LODWORD(v23) = [v23 updateAccessRecord:v10 replaceOnly:0 doCompositionWithChildService:v37 withRequestingProc ess:v22 function:v7 accessIdentity:v41];

          if ((_DWORD)v23)
          {
            char v36 = (char)v23;
            v38 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDAttributionChain requestingProcess](v5, "requestingProcess"));
            if (!v38
              || ([v38 codesignStatus] & 0x4000000) == 0
              || (v24 = (void *)objc_claimAutoreleasedReturnValue([v38 identifier]),
                  unsigned __int8 v25 = [v24 isEqualToString:@"com.apple.tccctl"],
                  v24,
                  (v25 & 1) == 0))
            {
              unsigned int v26 = [v38 isSystemPreferencesApp];
              uint64_t v27 = 5LL;
              if (v26) {
                uint64_t v27 = 2LL;
              }
              uint64_t v35 = v27;
              v28 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 platform]);
              v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableString accessIdentity](v19, "accessIdentity"));
              objc_msgSend( v28,  "sendAnalyticsForAction:service:subjectIdentity:indirectObjectIdentity:authValue:includeV1AuthValue:v1Aut hValue:desiredAuth:domainReason:promptType:",  v35,  v8,  v29,  v39,  objc_msgSend(v10, "authorizationValue"),  0,  0,  0,  0,  0);
            }

            [(id)qword_100078468 scheduleAccessEntryExpiryCheckForService:v8];
            access_changed();
            v30 = (void *)qword_100078468;
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableString identifier](v19, "identifier"));
            objc_msgSend( v30,  "publishAccessChangedEvent:forService:client:clientType:authValue:andKillClient:",  2,  v8,  v23,  -[NSMutableString identifierAuthority](v19, "identifierAuthority"),  objc_msgSend(v10, "authorizationValue"),  !xpc_dictionary_get_BOOL(v3, "noKill"));

            LOBYTE(v23) = v36;
          }

          xpc_dictionary_set_BOOL(xdict, "result", (BOOL)v23);
LABEL_29:

          goto LABEL_30;
        }

        id v42 = 0LL;
        [(id)qword_100078468 makeError:&v42 withCode:5 infoText:0];
        v19 = (NSMutableString *)v42;
        v33 = objc_opt_new(&OBJC_CLASS___NSMutableString);
        [(id)qword_100078468 buildErrorString:v33 forError:v19 contextString:0];
        v34 = (os_log_s *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 logHandle]);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          sub_10003C8A8();
        }
      }

      else
      {
        id v43 = 0LL;
        [(id)qword_100078468 makeError:&v43 withCode:9 infoText:0];
        v19 = (NSMutableString *)v43;
        v33 = objc_opt_new(&OBJC_CLASS___NSMutableString);
        [(id)qword_100078468 buildErrorString:v33 forError:v19 contextString:0];
        v34 = (os_log_s *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 logHandle]);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          sub_10003C8A8();
        }
      }
    }

    else
    {
      v19 = objc_opt_new(&OBJC_CLASS___NSMutableString);
      [(id)qword_100078468 buildErrorString:v19 forError:v11 contextString:0];
      v33 = (NSMutableString *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 logHandle]);
      if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_ERROR)) {
        sub_10003C8A8();
      }
    }

    goto LABEL_29;
  }

  uint64_t v11 = objc_opt_new(&OBJC_CLASS___NSMutableString);
  [(id)qword_100078468 buildErrorString:v11 forError:0 contextString:0];
  CFRange v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 logHandle]);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_10003C8A8();
  }
LABEL_32:
}

void sub_1000057D8(const char **a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (*a1) {
      goto LABEL_8;
    }
  }

  while (1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      double v5 = "_with_parameters";
      if (!a1) {
        double v5 = "";
      }
      *(_DWORD *)buf = 136446466;
      int v10 = v5;
      __int16 v11 = 2082;
      uint64_t v12 = a2;
      _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "FAIL: sandbox_init%{public}s() : %{public}s",  buf,  0x16u);
    }

    abort_with_reason(25LL, 0LL, a2, 576LL);
LABEL_8:
    double v6 = a1 + 2;
    do
    {
      uint64_t v7 = (uint64_t)*(v6 - 1);
      if (v7)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          int v10 = v2;
          __int16 v11 = 2082;
          uint64_t v12 = v7;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "sandbox parameter: %{public}s = %{public}s",  buf,  0x16u);
        }
      }

      CFRange v8 = *v6;
      v6 += 2;
      uint64_t v2 = v8;
    }

    while (v8);
  }

uint64_t start()
{
  os_log_t v0 = os_log_create("com.apple.TCC", "access");
  v1 = (void *)qword_100078240;
  qword_100078240 = (uint64_t)v0;

  uint64_t v2 = objc_autoreleasePoolPush();
  db_setup_queue();
  id v3 = objc_alloc_init(&OBJC_CLASS___TCCDServer);
  id v4 = (void *)qword_100078468;
  qword_100078468 = (uint64_t)v3;

  [(id)qword_100078468 setLogHandle:qword_100078240];
  [(id)qword_100078468 setAllowsInternalSecurityPolicies:os_variant_allows_internal_security_policies("com.apple.tcc")];
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
  [(id)qword_100078468 setPlatform:v5];

  double v6 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 platform]);
  [v6 loadConfigurationDictionary];

  id v7 = objc_claimAutoreleasedReturnValue([(id) qword_100078468 cacheDirectory]);
  [v7 UTF8String];
  id v8 = objc_claimAutoreleasedReturnValue([(id) qword_100078468 temporaryDirectory]);
  [v8 UTF8String];

  uint64_t v9 = (void *)qword_100078240;
  if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_INFO))
  {
    int v10 = v9;
    uid_t v11 = geteuid();
    *(_DWORD *)v21 = 136315394;
    *(void *)&v21[4] = "com.apple.tccd";
    __int16 v22 = 1024;
    uid_t v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "starting as: %s; UID: %d", v21, 0x12u);
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDEventPublisher sharedPublisher](&OBJC_CLASS___TCCDEventPublisher, "sharedPublisher"));
  [(id)qword_100078468 setEventPublisher:v12];

  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.tccd", 0LL, 1uLL);
  __int16 v14 = (void *)qword_100078248;
  qword_100078248 = (uint64_t)mach_service;

  if (!mach_service) {
    sub_10003C914();
  }
  xpc_connection_set_event_handler((xpc_connection_t)qword_100078248, &stru_100064E20);
  xpc_connection_resume((xpc_connection_t)qword_100078248);
  xpc_activity_register("com.apple.tccd.gc", XPC_ACTIVITY_CHECK_IN, &stru_100064E60);
  xpc_set_event_stream_handler("com.apple.distnoted.matching", &_dispatch_main_q, &stru_100064E80);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", &_dispatch_main_q, &stru_100064EA0);

  signal(15, (void (__cdecl *)(int))1);
  dispatch_source_t v15 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, &_dispatch_main_q);
  unsigned __int8 v16 = (void *)qword_100078250;
  qword_100078250 = (uint64_t)v15;

  if (qword_100078250)
  {
    dispatch_source_set_event_handler((dispatch_source_t)qword_100078250, &stru_100064EC0);
    dispatch_resume((dispatch_object_t)qword_100078250);
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  notify_register_dispatch("com.apple.language.changed", (int *)v21, v18, &stru_100064F00);

  [(id)qword_100078468 purgeAllExpiredAccessEntries];
  objc_autoreleasePoolPop(v2);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
  [v19 run];

  return 0LL;
}

void sub_100005C6C(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  id v3 = objc_autoreleasePoolPush();
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_error)
  {
    id v4 = (void *)qword_100078240;
    if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_ERROR)) {
      sub_10003C92C(v4);
    }
  }

  else
  {
    xpc_connection_set_event_handler(v2, &stru_100064E40);
    xpc_connection_resume(v2);
  }

  objc_autoreleasePoolPop(v3);
}

void sub_100005D04(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  id v3 = objc_autoreleasePoolPush();
  if (xpc_get_type(v2) != (xpc_type_t)&_xpc_type_error)
  {
    id v4 = v2;
    string = xpc_dictionary_get_string(v4, "function");
    xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v4);
    id v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
    xpc_object_t reply = xpc_dictionary_create_reply(v4);
    if (!reply)
    {
      unsigned __int8 v25 = xpc_copy_description(v4);
      unsigned int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 logHandle]);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_10003CA44();
      }

      free(v25);
      xpc_connection_cancel(v7);
      goto LABEL_70;
    }

    if (!string)
    {
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 descriptionForMessage:v4]);
      if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_ERROR)) {
        sub_10003CAA4();
      }

      goto LABEL_69;
    }

    uint64_t v9 = xpc_dictionary_get_string(v4, "TCCD_MSG_ID");
    xpc_connection_get_audit_token(v7, &v59);
    int v10 = (void *)qword_100078240;
    if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_DEFAULT))
    {
      loga = v10;
      uid_t v11 = geteuid();
      *(_OWORD *)atoken = v59;
      *(_OWORD *)&atoken[16] = v60;
      uint64_t v12 = v4;
      unsigned __int8 v13 = v2;
      xpc_object_t v14 = reply;
      dispatch_source_t v15 = v7;
      unsigned __int8 v16 = string;
      v17 = v3;
      id v18 = v9;
      pid_t v19 = audit_token_to_pid((audit_token_t *)atoken);
      *(_OWORD *)atoken = v59;
      *(_OWORD *)&atoken[16] = v60;
      uid_t v20 = audit_token_to_euid((audit_token_t *)atoken);
      *(_OWORD *)atoken = v59;
      *(_OWORD *)&atoken[16] = v60;
      uid_t v21 = audit_token_to_auid((audit_token_t *)atoken);
      *(_DWORD *)atoken = 67110402;
      *(_DWORD *)&atoken[4] = v11;
      *(_WORD *)&atoken[8] = 1024;
      *(_DWORD *)&atoken[10] = v19;
      uint64_t v9 = v18;
      id v3 = v17;
      string = v16;
      id v7 = v15;
      xpc_object_t reply = v14;
      uint64_t v2 = v13;
      id v4 = v12;
      *(_WORD *)&atoken[14] = 1024;
      *(_DWORD *)&atoken[16] = v20;
      *(_WORD *)&atoken[20] = 1024;
      *(_DWORD *)&atoken[22] = v21;
      *(_WORD *)&atoken[26] = 2082;
      *(void *)&atoken[28] = string;
      __int16 v62 = 2082;
      v63 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  loga,  OS_LOG_TYPE_DEFAULT,  "REQUEST: tccd_uid=%d, sender_pid=%d, sender_uid=%d, sender_auid=%d, function=%{public}s, msgID=%{public}s",  atoken,  0x2Eu);

      int v10 = (void *)qword_100078240;
    }

    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_INFO))
    {
      __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 descriptionForMessage:v4]);
      uid_t v23 = (os_log_s *)qword_100078240;
      if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)atoken = 136446466;
        *(void *)&atoken[4] = v9;
        *(_WORD *)&atoken[12] = 2114;
        *(void *)&atoken[14] = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "REQUEST_MSG: msgID=%{public}s, msg=%{public}@",  atoken,  0x16u);
      }
    }

    if (strcmp(string, "TCCAccessRequest"))
    {
      if (!strcmp(string, "TCCAccessCopyInformation"))
      {
        handle_TCCAccessCopyInformation(v4, reply);
      }

      else if (!strcmp(string, "TCCAccessCopyInformationForBundle"))
      {
        handle_TCCAccessCopyInformationForBundle(v4, reply);
      }

      else if (!strcmp(string, "TCCAccessCopyInformationForServices"))
      {
        handle_TCCAccessCopyInformationForServices(v4, reply);
      }

      else if (!strcmp(string, "TCCAccessCopyBundleIdentifiersForService"))
      {
        handle_TCCAccessCopyBundleIdentifiersForService(v4, reply);
      }

      else if (!strcmp(string, "TCCAccessCopyBundleIdentifiersDisabledForService"))
      {
        handle_TCCAccessCopyBundleIdentifiersDisabledForService(v4, reply);
      }

      else if (!strcmp(string, "TCCAccessSetInternal"))
      {
        sub_10000524C(v4, reply);
      }

      else if (!strcmp(string, "TCCAccessSetOverride"))
      {
        sub_100007320(v4, reply);
      }

      else if (!strcmp(string, "TCCAccessGetOverride"))
      {
        sub_1000074C0((uint64_t)v4, reply);
      }

      else if (!strcmp(string, "TCCAccessGetOverrides"))
      {
        sub_100007628(reply);
      }

      else if (!strcmp(string, "TCCAccessResetInternal"))
      {
        handle_TCCAccessResetInternal(v4, reply);
      }

      else if (!strcmp(string, "TCCAccessDeclarePolicy"))
      {
        sub_10000771C(v4, reply);
      }

      else if (!strcmp(string, "TCCAccessSelectPolicyForExtensionWithIdentifier"))
      {
        sub_100007988(v4, reply);
      }

      else if (!strcmp(string, "TCCAccessResetPoliciesExcept"))
      {
        sub_100007C2C(v4, reply);
      }

      else if (!strcmp(string, "TCCExpirationCopyInformationForService"))
      {
        sub_100007E44(v4, reply);
      }

      else if (!strcmp(string, "TCCExpirationReset"))
      {
        sub_1000080BC(v4, reply);
      }

      else if (!strcmp(string, "TCCServiceCopyDescriptions"))
      {
        sub_1000084A0(v4, reply);
      }

      else if (!strcmp(string, "TCCTestInternal"))
      {
        sub_10000871C(v4, reply);
      }

      else if (!strcmp(string, "TCCGetIdentityForCredential"))
      {
        sub_1000092F8(v4, reply);
      }

      else if (!strcmp(string, "TCCReportUse"))
      {
        sub_1000096B0(v4, reply);
      }

      else if (!strcmp(string, "TCCAccessSetWithPrompt"))
      {
        sub_100009C68(v4, reply);
      }

      else if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_ERROR))
      {
        sub_10003CB64();
      }

      goto LABEL_63;
    }

    v56 = v9;
    os_log_t log = reply;
    v28 = v4;
    v29 = objc_alloc(&OBJC_CLASS___TCCDRequestContext);
    *(void *)atoken = 0LL;
    v30 = -[TCCDRequestContext initWithRequestMessage:forServer:error:]( v29,  "initWithRequestMessage:forServer:error:",  v28,  qword_100078468,  atoken);

    id v31 = *(id *)atoken;
    id v32 = v31;
    if (!v30)
    {
      if (!v31) {
        id v32 = +[TCCDServer newErrorWithCode:format:]( &OBJC_CLASS___TCCDServer,  "newErrorWithCode:format:",  6LL,  @"Failed to create Request Context.");
      }
      os_log_t v36 = log;
      +[TCCDRequestResult populateReplyMessageToDeny:withError:]( &OBJC_CLASS___TCCDRequestResult,  "populateReplyMessageToDeny:withError:",  log,  v32);
      goto LABEL_62;
    }

    id v55 = sub_10000A8A8(v30);
    if (!v55)
    {
      id v37 = +[TCCDServer newErrorWithCode:format:]( &OBJC_CLASS___TCCDServer,  "newErrorWithCode:format:",  5LL,  @"Failed to create a Result from do_TCCAccessRequest().");

      os_log_t v36 = log;
      +[TCCDRequestResult populateReplyMessageToDeny:withError:]( &OBJC_CLASS___TCCDRequestResult,  "populateReplyMessageToDeny:withError:",  log,  v37);
      id v32 = v37;
LABEL_61:

LABEL_62:
      uint64_t v9 = v56;
LABEL_63:
      id v42 = (void *)qword_100078240;
      if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_INFO))
      {
        id v43 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 descriptionForMessage:reply]);
        v44 = (os_log_s *)qword_100078240;
        if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)atoken = 138543362;
          *(void *)&atoken[4] = v43;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "REPLY_MSG: msg=%{public}@", atoken, 0xCu);
        }

        id v42 = (void *)qword_100078240;
      }

      if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_DEFAULT))
      {
        id v45 = v42;
        uid_t v46 = geteuid();
        *(_DWORD *)atoken = 67109634;
        *(_DWORD *)&atoken[4] = v46;
        *(_WORD *)&atoken[8] = 2082;
        *(void *)&atoken[10] = string;
        *(_WORD *)&atoken[18] = 2082;
        *(void *)&atoken[20] = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "REPLY: (%d) function=%{public}s, msgID=%{public}s",  atoken,  0x1Cu);
      }

LABEL_69:
      xpc_connection_send_message(v7, reply);
LABEL_70:

      goto LABEL_71;
    }

    uint64_t v33 = objc_claimAutoreleasedReturnValue(-[TCCDRequestContext attributionChain](v30, "attributionChain"));
    if (!v33)
    {
LABEL_60:
      os_log_t v36 = log;
      [v55 populateReplyMessage:log];
      goto LABEL_61;
    }

    id v34 = (id)v33;
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext attributionChain](v30, "attributionChain"));
    if (([v35 accessingProcessSpecified] & 1) == 0)
    {
      id v53 = [v55 authorizationValue];

      if (v53 != (id)2) {
        goto LABEL_60;
      }
      id v34 = (id)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext service](v30, "service"));
      v38 = log;
      if ([v34 shouldIssueSandboxExtension])
      {
        xpc_object_t xdict = v38;
        v49 = (void *)objc_claimAutoreleasedReturnValue([v34 name]);
        v54 = v34;
        id v39 = objc_claimAutoreleasedReturnValue([@"com.apple.tcc." stringByAppendingString:v49]);
        id v40 = [v39 UTF8String];

        id v50 = v40;
        if (v40)
        {
          uint64_t v35 = v54;
          else {
            v41 = (const char *)sandbox_extension_issue_file(v50, "/", 0LL);
          }
          id v47 = (char *)v41;
          if (v41)
          {
            xpc_object_t v48 = xpc_string_create(v41);
            if (v48)
            {
              v51 = v48;
              xpc_dictionary_set_value(xdict, "extension", v48);
              free(v47);

              id v34 = v54;
              goto LABEL_46;
            }

            free(v47);
          }

          else if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_ERROR))
          {
            sub_10003CB04();
          }
        }

        id v34 = (id)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext service](v30, "service"));
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext identityDescription](v30, "identityDescription"));
        [v55 denyAuthorizationWithErrorCode:6, @"Failed to issue Sandbox Extension for %@ from %@", v34, v35 format];
        goto LABEL_46;
      }

      uint64_t v35 = v34;
    }

LABEL_46:
    goto LABEL_60;
  }

  if (v2 != (OS_xpc_object *)&_xpc_error_connection_invalid)
  {
    v24 = (void *)qword_100078240;
    if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_ERROR)) {
      sub_10003C9B8(v24);
    }
  }

    id v40 = v42;
    if (!--v38) {
      goto LABEL_47;
    }
  }

  v9->_platformType = 4;
  if ((unint64_t)(v40 + 4) <= v39)
  {
    id v47 = v40[3];
    goto LABEL_86;
  }

LABEL_71:
  objc_autoreleasePoolPop(v3);
}

void sub_10000675C(id a1, OS_xpc_object *a2)
{
  if (xpc_activity_get_state(a2) == 2) {
    sub_100006784();
  }
}

void sub_100006784()
{
  os_log_t v0 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v1 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472LL;
  v55[2] = sub_100010DFC;
  v55[3] = &unk_100064CD8;
  uint64_t v2 = v0;
  v56 = v2;
  id v3 = v1;
  v57 = v3;
  db_eval((uint64_t)"SELECT DISTINCT client, client_type FROM access", 0LL, v55);
  if (!-[NSMutableArray count](v2, "count")) {
    goto LABEL_34;
  }
  uint64_t v41 = 0LL;
  unint64_t v5 = 0LL;
  p_cache = &OBJC_CLASS___libTCCD.cache;
  *(void *)&__int128 v4 = 138543618LL;
  __int128 v37 = v4;
  v38 = v3;
  id v39 = v2;
  do
  {
    id v7 = objc_autoreleasePoolPush();
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v2, "objectAtIndexedSubscript:", v5));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v3, "objectAtIndexedSubscript:", v5));
    id v10 = [v9 intValue];

    id v11 = v8;
    uint64_t v12 = (const char *)[v11 UTF8String];
    if ((_DWORD)v10 == 1)
    {
      if (access(v12, 0) == -1 && *__error() == 2)
      {
        int v19 = 1;
        goto LABEL_13;
      }

      goto LABEL_12;
    }

    if ((_DWORD)v10) {
      goto LABEL_12;
    }
    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v12));
    if (!v13) {
      goto LABEL_12;
    }
    xpc_object_t v14 = (void *)v13;
    id v42 = v11;
    v44 = v7;
    dispatch_source_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v13));
    unsigned __int8 v16 = v15;
    if (v15)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue([v15 appState]);
      unsigned int v18 = [v17 isInstalled];

      if (v18)
      {

        p_cache = (void **)(&OBJC_CLASS___libTCCD + 16);
        id v11 = v42;
        id v7 = v44;
LABEL_12:
        int v19 = 0;
        goto LABEL_13;
      }
    }

    id v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100078468, "platform", v37));
    unsigned int v35 = [v34 isNonAppBundleIdentifierValid:v14];

    int v19 = v35 ^ 1;
    p_cache = (void **)(&OBJC_CLASS___libTCCD + 16);
    id v11 = v42;
    id v7 = v44;
LABEL_13:
    uid_t v20 = (os_log_s *)p_cache[72];
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      if (!v19) {
        goto LABEL_25;
      }
LABEL_15:
      id v45 = v7;
      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3221225472LL;
      v52[2] = sub_100010EBC;
      v52[3] = &unk_1000650B0;
      id v43 = v11;
      id v21 = v11;
      id v53 = v21;
      int v54 = (int)v10;
      __int16 v22 = objc_retainBlock(v52);
      uid_t v23 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472LL;
      v50[2] = sub_100010F2C;
      v50[3] = &unk_100064D00;
      v24 = v23;
      v51 = v24;
      db_eval((uint64_t)"SELECT DISTINCT service FROM access WHERE client = ? AND client_type = ?", v22, v50);
      id v40 = v22;
      db_eval((uint64_t)"DELETE FROM access WHERE client = ? AND client_type = ?", v22, 0LL);
      unsigned __int8 v25 = (os_log_s *)p_cache[72];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v60 = v21;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Pruned entries for %{public}@", buf, 0xCu);
      }

      __int128 v48 = 0u;
      __int128 v49 = 0u;
      __int128 v46 = 0u;
      __int128 v47 = 0u;
      unsigned int v26 = v24;
      id v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v26,  "countByEnumeratingWithState:objects:count:",  &v46,  v58,  16LL);
      if (v27)
      {
        id v28 = v27;
        uint64_t v29 = *(void *)v47;
        do
        {
          for (i = 0LL; i != v28; i = (char *)i + 1)
          {
            if (*(void *)v47 != v29) {
              objc_enumerationMutation(v26);
            }
            uint64_t v31 = *(void *)(*((void *)&v46 + 1) + 8LL * (void)i);
            id v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100078468, "platform", v37));
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v32 serviceByName:v31]);

            [(id)qword_100078468 publishAccessChangedEvent:3 forService:v33 client:v21 clientType:v10 authValue:1 andKillClient:0];
          }

          id v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v26,  "countByEnumeratingWithState:objects:count:",  &v46,  v58,  16LL);
        }

        while (v28);
      }

      ++v41;

      id v3 = v38;
      uint64_t v2 = v39;
      p_cache = (void **)(&OBJC_CLASS___libTCCD + 16);
      id v11 = v43;
      id v7 = v45;
      goto LABEL_25;
    }

    *(_DWORD *)buf = v37;
    os_log_t v36 = "Valid";
    if (v19) {
      os_log_t v36 = "Invalid";
    }
    id v60 = v11;
    __int16 v61 = 2082;
    __int16 v62 = v36;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "prune_database() %{public}@ : %{public}s",  buf,  0x16u);
    if (v19) {
      goto LABEL_15;
    }
LABEL_25:

    objc_autoreleasePoolPop(v7);
    ++v5;
  }

  while (v5 < (unint64_t)-[NSMutableArray count](v2, "count"));
  if (v41) {
    access_changed();
  }
LABEL_34:
}

void sub_100006C84(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  string = xpc_dictionary_get_string(v2, _xpc_event_key_name);
  if (string && !strcmp(string, "Application Uninstalled"))
  {
    xpc_object_t value = xpc_dictionary_get_value(v2, "UserInfo");
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(value);
    if (xpc_get_type(v5) == (xpc_type_t)&_xpc_type_dictionary) {
      double v6 = (void *)_CFXPCCreateCFObjectFromXPCObject(v5);
    }
    else {
      double v6 = 0LL;
    }
    p_cache = &OBJC_CLASS___libTCCD.cache;
    id v8 = (os_log_s *)qword_100078240;
    if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v56 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Handling Application Uninstalled event for %{public}@.",  buf,  0xCu);
    }

    if (v6)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"bundleIDs"]);
      id v10 = v9;
      if (v9)
      {
        __int128 v50 = 0u;
        __int128 v51 = 0u;
        __int128 v48 = 0u;
        __int128 v49 = 0u;
        id v11 = [v9 countByEnumeratingWithState:&v48 objects:buf count:16];
        if (v11)
        {
          id v12 = v11;
          id v34 = v5;
          unsigned int v35 = v2;
          uint64_t v13 = 0LL;
          xpc_object_t v14 = &AnalyticsSendEventLazy_ptr;
          uint64_t v39 = *(void *)v49;
          os_log_t v36 = v10;
          do
          {
            dispatch_source_t v15 = 0LL;
            id v37 = v12;
            do
            {
              if (*(void *)v49 != v39) {
                objc_enumerationMutation(v10);
              }
              uint64_t v16 = *(void *)(*((void *)&v48 + 1) + 8LL * (void)v15);
              v17 = (void *)objc_claimAutoreleasedReturnValue([v14[40] defaultWorkspace]);
              unsigned int v18 = [v17 applicationIsInstalled:v16];

              if (v18)
              {
                int v19 = (os_log_s *)p_cache[72];
                if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)id v53 = 138543362;
                  uint64_t v54 = v16;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "LS says %{public}@ was uninstalled but now we have found it is still installed.",  v53,  0xCu);
                }
              }

              else
              {
                uint64_t v38 = v13;
                v46[0] = _NSConcreteStackBlock;
                v46[1] = 3221225472LL;
                v46[2] = sub_100010F9C;
                v46[3] = &unk_1000650B0;
                v46[4] = v16;
                int v47 = 0;
                uid_t v20 = objc_retainBlock(v46);
                id v21 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
                v44[0] = _NSConcreteStackBlock;
                v44[1] = 3221225472LL;
                v44[2] = sub_10001100C;
                v44[3] = &unk_100064D00;
                __int16 v22 = v21;
                id v45 = v22;
                db_eval((uint64_t)"SELECT DISTINCT service FROM access WHERE client = ? AND client_type = ?", v20, v44);
                db_eval((uint64_t)"DELETE FROM access WHERE client = ? AND client_type = ?", v20, 0LL);
                db_eval((uint64_t)"VACUUM access", 0LL, 0LL);
                uid_t v23 = (os_log_s *)p_cache[72];
                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)id v53 = 138543362;
                  uint64_t v54 = v16;
                  _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Deleted entries for %{public}@",  v53,  0xCu);
                }

                __int128 v42 = 0u;
                __int128 v43 = 0u;
                __int128 v40 = 0u;
                __int128 v41 = 0u;
                v24 = v22;
                id v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v24,  "countByEnumeratingWithState:objects:count:",  &v40,  v52,  16LL);
                if (v25)
                {
                  id v26 = v25;
                  uint64_t v27 = *(void *)v41;
                  do
                  {
                    for (i = 0LL; i != v26; i = (char *)i + 1)
                    {
                      if (*(void *)v41 != v27) {
                        objc_enumerationMutation(v24);
                      }
                      uint64_t v29 = *(void *)(*((void *)&v40 + 1) + 8LL * (void)i);
                      v30 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 platform]);
                      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 serviceByName:v29]);

                      [(id)qword_100078468 publishAccessChangedEvent:3 forService:v31 client:v16 clientType:0 authValue:1 andKillClient:0];
                    }

                    id v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v24,  "countByEnumeratingWithState:objects:count:",  &v40,  v52,  16LL);
                  }

                  while (v26);
                }

                id v32 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 platform]);
                unsigned int v33 = [v32 removalOfAppBundleIdentifierRequiresPruning:v16];

                if (v33) {
                  sub_100006784();
                }
                uint64_t v13 = v38 + 1;

                p_cache = (void **)(&OBJC_CLASS___libTCCD + 16);
                id v10 = v36;
                id v12 = v37;
                xpc_object_t v14 = &AnalyticsSendEventLazy_ptr;
              }

              dispatch_source_t v15 = (char *)v15 + 1;
            }

            while (v15 != v12);
            id v12 = [v10 countByEnumeratingWithState:&v48 objects:buf count:16];
          }

          while (v12);
          unint64_t v5 = v34;
          uint64_t v2 = v35;
          if (v13) {
            access_changed();
          }
        }
      }
    }

    else
    {
      sub_100006784();
    }
  }
}

void sub_10000712C(id a1, OS_xpc_object *a2)
{
  string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
  if (string && !strcmp(string, "com.apple.sockpuppet.applications.updated"))
  {
    id v3 = (os_log_s *)qword_100078240;
    if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 v4 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Notification event: WatchKit applications updated.",  v4,  2u);
    }
  }

void sub_1000071B4(id a1)
{
  v1 = (os_log_s *)qword_100078240;
  if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Handling SIGTERM...", v2, 2u);
  }

  sub_100007218();
}

uint64_t sub_100007218()
{
  os_log_t v0 = (os_log_s *)qword_100078240;
  if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "shutting down tccd...", buf, 2u);
  }

  db_close();
  v1 = (os_log_s *)qword_100078240;
  if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "...exiting when clean.", v3, 2u);
  }

  return xpc_transaction_exit_clean();
}

void sub_1000072BC(id a1, int a2)
{
  uint64_t v2 = (os_log_s *)qword_100078240;
  if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Handling language change...", v3, 2u);
  }

  sub_100007218();
}

void sub_100007320(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  unint64_t v5 = -[TCCDAttributionChain initWithMessage:](objc_alloc(&OBJC_CLASS___TCCDAttributionChain), "initWithMessage:", v3);
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDAttributionChain requestingProcess](v5, "requestingProcess"));
  id v7 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v3, "function"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v14 = 0LL;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 serviceFromMessage:v3 error:&v14]);
  id v10 = v14;
  if (v9)
  {
    if ([(id)qword_100078468 canProcess:v6 callFunction:v8 forService:v9 withAccessIdentity:0])
    {
      BOOL v11 = xpc_dictionary_get_BOOL(v3, "override");
    }
  }

  else
  {
    id v12 = objc_opt_new(&OBJC_CLASS___NSMutableString);
    [(id)qword_100078468 buildErrorString:v12 forError:v10 contextString:0];
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 logHandle]);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10003CBC4();
    }
  }
}

void sub_1000074C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v13 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 serviceFromMessage:a1 error:&v13]);
  id v5 = v13;
  if (v4)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10000FFB4;
    v11[3] = &unk_100064D00;
    id v12 = v4;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100010020;
    v9[3] = &unk_100064D00;
    id v6 = v3;
    id v10 = v6;

    id v7 = v12;
  }

  else
  {
    id v7 = objc_opt_new(&OBJC_CLASS___NSMutableString);
    [(id)qword_100078468 buildErrorString:v7 forError:v5 contextString:0];
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 logHandle]);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10003CC30();
    }
  }
}

void sub_100007628(void *a1)
{
  id v1 = a1;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100010034;
  v4[3] = &unk_100064D00;
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v5 = v2;
  if (!db_eval((uint64_t)"SELECT service FROM access_overrides", 0LL, v4))
  {
    id v3 = (void *)_CFXPCCreateXPCObjectFromCFObject(v2);
    if (v3)
    {
      xpc_dictionary_set_value(v1, "overrides", v3);
    }

    else if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_ERROR))
    {
      sub_10003CC9C();
    }
  }
}

void sub_10000771C(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uuid = xpc_dictionary_get_uuid(v3, "policy");
  string = xpc_dictionary_get_string(v3, "display");
  if (uuid)
  {
    id v7 = string;
    if (string)
    {
      xpc_dictionary_get_audit_token(v3, &v18);
      *(_OWORD *)atoken = v18;
      *(_OWORD *)&atoken[16] = v19;
      audit_token_to_au32((audit_token_t *)atoken, 0LL, 0LL, 0LL, 0LL, 0LL, &pidp, 0LL, 0LL);
      *(_OWORD *)atoken = v18;
      *(_OWORD *)&atoken[16] = v19;
      if (sub_100010090(atoken))
      {
        id v8 = -[TCCDAttributionChain initWithMessage:]( objc_alloc(&OBJC_CLASS___TCCDAttributionChain),  "initWithMessage:",  v3);
        uint64_t v9 = -[TCCDAccessIdentity initWithAttributionChain:preferMostSpecificIdentifier:]( objc_alloc(&OBJC_CLASS___TCCDAccessIdentity),  "initWithAttributionChain:preferMostSpecificIdentifier:",  v8,  1LL);
        id v10 = (void *)qword_100078240;
        if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_INFO))
        {
          BOOL v11 = v10;
          id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDAccessIdentity identifier](v9, "identifier"));
          *(_DWORD *)atoken = 138544130;
          *(void *)&atoken[4] = v12;
          *(_WORD *)&atoken[12] = 1040;
          *(_DWORD *)&atoken[14] = 16;
          *(_WORD *)&atoken[18] = 2096;
          *(void *)&atoken[20] = uuid;
          *(_WORD *)&atoken[28] = 2082;
          *(void *)&atoken[30] = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "AccessDeclarePolicy() for %{public}@ policy: %{uuid_t}.16P; display: '%{public}s'",
            atoken,
            0x26u);
        }

        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDAccessIdentity bundle](v9, "bundle"));
        id v14 = objc_claimAutoreleasedReturnValue([v13 bundleIdentifier]);
        id v15 = [v14 UTF8String];

        if (v15)
        {
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472LL;
          v16[2] = sub_100010128;
          v16[3] = &unk_100064F20;
          v16[4] = uuid;
          v16[5] = v15;
          v16[6] = v7;
          if (!db_eval( (uint64_t)"INSERT OR REPLACE INTO policies (bundle_id, uuid, display) VALUES (?, ?, ?)",  v16,  0LL)) {
            xpc_dictionary_set_BOOL(v4, "result", 1);
          }
        }
      }
    }
  }
}

void sub_100007988(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uuid = xpc_dictionary_get_uuid(v3, "policy");
  string = xpc_dictionary_get_string(v3, "bundle_id");
  if (uuid)
  {
    id v7 = string;
    if (string)
    {
      xpc_dictionary_get_audit_token(v3, v18);
      *(_OWORD *)buf = v18[0];
      *(_OWORD *)&uint8_t buf[16] = v18[1];
      if (sub_100010090(buf))
      {
        id v8 = -[TCCDAttributionChain initWithMessage:]( objc_alloc(&OBJC_CLASS___TCCDAttributionChain),  "initWithMessage:",  v3);
        uint64_t v9 = -[TCCDAccessIdentity initWithAttributionChain:preferMostSpecificIdentifier:]( objc_alloc(&OBJC_CLASS___TCCDAccessIdentity),  "initWithAttributionChain:preferMostSpecificIdentifier:",  v8,  1LL);
        id v10 = (void *)qword_100078240;
        if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_INFO))
        {
          BOOL v11 = v10;
          id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDAccessIdentity identifier](v9, "identifier"));
          *(_DWORD *)buf = 138544130;
          *(void *)&uint8_t buf[4] = v12;
          *(_WORD *)&buf[12] = 1040;
          *(_DWORD *)&buf[14] = 16;
          *(_WORD *)&buf[18] = 2096;
          *(void *)&buf[20] = uuid;
          *(_WORD *)&buf[28] = 2082;
          *(void *)&buf[30] = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "SelectPolicyForExtensionWithIdentifier() for %{public}@ policy: %{uuid_t}.16P; bundle_id: '%{public}s",
            buf,
            0x26u);
        }

        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDAccessIdentity bundle](v9, "bundle"));
        id v14 = objc_claimAutoreleasedReturnValue([v13 bundleIdentifier]);
        id v15 = [v14 UTF8String];

        if (v15)
        {
          *(void *)buf = 0LL;
          *(void *)&buf[8] = buf;
          *(void *)&uint8_t buf[16] = 0x2020000000LL;
          buf[24] = 0;
          v17[0] = 0LL;
          v17[1] = v17;
          v17[2] = 0x2020000000LL;
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472LL;
          v16[2] = sub_1000101E8;
          v16[3] = &unk_100064F98;
          v16[6] = uuid;
          void v16[7] = v15;
          v16[4] = v17;
          v16[5] = buf;
          v16[8] = v7;
          _Block_object_dispose(v17, 8);
          _Block_object_dispose(buf, 8);
        }
      }
    }
  }
}

void sub_100007C00( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_100007C2C(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  xpc_object_t value = xpc_dictionary_get_value(v3, "exceptions");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(value);
  id v7 = v6;
  if (v6)
  {
    if (xpc_get_type(v6) == (xpc_type_t)&_xpc_type_array)
    {
      xpc_dictionary_get_audit_token(v3, v20);
      *(_OWORD *)buf = v20[0];
      __int128 v22 = v20[1];
      if (sub_100010090(buf))
      {
        id v8 = -[TCCDAttributionChain initWithMessage:]( objc_alloc(&OBJC_CLASS___TCCDAttributionChain),  "initWithMessage:",  v3);
        uint64_t v9 = -[TCCDAccessIdentity initWithAttributionChain:preferMostSpecificIdentifier:]( objc_alloc(&OBJC_CLASS___TCCDAccessIdentity),  "initWithAttributionChain:preferMostSpecificIdentifier:",  v8,  1LL);
        id v10 = (void *)qword_100078240;
        if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_INFO))
        {
          uint64_t v11 = v10;
          id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDAccessIdentity identifier](v9, "identifier"));
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "ResetPoliciesExcept() for %{public}@",  buf,  0xCu);
        }

        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDAccessIdentity bundle](v9, "bundle"));
        id v14 = objc_claimAutoreleasedReturnValue([v13 bundleIdentifier]);
        id v15 = [v14 UTF8String];

        if (v15)
        {
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472LL;
          v17[2] = sub_10001043C;
          v17[3] = &unk_100065020;
          id v18 = v7;
          id v19 = v15;
          int v16 = db_transaction(v17);
          access_changed();
          if (!v16) {
            xpc_dictionary_set_BOOL(v4, "result", 1);
          }
        }
      }
    }
  }
}

void sub_100007E44(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = -[TCCDAttributionChain initWithMessage:](objc_alloc(&OBJC_CLASS___TCCDAttributionChain), "initWithMessage:", v3);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDAttributionChain requestingProcess](v5, "requestingProcess"));
  id v7 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v3, "function"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v24 = 0LL;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 serviceFromMessage:v3 error:&v24]);
  id v10 = v24;
  if (v9)
  {
    if ([(id)qword_100078468 canProcess:v6 callFunction:v8 forService:v9 withAccessIdentity:0])
    {
      uint64_t v18 = 0LL;
      id v19 = &v18;
      uint64_t v20 = 0x3032000000LL;
      id v21 = sub_100010650;
      __int128 v22 = sub_100010660;
      id v23 = xpc_array_create(0LL, 0LL);
      if (v19[5])
      {
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472LL;
        v16[2] = sub_100010668;
        v16[3] = &unk_100064D00;
        id v17 = v9;
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472LL;
        v13[2] = sub_1000106D4;
        v13[3] = &unk_100065048;
        id v14 = v17;
        id v15 = &v18;
        if (!db_eval( (uint64_t)"SELECT client, client_type, csreq, last_modified, expired_at FROM expired WHERE service = ?",  v16,  v13)) {
          xpc_dictionary_set_value(v4, "clients", (xpc_object_t)v19[5]);
        }
      }

      _Block_object_dispose(&v18, 8);
    }
  }

  else
  {
    uint64_t v11 = objc_opt_new(&OBJC_CLASS___NSMutableString);
    [(id)qword_100078468 buildErrorString:v11 forError:v10 contextString:0];
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 logHandle]);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10003CCFC();
    }
  }
}

void sub_1000080A4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
}

void sub_1000080BC(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = -[TCCDAttributionChain initWithMessage:](objc_alloc(&OBJC_CLASS___TCCDAttributionChain), "initWithMessage:", v3);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDAttributionChain requestingProcess](v5, "requestingProcess"));
  id v7 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v3, "function"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v27 = 0LL;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 serviceFromMessage:v3 error:&v27]);
  id v10 = v27;
  if (!v9)
  {
    uint64_t v11 = objc_opt_new(&OBJC_CLASS___NSMutableString);
    [(id)qword_100078468 buildErrorString:v11 forError:v10 contextString:0];
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 logHandle]);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10003CD68();
    }
    goto LABEL_24;
  }

  if (xpc_dictionary_get_string(v3, "client"))
  {
    xpc_object_t xdict = v4;
    uint64_t v11 = -[TCCDAccessIdentity initWithMessage:](objc_alloc(&OBJC_CLASS___TCCDAccessIdentity), "initWithMessage:", v3);
    id v12 = objc_claimAutoreleasedReturnValue(-[NSMutableString identifier](v11, "identifier"));
    id v13 = [v12 UTF8String];

    if (v13
      && [(id)qword_100078468 canProcess:v6 callFunction:v8 forService:v9 withAccessIdentity:v11])
    {
      id v14 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSMutableString identifier](v11, "identifier"));
      goto LABEL_11;
    }

    id v4 = xdict;
  }

  else
  {
    uint64_t v11 = 0LL;
    if ([(id)qword_100078468 canProcess:v6 callFunction:v8 forService:v9 withAccessIdentity:0])
    {
      xpc_object_t xdict = v4;
      id v14 = @"kTCCClientAll";
LABEL_11:
      unsigned int v24 = -[NSMutableString client_type](v11, "client_type");
      id v16 = v9;
      id v15 = v14;
      id v25 = v16;
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 name]);
      LODWORD(v16) = [v17 isEqualToString:@"kTCCServiceAll"];

      unsigned int v18 = -[os_log_s isEqualToString:](v15, "isEqualToString:", @"kTCCClientAll");
      if ((_DWORD)v16)
      {
        if (v18)
        {
          int v19 = db_transaction(&stru_100065088);
        }

        else
        {
          v34[0] = _NSConcreteStackBlock;
          v34[1] = 3221225472LL;
          v34[2] = sub_1000109EC;
          v34[3] = &unk_1000650D8;
          unsigned int v35 = v15;
          unsigned int v36 = v24;
          int v19 = db_transaction(v34);
        }

        uint64_t v20 = v25;
        if (v19)
        {
LABEL_18:

          id v4 = xdict;
LABEL_24:

          goto LABEL_25;
        }
      }

      else
      {
        if (v18)
        {
          v32[0] = _NSConcreteStackBlock;
          v32[1] = 3221225472LL;
          v32[2] = sub_100010AE4;
          v32[3] = &unk_100065100;
          uint64_t v20 = v25;
          id v33 = v25;
          int v21 = db_transaction(v32);
          __int128 v22 = v33;
        }

        else
        {
          v28[0] = _NSConcreteStackBlock;
          v28[1] = 3221225472LL;
          v28[2] = sub_100010BCC;
          v28[3] = &unk_100065150;
          uint64_t v20 = v25;
          id v29 = v25;
          v30 = v15;
          unsigned int v31 = v24;
          int v21 = db_transaction(v28);

          __int128 v22 = v29;
        }

        if (v21) {
          goto LABEL_18;
        }
      }

      db_eval((uint64_t)"VACUUM expired", 0LL, 0LL);
      id v23 = (void *)qword_100078240;
      if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_DEBUG)) {
        sub_10003CDD4(v23, v20, (uint64_t)v15);
      }

      id v4 = xdict;
      xpc_dictionary_set_BOOL(xdict, "result", 1);
      goto LABEL_24;
    }
  }

LABEL_25:
}

    unsigned int v24 = v2;
    goto LABEL_26;
  }

  unsigned int v18 = [v1 isPreflight];

  if ((v18 & 1) != 0) {
    goto LABEL_20;
  }
  int v19 = (void *)qword_100078240;
  if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = v19;
    int v21 = (void *)objc_claimAutoreleasedReturnValue([v1 messageIdentifier]);
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v1 service]);
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 name]);
    *(_DWORD *)buf = 138543618;
    id v32 = v21;
    id v33 = 2114;
    id v34 = v23;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "AUTHREQ_RESULT: msgID=%{public}@, service=%{public}@, user wants to learn more, redoing prompt with secondary stage",  buf,  0x16u);
  }

  [v1 setDesiredAuth:2];
  unsigned int v24 = (id)sub_10000A8A8(v1);
LABEL_26:
  id v29 = v24;

  return v29;
}

        unsigned int v18 = 1LL;
LABEL_26:

        goto LABEL_27;
      }

      v98 = v24;
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tvOS_minimumSDKVersionNumber"));
      unsigned int v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tvOS_minimumSDKVersionNumberAuthSpecific"));
      id v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v13));
      v100 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKeyedSubscript:v32]);

      v96 = v30;
      if (v30) {
        v92 = [v30 unsignedIntValue];
      }
      else {
        v92 = 655360;
      }
      id v33 = (void *)objc_claimAutoreleasedReturnValue([v11 name]);
      id v34 = [v33 isEqualToString:@"kTCCServiceBluetoothAlways"];

      if (v34
        && (active_platform = dyld_get_active_platform(),
            unsigned int v36 = (void *)objc_claimAutoreleasedReturnValue([v12 bundle]),
            id v37 = [v36 isASKCapable],
            v36,
            v37))
      {
        unsigned int v24 = v98;
        p_cache = &OBJC_CLASS___libTCCD.cache;
        if (active_platform != 11 && active_platform != 1) {
          goto LABEL_44;
        }
        uint64_t v39 = (os_log_s *)qword_100078240;
        if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_INFO,  "binCompat ASK app found, using default usage description",  buf,  2u);
        }

        __int128 v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", -1LL));
        v92 = [v40 unsignedIntValue];
      }

      else
      {
        unsigned int v24 = v98;
      }

      p_cache = &OBJC_CLASS___libTCCD.cache;
LABEL_44:
      __int128 v41 = (void *)qword_100078240;
      if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_INFO))
      {
        __int128 v42 = (id) v14;
        os_log_t log = v41;
        __int128 v43 = [v42 UTF8String];
        v44 = [v12 responsiblePID];
        v87 = (void *)objc_claimAutoreleasedReturnValue([v12 bundle]);
        id v45 = objc_claimAutoreleasedReturnValue([v87 bundleURL]);
        __int128 v46 = [v45 fileSystemRepresentation];
        *(_DWORD *)buf = 136315650;
        *(void *)v106 = v43;
        *(_WORD *)&v106[8] = 1024;
        *(_DWORD *)v107 = v44;
        unsigned int v24 = v98;
        *(_WORD *)&v107[4] = 2080;
        *(void *)&v107[6] = v46;
        _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "No usage string found (key:%s) for client[%d] in bundle:%s",  buf,  0x1Cu);

        p_cache = &OBJC_CLASS___libTCCD.cache;
      }

      if ((_DWORD)v18)
      {
        int v47 = (void *)qword_100078240;
        if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_DEBUG))
        {
          v76 = (id) v14;
          v77 = v47;
          v88 = [v76 UTF8String];
          v78 = [v12 responsiblePID];
          loga = (os_log_t)objc_claimAutoreleasedReturnValue([v12 bundle]);
          v79 = objc_claimAutoreleasedReturnValue(-[os_log_s bundleURL](loga, "bundleURL"));
          v80 = [v79 fileSystemRepresentation];
          *(_DWORD *)buf = 136316162;
          *(void *)v106 = v88;
          *(_WORD *)&v106[8] = 1024;
          *(_DWORD *)v107 = v92;
          *(_WORD *)&v107[4] = 1024;
          *(_DWORD *)&v107[6] = v78;
          unsigned int v24 = v98;
          *(_WORD *)&v107[10] = 2080;
          *(void *)&v107[12] = v80;
          *(_WORD *)&v107[20] = 1024;
          *(_DWORD *)&v107[22] = v104;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v77,  OS_LOG_TYPE_DEBUG,  "Usage key:%s service sdk version: 0x%x;  client[%d](%s) sdk version: 0x%x",
            buf,
            0x28u);

          p_cache = (void **)(&OBJC_CLASS___libTCCD + 16);
        }

        __int128 v48 = p_cache[72];
        if (os_log_type_enabled((os_log_t)v48, OS_LOG_TYPE_DEFAULT))
        {
          __int128 v49 = v48;
          __int128 v50 = [v100 unsignedIntValue];
          *(_DWORD *)buf = 138412802;
          *(void *)v106 = v24;
          *(_WORD *)&v106[8] = 1024;
          *(_DWORD *)v107 = v50;
          *(_WORD *)&v107[4] = 1024;
          *(_DWORD *)&v107[6] = v104;
          _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "usage description: %@, minSDKVersionAuthSpecific: 0x%x, client_sdk_verison: 0x%x",  buf,  0x18u);

          p_cache = (void **)(&OBJC_CLASS___libTCCD + 16);
        }

        if (v24)
        {
          if (![v100 unsignedIntValue]
            || (__int128 v51 = v104,
                v52 = v51 >= [v100 unsignedIntValue],
                p_cache = &OBJC_CLASS___libTCCD.cache,
                !v52))
          {
            id v53 = (os_log_s *)p_cache[72];
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "No auth specific usage string, falling back to general usage string",  buf,  2u);
            }

            uint64_t v54 = p_cache[72];
            if (os_log_type_enabled((os_log_t)v54, OS_LOG_TYPE_DEFAULT))
            {
              id v55 = v54;
              v56 = [v100 unsignedIntValue];
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)v106 = v56;
              *(_WORD *)&v106[4] = 1024;
              *(_DWORD *)&v106[6] = v104;
              _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "minSDKVersionAuthSpecific: 0x%x, client_sdk_version: 0x%x",  buf,  0xEu);
            }

            *a4 = (uint64_t)v24;

            goto LABEL_25;
          }
        }

        v52 = v104 >= v92;
        *a5 = v104 >= v92;
        if (!v52)
        {
          v57 = (void *)objc_claimAutoreleasedReturnValue([v11 secondaryUsageDescriptionKeyName]);

          if (v57)
          {
            v58 = (void *)objc_claimAutoreleasedReturnValue([v12 bundle]);
            __int128 v59 = (void *)objc_claimAutoreleasedReturnValue([v58 localizedUsageDescriptionForKey:v57]);

            if (v59) {
              *a4 = (uint64_t)v59;
            }
            else {
              *a5 = v104 >> 17 > 4;
            }
            v75 = (void *)qword_100078240;
            if (!os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_DEBUG))
            {
              unsigned int v24 = v59;
              id v14 = (uint64_t)v57;
              goto LABEL_80;
            }

            v98 = v59;
            id v14 = v57;
            v95 = v75;
            v81 = [(id)v14 UTF8String];
            v82 = [v12 responsiblePID];
            v83 = (void *)objc_claimAutoreleasedReturnValue([v12 bundle]);
            v84 = objc_claimAutoreleasedReturnValue([v83 bundleURL]);
            v85 = [v84 fileSystemRepresentation];
            v86 = *a4;
            *(_DWORD *)buf = 136316418;
            *(void *)v106 = v81;
            *(_WORD *)&v106[8] = 1024;
            *(_DWORD *)v107 = 655360;
            *(_WORD *)&v107[4] = 1024;
            *(_DWORD *)&v107[6] = v82;
            *(_WORD *)&v107[10] = 2080;
            *(void *)&v107[12] = v85;
            *(_WORD *)&v107[20] = 1024;
            *(_DWORD *)&v107[22] = v104;
            *(_WORD *)&v107[26] = 2112;
            *(void *)&v107[28] = v86;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v95,  OS_LOG_TYPE_DEBUG,  "Secondary Usage key:%s service sdk version: 0x%x;  client[%d](%s) sdk version: 0x%x: usage string: '%@'",
              buf,
              0x32u);
          }

          else
          {
            if (![v11 shouldUseADefaultDescriptionString])
            {
              id v14 = 0LL;
              goto LABEL_80;
            }

            v63 = (void *)objc_claimAutoreleasedReturnValue([v11 name]);
            v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"REQUEST_DEFAULT_PURPOSE_STRING_SERVICE_%@",  v63));

            v65 = &stru_100066238;
            v94 = (os_log_t)objc_claimAutoreleasedReturnValue([v103 localizedStringForKey:v64 value:&stru_100066238 table:0]);
            if (&_MGGetStringAnswer)
            {
              v66 = MGGetStringAnswer(@"DeviceName");
              v67 = @"device";
              if (v66) {
                v67 = (__CFString *)v66;
              }
              v65 = v67;
            }

            v68 = (void *)objc_claimAutoreleasedReturnValue([v12 displayName]);
            *a4 = (uint64_t)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v94,  @"%@ %@",  0LL,  v68,  v65));

            v69 = (void *)qword_100078240;
            if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_INFO))
            {
              logb = v69;
              v70 = [v12 responsiblePID];
              v71 = (void *)objc_claimAutoreleasedReturnValue([v12 bundle]);
              v72 = objc_claimAutoreleasedReturnValue([v71 bundleURL]);
              v73 = [v72 fileSystemRepresentation];
              v74 = *a4;
              *(_DWORD *)buf = 138544386;
              *(void *)v106 = v64;
              *(_WORD *)&v106[8] = 1024;
              *(_DWORD *)v107 = v70;
              *(_WORD *)&v107[4] = 2082;
              *(void *)&v107[6] = v73;
              *(_WORD *)&v107[14] = 1024;
              *(_DWORD *)&v107[16] = v104;
              *(_WORD *)&v107[20] = 2114;
              *(void *)&v107[22] = v74;
              _os_log_impl( (void *)&_mh_execute_header,  logb,  OS_LOG_TYPE_INFO,  "Per-App Default Purpose String key: %{public}@, client[%d](%{public}s) sdk version: 0x%x: usage string: '%{public}@'",  buf,  0x2Cu);
            }

            id v14 = 0LL;
          }

          unsigned int v24 = v98;
        }
      }
}

void sub_1000084A0(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (!has_private_tcc_entitlement(v3, @"com.apple.private.tcc.manager.service-descriptions", 1))
  {
    id v14 = 0LL;
    [(id)qword_100078468 makeError:&v14 withCode:5 infoText:0];
    id v6 = (__CFString *)v14;
    id v10 = objc_opt_new(&OBJC_CLASS___NSMutableString);
    [(id)qword_100078468 buildErrorString:v10 forError:v6 contextString:0];
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 logHandle]);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10003CEDC();
    }
    goto LABEL_22;
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 platform]);
  id v6 = (__CFString *)objc_claimAutoreleasedReturnValue([v5 name]);

  string = xpc_dictionary_get_string(v3, "platform_name");
  if (!string)
  {
LABEL_19:
    id v10 = (NSMutableString *)objc_claimAutoreleasedReturnValue( +[TCCDService serviceDescriptionsForPlatformName:]( &OBJC_CLASS___TCCDService,  "serviceDescriptionsForPlatformName:",  v6));
    uint64_t v11 = (os_log_s *)_CFXPCCreateXPCObjectFromCFObject(v10);
    if (v11) {
      xpc_dictionary_set_value(v4, "service_descriptions", v11);
    }
    xpc_dictionary_set_BOOL(v4, "result", v11 != 0LL);
LABEL_22:

    goto LABEL_23;
  }

  id v8 = string;
  if (!strncmp(string, "macos", 5uLL))
  {
    id v12 = &TCCDPlatformNameMacOS;
LABEL_17:
    id v13 = *v12;
LABEL_18:

    id v6 = (__CFString *)v13;
    goto LABEL_19;
  }

  if (!strncmp(v8, "ios", 3uLL))
  {
    id v12 = &TCCDPlatformNameIOS;
    goto LABEL_17;
  }

  if (!strncmp(v8, "watchos", 7uLL))
  {
    id v12 = &TCCDPlatformNameWatchOS;
    goto LABEL_17;
  }

  if (!strncmp(v8, "tvos", 4uLL))
  {
    id v12 = &TCCDPlatformNameTVOS;
    goto LABEL_17;
  }

  if (!strncmp(v8, "all", 3uLL))
  {
    id v13 = @"all";
    goto LABEL_18;
  }

  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 logHandle]);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_10003CE7C();
  }

  xpc_dictionary_set_BOOL(v4, "result", 0);
LABEL_23:
}

void sub_10000871C(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  string = xpc_dictionary_get_string(v3, "operation");
  id v6 = -[TCCDAttributionChain initWithMessage:](objc_alloc(&OBJC_CLASS___TCCDAttributionChain), "initWithMessage:", v3);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDAttributionChain requestingProcess](v6, "requestingProcess"));
  if ([(id)qword_100078468 canProcess:v7 callFunction:0 forService:0 withAccessIdentity:0])
  {
    if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_DEBUG)) {
      sub_10003D154();
    }
    if (!strncmp(string, "TestDBAbort", 0xBuLL))
    {
      uint64_t v9 = (os_log_s *)qword_100078240;
      if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_DEBUG)) {
        sub_10003CF48(v9);
      }
      dispatch_time_t v10 = dispatch_time(0LL, 5000000000LL);
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
      id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      dispatch_after(v10, v12, &stru_100065170);
LABEL_29:

LABEL_48:
      BOOL v8 = 1;
LABEL_49:
      xpc_dictionary_set_BOOL(v4, "result", v8);
      goto LABEL_50;
    }

    if (!strncmp(string, "TestDatabaseDescription", 0x17uLL))
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 stateDumpDictionary]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 description]);

      id v15 = v14;
      xpc_dictionary_set_string( v4,  "description_string",  (const char *)-[dispatch_queue_s UTF8String](v15, "UTF8String"));
    }

    else
    {
      if (!strncmp(string, "TestToggleDoComposition", 0x17uLL))
      {
        objc_msgSend((id)qword_100078468, "setTestDoComposition:", xpc_dictionary_get_BOOL(v3, "arg1"));
        xpc_dictionary_set_BOOL(v4, "test_do_composition", (BOOL)[(id)qword_100078468 testDoComposition]);
        goto LABEL_48;
      }

      if (strncmp(string, "SetGenerateBacktraceOnPrompt", 0x1CuLL))
      {
        if (!strncmp(string, "PruneDB", 7uLL))
        {
          sub_100006784();
          goto LABEL_48;
        }

        if (strncmp(string, "pstate-get", 0xAuLL)
          && strncmp(string, "pstate-set", 0xAuLL)
          && strncmp(string, "pstate-reset", 0xCuLL))
        {
          if (strncmp(string, "show-alert", 0xAuLL))
          {
            if (!strncmp(string, "LogFDs", 6uLL))
            {
              log_open_file_descriptors();
              goto LABEL_48;
            }

            if (!strncmp(string, "ExhaustFDs", 0xAuLL))
            {
              dispatch_queue_global_t v27 = dispatch_get_global_queue(0LL, 0LL);
              id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v27);
              dispatch_async(v15, &stru_1000651F0);
              goto LABEL_31;
            }

            if (!strncmp(string, "SetReminderCooldownPeriod", 0x19uLL))
            {
              int64_t int64 = xpc_dictionary_get_int64(v3, "arg1");
              int64_t v34 = xpc_dictionary_get_int64(v3, "arg2");
              unsigned int v35 = (os_log_s *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 logHandle]);
              if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 134349312;
                int64_t v63 = int64;
                __int16 v64 = 2050;
                uint64_t v65 = v34;
                _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_INFO,  "SetReminderCooldownPeriod, system: %{public}llu, service: %{public}llu",  buf,  0x16u);
              }

              unsigned int v36 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 reminderMonitor]);
              [v36 setReminderCooldownPeriod:int64 with:v34];

              goto LABEL_48;
            }

            if (!strncmp(string, "GetReminderCooldownPeriod", 0x19uLL))
            {
              __int128 v40 = (os_log_s *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 logHandle]);
              if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
              {
                __int128 v41 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 reminderMonitor]);
                [v41 systemCooldown];
                uint64_t v43 = (uint64_t)v42;
                v44 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 reminderMonitor]);
                [v44 serviceCooldown];
                *(_DWORD *)buf = 134349312;
                int64_t v63 = v43;
                __int16 v64 = 2050;
                uint64_t v65 = (uint64_t)v45;
                _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_INFO,  "GetReminderCooldownPeriod, system: %{public}llu, service: %{public}llu",  buf,  0x16u);
              }

              __int128 v46 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 reminderMonitor]);
              [v46 systemCooldown];
              xpc_dictionary_set_int64(v4, "systemReminderCooldown", (uint64_t)v47);

              id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 reminderMonitor]);
              -[dispatch_queue_s serviceCooldown](v15, "serviceCooldown");
              int64_t v49 = (uint64_t)v48;
              __int128 v50 = "serviceReminderCooldown";
LABEL_84:
              xpc_dictionary_set_int64(v4, v50, v49);
              goto LABEL_31;
            }

            if (strncmp(string, "accessSetPrompt", 0xFuLL))
            {
              if (!strncmp(string, "TestDatabaseCorrupt", 0x13uLL))
              {
                int v52 = xpc_dictionary_get_int64(v3, "arg1");
                int v53 = db_test_corrupt(v52);
                xpc_dictionary_set_int64(v4, "result_type", v53);
                BOOL v8 = v53 == 0;
                goto LABEL_49;
              }

              if (strncmp(string, "GetIndirectRequestsOutstanding", 0x1EuLL))
              {
                if (!strncmp(string, "SurfaceIndirectOutstandingAlert", 0x1FuLL))
                {
                  v57 = (os_log_s *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 logHandle]);
                  if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_INFO,  "SurfaceIndirectOutstandingAlert",  buf,  2u);
                  }

                  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 platform]);
                  +[TCCDTapToRadar surfaceIndirectAlert:]( &OBJC_CLASS___TCCDTapToRadar,  "surfaceIndirectAlert:",  (int)-[dispatch_queue_s indirectRequestsOutstanding](v12, "indirectRequestsOutstanding"));
                }

                else
                {
                  if (strncmp(string, "SetIndrectRequesetsOutstanding", 0x1EuLL))
                  {
                    if (strncmp(string, "incomingSyncAuth", 0x10uLL)
                      && os_log_type_enabled((os_log_t)qword_100078460, OS_LOG_TYPE_ERROR))
                    {
                      sub_10003D0F4();
                    }

                    BOOL v8 = 0;
                    goto LABEL_49;
                  }

                  int64_t v58 = xpc_dictionary_get_int64(v3, "arg1");
                  __int128 v59 = (os_log_s *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 logHandle]);
                  if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 67240192;
                    LODWORD(v63) = v58;
                    _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_INFO,  "SetIndrectRequesetsOutstanding, requests: %{public}d",  buf,  8u);
                  }

                  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 platform]);
                  -[dispatch_queue_s setIndirectRequestsOutstanding:](v12, "setIndirectRequestsOutstanding:", v58);
                }

                goto LABEL_29;
              }

              uint64_t v54 = (os_log_s *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 logHandle]);
              if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
              {
                id v55 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 platform]);
                *(_DWORD *)buf = 134349056;
                int64_t v63 = (int)[v55 indirectRequestsOutstanding];
                _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_INFO,  "GetIndirectRequestsOutstanding, indirect reuqests outstanding: %{public}llu",  buf,  0xCu);
              }

              id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 platform]);
              int64_t v49 = (int)-[dispatch_queue_s indirectRequestsOutstanding](v15, "indirectRequestsOutstanding");
              __int128 v50 = "indirectRequestsOutstanding";
              goto LABEL_84;
            }

            __int128 v51 = (os_log_s *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 logHandle]);
            if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              int64_t v63 = (int64_t)"handle_TCCTestInternal";
              _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "%s accessSetPrompt", buf, 0xCu);
            }

            id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 logHandle]);
            if (!os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_INFO)) {
              goto LABEL_31;
            }
            *(_DWORD *)buf = 136315138;
            int64_t v63 = (int64_t)"handle_TCCTestInternal";
            unsigned int v18 = "%s not functional";
            goto LABEL_37;
          }

          unsigned int v24 = xpc_dictionary_get_string(v3, "arg1");
          id v25 = xpc_dictionary_get_string(v3, "arg2");
          if (v24) {
            id v26 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v24));
          }
          else {
            id v26 = 0LL;
          }
          if (v25)
          {
            id v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v25));
            id v29 = v28;
            if (v26 && v28)
            {
              unsigned int v61 = [v28 isEqualToString:@"FirstPromptFor3Rights"];
              if ((v61 & 1) != 0)
              {
                int v30 = 1;
                id v31 = +[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform", 1LL);
              }

              else
              {
                if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_ERROR)) {
                  sub_10003D094();
                }
                int v30 = 0;
                id v31 = +[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform", 0LL);
              }

              id v37 = (void *)objc_claimAutoreleasedReturnValue(v31);
              id v32 = (void *)objc_claimAutoreleasedReturnValue([v37 serviceByName:v26]);

              if (v32)
              {
                if (v61)
                {
                  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v32 alertManager]);
                  uint64_t v39 = v38;
                  if (v38)
                  {
                    [v38 displayAlertForCondition:v60 withCustomUserInfo:0];
                  }

                  else
                  {
                    v56 = (os_log_s *)qword_100078240;
                    if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138543362;
                      int64_t v63 = (int64_t)v26;
                      _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEFAULT,  "show-alert: Service: %{public}@ has no alert manager.",  buf,  0xCu);
                    }
                  }

                  int v30 = 1;
                }

                goto LABEL_70;
              }

              if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_ERROR)) {
                sub_10003D034();
              }
LABEL_69:
              id v32 = 0LL;
              int v30 = 0;
LABEL_70:

              BOOL v8 = v30 != 0;
              goto LABEL_49;
            }
          }

          else
          {
            id v29 = 0LL;
          }

          if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_ERROR)) {
            sub_10003CFC0();
          }
          goto LABEL_69;
        }

        int v19 = (char *)xpc_dictionary_get_string(v3, "arg1");
        uint64_t v20 = (char *)xpc_dictionary_get_string(v3, "arg2");
        int64_t v21 = xpc_dictionary_get_int64(v3, "arg3");
        if (v19) {
          int v19 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v19));
        }
        if (v20) {
          uint64_t v20 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v20));
        }
        if (!v19) {
          goto LABEL_46;
        }
        uint64_t v22 = [v19 isEqualToString:@"PostUpgrade3RightAlert"];
        if (!strncmp(string, "pstate-get", 0xAuLL))
        {
          int value = db_persistent_state_get_value(v22, v20);
          xpc_dictionary_set_int64(v4, "pstate_value", value);
        }

        else if (!strncmp(string, "pstate-set", 0xAuLL))
        {
          db_persistent_state_set_value(v22, v20, v21);
        }

        else
        {
          if (strncmp(string, "pstate-reset", 0xCuLL))
          {
LABEL_46:
            BOOL v8 = 0;
LABEL_57:

            goto LABEL_49;
          }

          db_persistent_state_reset(v22, v20);
        }

        BOOL v8 = 1;
        goto LABEL_57;
      }

      BOOL v16 = xpc_dictionary_get_BOOL(v3, "arg1");
      [(id)qword_100078468 setGenerateBacktraceOnPrompt:v16];
      id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 logHandle]);
      if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_INFO))
      {
        id v17 = "false";
        if (v16) {
          id v17 = "true";
        }
        *(_DWORD *)buf = 136446210;
        int64_t v63 = (int64_t)v17;
        unsigned int v18 = "Setting generateBacktraceOnPrompt: %{public}s";
LABEL_37:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v15, OS_LOG_TYPE_INFO, v18, buf, 0xCu);
      }
    }

LABEL_31:
    goto LABEL_48;
  }

LABEL_50:
}

          if (sqlite3_exec((sqlite3 *)qword_1000782F0, "ALTER TABLE access ADD COLUMN pid INTEGER", 0LL, 0LL, 0LL)
            || sqlite3_exec( (sqlite3 *)qword_1000782F0,  "ALTER TABLE access ADD COLUMN pid_version INTEGER",  0LL,  0LL,  0LL)
            || sqlite3_exec( (sqlite3 *)qword_1000782F0,  "ALTER TABLE access ADD COLUMN boot_uuid TEXT NOT NULL DEFAULT 'UNUSED'",  0LL,  0LL,  0LL))
          {
            goto LABEL_86;
          }

void sub_1000092F8(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (has_private_tcc_entitlement(v3, @"com.apple.private.tcc.manager.get-identity-for-credential", 1))
  {
    xpc_object_t value = xpc_dictionary_get_value(v3, "TCC_MSG_REQUEST_AUTHORIZATION_SUBJECT_CREDENTIAL_DICTIONARY_KEY");
    id v6 = (NSMutableString *)objc_claimAutoreleasedReturnValue(value);
    id v7 = v6;
    if (!v6 || xpc_get_type(v6) != (xpc_type_t)&_xpc_type_dictionary)
    {
      id v25 = 0LL;
      [(id)qword_100078468 makeError:&v25 withCode:7 infoText:0];
      id v8 = v25;
      uint64_t v9 = objc_opt_new(&OBJC_CLASS___NSMutableString);
      [(id)qword_100078468 buildErrorString:v9 forError:v8 contextString:0];
      dispatch_time_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 logHandle]);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10003D1C0();
      }
LABEL_6:

      goto LABEL_9;
    }

    if (xpc_dictionary_get_uint64(v7, "TCCD_MSG_CREDENTIAL_AUTHENTICATOR_TYPE_KEY") != 1)
    {
      id v24 = 0LL;
      [(id)qword_100078468 makeError:&v24 withCode:3 infoText:0];
      id v8 = v24;
      uint64_t v9 = objc_opt_new(&OBJC_CLASS___NSMutableString);
      [(id)qword_100078468 buildErrorString:v9 forError:v8 contextString:0];
      dispatch_time_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 logHandle]);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10003D1C0();
      }
      goto LABEL_6;
    }

    size_t length = 0LL;
    if (!xpc_dictionary_get_data(v7, "TCCD_MSG_CREDENTIAL_AUTHENTICATOR_AUDIT_TOKEN_KEY", &length) || length != 32)
    {
      id v22 = 0LL;
      [(id)qword_100078468 makeError:&v22 withCode:4 infoText:0];
      id v8 = v22;
      uint64_t v9 = objc_opt_new(&OBJC_CLASS___NSMutableString);
      [(id)qword_100078468 buildErrorString:v9 forError:v8 contextString:0];
      dispatch_time_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 logHandle]);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10003D1C0();
      }
      goto LABEL_6;
    }

    uint64_t v9 = -[TCCDAttributionChain initWithMessage:]( objc_alloc(&OBJC_CLASS___TCCDAttributionChain),  "initWithMessage:",  v3);
    if (v9)
    {
      uint64_t v11 = -[TCCDAccessIdentity initWithAttributionChain:preferMostSpecificIdentifier:]( objc_alloc(&OBJC_CLASS___TCCDAccessIdentity),  "initWithAttributionChain:preferMostSpecificIdentifier:",  v9,  1LL);
      id v12 = v11;
      if (v11)
      {
        xpc_dictionary_set_uint64( v4,  "TCCD_MSG_IDENTITY_TYPE_KEY",  -[TCCDAccessIdentity client_type](v11, "client_type"));
        id v13 = objc_claimAutoreleasedReturnValue(-[TCCDAccessIdentity identifier](v12, "identifier"));
        xpc_dictionary_set_string(v4, "TCCD_MSG_IDENTITY_ID_KEY", (const char *)[v13 UTF8String]);
      }

      else
      {
        id v15 = (os_log_s *)qword_100078240;
        if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_ERROR)) {
          sub_10003D2C4((uint64_t)v9, v15, v16, v17, v18, v19, v20, v21);
        }
      }
    }

    else
    {
      id v14 = (void *)qword_100078240;
      if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_ERROR)) {
        sub_10003D22C(v14, v3);
      }
    }

    id v8 = 0LL;
  }

  else
  {
    id v26 = 0LL;
    [(id)qword_100078468 makeError:&v26 withCode:5 infoText:0];
    id v8 = v26;
    id v7 = objc_opt_new(&OBJC_CLASS___NSMutableString);
    [(id)qword_100078468 buildErrorString:v7 forError:v8 contextString:0];
    uint64_t v9 = (NSMutableString *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 logHandle]);
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR)) {
      sub_10003D1C0();
    }
  }

LABEL_9:
}

  uint64_t v17 = 1LL;
LABEL_10:
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v8 service]);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 name]);

  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = sub_100022434;
  v44[3] = &unk_100065778;
  uint64_t v20 = v10;
  double v45 = v20;
  __int128 v46 = v19;
  uint64_t v21 = v8;
  double v47 = v21;
  __int128 v50 = v12;
  id v22 = v9;
  __int128 v51 = v11;
  double v48 = v22;
  int64_t v49 = 0LL;
  id v23 = v19;
  id v24 = db_eval( (uint64_t)"INSERT OR REPLACE INTO access   (service, client, client_type, auth_value, auth_reason, auth_version, csreq, policy_id, indirect_object_identifier, flags, pid, pid_version, boot_uuid, last_reminded) VAL UES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",  v44,  0LL);
  if (!v24)
  {
    uint64_t v43 = a5;
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v21 service]);
    id v26 = [v25 supportsStagedPrompting];

    uint64_t v39 = v12;
    __int128 v41 = v17;
    if (v26)
    {
      dispatch_queue_global_t v27 = self;
      if ([v22 previousAuthorization] == (id)1)
      {
        id v28 = 0LL;
      }

      else
      {
        id v29 = [v22 previousAuthorization];
        id v28 = v29 != [v22 authorizationValue];
      }

      int v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "service", v39, v17));
      id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 name]);
      id v32 = [v31 isEqualToString:@"kTCCServiceCalendar"];

      if (v32)
      {
        self = v27;
        if ([v22 previousAuthorization] == (id)4)
        {
          if ([v22 authorizationValue] == (id)2) {
            id v28 = 0LL;
          }
          else {
            id v28 = v28;
          }
        }
      }

      else
      {
        self = v27;
      }
    }

    else
    {
      id v28 = 0LL;
    }

    id v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "service", v39, v41));
    -[TCCDServer scheduleAccessEntryExpiryCheckForService:](self, "scheduleAccessEntryExpiryCheckForService:", v33);

    access_changed();
    int64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v21 subjectIdentity]);
    unsigned int v35 = self;
    unsigned int v36 = (void *)objc_claimAutoreleasedReturnValue([v34 identifier]);
    id v37 = (void *)objc_claimAutoreleasedReturnValue([v21 subjectIdentity]);
    -[TCCDServer publishAccessChangedEvent:forService:client:clientType:authValue:andKillClient:]( v35,  "publishAccessChangedEvent:forService:client:clientType:authValue:andKillClient:",  v42,  v20,  v36,  objc_msgSend(v37, "client_type"),  v40,  v28);

    if (v43) {
      *uint64_t v43 = 0;
    }
  }

  return v24 == 0;
}

LABEL_10:
  uint64_t v18 = v9 & ~*(_DWORD *)(a1 + 40);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10003A4C0;
  v22[3] = &unk_100066098;
  id v25 = v18;
  uint64_t v19 = v5;
  id v23 = v19;
  uint64_t v20 = v7;
  id v24 = v20;
  id v26 = v8;
  if (db_eval_locked( (uint64_t)"UPDATE access SET flags = ? WHERE service = ? AND client = ? AND client_type = ?",  v22,  0LL))
  {
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TCCDPolicyOverride logHandle](&OBJC_CLASS___TCCDPolicyOverride, "logHandle"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v28 = v19;
      id v29 = 2114;
      int v30 = v20;
      id v31 = 1024;
      id v32 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Failed to remove TCCD_ACCESS_ALLOW_STANDARD_USER_TO_SET_SYSTEM_SERVICE flag from database record: serviceName=%{ public}@, identifier=%{public}@, identifier_type=%d",  buf,  0x1Cu);
    }
  }

LABEL_17:
}

void sub_1000096B0(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = objc_alloc(&OBJC_CLASS___TCCDRequestContext);
  id v41 = 0LL;
  id v6 = -[TCCDRequestContext initWithRequestMessage:forServer:error:]( v5,  "initWithRequestMessage:forServer:error:",  v3,  qword_100078468,  &v41);
  id v7 = v41;
  -[TCCDRequestContext setInitialPrompt:](v6, "setInitialPrompt:", 0LL);
  if (v6)
  {
    id v8 = (void *)qword_100078240;
    if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t log = v8;
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext messageIdentifier](v6, "messageIdentifier"));
      dispatch_time_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext functionName](v6, "functionName"));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext service](v6, "service"));
      id v35 = v3;
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 name]);
      id v13 = v4;
      id v14 = -[TCCDRequestContext queryCount](v6, "queryCount");
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext clientDict](v6, "clientDict"));
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext daemonDict](v6, "daemonDict"));
      *(_DWORD *)buf = 138544642;
      uint64_t v43 = v9;
      __int16 v44 = 2112;
      double v45 = v10;
      __int16 v46 = 2112;
      double v47 = v12;
      __int16 v48 = 2048;
      id v49 = v14;
      id v4 = v13;
      __int16 v50 = 2112;
      __int128 v51 = v15;
      __int16 v52 = 2112;
      int v53 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "AUTHREQ_CTX: msgID=%{public}@, function=%@, service=%@, query=%llu, client_dict=%@, daemon_dict=%@",  buf,  0x3Eu);

      id v3 = v35;
    }

    uint64_t v17 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v3, "function"));
    uint64_t v18 = (NSMutableString *)objc_claimAutoreleasedReturnValue(v17);
    id v40 = v7;
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 serviceFromMessage:v3 error:&v40]);
    id v20 = v40;

    if (v19)
    {
      id v21 = [v19 downgradeAuthRight];
      id v22 = (void *)qword_100078468;
      if (v21)
      {
        id v23 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext attributionChain](v6, "attributionChain"));
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 requestingProcess]);
        unsigned __int8 v25 = [v22 canProcess:v24 callFunction:v18 forService:v19 withAccessIdentity:0];

        if ((v25 & 1) != 0)
        {
          id v26 = objc_alloc(&OBJC_CLASS___TCCDAccessIdentity);
          dispatch_queue_global_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext attributionChain](v6, "attributionChain"));
          id v28 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext service](v6, "service"));
          id v29 = -[TCCDAccessIdentity initWithAttributionChain:preferMostSpecificIdentifier:]( v26,  "initWithAttributionChain:preferMostSpecificIdentifier:",  v27,  [v28 hasParanoidSecurityPolicy]);
          -[TCCDRequestContext setSubjectIdentity:](v6, "setSubjectIdentity:", v29);

          int v30 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 reminderMonitor]);
          id v31 = (NSMutableString *)objc_claimAutoreleasedReturnValue([v30 reportResourceUsage:v6]);

          if (v31)
          {
            xpc_dictionary_set_BOOL(v4, "result", 1);
LABEL_22:

            id v7 = v20;
            goto LABEL_23;
          }

          id v36 = v20;
          [(id)qword_100078468 makeError:&v36 withCode:8 infoText:0];
          id v32 = v36;

          id v31 = objc_opt_new(&OBJC_CLASS___NSMutableString);
          [(id)qword_100078468 buildErrorString:v31 forError:v32 contextString:0];
          id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 logHandle]);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
            sub_10003D33C();
          }
        }

        else
        {
          id v37 = v20;
          [(id)qword_100078468 makeError:&v37 withCode:5 infoText:0];
          id v32 = v37;

          id v31 = objc_opt_new(&OBJC_CLASS___NSMutableString);
          [(id)qword_100078468 buildErrorString:v31 forError:v32 contextString:0];
          id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 logHandle]);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
            sub_10003D33C();
          }
        }
      }

      else
      {
        id v38 = v20;
        [(id)qword_100078468 makeError:&v38 withCode:2 infoText:0];
        id v32 = v38;

        id v31 = objc_opt_new(&OBJC_CLASS___NSMutableString);
        [(id)qword_100078468 buildErrorString:v31 forError:v32 contextString:0];
        id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 logHandle]);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          sub_10003D33C();
        }
      }
    }

    else
    {
      id v39 = v20;
      [(id)qword_100078468 makeError:&v39 withCode:2 infoText:0];
      id v32 = v39;

      id v31 = objc_opt_new(&OBJC_CLASS___NSMutableString);
      [(id)qword_100078468 buildErrorString:v31 forError:v32 contextString:0];
      id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 logHandle]);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        sub_10003D33C();
      }
    }

    id v20 = v32;
    goto LABEL_22;
  }

  if (!v7) {
    id v7 = +[TCCDServer newErrorWithCode:format:]( &OBJC_CLASS___TCCDServer,  "newErrorWithCode:format:",  6LL,  @"Failed to create Request Context.");
  }
  uint64_t v18 = objc_opt_new(&OBJC_CLASS___NSMutableString);
  [(id)qword_100078468 buildErrorString:v18 forError:v7 contextString:0];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 logHandle]);
  if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR)) {
    sub_10003D33C();
  }
LABEL_23:
}

void sub_100009C68(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = objc_opt_new(&OBJC_CLASS___TCCDRequestResult);
  -[TCCDRequestResult setPromptType:](v5, "setPromptType:", 4LL);
  id v6 = (os_log_s *)qword_100078240;
  if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v93 = "handle_TCCSetAccessWithPrompt";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s begin", buf, 0xCu);
  }

  id v91 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 serviceFromMessage:v3 error:&v91]);
  id v8 = v91;
  if (v7)
  {
    id v85 = v4;
    uint64_t v9 = objc_alloc_init(&OBJC_CLASS___TCCDRequestContext);
    -[TCCDRequestContext setSpiVersion:](v9, "setSpiVersion:", 2LL);
    -[TCCDRequestContext setFunctionName:](v9, "setFunctionName:", @"TCCAccessRequest");
    -[TCCDRequestContext setService:](v9, "setService:", v7);
    -[TCCDRequestContext setAccessSetPrompt:](v9, "setAccessSetPrompt:", 1LL);
    dispatch_time_t v10 = -[TCCDAttributionChain initWithMessage:]( objc_alloc(&OBJC_CLASS___TCCDAttributionChain),  "initWithMessage:",  v3);
    uint64_t v11 = (void *)qword_100078240;
    if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v11;
      id v13 = (char *)objc_claimAutoreleasedReturnValue(-[TCCDAttributionChain requestingProcess](v10, "requestingProcess"));
      *(_DWORD *)buf = 138412290;
      v93 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "requesting process; %@", buf, 0xCu);
    }

    id v14 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v3, "function"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    uint64_t v16 = qword_100078468;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDAttributionChain requestingProcess](v10, "requestingProcess"));
    LOBYTE(v16) = [(id)v16 canProcess:v17 callFunction:v15 forService:v7 withAccessIdentity:0];

    if ((v16 & 1) == 0)
    {
      id v89 = v8;
      [(id)qword_100078468 makeError:&v89 withCode:5 infoText:0];
      id v20 = v89;

      id v21 = objc_opt_new(&OBJC_CLASS___NSMutableString);
      [(id)qword_100078468 buildErrorString:v21 forError:v20 contextString:0];
      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 logHandle]);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_10003D3A8();
      }
      goto LABEL_55;
    }

    string = xpc_dictionary_get_string(v3, "client_type");
    uint64_t v19 = xpc_dictionary_get_string(v3, "client");
    if (strcmp(string, "bundle"))
    {
      id v88 = v8;
      [(id)qword_100078468 makeError:&v88 withCode:6 infoText:0];
      id v20 = v88;

      id v21 = objc_opt_new(&OBJC_CLASS___NSMutableString);
      [(id)qword_100078468 buildErrorString:v21 forError:v20 contextString:0];
      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 logHandle]);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_10003D3A8();
      }
      goto LABEL_55;
    }

    id v23 = objc_alloc(&OBJC_CLASS___TCCDAccessIdentity);
    id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v19));
    unsigned __int8 v25 = -[TCCDAccessIdentity initWithIdentifier:type:executableURL:SDKVersion:platformType:]( v23,  "initWithIdentifier:type:executableURL:SDKVersion:platformType:",  v24,  0LL,  0LL,  0LL,  0LL);

    id v26 = (os_log_s *)qword_100078240;
    v84 = (NSMutableString *)v25;
    if (!v25)
    {
      if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_ERROR)) {
        sub_10003D414(v26, v45, v46, v47, v48, v49, v50, v51);
      }
      id v87 = v8;
      [(id)qword_100078468 makeError:&v87 withCode:6 infoText:0];
      id v20 = v87;

      id v22 = objc_opt_new(&OBJC_CLASS___NSMutableString);
      [(id)qword_100078468 buildErrorString:v22 forError:v20 contextString:0];
      __int16 v52 = (os_log_s *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 logHandle]);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
        sub_10003D3A8();
      }
      goto LABEL_54;
    }

    v78 = v15;
    if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_queue_global_t v27 = v26;
      id v28 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext subjectIdentity](v9, "subjectIdentity"));
      id v29 = (char *)objc_claimAutoreleasedReturnValue([v28 identifier]);
      *(_DWORD *)buf = 138412290;
      v93 = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "context.subjectIdentity.identifier: %@",  buf,  0xCu);
    }

    -[TCCDRequestContext setSubjectIdentity:](v9, "setSubjectIdentity:", v84);
    uint64_t int64 = xpc_dictionary_get_uint64(v3, "desired_auth_value");
    -[TCCDRequestContext setDesiredAuth:](v9, "setDesiredAuth:", uint64);
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 settingsRequestFullTitleTextLocalizationKey]);
    uint64_t v80 = uint64;
    uint64_t v83 = objc_claimAutoreleasedReturnValue([v7 buttonTitleLocalizationKeyForAuthorization:uint64 desiredAuth:uint64]);
    v82 = (void *)objc_claimAutoreleasedReturnValue([v7 cancelButtontitleLocalizationKey]);
    id v31 = (void *)qword_100078240;
    if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_DEFAULT))
    {
      id v32 = v31;
      id v33 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
      *(_DWORD *)buf = 136315906;
      v93 = "handle_TCCSetAccessWithPrompt";
      __int16 v94 = 2048;
      uint64_t v95 = 1LL;
      __int16 v96 = 2048;
      unint64_t v97 = v80;
      __int16 v98 = 2112;
      unint64_t v99 = (unint64_t)v33;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "%s currentAuth: %llu desiredAuth: %llu, got auth choices for service %@",  buf,  0x2Au);
    }

    int64_t v34 = (os_log_s *)qword_100078240;
    if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v93 = 0LL;
      __int16 v94 = 2048;
      uint64_t v95 = v80;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "aButtonAuth: %llu bButtonAuth: %llu",  buf,  0x16u);
    }

    id v35 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext service](v9, "service"));
    id v36 = (void *)objc_claimAutoreleasedReturnValue([v35 localizedTextWithKey:v82]);

    id v37 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext service](v9, "service"));
    v79 = (void *)objc_claimAutoreleasedReturnValue([v37 localizedTextWithKey:v83]);

    uint64_t v38 = objc_claimAutoreleasedReturnValue([v7 localizedTextWithKey:v22]);
    v77 = (void *)v38;
    if (!v38)
    {
      id v53 = tcc_access_log();
      uint64_t v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
      v76 = v54;
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v93 = (const char *)v7;
        _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "Could not find localized string for service: %@",  buf,  0xCu);
      }

      id v15 = v78;
      __int16 v52 = (os_log_s *)v83;
      goto LABEL_53;
    }

    v74 = v22;
    v75 = v36;
    uint64_t v39 = v38;
    id v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableString displayName](v84, "displayName"));
    uint64_t v41 = objc_claimAutoreleasedReturnValue( +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v39,  @"%@",  0LL,  v40));

    v76 = (void *)v41;
    if (!v41)
    {
      id v55 = tcc_access_log();
      v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
      id v15 = v78;
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v93 = (const char *)v7;
        _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEFAULT,  "Could not find localized request string for service: %@",  buf,  0xCu);
      }

      __int16 v52 = (os_log_s *)v83;
      id v22 = v74;
      id v36 = v75;
      goto LABEL_53;
    }

    -[TCCDRequestContext presentSynchronousPromptWithHeader:message:aButtonTitle:aButtonAuth:bButtonTitle:bButtonAuth:cButtonTitle:cButtonAuth:currentAuth:updatingResult:]( v9,  "presentSynchronousPromptWithHeader:message:aButtonTitle:aButtonAuth:bButtonTitle:bButtonAuth:cButtonTitle:cButtonA uth:currentAuth:updatingResult:",  v41,  0LL,  v75,  0LL,  v79,  v80,  0LL,  1LL,  1LL,  v5);
    id v42 = tcc_access_log();
    uint64_t v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
    id v15 = v78;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v93 = "handle_TCCSetAccessWithPrompt";
      __int16 v94 = 2112;
      uint64_t v95 = (uint64_t)v5;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%s: result %@", buf, 0x16u);
    }

    id v22 = v74;
    if (!v5)
    {
      id v86 = v8;
      [(id)qword_100078468 makeError:&v86 withCode:8 infoText:0];
      id v57 = v86;

      int64_t v58 = objc_opt_new(&OBJC_CLASS___NSMutableString);
      id v81 = v57;
      [(id)qword_100078468 buildErrorString:v58 forError:v57 contextString:0];
      __int128 v59 = (os_log_s *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 logHandle]);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
        sub_10003D3A8();
      }

      id v8 = v81;
      goto LABEL_52;
    }

    if ((id)-[TCCDRequestResult databaseAction](v5, "databaseAction") != (id)1
      || !-[TCCDRequestResult authorizationValue](v5, "authorizationValue"))
    {
LABEL_47:
      int64_t v63 = (void *)qword_100078240;
      if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_DEFAULT))
      {
        loga = v63;
        v71 = (char *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext messageIdentifier](v9, "messageIdentifier"));
        unint64_t v70 = -[TCCDRequestResult authorizationValue](v5, "authorizationValue");
        unint64_t v69 = -[TCCDRequestResult authorizationReason](v5, "authorizationReason");
        unint64_t v68 = -[TCCDRequestResult authorizationVersion](v5, "authorizationVersion");
        __int16 v64 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestResult error](v5, "error"));
        *(_DWORD *)buf = 138544386;
        v93 = v71;
        __int16 v94 = 2048;
        uint64_t v95 = v70;
        __int16 v96 = 2048;
        unint64_t v97 = v69;
        __int16 v98 = 2048;
        unint64_t v99 = v68;
        __int16 v100 = 2114;
        v101 = v64;
        _os_log_impl( (void *)&_mh_execute_header,  loga,  OS_LOG_TYPE_DEFAULT,  "AUTH_SET_PROMPT: msgID=%{public}@, authValue=%llu, authReason=%llu, authVersion=%llu, error=%{public}@,",  buf,  0x34u);
      }

      uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 platform]);
      v66 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext service](v9, "service"));
      objc_msgSend( v65,  "sendAnalyticsForAction:service:subjectIdentity:indirectObjectIdentity:authValue:includeV1AuthValue:v1AuthValue:d esiredAuth:domainReason:promptType:",  4,  v66,  v84,  0,  -[TCCDRequestResult authorizationValue](v5, "authorizationValue"),  0,  -[TCCDRequestResult v1AuthorizationValue](v5, "v1AuthorizationValue"),  v80,  0,  -[TCCDRequestResult promptType](v5, "promptType"));

      -[TCCDRequestResult populateReplyMessage:](v5, "populateReplyMessage:", v85);
      v67 = (os_log_s *)qword_100078240;
      if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v93 = "handle_TCCSetAccessWithPrompt";
        _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "%s end", buf, 0xCu);
      }

      id v15 = v78;
LABEL_52:
      __int16 v52 = (os_log_s *)v83;
      id v36 = v75;
LABEL_53:

      id v20 = v8;
LABEL_54:
      id v21 = v84;

LABEL_55:
      id v4 = v85;
      goto LABEL_56;
    }

    __int16 v44 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
    if ([v44 isEqualToString:@"kTCCServicePhotos"])
    {
    }

    else
    {
      uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
      unsigned int log = [v60 isEqualToString:@"kTCCServiceCalendar"];

      if (!log) {
        goto LABEL_45;
      }
    }

    -[TCCDRequestResult setAuthorizationVersion:]( v5,  "setAuthorizationVersion:",  [v7 authorizationVersionNumber]);
LABEL_45:
    if (([(id)qword_100078468 updateAuthorizationRecordFromContext:v9 forResult:v5 syncedUpdate:0] & 1) == 0)
    {
      unsigned int v61 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext service](v9, "service"));
      __int16 v62 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext identityDescription](v9, "identityDescription"));
      -[TCCDRequestResult denyAuthorizationWithErrorCode:format:]( v5,  "denyAuthorizationWithErrorCode:format:",  4LL,  @"Failed to update database %@ from %@",  v61,  v62);
    }

    goto LABEL_47;
  }

  id v90 = v8;
  [(id)qword_100078468 makeError:&v90 withCode:2 infoText:0];
  id v20 = v90;

  uint64_t v9 = objc_opt_new(&OBJC_CLASS___NSMutableString);
  [(id)qword_100078468 buildErrorString:v9 forError:v20 contextString:0];
  dispatch_time_t v10 = (TCCDAttributionChain *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 logHandle]);
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
    sub_10003D3A8();
  }
LABEL_56:
}

id sub_10000A8A8(void *a1)
{
  id v1 = a1;
  id v2 = 0LL;
  do
  {
    id v3 = v2;
    objc_msgSend(v1, "setQueryCount:", (char *)objc_msgSend(v1, "queryCount") + 1);
    id v4 = objc_autoreleasePoolPush();
    id v5 = sub_10000AC8C(v1);
    id v2 = (void *)objc_claimAutoreleasedReturnValue(v5);

    objc_autoreleasePoolPop(v4);
    if (!v2)
    {
      unsigned __int8 v25 = (void *)qword_100078240;
      if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_ERROR)) {
        sub_10003D484(v25, v1);
      }
      goto LABEL_25;
    }
  }

  while ([v2 databaseAction] == (id)2);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v2 error]);

  if (!v6
    && [v2 databaseAction] == (id)1
    && ([(id)qword_100078468 updateAuthorizationRecordFromContext:v1 forResult:v2 syncedUpdate:0] & 1) == 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v1 service]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v1 identityDescription]);
    [v2 denyAuthorizationWithErrorCode:4, @"Failed to update database %@ from %@", v7, v8 format];
  }

  uint64_t v9 = (void *)qword_100078240;
  if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_time_t v10 = v9;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v1 messageIdentifier]);
    id v12 = [v2 authorizationValue];
    id v13 = [v2 authorizationReason];
    id v14 = [v2 authorizationVersion];
    id v15 = [v1 desiredAuth];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v2 error]);
    *(_DWORD *)buf = 138544642;
    id v32 = v11;
    __int16 v33 = 2048;
    id v34 = v12;
    __int16 v35 = 2048;
    id v36 = v13;
    __int16 v37 = 2048;
    id v38 = v14;
    __int16 v39 = 2048;
    id v40 = v15;
    __int16 v41 = 2114;
    id v42 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "AUTHREQ_RESULT: msgID=%{public}@, authValue=%llu, authReason=%llu, authVersion=%llu, desired_auth=%llu, error=%{public}@,",  buf,  0x3Eu);
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v1 service]);
  if (![v17 usesTwoStagePrompting]
    || [v2 authorizationValue] != (id)6
    || [v1 desiredAuth] != (id)6)
  {

LABEL_20:
    if ([v2 authorizationValue] == (id)6)
    {
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v1 service]);
      dispatch_queue_global_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 name]);
      unsigned int v28 = [v27 isEqualToString:@"kTCCServiceAddressBook"];

      if (v28) {
        [v2 setReplyNoCacheAuthorization:1];
      }
    }

    if ([v2 authorizationValue] == (id)6)
    {
      [v2 setAuthorizationValue:1];
      [v2 setAuthorizationReason:5];
    }

TCCDRequestResult *sub_10000AC8C(void *a1)
{
  id v5 = a1;
  uint64_t v520 = 0LL;
  v521 = &v520;
  uint64_t v522 = 0x2020000000LL;
  char v523 = 0;
  v500 = objc_opt_new(&OBJC_CLASS___TCCDRequestResult);
  -[TCCDRequestResult setPromptType:](v500, "setPromptType:", 1LL);
  id v6 = v500;
  if (v500)
  {
    -[TCCDRequestResult setAuthorizationValue:](v500, "setAuthorizationValue:", 1LL);
    -[TCCDRequestResult setAuthorizationReason:](v500, "setAuthorizationReason:", 0LL);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 service]);
    -[TCCDRequestResult setAuthorizationVersion:]( v500,  "setAuthorizationVersion:",  [v7 authorizationVersionNumber]);

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 service]);
    unsigned int v9 = [v8 upgradeV1AuthorizationValue];

    if (v9
      && ([v5 spiVersion] == (id)1
       || [v5 spiVersion] == (id)2
       && [v5 recordUpgradePolicy] == (id)1
       && [v5 promptRightsMask] == (id)5))
    {
      -[TCCDRequestResult setAuthorizationVersion:](v500, "setAuthorizationVersion:", 1LL);
    }

    -[TCCDRequestResult setDatabaseAction:](v500, "setDatabaseAction:", 0LL);
    dispatch_time_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 service]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 name]);
    unsigned __int8 v12 = [v11 isEqualToString:@"kTCCServiceExposureNotification"];
    if ((v12 & 1) != 0)
    {
      int v13 = 0;
      uint64_t v14 = 1LL;
    }

    else
    {
      id v1 = (void *)objc_claimAutoreleasedReturnValue([v5 service]);
      id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 name]);
      if ([v2 isEqualToString:@"kTCCServiceCrashDetection"])
      {
        int v13 = 0;
        uint64_t v14 = 1LL;
      }

      else
      {
        id v3 = (void *)objc_claimAutoreleasedReturnValue([v5 service]);
        id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
        uint64_t v14 = (uint64_t)[v4 isEqualToString:@"kTCCServicePasteboard"];
        int v13 = 1;
      }
    }

    -[TCCDRequestResult setReplyNoCacheAuthorization:](v500, "setReplyNoCacheAuthorization:", v14);
    if (v13)
    {
    }

    if ((v12 & 1) == 0)
    {
    }

    id v15 = (os_log_s *)(id)qword_100078240;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v5 messageIdentifier]);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v5 functionName]);
      unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue([v5 service]);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 name]);
      else {
        id v20 = "no";
      }
      id v21 = [v5 queryCount];
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v5 clientDict]);
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v5 daemonDict]);
      *(_DWORD *)buf = 138544898;
      *(void *)v526 = v16;
      *(_WORD *)&v526[8] = 2112;
      *(void *)&v526[10] = v17;
      *(_WORD *)&v526[18] = 2112;
      *(void *)&v526[20] = v19;
      *(_WORD *)&v526[28] = 2082;
      *(void *)&v526[30] = v20;
      __int16 v527 = 2048;
      id v528 = v21;
      __int16 v529 = 2112;
      v530 = v22;
      __int16 v531 = 2112;
      v532 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "AUTHREQ_CTX: msgID=%{public}@, function=%@, service=%@, preflight=%{public}s, query=%llu, client_dict=%@, daemon_dict=%@",  buf,  0x48u);
    }

    id v24 = (void *)objc_claimAutoreleasedReturnValue([v5 subjectIdentity]);
    BOOL v25 = v24 == 0LL;

    if (!v25) {
      goto LABEL_23;
    }
    id v38 = (void *)objc_claimAutoreleasedReturnValue([v5 attributionChain]);
    BOOL v39 = v38 == 0LL;

    if (!v39)
    {
      id v40 = (os_log_s *)(id)qword_100078240;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v41 = (void *)objc_claimAutoreleasedReturnValue([v5 messageIdentifier]);
        id v42 = (void *)objc_claimAutoreleasedReturnValue([v5 attributionChain]);
        uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v42 description]);
        *(_DWORD *)buf = 138543618;
        *(void *)v526 = v41;
        *(_WORD *)&v526[8] = 2114;
        *(void *)&v526[10] = v43;
        _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "AUTHREQ_ATTRIBUTION: msgID=%{public}@, attribution={%{public}@},",  buf,  0x16u);
      }
    }

    __int16 v44 = (void *)objc_claimAutoreleasedReturnValue([v5 attributionChain]);
    unsigned int v45 = [v44 accessingProcessSpecified];

    if (v45)
    {
      uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v5 attributionChain]);
      uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v46 requestingProcess]);

      if ([v47 euid])
      {
        uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v5 service]);
        unsigned __int8 v49 = [v48 shouldAllowUnrestrictedCheckAuditToken];

        if ((v49 & 1) == 0)
        {
          uint64_t v50 = (void *)qword_100078468;
          uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue([v5 functionName]);
          __int16 v52 = (void *)objc_claimAutoreleasedReturnValue([v5 service]);
          LODWORD(v50) = [v50 canProcess:v47 callFunction:v51 forService:v52 withAccessIdentity:0];

          if (!(_DWORD)v50)
          {
            v136 = (void *)objc_claimAutoreleasedReturnValue([v47 description]);
            v137 = (void *)objc_claimAutoreleasedReturnValue([v5 attributionChain]);
            v138 = (void *)objc_claimAutoreleasedReturnValue([v137 accessingProcess]);
            v139 = (void *)objc_claimAutoreleasedReturnValue([v138 description]);
            -[TCCDRequestResult denyAuthorizationWithErrorCode:format:]( v500,  "denyAuthorizationWithErrorCode:format:",  3LL,  @"Requestor: %@ is not entitled to check access for accessor %@",  v136,  v139);

            v140 = v500;
            goto LABEL_28;
          }

          id v53 = (os_log_s *)(id)qword_100078240;
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue([v47 description]);
            id v55 = (void *)objc_claimAutoreleasedReturnValue([v5 attributionChain]);
            v56 = (void *)objc_claimAutoreleasedReturnValue([v55 accessingProcess]);
            id v57 = (void *)objc_claimAutoreleasedReturnValue([v56 description]);
            *(_DWORD *)buf = 138543618;
            *(void *)v526 = v54;
            *(_WORD *)&v526[8] = 2114;
            *(void *)&v526[10] = v57;
            _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "requestor: %{public}@ is checking access for accessor %{public}@",  buf,  0x16u);
          }
        }
      }
    }

    int64_t v58 = (void *)objc_claimAutoreleasedReturnValue([v5 attributionChain]);
    __int128 v59 = (void *)objc_claimAutoreleasedReturnValue([v58 accessingProcess]);
    uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue([v5 service]);
    unsigned int v61 = [v59 hasEntitlement:@"com.apple.private.tcc.allow" containsService:v60 options:1];

    if (v61)
    {
      __int16 v62 = (os_log_s *)(id)qword_100078240;
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v63 = (void *)objc_claimAutoreleasedReturnValue([v5 attributionChain]);
        __int16 v64 = (void *)objc_claimAutoreleasedReturnValue([v63 accessingProcess]);
        uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue([v64 description]);
        v66 = (void *)objc_claimAutoreleasedReturnValue([v5 service]);
        v67 = (void *)objc_claimAutoreleasedReturnValue([v66 name]);
        *(_DWORD *)buf = 138543618;
        *(void *)v526 = v65;
        *(_WORD *)&v526[8] = 2114;
        *(void *)&v526[10] = v67;
        _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_DEFAULT,  "Granting %{public}@ access to %{public}@ via entitlement 'com.apple.private.tcc.allow'",  buf,  0x16u);
      }

LABEL_44:
      -[TCCDRequestResult setAuthorizationValue:](v500, "setAuthorizationValue:", 2LL);
      -[TCCDRequestResult setAuthorizationReason:](v500, "setAuthorizationReason:", 11LL);
      id v6 = v500;
      unint64_t v68 = v500;
      goto LABEL_45;
    }

    uint64_t v83 = (void *)objc_claimAutoreleasedReturnValue([v5 service]);
    v84 = (void *)objc_claimAutoreleasedReturnValue([v83 name]);
    if ([v84 isEqualToString:@"kTCCServiceBluetoothAlways"])
    {
      id v85 = (void *)objc_claimAutoreleasedReturnValue([v5 attributionChain]);
      id v86 = (void *)objc_claimAutoreleasedReturnValue([v85 accessingProcess]);
      id v87 = (void *)objc_claimAutoreleasedReturnValue([v5 service]);
      unsigned int v88 = [v86 hasEntitlement:@"com.apple.private.tcc.ifdreader" containsService:v87 options:1];

      if (v88)
      {
        __int16 v62 = (os_log_s *)(id)qword_100078240;
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          id v89 = (void *)objc_claimAutoreleasedReturnValue([v5 attributionChain]);
          id v90 = (void *)objc_claimAutoreleasedReturnValue([v89 accessingProcess]);
          id v91 = (void *)objc_claimAutoreleasedReturnValue([v90 description]);
          v92 = (void *)objc_claimAutoreleasedReturnValue([v5 service]);
          v93 = (void *)objc_claimAutoreleasedReturnValue([v92 name]);
          *(_DWORD *)buf = 138543618;
          *(void *)v526 = v91;
          *(_WORD *)&v526[8] = 2114;
          *(void *)&v526[10] = v93;
          _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_DEFAULT,  "Granting %{public}@ access to %{public}@ via entitlement 'com.apple.private.tcc.ifdreader'",  buf,  0x16u);
        }

        goto LABEL_44;
      }
    }

    else
    {
    }

LABEL_23:
    v518[0] = _NSConcreteStackBlock;
    v518[1] = 3221225472LL;
    v518[2] = sub_10000F0F0;
    v518[3] = &unk_100064D00;
    id v26 = v5;
    id v519 = v26;
    v517[0] = _NSConcreteStackBlock;
    v517[1] = 3221225472LL;
    v517[2] = sub_10000F178;
    v517[3] = &unk_100064C68;
    v517[4] = &v520;
    if (db_eval((uint64_t)"SELECT NULL FROM access_overrides WHERE service = ?", v518, v517))
    {
      dispatch_queue_global_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 service]);
      unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue([v27 name]);
      id v29 = (void *)objc_claimAutoreleasedReturnValue([v26 attributionChain]);
      int v30 = (void *)objc_claimAutoreleasedReturnValue([v29 requestingProcess]);
      id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 description]);
      -[TCCDRequestResult denyAuthorizationWithErrorCode:format:]( v500,  "denyAuthorizationWithErrorCode:format:",  4LL,  @"Checking for Service Override on %@: Requestor: %@",  v28,  v31);

LABEL_25:
      id v32 = v500;
LABEL_26:
      id v33 = 0LL;
      id v34 = 0LL;
      __int16 v35 = 0LL;
      id v36 = 0LL;
      __int16 v37 = 0LL;
LABEL_27:

LABEL_28:
      id v6 = v500;
      goto LABEL_45;
    }

    unint64_t v70 = (void *)objc_claimAutoreleasedReturnValue([v26 subjectIdentity]);
    BOOL v71 = v70 == 0LL;

    if (v71)
    {
      __int16 v94 = (void *)objc_claimAutoreleasedReturnValue([v26 attributionChain]);
      uint64_t v95 = (void *)objc_claimAutoreleasedReturnValue([v94 accessingProcess]);
      __int16 v96 = (void *)objc_claimAutoreleasedReturnValue([v26 service]);
      unsigned int v97 = [v95 hasEntitlement:@"com.apple.private.tcc.allow.overridable" containsService:v96 options:1];

      if (v97)
      {
        if (!*((_BYTE *)v521 + 24))
        {
          -[TCCDRequestResult setAuthorizationValue:](v500, "setAuthorizationValue:", 2LL);
          -[TCCDRequestResult setAuthorizationReason:](v500, "setAuthorizationReason:", 11LL);
          v158 = (os_log_s *)(id)qword_100078240;
          if (os_log_type_enabled(v158, OS_LOG_TYPE_DEFAULT))
          {
            v159 = (void *)objc_claimAutoreleasedReturnValue([v26 attributionChain]);
            v160 = (void *)objc_claimAutoreleasedReturnValue([v159 accessingProcess]);
            v161 = (void *)objc_claimAutoreleasedReturnValue([v160 description]);
            v162 = (void *)objc_claimAutoreleasedReturnValue([v26 service]);
            v163 = (void *)objc_claimAutoreleasedReturnValue([v162 name]);
            *(_DWORD *)buf = 138543618;
            *(void *)v526 = v161;
            *(_WORD *)&v526[8] = 2114;
            *(void *)&v526[10] = v163;
            _os_log_impl( (void *)&_mh_execute_header,  v158,  OS_LOG_TYPE_DEFAULT,  "Overridable entitlement policy: %{public}@ is Allow access to %{public}@",  buf,  0x16u);
          }

          goto LABEL_25;
        }

        __int16 v98 = (os_log_s *)(id)qword_100078240;
        if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v99 = (void *)objc_claimAutoreleasedReturnValue([v26 attributionChain]);
          __int16 v100 = (void *)objc_claimAutoreleasedReturnValue([v99 accessingProcess]);
          v101 = (void *)objc_claimAutoreleasedReturnValue([v100 description]);
          v102 = (void *)objc_claimAutoreleasedReturnValue([v26 service]);
          v103 = (void *)objc_claimAutoreleasedReturnValue([v102 name]);
          *(_DWORD *)buf = 138543618;
          *(void *)v526 = v101;
          *(_WORD *)&v526[8] = 2114;
          *(void *)&v526[10] = v103;
          _os_log_impl( (void *)&_mh_execute_header,  v98,  OS_LOG_TYPE_DEFAULT,  "Overridable entitlement policy: %{public}@ is Denied/Restricted access to %{public}@",  buf,  0x16u);
        }

        goto LABEL_61;
      }

      v115 = objc_alloc(&OBJC_CLASS___TCCDAccessIdentity);
      v116 = (void *)objc_claimAutoreleasedReturnValue([v26 attributionChain]);
      v117 = (void *)objc_claimAutoreleasedReturnValue([v26 service]);
      v118 = -[TCCDAccessIdentity initWithAttributionChain:preferMostSpecificIdentifier:]( v115,  "initWithAttributionChain:preferMostSpecificIdentifier:",  v116,  [v117 hasParanoidSecurityPolicy]);
      [v26 setSubjectIdentity:v118];

      v119 = (void *)objc_claimAutoreleasedReturnValue([v26 subjectIdentity]);
      BOOL v120 = v119 == 0LL;

      if (v120)
      {
        v164 = (void *)objc_claimAutoreleasedReturnValue([v26 service]);
        v165 = (void *)objc_claimAutoreleasedReturnValue([v164 name]);
        v166 = (void *)objc_claimAutoreleasedReturnValue([v26 identityDescription]);
        -[TCCDRequestResult denyAuthorizationWithErrorCode:format:]( v500,  "denyAuthorizationWithErrorCode:format:",  2LL,  @"Unable to construct an identity to %@, %@",  v165,  v166);

        goto LABEL_25;
      }

      v121 = (os_log_s *)(id)qword_100078240;
      if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
      {
        v122 = (void *)objc_claimAutoreleasedReturnValue([v26 messageIdentifier]);
        v123 = (void *)objc_claimAutoreleasedReturnValue([v26 subjectIdentity]);
        v124 = (void *)objc_claimAutoreleasedReturnValue([v123 identifier]);
        *(_DWORD *)buf = 138543618;
        *(void *)v526 = v122;
        *(_WORD *)&v526[8] = 2114;
        *(void *)&v526[10] = v124;
        _os_log_impl( (void *)&_mh_execute_header,  v121,  OS_LOG_TYPE_DEFAULT,  "AUTHREQ_SUBJECT: msgID=%{public}@, subject=%{public}@,",  buf,  0x16u);
      }

      v125 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 platform]);
      v126 = (void *)objc_claimAutoreleasedReturnValue([v26 subjectIdentity]);
      v127 = (void *)objc_claimAutoreleasedReturnValue([v26 attributionChain]);
      [v125 registerWithApplicationResolverSubjectIdentity:v126 processChain:v127];
    }

    v72 = (void *)objc_claimAutoreleasedReturnValue([v26 service]);
    v73 = (void *)objc_claimAutoreleasedReturnValue([v72 name]);
    if ([v73 isEqualToString:@"kTCCServiceUserTracking"])
    {
      v74 = (void *)objc_claimAutoreleasedReturnValue([v26 attributionChain]);
      v75 = (void *)objc_claimAutoreleasedReturnValue([v74 accessingProcess]);
      unsigned int v76 = [v75 BOOLValueForEntitlement:@"com.apple.developer.web-browser"];

      if (v76)
      {
        v77 = (os_log_s *)(id)qword_100078240;
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
        {
          id v78 = objc_claimAutoreleasedReturnValue([v26 functionName]);
          id v79 = [v78 UTF8String];
          uint64_t v80 = (void *)objc_claimAutoreleasedReturnValue([v26 service]);
          id v81 = (void *)objc_claimAutoreleasedReturnValue([v80 name]);
          v82 = (void *)objc_claimAutoreleasedReturnValue([v26 identityDescription]);
          *(_DWORD *)buf = 136446722;
          *(void *)v526 = v79;
          *(_WORD *)&v526[8] = 2114;
          *(void *)&v526[10] = v81;
          *(_WORD *)&v526[18] = 2114;
          *(void *)&v526[20] = v82;
          _os_log_impl( (void *)&_mh_execute_header,  v77,  OS_LOG_TYPE_DEFAULT,  "Refusing %{public}s for service %{public}@ from %{public}@ due to security policy",  buf,  0x20u);
        }

        -[TCCDRequestResult setAuthorizationValue:](v500, "setAuthorizationValue:", 0LL);
        -[TCCDRequestResult setAuthorizationReason:](v500, "setAuthorizationReason:", 14LL);
      }
    }

    else
    {
    }

    v104 = (void *)objc_claimAutoreleasedReturnValue([v26 subjectIdentity]);
    v105 = (void *)objc_claimAutoreleasedReturnValue([v104 pluginBundleIdentifier]);
    BOOL v106 = v105 == 0LL;

    if (!v106)
    {
      v107 = (void *)objc_claimAutoreleasedReturnValue([v26 subjectIdentity]);
      unsigned __int8 v108 = [v107 pluginTargetsSystemExtensionPoint];

      if ((v108 & 1) == 0)
      {
        v114 = (os_log_s *)(id)qword_100078240;
        if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
        {
          id v206 = objc_claimAutoreleasedReturnValue([v26 functionName]);
          id v207 = [v206 UTF8String];
          v208 = (void *)objc_claimAutoreleasedReturnValue([v26 service]);
          v209 = (void *)objc_claimAutoreleasedReturnValue([v208 name]);
          v210 = (void *)objc_claimAutoreleasedReturnValue([v26 identityDescription]);
          *(_DWORD *)buf = 136446722;
          *(void *)v526 = v207;
          *(_WORD *)&v526[8] = 2114;
          *(void *)&v526[10] = v209;
          *(_WORD *)&v526[18] = 2114;
          *(void *)&v526[20] = v210;
          _os_log_error_impl( (void *)&_mh_execute_header,  v114,  OS_LOG_TYPE_ERROR,  "Refusing %{public}s for service %{public}@ from extension %{public}@ targeting 3rd party extension point",  buf,  0x20u);
        }

        goto LABEL_86;
      }

      v109 = (void *)objc_claimAutoreleasedReturnValue([v26 subjectIdentity]);
      BOOL v110 = [v109 pluginPromptPolicy] == 0;

      if (v110)
      {
        v114 = (os_log_s *)(id)qword_100078240;
        if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
        {
          id v236 = objc_claimAutoreleasedReturnValue([v26 functionName]);
          id v237 = [v236 UTF8String];
          v238 = (void *)objc_claimAutoreleasedReturnValue([v26 service]);
          v239 = (void *)objc_claimAutoreleasedReturnValue([v238 name]);
          v240 = (void *)objc_claimAutoreleasedReturnValue([v26 identityDescription]);
          *(_DWORD *)buf = 136446722;
          *(void *)v526 = v237;
          *(_WORD *)&v526[8] = 2114;
          *(void *)&v526[10] = v239;
          *(_WORD *)&v526[18] = 2114;
          *(void *)&v526[20] = v240;
          _os_log_error_impl( (void *)&_mh_execute_header,  v114,  OS_LOG_TYPE_ERROR,  "Refusing %{public}s for service %{public}@ from extension %{public}@, extension point disallows prompting",  buf,  0x20u);
        }

        goto LABEL_86;
      }
    }

    if (*((_BYTE *)v521 + 24))
    {
      __int16 v98 = (os_log_s *)(id)qword_100078240;
      if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
      {
        v111 = (void *)objc_claimAutoreleasedReturnValue([v26 identityDescription]);
        v112 = (void *)objc_claimAutoreleasedReturnValue([v26 service]);
        v113 = (void *)objc_claimAutoreleasedReturnValue([v112 name]);
        *(_DWORD *)buf = 138412546;
        *(void *)v526 = v111;
        *(_WORD *)&v526[8] = 2114;
        *(void *)&v526[10] = v113;
        _os_log_impl( (void *)&_mh_execute_header,  v98,  OS_LOG_TYPE_DEFAULT,  "Restricted %@ access to %{public}@",  buf,  0x16u);
      }

LABEL_61:
      -[TCCDRequestResult setAuthorizationValue:](v500, "setAuthorizationValue:", 0LL);
      -[TCCDRequestResult setAuthorizationReason:](v500, "setAuthorizationReason:", 7LL);
      goto LABEL_25;
    }

    v128 = (void *)objc_claimAutoreleasedReturnValue([v26 subjectIdentity]);
    if ([v128 isAvocadoWidget])
    {
      v129 = (void *)objc_claimAutoreleasedReturnValue([v26 service]);
      unsigned __int8 v130 = [v129 allowedForAvocadoWidget];

      if ((v130 & 1) == 0)
      {
        v114 = (os_log_s *)(id)qword_100078240;
        if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
        {
          v131 = (void *)objc_claimAutoreleasedReturnValue([v26 attributionChain]);
          v132 = (void *)objc_claimAutoreleasedReturnValue([v131 accessingProcess]);
          v133 = (void *)objc_claimAutoreleasedReturnValue([v132 description]);
          v134 = (void *)objc_claimAutoreleasedReturnValue([v26 service]);
          v135 = (void *)objc_claimAutoreleasedReturnValue([v134 name]);
          *(_DWORD *)buf = 138543618;
          *(void *)v526 = v133;
          *(_WORD *)&v526[8] = 2114;
          *(void *)&v526[10] = v135;
          _os_log_impl( (void *)&_mh_execute_header,  v114,  OS_LOG_TYPE_DEFAULT,  "Denying Avocado widget %{public}@ access to prohibited service %{public}@",  buf,  0x16u);
        }

LABEL_86:
        -[TCCDRequestResult setAuthorizationValue:](v500, "setAuthorizationValue:", 0LL);
        -[TCCDRequestResult setAuthorizationReason:](v500, "setAuthorizationReason:", 12LL);
        goto LABEL_25;
      }
    }

    else
    {
    }

    v141 = (void *)objc_claimAutoreleasedReturnValue([v26 attributionChain]);
    if (!v141)
    {
LABEL_102:
      unsigned int v487 = sub_10000F18C(v26);
      v512[0] = _NSConcreteStackBlock;
      v512[1] = 3221225472LL;
      v512[2] = sub_10000F1C0;
      v512[3] = &unk_100064CD8;
      v499 = v500;
      v513 = v499;
      id v167 = v26;
      id v514 = v167;
      v491 = objc_retainBlock(v512);
      v489 = (void *)qword_100078468;
      v168 = (void *)objc_claimAutoreleasedReturnValue([v167 service]);
      v494 = (void *)objc_claimAutoreleasedReturnValue([v168 name]);
      v496 = (void *)objc_claimAutoreleasedReturnValue([v167 subjectIdentity]);
      v492 = (void *)objc_claimAutoreleasedReturnValue([v496 identifier]);
      v169 = (void *)objc_claimAutoreleasedReturnValue([v167 subjectIdentity]);
      id v170 = objc_msgSend(v169, "client_type");
      v171 = (void *)objc_claimAutoreleasedReturnValue([v167 attributionChain]);
      v172 = (void *)objc_claimAutoreleasedReturnValue([v171 requestingProcess]);
      v173 = (void *)objc_claimAutoreleasedReturnValue([v167 functionName]);
      v174 = (void *)objc_claimAutoreleasedReturnValue([v167 attributionChain]);
      v175 = (void *)objc_claimAutoreleasedReturnValue( [v489 translateAllFilesToEndpointSecurity:v494 withClient:v492 clientType:v170 requestingProcess:v172 function:v173 attributio nChain:v174 executablePath:0]);

      v509[0] = _NSConcreteStackBlock;
      v509[1] = 3221225472LL;
      v509[2] = sub_10000F2CC;
      v509[3] = &unk_100064CD8;
      id v176 = v175;
      id v510 = v176;
      id v177 = v167;
      id v511 = v177;
      if (db_eval( (uint64_t)"SELECT auth_value, auth_reason, csreq, strftime('%s','now') - last_modified AS age, flags, auth_version, pid, pid_version, boot_uuid, last_reminded FROM access WHERE se rvice = ? AND client = ? AND client_type = ?",  v509,  v491))
      {
        v178 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
        v179 = (void *)objc_claimAutoreleasedReturnValue([v178 name]);
        v180 = (void *)objc_claimAutoreleasedReturnValue([v177 identityDescription]);
        -[TCCDRequestResult denyAuthorizationWithErrorCode:format:]( v499,  "denyAuthorizationWithErrorCode:format:",  4LL,  @"Query for current DB state for %@: Requestor: %@",  v179,  v180);

LABEL_104:
        v181 = v499;
        id v33 = 0LL;
        id v34 = 0LL;
        __int16 v35 = 0LL;
        id v36 = 0LL;
        __int16 v37 = 0LL;
LABEL_105:

        goto LABEL_27;
      }

      v182 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
      unsigned int v183 = [v182 upgradeV1AuthorizationValue];

      if (v183)
      {
        v184 = (os_log_s *)(id)qword_100078240;
        if (os_log_type_enabled(v184, OS_LOG_TYPE_INFO))
        {
          unint64_t v185 = -[TCCDRequestResult authorizationValue](v499, "authorizationValue");
          id v186 = [v177 spiVersion];
          unint64_t v187 = -[TCCDRequestResult authorizationVersion](v499, "authorizationVersion");
          id v188 = [v177 recordUpgradePolicy];
          *(_DWORD *)buf = 134218752;
          *(void *)v526 = v185;
          *(_WORD *)&v526[8] = 2048;
          *(void *)&v526[10] = v186;
          *(_WORD *)&v526[18] = 2048;
          *(void *)&v526[20] = v187;
          *(_WORD *)&v526[28] = 2048;
          *(void *)&v526[30] = v188;
          _os_log_impl( (void *)&_mh_execute_header,  v184,  OS_LOG_TYPE_INFO,  "upgradeV1AuthorizationValue: authValue:%llu, spiVersion: %llu, authVersion: %llu, upgrade policy: %llu",  buf,  0x2Au);
        }
      }

      id v189 = -[TCCDRequestResult authorizationVersion](v499, "authorizationVersion");
      v190 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
      if (v189 < [v190 authorizationVersionNumber])
      {
        v191 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
        if ([v191 upgradeV1AuthorizationValue]
          && ![v177 recordUpgradePolicy])
        {
          BOOL v241 = (id)-[TCCDRequestResult authorizationValue](v499, "authorizationValue") == (id)1;

          if (!v241)
          {
            -[TCCDRequestResult setV1AuthorizationUpgrade:](v499, "setV1AuthorizationUpgrade:", 1LL);
            -[TCCDRequestResult setV1AuthorizationValue:]( v499,  "setV1AuthorizationValue:",  -[TCCDRequestResult authorizationValue](v499, "authorizationValue"));
            -[TCCDRequestResult setV1AuthorizationReason:]( v499,  "setV1AuthorizationReason:",  -[TCCDRequestResult authorizationReason](v499, "authorizationReason"));
            if (!-[TCCDRequestResult authorizationValue](v499, "authorizationValue"))
            {
              -[TCCDRequestResult setAuthorizationVersion:](v499, "setAuthorizationVersion:", 2LL);
              -[TCCDRequestResult setDatabaseAction:](v499, "setDatabaseAction:", 1LL);
              v287 = (os_log_s *)(id)qword_100078240;
              if (os_log_type_enabled(v287, OS_LOG_TYPE_INFO))
              {
                v288 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
                v289 = (void *)objc_claimAutoreleasedReturnValue([v288 name]);
                v290 = (void *)objc_claimAutoreleasedReturnValue([v177 identityDescription]);
                *(_DWORD *)buf = 138543618;
                *(void *)v526 = v289;
                *(_WORD *)&v526[8] = 2114;
                *(void *)&v526[10] = v290;
                _os_log_impl( (void *)&_mh_execute_header,  v287,  OS_LOG_TYPE_INFO,  "Upgrading to V2 Denied: for %{public}@, %{public}@",  buf,  0x16u);
              }

              -[TCCDRequestResult setPromptType:](v499, "setPromptType:", 0LL);
              v291 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 platform]);
              v292 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
              v293 = (void *)objc_claimAutoreleasedReturnValue([v177 subjectIdentity]);
              objc_msgSend( v291,  "sendAnalyticsForAction:service:subjectIdentity:indirectObjectIdentity:authValue:includeV1AuthValue:v1Aut hValue:desiredAuth:domainReason:promptType:",  6,  v292,  v293,  0,  -[TCCDRequestResult authorizationValue](v499, "authorizationValue"),  1,  -[TCCDRequestResult v1AuthorizationValue](v499, "v1AuthorizationValue"),  objc_msgSend(v177, "desiredAuth"),  0,  -[TCCDRequestResult promptType](v499, "promptType"));

              goto LABEL_104;
            }

            -[TCCDRequestResult setAuthorizationValue:](v499, "setAuthorizationValue:", 1LL);
            -[TCCDRequestResult setAuthorizationReason:](v499, "setAuthorizationReason:", 5LL);
            -[TCCDRequestResult setAuthorizationVersion:](v499, "setAuthorizationVersion:", 2LL);
          }

          _db_error(0);
LABEL_87:
          database = 1LL;
          break;
        case 7:
          goto LABEL_20;
        case 8:
          goto LABEL_24;
        case 9:
          goto LABEL_26;
        case 0xA:
          goto LABEL_30;
        case 0xB:
          goto LABEL_35;
        case 0xC:
        case 0xD:
        case 0xE:
          goto LABEL_40;
        case 0xF:
          goto LABEL_41;
        case 0x10:
        case 0x11:
        case 0x12:
          goto LABEL_42;
        case 0x13:
          goto LABEL_44;
        case 0x14:
          goto LABEL_46;
        case 0x15:
        case 0x16:
        case 0x17:
          goto LABEL_48;
        case 0x18:
          goto LABEL_50;
        case 0x19:
          goto LABEL_53;
        case 0x1A:
          goto LABEL_54;
        case 0x1B:
          goto LABEL_55;
        case 0x1C:
          goto LABEL_78;
        case 0x1D:
          goto LABEL_82;
        case 0x1E:
          goto LABEL_85;
        default:
          id v7 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
          id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 server]);
          unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 logHandle]);

          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            dispatch_time_t v10 = *((_DWORD *)v39 + 6);
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)&uint8_t buf[4] = v10;
            LOWORD(v4_Block_object_dispose(va, 8) = 1024;
            *(_DWORD *)((char *)&v48 + 2) = 30;
            _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Downgrading database from version %d to %d",  buf,  0xEu);
          }

          sqlite3_close((sqlite3 *)qword_1000782F0);
          qword_1000782F0 = 0LL;
          if (removefile(v1, 0LL, 3u))
          {
            uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
            unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 server]);
            int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 logHandle]);

            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
              sub_100019D6C();
            }

            database = 1LL;
          }

          else
          {
            database = db_open();
          }

          access_changed();
          free(v1);
          if ((_DWORD)database) {
            goto LABEL_89;
          }
          goto LABEL_90;
      }
    }
  }

  free(v1);
LABEL_89:
  byte_1000782E8 = 1;
  dword_1000782F8 = sqlite3_extended_errcode((sqlite3 *)qword_1000782F0);
  sqlite3_close((sqlite3 *)qword_1000782F0);
  qword_1000782F0 = 0LL;
LABEL_90:
  _Block_object_dispose(&v38, 8);
  return database;
}

LABEL_115:
          if (v487 && (id)-[TCCDRequestResult authorizationValue](v499, "authorizationValue") == (id)1)
          {
            -[TCCDRequestResult setAuthorizationValue:](v499, "setAuthorizationValue:", 2LL);
            -[TCCDRequestResult setAuthorizationReason:](v499, "setAuthorizationReason:", 5LL);
            v192 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
            unsigned int v193 = [v192 doNotStoreDefaultAllowAccess];

            if (v193)
            {
              v194 = (os_log_s *)(id)qword_100078240;
              if (os_log_type_enabled(v194, OS_LOG_TYPE_DEBUG))
              {
                v328 = (void *)objc_claimAutoreleasedReturnValue([v177 subjectIdentity]);
                v329 = (void *)objc_claimAutoreleasedReturnValue([v328 identifier]);
                v330 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
                v331 = (void *)objc_claimAutoreleasedReturnValue([v330 name]);
                *(_DWORD *)buf = 138543618;
                *(void *)v526 = v329;
                *(_WORD *)&v526[8] = 2114;
                *(void *)&v526[10] = v331;
                _os_log_debug_impl( (void *)&_mh_execute_header,  v194,  OS_LOG_TYPE_DEBUG,  "Default Allow for: Client %{public}@ to %{public}@ will not be stored in database.",  buf,  0x16u);
              }

LABEL_222:
              goto LABEL_104;
            }

LABEL_209:
            -[TCCDRequestResult setDatabaseAction:](v499, "setDatabaseAction:", 1LL);
            goto LABEL_104;
          }

          if ((id)-[TCCDRequestResult authorizationValue](v499, "authorizationValue") == (id)1)
          {
            v195 = (void *)objc_claimAutoreleasedReturnValue([v177 attributionChain]);
            if (v195)
            {
              v196 = (void *)objc_claimAutoreleasedReturnValue([v177 attributionChain]);
              v197 = (void *)objc_claimAutoreleasedReturnValue([v196 accessingProcess]);
              v198 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
              unsigned int v199 = [v197 hasEntitlement:@"com.apple.private.tcc.system" containsService:v198 options:0];

              if (v199)
              {
                v200 = (os_log_s *)(id)qword_100078240;
                if (os_log_type_enabled(v200, OS_LOG_TYPE_DEFAULT))
                {
                  v201 = (void *)objc_claimAutoreleasedReturnValue([v177 identityDescription]);
                  v202 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
                  v203 = (void *)objc_claimAutoreleasedReturnValue([v202 name]);
                  *(_DWORD *)buf = 138543618;
                  *(void *)v526 = v201;
                  *(_WORD *)&v526[8] = 2114;
                  *(void *)&v526[10] = v203;
                  _os_log_impl( (void *)&_mh_execute_header,  v200,  OS_LOG_TYPE_DEFAULT,  "Subject %{public}@ Allowed access to %{public}@ via entitlement 'com.apple.private.tcc.system'",  buf,  0x16u);
                }

                -[TCCDRequestResult setAuthorizationValue:](v499, "setAuthorizationValue:", 2LL);
                -[TCCDRequestResult setAuthorizationReason:](v499, "setAuthorizationReason:", 11LL);
                -[TCCDRequestResult setDatabaseAction:](v499, "setDatabaseAction:", 1LL);
                goto LABEL_104;
              }
            }
          }

          if ((id)-[TCCDRequestResult authorizationValue](v499, "authorizationValue") == (id)1)
          {
            id v204 = (id)objc_claimAutoreleasedReturnValue([v177 service]);
            if (![v204 isAccessDeniedByDefault])
            {
LABEL_151:

              goto LABEL_152;
            }

            v205 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
            if ([v205 alertStyle] == (id)1)
            {
            }

            else
            {
              v242 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
              BOOL v243 = [v242 alertStyle] == (id)3;

              if (!v243) {
                goto LABEL_152;
              }
            }

            -[TCCDRequestResult setAuthorizationValue:](v499, "setAuthorizationValue:", 0LL);
            -[TCCDRequestResult setAuthorizationReason:](v499, "setAuthorizationReason:", 5LL);
            -[TCCDRequestResult setDatabaseAction:]( v499,  "setDatabaseAction:",  [v177 isPreflight] ^ 1);
            if ((id)-[TCCDRequestResult databaseAction](v499, "databaseAction") == (id)1)
            {
              id v204 = (id)qword_100078240;
              if (os_log_type_enabled((os_log_t)v204, OS_LOG_TYPE_DEFAULT))
              {
                v244 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
                v245 = (void *)objc_claimAutoreleasedReturnValue([v244 name]);
                *(_DWORD *)buf = 138543362;
                *(void *)v526 = v245;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v204,  OS_LOG_TYPE_DEFAULT,  "Service %{public}@ does not allow prompting; recording denied.",
                  buf,
                  0xCu);
              }

              goto LABEL_151;
            }
          }

LABEL_152:
          if ((id)-[TCCDRequestResult authorizationValue](v499, "authorizationValue") == (id)1)
          {
            v246 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
            unsigned int v247 = [v246 applyDevelopmentAuthorizationPolicy];

            if (v247)
            {
              v248 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
              id v249 = [v248 developmentAuthorizationValue];

              if (v249)
              {
                if (v249 == (id)2)
                {
                  -[TCCDRequestResult setAuthorizationValue:](v499, "setAuthorizationValue:", 0LL);
                  -[TCCDRequestResult setAuthorizationReason:](v499, "setAuthorizationReason:", 5LL);
                  -[TCCDRequestResult setDatabaseAction:](v499, "setDatabaseAction:", 0LL);
                  v250 = "Denied:No Record";
                }

                else if (v249 == (id)1)
                {
                  -[TCCDRequestResult setAuthorizationValue:](v499, "setAuthorizationValue:", 2LL);
                  -[TCCDRequestResult setAuthorizationReason:](v499, "setAuthorizationReason:", 5LL);
                  -[TCCDRequestResult setDatabaseAction:](v499, "setDatabaseAction:", 0LL);
                  v250 = "Allowed:No Record";
                }

                else
                {
                  v250 = "unexpected!";
                }

                v251 = (os_log_s *)(id)qword_100078240;
                if (os_log_type_enabled(v251, OS_LOG_TYPE_INFO))
                {
                  v252 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
                  v253 = (void *)objc_claimAutoreleasedReturnValue([v252 name]);
                  *(_DWORD *)buf = 138543618;
                  *(void *)v526 = v253;
                  *(_WORD *)&v526[8] = 2082;
                  *(void *)&v526[10] = v250;
                  _os_log_impl( (void *)&_mh_execute_header,  v251,  OS_LOG_TYPE_INFO,  " %{public}@ has Development Auth value: %{public}s",  buf,  0x16u);
                }
              }
            }
          }

          v254 = (void *)objc_claimAutoreleasedReturnValue([v177 subjectIdentity]);
          if ([v254 isAvocadoWidget])
          {
            BOOL v255 = (id)-[TCCDRequestResult authorizationValue](v499, "authorizationValue") == (id)1;

            if (v255)
            {
              v256 = (os_log_s *)(id)qword_100078240;
              if (os_log_type_enabled(v256, OS_LOG_TYPE_DEFAULT))
              {
                v257 = (void *)objc_claimAutoreleasedReturnValue([v177 attributionChain]);
                v258 = (void *)objc_claimAutoreleasedReturnValue([v257 accessingProcess]);
                v259 = (void *)objc_claimAutoreleasedReturnValue([v258 description]);
                v260 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
                v261 = (void *)objc_claimAutoreleasedReturnValue([v260 name]);
                *(_DWORD *)buf = 138543618;
                *(void *)v526 = v259;
                *(_WORD *)&v526[8] = 2114;
                *(void *)&v526[10] = v261;
                _os_log_impl( (void *)&_mh_execute_header,  v256,  OS_LOG_TYPE_DEFAULT,  "Preventing prompt from Avocado widget %{public}@ for service %{public}@",  buf,  0x16u);
              }

              -[TCCDRequestResult setAuthorizationValue:](v499, "setAuthorizationValue:", 0LL);
              -[TCCDRequestResult setAuthorizationReason:](v499, "setAuthorizationReason:", 12LL);
              -[TCCDRequestResult setDatabaseAction:](v499, "setDatabaseAction:", 0LL);
              goto LABEL_104;
            }
          }

          else
          {
          }

          v262 = (void *)objc_claimAutoreleasedReturnValue([v177 subjectIdentity]);
          if ([v262 isCaptureExtension])
          {
            BOOL v263 = (id)-[TCCDRequestResult authorizationValue](v499, "authorizationValue") == (id)1;

            if (v263)
            {
              v264 = (os_log_s *)(id)qword_100078240;
              if (os_log_type_enabled(v264, OS_LOG_TYPE_DEFAULT))
              {
                v265 = (void *)objc_claimAutoreleasedReturnValue([v177 attributionChain]);
                v266 = (void *)objc_claimAutoreleasedReturnValue([v265 accessingProcess]);
                v267 = (void *)objc_claimAutoreleasedReturnValue([v266 description]);
                v268 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
                v269 = (void *)objc_claimAutoreleasedReturnValue([v268 name]);
                *(_DWORD *)buf = 138543618;
                *(void *)v526 = v267;
                *(_WORD *)&v526[8] = 2114;
                *(void *)&v526[10] = v269;
                _os_log_impl( (void *)&_mh_execute_header,  v264,  OS_LOG_TYPE_DEFAULT,  "Preventing prompt from Capture Extension %{public}@ for service %{public}@",  buf,  0x16u);
              }

              -[TCCDRequestResult setAuthorizationValue:](v499, "setAuthorizationValue:", 1LL);
              -[TCCDRequestResult setAuthorizationReason:](v499, "setAuthorizationReason:", 12LL);
              -[TCCDRequestResult setDatabaseAction:](v499, "setDatabaseAction:", 0LL);
              goto LABEL_104;
            }
          }

          else
          {
          }

          v270 = (os_log_s *)(id)qword_100078240;
          if (os_log_type_enabled(v270, OS_LOG_TYPE_INFO))
          {
            v271 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
            v272 = (void *)objc_claimAutoreleasedReturnValue([v271 name]);
            v273 = (void *)objc_claimAutoreleasedReturnValue([v177 identityDescription]);
            v274 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
            id v275 = (id)objc_claimAutoreleasedReturnValue( -[TCCDRequestResult descriptionWithRespectToService:]( v499,  "descriptionWithRespectToService:",  v274));
            *(_DWORD *)buf = 138543874;
            *(void *)v526 = v272;
            *(_WORD *)&v526[8] = 2114;
            *(void *)&v526[10] = v273;
            *(_WORD *)&v526[18] = 2114;
            *(void *)&v526[20] = v275;
            _os_log_impl( (void *)&_mh_execute_header,  v270,  OS_LOG_TYPE_INFO,  "Handling access request to %{public}@, from %{public}@, %{public}@",  buf,  0x20u);
          }

          v276 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
          unsigned int v277 = [v276 supportsStagedPrompting];

          if (v277)
          {
            if (![v177 desiredAuth])
            {
              v278 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
              objc_msgSend(v177, "setDesiredAuth:", objc_msgSend(v278, "defaultDesiredAuth"));
            }

            -[TCCDRequestResult setPreviousAuthorization:]( v499,  "setPreviousAuthorization:",  -[TCCDRequestResult authorizationValue](v499, "authorizationValue"));
            if ((id)-[TCCDRequestResult authorizationValue](v499, "authorizationValue") != (id)1)
            {
              id v279 = -[TCCDRequestResult authorizationValue](v499, "authorizationValue");
              if (v279 != [v177 desiredAuth])
              {
                v280 = (os_log_s *)(id)qword_100078240;
                if (os_log_type_enabled(v280, OS_LOG_TYPE_DEFAULT))
                {
                  unint64_t v281 = -[TCCDRequestResult authorizationValue](v499, "authorizationValue");
                  id v282 = [v177 desiredAuth];
                  *(_DWORD *)buf = 134218240;
                  *(void *)v526 = v281;
                  *(_WORD *)&v526[8] = 2048;
                  *(void *)&v526[10] = v282;
                  _os_log_impl( (void *)&_mh_execute_header,  v280,  OS_LOG_TYPE_DEFAULT,  "got existing auth right: %llu with requested upgrade auth: %llu",  buf,  0x16u);
                }

                if ([v177 desiredAuth] == (id)2
                  && (-[TCCDRequestResult databaseFlags](v499, "databaseFlags") & 0x10) != 0)
                {
                  v286 = (os_log_s *)(id)qword_100078240;
                  if (os_log_type_enabled(v286, OS_LOG_TYPE_ERROR)) {
                    sub_10003D5EC(v524, -[TCCDRequestResult databaseFlags](v499, "databaseFlags"), v286);
                  }
                  goto LABEL_198;
                }

                v283 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
                unsigned int v284 = objc_msgSend( v283,  "authorizationChoicesForCurrentAuth:desiredAuth:aButtonAuth:bButtonAuth:cButtonAuth:",  -[TCCDRequestResult authorizationValue](v499, "authorizationValue"),  objc_msgSend(v177, "desiredAuth"),  0,  0,  0);

                v285 = (os_log_s *)(id)qword_100078240;
                v286 = v285;
                if (v284)
                {
                  if (os_log_type_enabled(v285, OS_LOG_TYPE_ERROR)) {
                    sub_10003D5A0( (uint64_t)v524,  -[TCCDRequestResult authorizationValue](v499, "authorizationValue"),  (uint64_t)[v177 desiredAuth],  v286);
                  }
LABEL_198:

                  -[TCCDRequestResult setAuthorizationValue:]( v499,  "setAuthorizationValue:",  -[TCCDRequestResult authorizationValue](v499, "authorizationValue"));
                  -[TCCDRequestResult setAuthorizationReason:](v499, "setAuthorizationReason:", 5LL);
                  -[TCCDRequestResult setDatabaseAction:](v499, "setDatabaseAction:", 0LL);
                  goto LABEL_199;
                }

                if (os_log_type_enabled(v285, OS_LOG_TYPE_DEFAULT))
                {
                  unint64_t v294 = -[TCCDRequestResult authorizationValue](v499, "authorizationValue");
                  id v295 = [v177 desiredAuth];
                  *(_DWORD *)buf = 134218240;
                  *(void *)v526 = v294;
                  *(_WORD *)&v526[8] = 2048;
                  *(void *)&v526[10] = v295;
                  _os_log_impl( (void *)&_mh_execute_header,  v286,  OS_LOG_TYPE_DEFAULT,  "attempting upgrade: currentAuth: %llu desiredAuth: %llu",  buf,  0x16u);
                }

                if (([v177 isPreflight] & 1) == 0)
                {
                  -[TCCDRequestResult setAuthorizationValue:](v499, "setAuthorizationValue:", 1LL);
                  -[TCCDRequestResult setPromptType:](v499, "setPromptType:", 2LL);
                }
              }
            }
          }

LABEL_199:
          if ((id)-[TCCDRequestResult authorizationValue](v499, "authorizationValue") != (id)1
            && (id)-[TCCDRequestResult authorizationValue](v499, "authorizationValue") != (id)6)
          {
            if (([v177 isPreflight] & 1) != 0
              || !-[TCCDRequestResult doUpdateOfSubjectVerifierData](v499, "doUpdateOfSubjectVerifierData"))
            {
              goto LABEL_104;
            }

            goto LABEL_209;
          }

          +[NSUserDefaults resetStandardUserDefaults](&OBJC_CLASS___NSUserDefaults, "resetStandardUserDefaults");
          v296 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
          v297 = (void *)objc_claimAutoreleasedReturnValue([v296 persistentDomainForName:@"com.apple.springboard"]);
          v298 = (void *)objc_claimAutoreleasedReturnValue([v297 objectForKeyedSubscript:@"SBParentalControlsCapabilities"]);
          v299 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
          v300 = (void *)objc_claimAutoreleasedReturnValue([v299 name]);
          unsigned int v301 = [v298 containsObject:v300];

          if (v301)
          {
            -[TCCDRequestResult setAuthorizationValue:](v499, "setAuthorizationValue:", 0LL);
            -[TCCDRequestResult setAuthorizationReason:](v499, "setAuthorizationReason:", 7LL);
            -[TCCDRequestResult setDatabaseAction:](v499, "setDatabaseAction:", 0LL);
            v194 = (os_log_s *)(id)qword_100078240;
            if (os_log_type_enabled(v194, OS_LOG_TYPE_DEFAULT))
            {
              v302 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
              v303 = (void *)objc_claimAutoreleasedReturnValue([v302 name]);
              *(_DWORD *)buf = 138543362;
              *(void *)v526 = v303;
              _os_log_impl( (void *)&_mh_execute_header,  v194,  OS_LOG_TYPE_DEFAULT,  "%{public}@ is restricted by Parental Controls.",  buf,  0xCu);
            }

            goto LABEL_222;
          }

          v304 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
          BOOL v305 = [v304 alertStyle] == (id)2;

          if (v305)
          {
            v306 = (void *)objc_claimAutoreleasedReturnValue([v177 attributionChain]);
            v307 = (void *)objc_claimAutoreleasedReturnValue([v306 responsibleProcess]);
            unsigned int v308 = [v307 BOOLValueForEntitlement:@"com.apple.private.packagekit.userconsent"];

            int v309 = v308 ^ 1;
          }

          else
          {
            int v309 = 0;
          }

          v310 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
          v311 = (void *)objc_claimAutoreleasedReturnValue([v310 name]);
          unsigned int v312 = [v311 isEqualToString:@"kTCCServiceAccessibility"];

          if (v312)
          {
            -[TCCDRequestResult setAuthorizationValue:](v499, "setAuthorizationValue:", 1LL);
            -[TCCDRequestResult setAuthorizationReason:](v499, "setAuthorizationReason:", 5LL);
            -[TCCDRequestResult setDatabaseAction:](v499, "setDatabaseAction:", 0LL);
            v194 = (os_log_s *)(id)qword_100078240;
            if (os_log_type_enabled(v194, OS_LOG_TYPE_DEFAULT))
            {
              v313 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
              v314 = (void *)objc_claimAutoreleasedReturnValue([v313 name]);
              *(_DWORD *)buf = 138543362;
              *(void *)v526 = v314;
              _os_log_impl( (void *)&_mh_execute_header,  v194,  OS_LOG_TYPE_DEFAULT,  "Service %{public}@ does not allow prompting; returning Unknown",
                buf,
                0xCu);
            }

            goto LABEL_222;
          }

          v315 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
          BOOL v316 = [v315 alertStyle] == (id)1;

          if (v316)
          {
            -[TCCDRequestResult setAuthorizationValue:](v499, "setAuthorizationValue:", 0LL);
            -[TCCDRequestResult setAuthorizationReason:](v499, "setAuthorizationReason:", 5LL);
            -[TCCDRequestResult setDatabaseAction:](v499, "setDatabaseAction:", 0LL);
            v194 = (os_log_s *)(id)qword_100078240;
            if (os_log_type_enabled(v194, OS_LOG_TYPE_DEFAULT))
            {
              v317 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
              v318 = (void *)objc_claimAutoreleasedReturnValue([v317 name]);
              *(_DWORD *)buf = 138543362;
              *(void *)v526 = v318;
              _os_log_impl( (void *)&_mh_execute_header,  v194,  OS_LOG_TYPE_DEFAULT,  "Service %{public}@ does not allow prompting; returning denied.",
                buf,
                0xCu);
            }

            goto LABEL_222;
          }

          v319 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
          BOOL v320 = [v319 alertStyle] == (id)3;

          if (v320)
          {
            -[TCCDRequestResult setAuthorizationValue:](v499, "setAuthorizationValue:", 0LL);
            -[TCCDRequestResult setAuthorizationReason:](v499, "setAuthorizationReason:", 5LL);
            -[TCCDRequestResult setDatabaseAction:](v499, "setDatabaseAction:", 0LL);
            v194 = (os_log_s *)(id)qword_100078240;
            if (os_log_type_enabled(v194, OS_LOG_TYPE_DEFAULT))
            {
              v321 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
              v322 = (void *)objc_claimAutoreleasedReturnValue([v321 name]);
              *(_DWORD *)buf = 138543362;
              *(void *)v526 = v322;
              _os_log_impl( (void *)&_mh_execute_header,  v194,  OS_LOG_TYPE_DEFAULT,  "Service %{public}@ does not allow prompting; returning denied.",
                buf,
                0xCu);
            }

            goto LABEL_222;
          }

          if ([v177 isPreflight])
          {
            if ([v177 promptingPolicy] == (id)1)
            {
              -[TCCDRequestResult setAuthorizationValue:](v499, "setAuthorizationValue:", 0LL);
              -[TCCDRequestResult setAuthorizationReason:](v499, "setAuthorizationReason:", 10LL);
              -[TCCDRequestResult setDatabaseAction:](v499, "setDatabaseAction:", 0LL);
            }

            v194 = (os_log_s *)objc_claimAutoreleasedReturnValue([v177 service]);
            if (-[os_log_s supportsStagedPrompting](v194, "supportsStagedPrompting"))
            {
              BOOL v323 = (id)-[TCCDRequestResult authorizationValue](v499, "authorizationValue") == (id)6;

              if (v323) {
                [v177 setDesiredAuth:6];
              }
              goto LABEL_104;
            }

            goto LABEL_222;
          }

          if (v309)
          {
            v324 = (os_log_s *)(id)qword_100078240;
            if (os_log_type_enabled(v324, OS_LOG_TYPE_DEFAULT))
            {
              v325 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
              v326 = (void *)objc_claimAutoreleasedReturnValue([v325 name]);
              *(_DWORD *)buf = 138543362;
              *(void *)v526 = v326;
              _os_log_impl( (void *)&_mh_execute_header,  v324,  OS_LOG_TYPE_DEFAULT,  "Service %{public}@ does not allow prompting for unentitled binaries; returning denied.",
                buf,
                0xCu);
            }

            v327 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
            [v177 presentAsynchronousDenialNotificationForService:v327];

            -[TCCDRequestResult setAuthorizationValue:](v499, "setAuthorizationValue:", 0LL);
            -[TCCDRequestResult setAuthorizationReason:](v499, "setAuthorizationReason:", 2LL);
            -[TCCDRequestResult setDatabaseAction:](v499, "setDatabaseAction:", 1LL);
            goto LABEL_104;
          }

          v332 = (void *)objc_claimAutoreleasedReturnValue([v177 subjectIdentity]);
          __int16 v37 = (void *)objc_claimAutoreleasedReturnValue([v332 displayName]);

          if (!v37)
          {
            v344 = (void *)objc_claimAutoreleasedReturnValue([v177 identityDescription]);
            -[TCCDRequestResult denyAuthorizationWithErrorCode:format:]( v499,  "denyAuthorizationWithErrorCode:format:",  2LL,  @"Unable to prompt for client without display name (%{public}@)",  v344);

            goto LABEL_104;
          }

          v333 = (os_log_s *)(id)qword_100078240;
          if (os_log_type_enabled(v333, OS_LOG_TYPE_DEFAULT))
          {
            v334 = (void *)objc_claimAutoreleasedReturnValue([v177 messageIdentifier]);
            v335 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
            v336 = (void *)objc_claimAutoreleasedReturnValue([v335 name]);
            v337 = (void *)objc_claimAutoreleasedReturnValue([v177 identityDescription]);
            *(_DWORD *)buf = 138543874;
            *(void *)v526 = v334;
            *(_WORD *)&v526[8] = 2114;
            *(void *)&v526[10] = v336;
            *(_WORD *)&v526[18] = 2114;
            *(void *)&v526[20] = v337;
            _os_log_impl( (void *)&_mh_execute_header,  v333,  OS_LOG_TYPE_DEFAULT,  "AUTHREQ_PROMPTING: msgID=%{public}@, service=%{public}@, subject=%{public}@, ",  buf,  0x20u);
          }

          v338 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
          id v36 = (void *)objc_claimAutoreleasedReturnValue([v338 requestTitleTextLocalizationKey]);

          v339 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
          v486 = (void *)objc_claimAutoreleasedReturnValue([v339 requestAdditionalTextLocalizationKey]);

          v340 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
          unsigned int v341 = [v340 supportsStagedPrompting];

          if (v341)
          {
            if ((id)-[TCCDRequestResult promptType](v499, "promptType") == (id)2)
            {
              v342 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
              v343 = (void *)objc_claimAutoreleasedReturnValue([v342 requestUpgradeTitleTextLocalizationKey]);
            }

            else
            {
              v342 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
              v343 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v342,  "requestTitleTextLocalizationKeyForAuthorization:",  objc_msgSend(v177, "desiredAuth")));
            }

            id v490 = v343;
          }

          else
          {
            id v490 = 0LL;
          }

          v345 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
          v488 = (void *)objc_claimAutoreleasedReturnValue([v345 alternatePromptTitleEntitlement]);

          if (v488)
          {
            v346 = (void *)objc_claimAutoreleasedReturnValue([v177 attributionChain]);
            v347 = (void *)objc_claimAutoreleasedReturnValue([v346 accessingProcess]);
            unsigned int v348 = [v347 BOOLValueForEntitlement:v488];

            if (v348)
            {
              v349 = (os_log_s *)(id)qword_100078240;
              if (os_log_type_enabled(v349, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v349,  OS_LOG_TYPE_DEFAULT,  "using alternate header text due to entitlement",  buf,  2u);
              }

              v350 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
              uint64_t v351 = objc_claimAutoreleasedReturnValue([v350 requestEntitlementTitleTextLocalizationKey]);

              id v490 = (id)v351;
            }
          }

          if (v490)
          {
            id v352 = v490;

            id v36 = v352;
          }

          if ([v177 promptRightsMask])
          {
            unsigned __int8 v353 = [v177 promptRightsMask];
          }

          else
          {
            v354 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
            unsigned __int8 v353 = [v354 authorizationPromptRightsMask];
          }

          id v355 = [v177 spiVersion];
          v356 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
          v495 = (void *)objc_claimAutoreleasedReturnValue([v356 allowAuthorizationButtonTitleLocalizationKey]);

          uint64_t v508 = 2LL;
          v357 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
          v493 = (void *)objc_claimAutoreleasedReturnValue([v357 denyAuthorizationButtonTitleLocalizationKey]);

          v497 = 0LL;
          uint64_t v506 = 1LL;
          uint64_t v507 = 0LL;
          if ((v353 & 8) != 0 && (unint64_t)v355 >= 2)
          {
            v359 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
            v497 = (void *)objc_claimAutoreleasedReturnValue([v359 limitedAuthorizationButtonTitleLocalizationKey]);

            uint64_t v506 = 3LL;
            if ((id)-[TCCDRequestResult v1AuthorizationValue](v499, "v1AuthorizationValue") == (id)2)
            {
              v360 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
              v361 = (void *)objc_claimAutoreleasedReturnValue([v360 requestTitleTextAfterV2UpgradeLocalizationKey]);
              BOOL v362 = v361 == 0LL;

              if (!v362)
              {
                v363 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
                uint64_t v364 = objc_claimAutoreleasedReturnValue([v363 requestTitleTextAfterV2UpgradeLocalizationKey]);

                id v36 = (void *)v364;
              }

              v365 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
              v366 = (void *)objc_claimAutoreleasedReturnValue([v365 requestAdditionalTextAfterV2UpgradeLocalizationKey]);
              BOOL v367 = v366 == 0LL;

              if (!v367)
              {
                v368 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
                uint64_t v369 = objc_claimAutoreleasedReturnValue([v368 requestAdditionalTextAfterV2UpgradeLocalizationKey]);

                v486 = (void *)v369;
              }
            }
          }

          id v370 = (id)objc_claimAutoreleasedReturnValue([v177 service]);
          if ([v370 supportsStagedPrompting])
          {
            v371 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
            v372 = (void *)objc_claimAutoreleasedReturnValue([v371 name]);
            if ([v372 isEqualToString:@"kTCCServicePhotos"])
            {
              BOOL v373 = [v177 spiVersion] == (id)1;

              if (v373)
              {
                v482 = v493;
                v484 = v495;
                v480 = v497;
                goto LABEL_269;
              }
            }

            else
            {
            }

            id v391 = [v177 desiredAuth];
            v392 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
            unsigned int v393 = objc_msgSend( v392,  "authorizationChoicesForCurrentAuth:desiredAuth:aButtonAuth:bButtonAuth:cButtonAuth:",  -[TCCDRequestResult previousAuthorization](v499, "previousAuthorization"),  objc_msgSend(v177, "desiredAuth"),  &v508,  &v507,  &v506);

            if ((v393 & 0x80000000) != 0)
            {
              v432 = (os_log_s *)(id)qword_100078240;
              if (os_log_type_enabled(v432, OS_LOG_TYPE_ERROR))
              {
                unint64_t v454 = -[TCCDRequestResult previousAuthorization](v499, "previousAuthorization");
                id v455 = [v177 desiredAuth];
                *(_DWORD *)buf = 67109632;
                *(_DWORD *)v526 = v391 == 0LL;
                *(_WORD *)&v526[4] = 2048;
                *(void *)&v526[6] = v454;
                *(_WORD *)&v526[14] = 2048;
                *(void *)&v526[16] = v455;
                _os_log_error_impl( (void *)&_mh_execute_header,  v432,  OS_LOG_TYPE_ERROR,  "Staged prompting request is invalid: legacySPI: %d currentAuth: %llu desiredAuth: %llu",  buf,  0x1Cu);
              }

              -[TCCDRequestResult setAuthorizationValue:]( v499,  "setAuthorizationValue:",  -[TCCDRequestResult previousAuthorization](v499, "previousAuthorization"));
              -[TCCDRequestResult setAuthorizationReason:](v499, "setAuthorizationReason:", 5LL);
              -[TCCDRequestResult setDatabaseAction:](v499, "setDatabaseAction:", 0LL);
              goto LABEL_314;
            }

            if ((id)-[TCCDRequestResult previousAuthorization](v499, "previousAuthorization") == (id)6
              && [v177 desiredAuth] == (id)6)
            {
              v394 = (os_log_s *)(id)qword_100078240;
              if (os_log_type_enabled(v394, OS_LOG_TYPE_DEBUG)) {
                sub_10003D574();
              }

              [v177 setDesiredAuth:2];
            }

            v395 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
            v484 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v395,  "buttonTitleLocalizationKeyForAuthorization:desiredAuth:",  v508,  objc_msgSend(v177, "desiredAuth")));

            v396 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
            v482 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v396,  "buttonTitleLocalizationKeyForAuthorization:desiredAuth:",  v507,  objc_msgSend(v177, "desiredAuth")));

            v397 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
            v480 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v397,  "buttonTitleLocalizationKeyForAuthorization:desiredAuth:",  v506,  objc_msgSend(v177, "desiredAuth")));

            v398 = (os_log_s *)(id)qword_100078240;
            if (os_log_type_enabled(v398, OS_LOG_TYPE_DEFAULT))
            {
              v399 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
              unint64_t v400 = -[TCCDRequestResult previousAuthorization](v499, "previousAuthorization");
              id v401 = [v177 desiredAuth];
              *(_DWORD *)buf = 67109890;
              *(_DWORD *)v526 = v391 == 0LL;
              *(_WORD *)&v526[4] = 2112;
              *(void *)&v526[6] = v399;
              *(_WORD *)&v526[14] = 2048;
              *(void *)&v526[16] = v400;
              *(_WORD *)&v526[24] = 2048;
              *(void *)&v526[26] = v401;
              _os_log_impl( (void *)&_mh_execute_header,  v398,  OS_LOG_TYPE_DEFAULT,  "got authorization choices for staged prompting request: legacy SPI: %d service: %@ currentAuth: %llu desiredAuth: %llu",  buf,  0x26u);
            }

            id v370 = (id)qword_100078240;
            if (os_log_type_enabled((os_log_t)v370, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218496;
              *(void *)v526 = v508;
              *(_WORD *)&v526[8] = 2048;
              *(void *)&v526[10] = v507;
              *(_WORD *)&v526[18] = 2048;
              *(void *)&v526[20] = v506;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v370,  OS_LOG_TYPE_DEFAULT,  "aButtonAuth: %llu bButtonAuth: %llu cButtonAuth: %llu",  buf,  0x20u);
            }
          }

          else
          {
            v482 = v493;
            v484 = v495;
            v480 = v497;
          }

LABEL_269:
          v374 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
          v375 = (void *)objc_claimAutoreleasedReturnValue([v374 requestTitleTextForSubsequentRequestsKey]);
          BOOL v376 = v375 == 0LL;

          if (!v376)
          {
            v377 = (void *)qword_100078468;
            v378 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
            id v379 = [v377 numberOfRecordsForService:v378];

            if (v379)
            {
              v380 = (os_log_s *)(id)qword_100078240;
              if (os_log_type_enabled(v380, OS_LOG_TYPE_DEFAULT))
              {
                v381 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
                v382 = (void *)objc_claimAutoreleasedReturnValue([v381 name]);
                *(_DWORD *)buf = 138543618;
                *(void *)v526 = v382;
                *(_WORD *)&v526[8] = 2048;
                *(void *)&v526[10] = v379;
                _os_log_impl( (void *)&_mh_execute_header,  v380,  OS_LOG_TYPE_DEFAULT,  "Using subsequent request strings for %{public}@ with %llu records.",  buf,  0x16u);
              }

LABEL_273:
              v383 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
              uint64_t v384 = objc_claimAutoreleasedReturnValue([v383 requestTitleTextForSubsequentRequestsKey]);

              v385 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
              uint64_t v386 = objc_claimAutoreleasedReturnValue([v385 requestAdditionalTextForSubsequentRequestsLocalizationKey]);

              v387 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
              v495 = (void *)objc_claimAutoreleasedReturnValue([v387 subsequentRequestAllowAuthorizationButtonTitleLocalizationKey]);

              uint64_t v508 = 2LL;
              v388 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
              v493 = (void *)objc_claimAutoreleasedReturnValue([v388 subsequentRequestDenyAuthorizationButtonTitleLocalizationKey]);

              uint64_t v507 = 0LL;
              v389 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
              v497 = (void *)objc_claimAutoreleasedReturnValue([v389 subsequentRequestLimitedAuthorizationButtonTitleLocalizationKey]);

              uint64_t v506 = 3LL;
              v390 = (os_log_s *)(id)qword_100078240;
              if (os_log_type_enabled(v390, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412802;
                *(void *)v526 = v495;
                *(_WORD *)&v526[8] = 2112;
                *(void *)&v526[10] = v493;
                *(_WORD *)&v526[18] = 2112;
                *(void *)&v526[20] = v497;
                _os_log_debug_impl( (void *)&_mh_execute_header,  v390,  OS_LOG_TYPE_DEBUG,  "Loc Keys: allow %@, deny: %@, limited: %@",  buf,  0x20u);
              }

              v486 = (void *)v386;
              id v36 = (void *)v384;
              goto LABEL_292;
            }

            v402 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
            v403 = (void *)objc_claimAutoreleasedReturnValue([v402 subsequentRequestStringsRelatedService]);
            BOOL v404 = v403 == 0LL;

            if (!v404)
            {
              v405 = (void *)qword_100078468;
              v406 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
              v407 = (void *)objc_claimAutoreleasedReturnValue([v406 subsequentRequestStringsRelatedService]);
              id v408 = [v405 numberOfRecordsForService:v407 withAuthorizationValue:2];

              if (v408)
              {
                v380 = (os_log_s *)(id)qword_100078240;
                if (os_log_type_enabled(v380, OS_LOG_TYPE_DEFAULT))
                {
                  v409 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
                  v410 = (void *)objc_claimAutoreleasedReturnValue([v409 subsequentRequestStringsRelatedService]);
                  v411 = (void *)objc_claimAutoreleasedReturnValue([v410 name]);
                  *(_DWORD *)buf = 138543618;
                  *(void *)v526 = v411;
                  *(_WORD *)&v526[8] = 2048;
                  *(void *)&v526[10] = v408;
                  _os_log_impl( (void *)&_mh_execute_header,  v380,  OS_LOG_TYPE_DEFAULT,  "Using subsequent request strings for related service %{public}@ with %llu records.",  buf,  0x16u);
                }

                goto LABEL_273;
              }
            }
          }

          v493 = v482;
          v495 = v484;
          v497 = v480;
LABEL_292:
          v412 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
          v413 = (void *)objc_claimAutoreleasedReturnValue([v412 localizedResourcesBundle]);
          BOOL v414 = v413 == 0LL;

          if (!v414)
          {
            v415 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
            v485 = (void *)objc_claimAutoreleasedReturnValue([v415 localizedTextWithKey:v495]);

            v416 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
            v483 = (void *)objc_claimAutoreleasedReturnValue([v416 localizedTextWithKey:v493]);

            if (v497)
            {
              v417 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
              v481 = (void *)objc_claimAutoreleasedReturnValue([v417 localizedTextWithKey:v497]);
            }

            else
            {
              v481 = 0LL;
            }

            v420 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
            __int16 v35 = (void *)objc_claimAutoreleasedReturnValue([v420 localizedTextWithKey:v36]);

            if (v35)
            {
              id v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v35,  @"%@",  0LL,  v37));
              if (v34)
              {
                BOOL v505 = 0;
                v421 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
                v472 = (void *)objc_claimAutoreleasedReturnValue([v177 subjectIdentity]);
                v475 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
                v422 = (void *)objc_claimAutoreleasedReturnValue([v475 localizedResourcesBundle]);
                id v504 = 0LL;
                char oslogb = sub_10000F3B8( v421,  v472,  v422,  (uint64_t *)&v504,  &v505,  (uint64_t)[v177 desiredAuth]);
                id v33 = v504;

                if ((oslogb & 1) == 0)
                {
                  v438 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
                  v439 = (void *)objc_claimAutoreleasedReturnValue([v438 name]);
                  v440 = (void *)objc_claimAutoreleasedReturnValue([v177 identityDescription]);
                  -[TCCDRequestResult denyAuthorizationWithErrorCode:format:]( v499,  "denyAuthorizationWithErrorCode:format:",  2LL,  @"Failure client_usage_string_for_service() service %{public}@ and subject %{public}@",  v439,  v440);

                  v441 = v499;
                  goto LABEL_342;
                }

                if (!v33 && v505)
                {
                  v423 = (os_log_s *)(id)qword_100078240;
                  if (os_log_type_enabled(v423, OS_LOG_TYPE_ERROR))
                  {
                    v459 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
                    v479 = (void *)objc_claimAutoreleasedReturnValue([v459 name]);
                    os_log_t oslogc = (os_log_t)objc_claimAutoreleasedReturnValue([v177 identityDescription]);
                    v474 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
                    v460 = (void *)objc_claimAutoreleasedReturnValue([v474 usageDescriptionKeyName]);
                    *(_DWORD *)buf = 138543874;
                    *(void *)v526 = v479;
                    *(_WORD *)&v526[8] = 2114;
                    *(void *)&v526[10] = oslogc;
                    *(_WORD *)&v526[18] = 2114;
                    *(void *)&v526[20] = v460;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v423,  OS_LOG_TYPE_ERROR,  "Refusing authorization request for service %{public}@ and subject %{public}@ without %{public}@ key",  buf,  0x20u);
                  }

                  -[TCCDRequestResult setAuthorizationValue:](v499, "setAuthorizationValue:", 0LL);
                  -[TCCDRequestResult setAuthorizationReason:](v499, "setAuthorizationReason:", 8LL);
                  -[TCCDRequestResult setDatabaseAction:](v499, "setDatabaseAction:", 0LL);
                  v424 = (void *)objc_claimAutoreleasedReturnValue([v177 attributionChain]);
                  if (!v424) {
                    goto LABEL_309;
                  }
                  v425 = (void *)objc_claimAutoreleasedReturnValue([v177 attributionChain]);
                  if (([v425 accessingProcessSpecified] & 1) == 0)
                  {
                    v426 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
                    unsigned __int8 v476 = [v426 pardonMissingUsage];

                    if ((v476 & 1) != 0)
                    {
LABEL_309:
                      v429 = v499;
                      id v33 = 0LL;
LABEL_342:

                      goto LABEL_343;
                    }

                    v477 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
                    v427 = (void *)objc_claimAutoreleasedReturnValue([v477 usageDescriptionKeyName]);
                    v424 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"This app has crashed because it attempted to access privacy-sensitive data without a usage description.  The app's Info.plist must contain an %@ key with a string value explaining to the user how the app uses this data.",  v427));

                    -[TCCDRequestResult setServicePolicyAction:](v499, "setServicePolicyAction:", 1LL);
                    -[TCCDRequestResult setServicePolicyActionDescription:]( v499,  "setServicePolicyActionDescription:",  v424);
                    v425 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
                    v428 = (void *)objc_claimAutoreleasedReturnValue([v425 usageDescriptionKeyName]);
                    -[TCCDRequestResult setServicePolicyActionKeyName:](v499, "setServicePolicyActionKeyName:", v428);
                  }

                  goto LABEL_309;
                }

                if (v486)
                {
                  osunsigned int log = (os_log_t)objc_claimAutoreleasedReturnValue([v177 service]);
                  v442 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s localizedResourcesBundle](oslog, "localizedResourcesBundle"));
                  v478 = (void *)objc_claimAutoreleasedReturnValue([v442 localizedStringForKey:v486 value:&stru_100066238 table:0]);
                  if (v478)
                  {
                    v473 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v478,  @"%@",  0LL,  v37));

                    if (v473)
                    {
                      if (v33)
                      {
                        uint64_t v443 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@\n\n%@",  v473,  v33));

                        id v33 = (id)v443;
                      }

                      else
                      {
                        id v33 = v473;
                        v473 = v33;
                      }
                    }

                    else
                    {
                      v473 = 0LL;
                    }

LABEL_325:
                    v444 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
                    if ([v444 usesTwoStagePrompting])
                    {
                      BOOL v445 = [v177 desiredAuth] == (id)2;

                      if (v445)
                      {
                        uint64_t v502 = 0LL;
                        uint64_t v503 = 1LL;
                        int v501 = 0;
                        uint64_t v464 = qword_100078468;
                        v446 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
                        os_log_t oslogd = (os_log_t)objc_claimAutoreleasedReturnValue([v177 service]);
                        unsigned int v462 = -[os_log_s isAccessAllowedByDefault](oslogd, "isAccessAllowedByDefault");
                        v447 = (void *)objc_claimAutoreleasedReturnValue([v177 subjectIdentity]);
                        LOBYTE(v464) = [(id)v464 evaluateAccessToService:v446 defaultAccessAllowed:v462 by:v447 checkCodeRequi rements:1 authorizationResult:&v503 authorizationReason:&v502 flags:&v501 subjectC odeIdentityDataResult:0];

                        osloga = (os_log_s *)(id)qword_100078240;
                        if ((v464 & 1) != 0)
                        {
                          if (os_log_type_enabled(osloga, OS_LOG_TYPE_DEFAULT))
                          {
                            uint64_t v448 = v503;
                            v449 = (void *)objc_claimAutoreleasedReturnValue([v177 identityDescription]);
                            *(_DWORD *)buf = 134218498;
                            *(void *)v526 = v448;
                            *(_WORD *)&v526[8] = 2112;
                            *(void *)&v526[10] = v449;
                            *(_WORD *)&v526[18] = 1024;
                            *(_DWORD *)&v526[20] = v501;
                            _os_log_impl( (void *)&_mh_execute_header,  osloga,  OS_LOG_TYPE_DEFAULT,  "AUTHREQ_RESULT: Got %llu auth from db for client: %@ flags: %d",  buf,  0x1Cu);
                          }

                          -[TCCDRequestResult setAuthorizationValue:](v499, "setAuthorizationValue:", v503);
                          -[TCCDRequestResult setAuthorizationReason:](v499, "setAuthorizationReason:", v502);
                          -[TCCDRequestResult setDatabaseAction:](v499, "setDatabaseAction:", 0LL);
                        }

                        else
                        {
                          if (os_log_type_enabled(osloga, OS_LOG_TYPE_ERROR))
                          {
                            v457 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
                            v458 = (void *)objc_claimAutoreleasedReturnValue([v177 identityDescription]);
                            sub_10003D510(v457, v458, (uint64_t)buf, osloga);
                          }
                        }

                        goto LABEL_333;
                      }
                    }

                    else
                    {
                    }

                    LODWORD(v461) = 0;
                    objc_msgSend( v177,  "presentSynchronousPromptWithHeader:message:aButtonTitle:aButtonAuth:bButtonTitle:bButtonAuth:cButt onTitle:cButtonAuth:currentAuth:withTimeoutInSeconds:updatingResult:",  v34,  v33,  v485,  v508,  v483,  v507,  v481,  v506,  -[TCCDRequestResult previousAuthorization](v499, "previousAuthorization"),  v461,  v499);
LABEL_333:
                    v450 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
                    if ([v450 supportsStagedPrompting]
                      && (v508 == 2 || v507 == 2 || v506 == 2)
                      && (id)-[TCCDRequestResult authorizationReason](v499, "authorizationReason") != (id)9)
                    {
                      BOOL v456 = (id)-[TCCDRequestResult authorizationReason](v499, "authorizationReason") == (id)13;

                      if (!v456) {
                        -[TCCDRequestResult setDatabaseFlags:]( v499,  "setDatabaseFlags:",  -[TCCDRequestResult databaseFlags](v499, "databaseFlags") | 0x10);
                      }
                    }

                    else
                    {
                    }

                    v451 = (void *)objc_claimAutoreleasedReturnValue([v177 clientDict]);
                    v452 = (void *)objc_claimAutoreleasedReturnValue( [v451 objectForKeyedSubscript:kTCCNotificationExtensionClientDataPromptReasonKey]);

                    if ((id)-[TCCDRequestResult authorizationReason](v499, "authorizationReason") == (id)2)
                    {
                      v463 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 platform]);
                      os_log_t osloge = (os_log_t)objc_claimAutoreleasedReturnValue([v177 service]);
                      v465 = (void *)objc_claimAutoreleasedReturnValue([v177 subjectIdentity]);
                      objc_msgSend( v463,  "sendAnalyticsForAction:service:subjectIdentity:indirectObjectIdentity:authValue:includeV1AuthVal ue:v1AuthValue:desiredAuth:domainReason:promptType:",  4,  osloge,  v465,  0,  -[TCCDRequestResult authorizationValue](v499, "authorizationValue"),  -[TCCDRequestResult v1AuthorizationUpgrade](v499, "v1AuthorizationUpgrade") != 0,  -[TCCDRequestResult v1AuthorizationValue](v499, "v1AuthorizationValue"),  objc_msgSend(v177, "desiredAuth"),  v452,  -[TCCDRequestResult promptType](v499, "promptType"));
                    }

                    v453 = v499;

                    goto LABEL_342;
                  }
                }

                v473 = 0LL;
                v478 = 0LL;
                goto LABEL_325;
              }

              v434 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
              v435 = (void *)objc_claimAutoreleasedReturnValue([v434 name]);
              v436 = (void *)objc_claimAutoreleasedReturnValue([v177 identityDescription]);
              -[TCCDRequestResult denyAuthorizationWithErrorCode:format:]( v499,  "denyAuthorizationWithErrorCode:format:",  2LL,  @"Failed to construct localized request string for service %{public}@ and subject %{public}@",  v435,  v436);
            }

            else
            {
              v430 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
              v431 = (void *)objc_claimAutoreleasedReturnValue([v430 name]);
              -[TCCDRequestResult denyAuthorizationWithErrorCode:format:]( v499,  "denyAuthorizationWithErrorCode:format:",  2LL,  @"Could not find localized string for service %{public}: request_key=%{public}",  v431,  v36,  0LL);
            }

            v437 = v499;
            id v33 = 0LL;
            id v34 = 0LL;
            goto LABEL_342;
          }

          v418 = (void *)objc_claimAutoreleasedReturnValue([v177 service]);
          v419 = (void *)objc_claimAutoreleasedReturnValue([v418 name]);
          -[TCCDRequestResult denyAuthorizationWithErrorCode:format:]( v499,  "denyAuthorizationWithErrorCode:format:",  2LL,  @"Failed to load localizedResourcesBundle for service %{public}@",  v419);

LABEL_314:
          v433 = v499;
          id v33 = 0LL;
          id v34 = 0LL;
          __int16 v35 = 0LL;
LABEL_343:

          goto LABEL_105;
        }
      }

      goto LABEL_115;
    }

    v142 = (void *)objc_claimAutoreleasedReturnValue([v26 attributionChain]);
    v143 = (void *)objc_claimAutoreleasedReturnValue([v142 accessingProcess]);
    v498 = (void *)objc_claimAutoreleasedReturnValue([v143 arrayValueForEntitlement:@"com.apple.tcc.delegated-services"]);

    id v144 = (id)objc_claimAutoreleasedReturnValue([v26 service]);
    v145 = (void *)objc_claimAutoreleasedReturnValue([v144 name]);
    if ([v498 containsObject:v145])
    {
      v146 = (void *)objc_claimAutoreleasedReturnValue([v26 service]);
      v147 = (void *)objc_claimAutoreleasedReturnValue([v146 sandboxOperationForDelegation]);
      BOOL v148 = v147 == 0LL;

      if (v148)
      {
LABEL_101:

        goto LABEL_102;
      }

      v149 = (os_log_s *)(id)qword_100078240;
      if (os_log_type_enabled(v149, OS_LOG_TYPE_INFO))
      {
        v150 = (void *)objc_claimAutoreleasedReturnValue([v26 identityDescription]);
        v151 = (void *)objc_claimAutoreleasedReturnValue([v26 service]);
        v152 = (void *)objc_claimAutoreleasedReturnValue([v151 name]);
        v153 = (void *)objc_claimAutoreleasedReturnValue([v26 service]);
        v154 = (void *)objc_claimAutoreleasedReturnValue([v153 sandboxOperationForDelegation]);
        *(_DWORD *)buf = 138412802;
        *(void *)v526 = v150;
        *(_WORD *)&v526[8] = 2112;
        *(void *)&v526[10] = v152;
        *(_WORD *)&v526[18] = 2112;
        *(void *)&v526[20] = v154;
        _os_log_impl( (void *)&_mh_execute_header,  v149,  OS_LOG_TYPE_INFO,  "Checking %@ for delegated service: %@: operation: %@",  buf,  0x20u);
      }

      v155 = (void *)objc_claimAutoreleasedReturnValue([v26 attributionChain]);
      v156 = (void *)objc_claimAutoreleasedReturnValue([v155 accessingProcess]);
      v157 = v156;
      if (v156) {
        [v156 auditToken];
      }
      else {
        memset(v516, 0, sizeof(v516));
      }
      uint64_t v211 = SANDBOX_CHECK_NO_REPORT;
      BOOL v212 = sandbox_check_by_audit_token(v516, 0LL, SANDBOX_CHECK_NO_REPORT) == 0;

      if (!v212)
      {
        v213 = (void *)objc_claimAutoreleasedReturnValue([v26 attributionChain]);
        v214 = (void *)objc_claimAutoreleasedReturnValue([v213 accessingProcess]);
        v215 = v214;
        if (v214) {
          [v214 auditToken];
        }
        else {
          memset(v515, 0, sizeof(v515));
        }
        v221 = (void *)objc_claimAutoreleasedReturnValue([v26 service]);
        id v222 = objc_claimAutoreleasedReturnValue([v221 sandboxOperationForDelegation]);
        int v223 = sandbox_check_by_audit_token(v515, [v222 UTF8String], v211);

        if (v223 < 0)
        {
          id v224 = (id)objc_claimAutoreleasedReturnValue([v26 service]);
          v231 = (void *)objc_claimAutoreleasedReturnValue([v224 name]);
          v232 = (void *)objc_claimAutoreleasedReturnValue([v26 identityDescription]);
          v233 = (void *)objc_claimAutoreleasedReturnValue([v26 service]);
          v234 = (void *)objc_claimAutoreleasedReturnValue([v233 sandboxOperationForDelegation]);
          -[TCCDRequestResult denyAuthorizationWithErrorCode:format:]( v500,  "denyAuthorizationWithErrorCode:format:",  3LL,  @"delegated service: %@: %@ sandbox_check_by_audit_token(%@) fails: %d",  v231,  v232,  v234,  *__error());
        }

        else
        {
          -[TCCDRequestResult setAuthorizationValue:](v500, "setAuthorizationValue:", 2LL * (v223 == 0));
          -[TCCDRequestResult setAuthorizationReason:](v500, "setAuthorizationReason:", 5LL);
          -[TCCDRequestResult setReplyNoCacheAuthorization:](v500, "setReplyNoCacheAuthorization:", 1LL);
          id v224 = (id)qword_100078240;
          if (os_log_type_enabled((os_log_t)v224, OS_LOG_TYPE_INFO))
          {
            v225 = (void *)objc_claimAutoreleasedReturnValue([v26 identityDescription]);
            v226 = (void *)objc_claimAutoreleasedReturnValue([v26 service]);
            v227 = (void *)objc_claimAutoreleasedReturnValue([v226 name]);
            v228 = (void *)objc_claimAutoreleasedReturnValue([v26 service]);
            v229 = (void *)objc_claimAutoreleasedReturnValue([v228 sandboxOperationForDelegation]);
            unint64_t v230 = -[TCCDRequestResult authorizationValue](v500, "authorizationValue");
            *(_DWORD *)buf = 138413058;
            *(void *)v526 = v225;
            *(_WORD *)&v526[8] = 2112;
            *(void *)&v526[10] = v227;
            *(_WORD *)&v526[18] = 2112;
            *(void *)&v526[20] = v229;
            *(_WORD *)&v526[28] = 2048;
            *(void *)&v526[30] = v230;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v224,  OS_LOG_TYPE_INFO,  "%@ for delegated service: %@: operation: %@ is %lld",  buf,  0x2Au);
          }
        }

        v235 = v500;
        goto LABEL_26;
      }

      id v144 = (id)qword_100078240;
      if (os_log_type_enabled((os_log_t)v144, OS_LOG_TYPE_INFO))
      {
        v216 = (void *)objc_claimAutoreleasedReturnValue([v26 identityDescription]);
        v217 = (void *)objc_claimAutoreleasedReturnValue([v26 service]);
        v218 = (void *)objc_claimAutoreleasedReturnValue([v217 name]);
        v219 = (void *)objc_claimAutoreleasedReturnValue([v26 service]);
        v220 = (void *)objc_claimAutoreleasedReturnValue([v219 sandboxOperationForDelegation]);
        *(_DWORD *)buf = 138412802;
        *(void *)v526 = v216;
        *(_WORD *)&v526[8] = 2112;
        *(void *)&v526[10] = v218;
        *(_WORD *)&v526[18] = 2112;
        *(void *)&v526[20] = v220;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v144,  OS_LOG_TYPE_INFO,  "%@ for delegated service: %@: operation: %@ is not sandboxed. Ignoring delegation",  buf,  0x20u);
      }
    }

    else
    {
    }

    goto LABEL_101;
  }

LABEL_45:
  _Block_object_dispose(&v520, 8);
  return v500;
}

void sub_10000EFC4(_Unwind_Exception *a1)
{
}

void sub_10000F0F0(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) service]);
  id v4 = objc_claimAutoreleasedReturnValue([v3 name]);
  LODWORD(a2) = sqlite3_bind_text( a2,  1,  (const char *)[v4 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  if ((_DWORD)a2) {
    _db_error(1);
  }
}

uint64_t sub_10000F178(uint64_t result)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 1;
  return result;
}

id sub_10000F18C(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 service]);
  id v2 = [v1 isAccessAllowedByDefault];

  return v2;
}

void sub_10000F1C0(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v4 = qword_100078468;
  uint64_t v5 = sqlite3_column_int(a2, 3);
  id v6 = [*(id *)(a1 + 32) authorizationValue];
  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) service]);
  LOBYTE(v4) = [(id)v4 isAccessEntryWithAge:v5 authorizationValue:v6 expiredForService:v7];

  if ((v4 & 1) == 0) {
    objc_msgSend(*(id *)(a1 + 32), "setLastReminderTime:", sqlite3_column_int(a2, 9));
  }
}

void sub_10000F2CC(uint64_t a1, sqlite3_stmt *a2)
{
  if (!sqlite3_bind_text( a2, 1, (const char *)[*(id *)(a1 + 32) UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) subjectIdentity]);
    id v5 = objc_claimAutoreleasedReturnValue([v4 identifier]);
    if (sqlite3_bind_text( a2,  2,  (const char *)[v5 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
    }

    else
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) subjectIdentity]);
      int v7 = sqlite3_bind_int(a2, 3, (int)objc_msgSend(v6, "client_type"));

      if (!v7) {
        return;
      }
    }
  }

  _db_error(1);
}

uint64_t sub_10000F3B8(void *a1, void *a2, void *a3, uint64_t *a4, BOOL *a5, uint64_t a6)
{
  id v11 = a1;
  id v12 = a2;
  id v103 = a3;
  *a5 = 0;
  if (a6) {
    uint64_t v13 = a6;
  }
  else {
    uint64_t v13 = 2LL;
  }
  uint64_t v14 = objc_claimAutoreleasedReturnValue([v11 usageDescriptionKeyName]);
  uint64_t v15 = objc_claimAutoreleasedReturnValue([v11 usageDescriptionKeyForAuthorization:v13]);
  if (v15)
  {
    uint64_t v16 = (os_log_s *)qword_100078240;
    if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)BOOL v106 = v15;
      *(_WORD *)&v106[8] = 2048;
      *(void *)v107 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "found auth specifc usage key: %@ for desired auth: %llu",  buf,  0x16u);
    }
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v12 bundle]);
  if (v17)
  {

    if (v14 | v15)
    {
      *a4 = 0LL;
      if (v15
        && (uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v12 bundle]),
            id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 localizedUsageDescriptionForKey:v15]),
            v19,
            v20))
      {
        id v102 = v20;
        *a4 = (uint64_t)v102;
        id v21 = (os_log_s *)qword_100078240;
        if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v22 = *a4;
          *(_DWORD *)buf = 138412290;
          *(void *)BOOL v106 = v22;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "found auth specifc usage string: %@",  buf,  0xCu);
        }
      }

      else
      {
        id v102 = 0LL;
      }

      id v23 = (void *)objc_claimAutoreleasedReturnValue([v12 bundle]);
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 localizedUsageDescriptionForKey:v14]);

      BOOL v25 = (os_log_s *)qword_100078240;
      if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)BOOL v106 = v24;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "found general usage key: %@", buf, 0xCu);
      }

      if (v15 || !v24)
      {
        if (!*a4) {
          goto LABEL_28;
        }
      }

      else
      {
        id v26 = (os_log_s *)qword_100078240;
        if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)BOOL v106 = v24;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "using general usage key: %@", buf, 0xCu);
        }

        *a4 = (uint64_t)v24;
      }

      dispatch_queue_global_t v27 = (os_log_s *)(id)qword_100078240;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        if (v102) {
          uint64_t v60 = (void *)v15;
        }
        else {
          uint64_t v60 = (void *)v14;
        }
        id v97 = [v60 UTF8String];
        unsigned int v93 = [v12 responsiblePID];
        v101 = (void *)objc_claimAutoreleasedReturnValue([v12 bundle]);
        id v99 = objc_claimAutoreleasedReturnValue([v101 bundleURL]);
        id v61 = [v99 fileSystemRepresentation];
        uint64_t v62 = *a4;
        *(_DWORD *)buf = 136315906;
        *(void *)BOOL v106 = v97;
        *(_WORD *)&v106[8] = 1024;
        *(_DWORD *)v107 = v93;
        *(_WORD *)&v107[4] = 2080;
        *(void *)&v107[6] = v61;
        *(_WORD *)&v107[14] = 2112;
        *(void *)&v107[16] = v62;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEBUG,  "Usage key:%s, client[%d](%s), usage string: '%@'",  buf,  0x26u);
      }

      if (*a4) {
        goto LABEL_25;
      }
LABEL_28:
      uint64_t v104 = 0LL;
      uint64_t v18 = (uint64_t)[v12 getSDKVersion:&v104 platformType:(char *)&v104 + 4];
      if (!(_DWORD)v18 && v24)
      {
        *a4 = (uint64_t)v24;
        id v29 = (os_log_s *)qword_100078240;
        if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "falling back to general usage description because there was an error parsing client sdk version",  buf,  2u);
        }

LABEL_80:
      goto LABEL_26;
    }
  }

  *a4 = 0LL;
  uint64_t v18 = 1LL;
LABEL_27:

  return v18;
}

void sub_10000FFB4(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
  LODWORD(a2) = sqlite3_bind_text( a2,  1,  (const char *)[v3 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  if ((_DWORD)a2) {
    _db_error(1);
  }
}

void sub_100010020(uint64_t a1)
{
}

void sub_100010034(uint64_t a1, sqlite3_stmt *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", sqlite3_column_text(a2, 0));
  id v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  [v2 addObject:v4];
}

BOOL sub_100010090(_OWORD *a1)
{
  __int128 v1 = a1[1];
  *(_OWORD *)v8.val = *a1;
  *(_OWORD *)&v8.val[4] = v1;
  id v2 = SecTaskCreateWithAuditToken(0LL, &v8);
  if (!v2) {
    return 0LL;
  }
  id v3 = v2;
  CFTypeRef v4 = SecTaskCopyValueForEntitlement(v2, @"com.apple.private.tcc.policy-override", 0LL);
  if (v4)
  {
    id v5 = v4;
    BOOL v6 = CFEqual(v4, kCFBooleanTrue) != 0;
    CFRelease(v5);
  }

  else
  {
    BOOL v6 = 0LL;
  }

  CFRelease(v3);
  return v6;
}

void sub_100010128(uint64_t a1, sqlite3_stmt *a2)
{
  if (sqlite3_bind_text(a2, 1, *(const char **)(a1 + 40), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)
    || sqlite3_bind_text(a2, 2, out, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)
    || sqlite3_bind_text(a2, 3, *(const char **)(a1 + 48), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
    _db_error(1);
  }

uint64_t sub_1000101E8(uint64_t a1)
{
  v8[0] = _NSConcreteStackBlock;
  __int128 v2 = *(_OWORD *)(a1 + 32);
  __int128 v9 = *(_OWORD *)(a1 + 48);
  v8[1] = 3221225472LL;
  v8[2] = sub_1000102D4;
  v8[3] = &unk_100064CB0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100010378;
  v6[3] = &unk_100064F48;
  __int128 v7 = v2;
  uint64_t result = db_eval_locked((uint64_t)"SELECT id FROM policies WHERE bundle_id = ? AND uuid = ?", v8, v6);
  if (!(_DWORD)result)
  {
    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
    {
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472LL;
      v5[2] = sub_1000103BC;
      v5[3] = &unk_100064F70;
      uint64_t v4 = *(void *)(a1 + 64);
      v5[4] = *(void *)(a1 + 32);
      v5[5] = v4;
      return db_eval_locked((uint64_t)"INSERT OR REPLACE INTO active_policy VALUES (?, ?, ?)", v5, 0LL);
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

void sub_1000102D4(uint64_t a1, sqlite3_stmt *a2)
{
  if (sqlite3_bind_text(a2, 1, *(const char **)(a1 + 40), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)
    || sqlite3_bind_text(a2, 2, out, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
    _db_error(1);
  }

sqlite3_int64 sub_100010378(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 result = sqlite3_column_int64(a2, 0);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  return result;
}

void sub_1000103BC(uint64_t a1, sqlite3_stmt *a2)
{
  if (sqlite3_bind_text(a2, 1, *(const char **)(a1 + 40), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)
    || sqlite3_bind_int(a2, 2, 0)
    || sqlite3_bind_int64(a2, 3, *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)))
  {
    _db_error(1);
  }

uint64_t sub_10001043C(uint64_t a1)
{
  uint64_t v2 = db_eval_locked((uint64_t)"CREATE TEMPORARY TABLE _exceptions (uuid TEXT NOT NULL)", 0LL, 0LL);
  if (!(_DWORD)v2)
  {
    xpc_array_apply(*(xpc_object_t *)(a1 + 32), &stru_100064FD8);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_100010614;
    v4[3] = &unk_100064FF8;
    void v4[4] = *(void *)(a1 + 40);
    uint64_t v2 = db_eval_locked( (uint64_t)"DELETE FROM policies WHERE bundle_id = ? AND uuid NOT IN (SELECT uuid FROM _exceptions)",  v4,  0LL);
  }

  db_eval_locked((uint64_t)"DROP TABLE IF EXISTS _exceptions", 0LL, 0LL);
  return v2;
}

BOOL sub_1000104F0(id a1, unint64_t a2, OS_xpc_object *a3)
{
  id v3 = a3;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_uuid)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100010590;
    v6[3] = &unk_100064FF8;
    void v6[4] = xpc_uuid_get_bytes(v3);
    BOOL v4 = db_eval_locked((uint64_t)"INSERT INTO _exceptions VALUES (?)", v6, 0LL) == 0;
  }

  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

void sub_100010590(uint64_t a1, sqlite3_stmt *a2)
{
}

void sub_100010614(uint64_t a1, sqlite3_stmt *a2)
{
}

uint64_t sub_100010650(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100010660(uint64_t a1)
{
}

void sub_100010668(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
  LODWORD(a2) = sqlite3_bind_text( a2,  1,  (const char *)[v3 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  if ((_DWORD)a2) {
    _db_error(1);
  }
}

void sub_1000106D4(uint64_t a1, sqlite3_stmt *a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (v4)
  {
    unsigned int v5 = sqlite3_column_int(a2, 1);
    int v6 = v5;
    if (v5 >= 2)
    {
      __int128 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 logHandle]);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10003D65C(a1, v6, v7);
      }

      goto LABEL_21;
    }

    if (v5 == 1)
    {
      __int128 v9 = sqlite3_column_text(a2, 0);
      xpc_dictionary_set_string(v4, "path", (const char *)v9);
LABEL_11:
      sqlite3_int64 v10 = sqlite3_column_int64(a2, 3);
      xpc_dictionary_set_int64(v4, "last_modified", v10);
      sqlite3_int64 v11 = sqlite3_column_int64(a2, 4);
      xpc_dictionary_set_int64(v4, "expired_at", v11);
      if (sqlite3_column_type(a2, 2) != 5)
      {
        id v12 = sqlite3_column_blob(a2, 2);
        int v13 = sqlite3_column_bytes(a2, 2);
        xpc_dictionary_set_data(v4, "code_requirement", v12, v13);
      }

      xpc_array_append_value(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), v4);
      goto LABEL_21;
    }

    uint64_t v14 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", sqlite3_column_text(a2, 0));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if (!v15) {
      goto LABEL_21;
    }
    id v16 = v15;
    xpc_dictionary_set_string(v4, "bundle_id", (const char *)[v16 UTF8String]);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:placeholder:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:placeholder:",  v16,  0LL));
    uint64_t v18 = v17;
    if (v17)
    {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v17 bundleURL]);

      if (v19)
      {
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v18 bundleURL]);
        id v21 = objc_claimAutoreleasedReturnValue([v20 absoluteString]);
        xpc_dictionary_set_string(v4, "bundle", (const char *)[v21 UTF8String]);

        goto LABEL_11;
      }
    }

    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 logHandle]);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      int v23 = 138412290;
      id v24 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "bundle Id: %@ has no LSProxy or URL",  (uint8_t *)&v23,  0xCu);
    }
  }

  else
  {
    audit_token_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([(id)qword_100078468 logHandle]);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10003D630();
    }
  }

LABEL_21:
}
}

int sub_1000109D8(id a1)
{
  return db_eval_locked((uint64_t)"DELETE FROM expired", 0LL, 0LL);
}

uint64_t sub_1000109EC(uint64_t a1)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100010A74;
  v4[3] = &unk_1000650B0;
  id v5 = *(id *)(a1 + 32);
  int v6 = *(_DWORD *)(a1 + 40);
  uint64_t v2 = db_eval_locked((uint64_t)"DELETE FROM expired WHERE client = ? AND client_type = ?", v4, 0LL);

  return v2;
}

void sub_100010A74(uint64_t a1, sqlite3_stmt *a2)
{
  if (sqlite3_bind_text( a2, 1, (const char *)[*(id *)(a1 + 32) UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)
    || sqlite3_bind_int(a2, 2, *(_DWORD *)(a1 + 40)))
  {
    _db_error(1);
  }

uint64_t sub_100010AE4(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100010B60;
  v3[3] = &unk_100064D00;
  id v4 = *(id *)(a1 + 32);
  uint64_t v1 = db_eval_locked((uint64_t)"DELETE FROM expired WHERE service = ?", v3, 0LL);

  return v1;
}

void sub_100010B60(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
  LODWORD(a2) = sqlite3_bind_text( a2,  1,  (const char *)[v3 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  if ((_DWORD)a2) {
    _db_error(1);
  }
}

uint64_t sub_100010BCC(uint64_t a1)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100010C68;
  v4[3] = &unk_100065128;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  int v7 = *(_DWORD *)(a1 + 48);
  uint64_t v2 = db_eval_locked((uint64_t)"DELETE FROM expired WHERE service = ? AND client = ? AND client_type = ?", v4, 0LL);

  return v2;
}

void sub_100010C68(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
  if (sqlite3_bind_text( a2,  1,  (const char *)[v4 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)
    || sqlite3_bind_text( a2, 2, (const char *)[*(id *)(a1 + 40) UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {

LABEL_4:
    _db_error(1);
    return;
  }

  int v5 = sqlite3_bind_int(a2, 3, *(_DWORD *)(a1 + 48));

  if (v5) {
    goto LABEL_4;
  }
}

void sub_100010D24(id a1)
{
  if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_DEBUG)) {
    sub_10003D700();
  }
  db_eval((uint64_t)"SELECT NULL FROM access_overrides WHERE service = ?", &stru_1000651B0, &stru_1000651D0);
}

void sub_100010D7C(id a1, sqlite3_stmt *a2)
{
}

void sub_100010DBC(id a1, sqlite3_stmt *a2)
{
  if (os_log_type_enabled((os_log_t)qword_100078240, OS_LOG_TYPE_ERROR)) {
    sub_10003D72C();
  }
}

void sub_100010DFC(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = sqlite3_column_text(a2, 0);
  uint64_t v5 = sqlite3_column_int(a2, 1);
  if (v4)
  {
    uint64_t v6 = v5;
    int v7 = *(void **)(a1 + 32);
    audit_token_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v4));
    [v7 addObject:v8];

    __int128 v9 = *(void **)(a1 + 40);
    id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v6));
    [v9 addObject:v10];
  }

void sub_100010EBC(uint64_t a1, sqlite3_stmt *a2)
{
  if (sqlite3_bind_text( a2, 1, (const char *)[*(id *)(a1 + 32) UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)
    || sqlite3_bind_int(a2, 2, *(_DWORD *)(a1 + 40)))
  {
    _db_error(1);
  }

void sub_100010F2C(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = sqlite3_column_text(a2, 0);
  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v3));
    [v4 addObject:v5];
  }

void sub_100010F9C(uint64_t a1, sqlite3_stmt *a2)
{
  if (sqlite3_bind_text( a2, 1, (const char *)[*(id *)(a1 + 32) UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)
    || sqlite3_bind_int(a2, 2, *(_DWORD *)(a1 + 40)))
  {
    _db_error(1);
  }

void sub_10001100C(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = sqlite3_column_text(a2, 0);
  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v3));
    [v4 addObject:v5];
  }

void sub_10001107C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_1000110A0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

void sub_1000110C8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

const char *sub_1000110D8()
{
  return xpc_dictionary_get_string(v0, v1);
}

  ;
}

id sub_1000110F4(id a1)
{
  return a1;
}

void sub_100011844( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33, uint64_t a34, uint64_t a35, uint64_t a36, char a37, uint64_t a38, uint64_t a39, uint64_t a40, char a41, uint64_t a42, uint64_t a43, uint64_t a44, char a45)
{
}

uint64_t sub_1000118EC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000118FC(uint64_t a1)
{
}

void sub_100011904(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
  int v5 = sqlite3_bind_text( a2,  2,  (const char *)[v4 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  if (v5) {
    _db_error(1);
  }
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) service]);
  id v7 = objc_claimAutoreleasedReturnValue([v6 name]);
  int v8 = sqlite3_bind_text( a2,  3,  (const char *)[v7 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  if (v8) {
    _db_error(1);
  }
}

void sub_100011A38(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", sqlite3_column_text(a2, 0));
  uint64_t v5 = objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = sqlite3_column_int(a2, 1);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = sqlite3_column_int(a2, 2);
  int v8 = sqlite3_column_int(a2, 3);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = sqlite3_column_int(a2, 4);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL) = sqlite3_column_int(a2, 5);
  int v9 = *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
  double v10 = *(double *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 24LL);
  if (v9 < 1)
  {
    id v12 = tcc_access_log();
    int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8LL) + 24LL);
      int v27 = 136315650;
      unsigned int v28 = "-[TCCDReminderMonitor reportResourceUsage:]_block_invoke_2";
      __int16 v29 = 2048;
      id v30 = v14;
      __int16 v31 = 1024;
      int v32 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s: lastReminded is 0 for this record, now: %f last_modified: %d",  (uint8_t *)&v27,  0x1Cu);
    }

    double v11 = (double)v8 - kCFAbsoluteTimeIntervalSince1970;
  }

  else
  {
    double v11 = (double)v9;
  }

  double v15 = v10 - v11;
  [*(id *)(a1 + 32) serviceCooldown];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 24LL) = v15 > v16;
  id v17 = tcc_access_log();
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) UTF8String];
    int v20 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
    id v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) service]);
    id v22 = objc_claimAutoreleasedReturnValue([v21 name]);
    id v23 = [v22 UTF8String];
    int v24 = *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
    uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 24LL);
    [*(id *)(a1 + 32) serviceCooldown];
    int v27 = 136317186;
    unsigned int v28 = "-[TCCDReminderMonitor reportResourceUsage:]_block_invoke";
    __int16 v29 = 2080;
    id v30 = v19;
    __int16 v31 = 1024;
    int v32 = v20;
    __int16 v33 = 2080;
    id v34 = v23;
    __int16 v35 = 1024;
    int v36 = v24;
    __int16 v37 = 1024;
    int v38 = v8;
    __int16 v39 = 2048;
    uint64_t v40 = v25;
    __int16 v41 = 2048;
    double v42 = v15;
    __int16 v43 = 2048;
    uint64_t v44 = v26;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s: client: %s clientType: %d service: %s last_reminded: %d last_modified: %d now: %f elapsed: %f service_cooldown: %f",  (uint8_t *)&v27,  0x50u);
  }
}

void sub_100012198(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Error retrieving authorization record associated with attribution chain: %@ service: %@",  buf,  0x16u);
}

void sub_1000124F8(_Unwind_Exception *a1)
{
}

void sub_1000125AC(_Unwind_Exception *a1)
{
}

void sub_1000127D0(id a1)
{
  uint64_t v1 = -[TCCDAccessIndirectObject initWithType:]( objc_alloc(&OBJC_CLASS___TCCDAccessIndirectObject),  "initWithType:",  0LL);
  uint64_t v2 = (void *)qword_100078260;
  qword_100078260 = (uint64_t)v1;
}

id tcc_access_log()
{
  if (qword_100078270 != -1) {
    dispatch_once(&qword_100078270, &stru_100065270);
  }
  return (id)qword_100078268;
}

void sub_1000128D4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TCC", "access");
  uint64_t v2 = (void *)qword_100078268;
  qword_100078268 = (uint64_t)v1;
}

id tcc_events_log()
{
  if (qword_100078280 != -1) {
    dispatch_once(&qword_100078280, &stru_100065290);
  }
  return (id)qword_100078278;
}

void sub_100012944(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TCC", "events");
  uint64_t v2 = (void *)qword_100078278;
  qword_100078278 = (uint64_t)v1;
}

id tcc_sync_log()
{
  if (qword_100078290 != -1) {
    dispatch_once(&qword_100078290, &stru_1000652B0);
  }
  return (id)qword_100078288;
}

void sub_1000129B4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TCC", "sync");
  uint64_t v2 = (void *)qword_100078288;
  qword_100078288 = (uint64_t)v1;
}

id tcc_open_fds_log()
{
  if (qword_1000782A0 != -1) {
    dispatch_once(&qword_1000782A0, &stru_1000652D0);
  }
  return (id)qword_100078298;
}

void sub_100012A24(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TCC", "open_fds");
  uint64_t v2 = (void *)qword_100078298;
  qword_100078298 = (uint64_t)v1;
}

void sub_100012A7C(id a1)
{
  os_log_t v1 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  40LL);
  uint64_t v2 = (void *)qword_1000782A8;
  qword_1000782A8 = (uint64_t)v1;

  id v3 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 40LL);
  id v4 = (void *)qword_1000782B0;
  qword_1000782B0 = (uint64_t)v3;
}

void sub_100012E5C(_Unwind_Exception *a1)
{
}

void sub_1000131FC(_Unwind_Exception *a1)
{
}

id sub_1000132D8(uint64_t a1)
{
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:placeholder:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:placeholder:",  *(void *)(a1 + 32),  0LL));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 localizedName]);

  return v2;
}

id sub_100013D40(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

LABEL_11:
    uint64_t v6 = 0LL;
    goto LABEL_25;
  }

  uint64_t v5 = -[TCCDAttributionChain initWithMessage:](objc_alloc(&OBJC_CLASS___TCCDAttributionChain), "initWithMessage:", v4);
  if (v5)
  {
    self =  -[TCCDAccessIdentity initWithAttributionChain:preferMostSpecificIdentifier:]( self,  "initWithAttributionChain:preferMostSpecificIdentifier:",  v5,  1LL);
    uint64_t v6 = self;
  }

  else
  {
    uint64_t v6 = 0LL;
  }

LABEL_25:
  return v6;
}

    if ((_DWORD)v17) {
      goto LABEL_18;
    }
    goto LABEL_15;
  }

  if (v15)
  {
    unsigned int v78 = _NSConcreteStackBlock;
    id v79 = 3221225472LL;
    id v80 = sub_100018F34;
    id v81 = &unk_100064D00;
    unsigned int v82 = v12;
    double v16 = sub_100016EEC((uint64_t)"SELECT service, client, client_type FROM access", 0LL, &v78, 0);
    id v17 = db_transaction(&stru_100065420) | v16;
    uint64_t v18 = v82;
    goto LABEL_11;
  }

  id v22 = v11;
  id v23 = v12;
  v85[0] = _NSConcreteStackBlock;
  v85[1] = 3221225472LL;
  v85[2] = sub_100019040;
  v85[3] = &unk_1000650B0;
  int v24 = v22;
  uint64_t v86 = v24;
  id v87 = a3;
  uint64_t v25 = objc_retainBlock(v85);
  unsigned int v78 = _NSConcreteStackBlock;
  id v79 = 3221225472LL;
  id v80 = sub_1000190AC;
  id v81 = &unk_100065128;
  unsigned int v82 = v23;
  uint64_t v83 = v24;
  id v84 = a3;
  uint64_t v26 = v23;
  int v27 = v24;
  unsigned int v28 = sub_100016EEC((uint64_t)"SELECT service FROM access WHERE client = ? AND client_type = ?", v25, &v78, 0);
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472LL;
  v76[2] = sub_100019158;
  v76[3] = &unk_100065390;
  v77 = v25;
  __int16 v29 = v25;
  id v30 = db_transaction(v76);

  __int16 v31 = (void *)objc_claimAutoreleasedReturnValue([v26 platform]);
  int v32 = (void *)objc_claimAutoreleasedReturnValue([v31 prefixOfBundleIdentifiersToResetAfterResetOfAppBundleIdentifier:v27]);

  if (v32)
  {
    __int16 v33 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"SELECT service, client FROM access WHERE client LIKE '%@%@' AND client_type = %d", v32, @"%", 0LL));
    id v34 = [v33 UTF8String];
    v72[0] = _NSConcreteStackBlock;
    v72[1] = 3221225472LL;
    v72[2] = sub_100016834;
    v72[3] = &unk_100065368;
    id v73 = v26;
    __int16 v35 = v32;
    uint64_t v74 = v35;
    v75 = v10;
    int v36 = sub_100016EEC((uint64_t)v34, 0LL, v72, 0);
    __int16 v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"DELETE FROM access WHERE client LIKE '%@%@' AND client_type = %d",  v35,  @"%",  0LL));

    int v38 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
    __int16 v39 = (void *)objc_claimAutoreleasedReturnValue([v38 server]);
    uint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue([v39 logHandle]);

    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
      sub_100019BA0();
    }

    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472LL;
    v70[2] = sub_100016AC4;
    v70[3] = &unk_100065100;
    BOOL v71 = v37;
    __int16 v41 = v37;
    id v17 = db_transaction(v70) | v36;
  }

  else
  {
    id v17 = v30 | v28;
  }

  if (!(_DWORD)v17)
  {
LABEL_15:
    sub_100016EEC((uint64_t)"VACUUM access", 0LL, 0LL, 0);
    uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
    uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v47 server]);
    unsigned __int8 v49 = (os_log_s *)objc_claimAutoreleasedReturnValue([v48 logHandle]);

    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
      sub_100019AF8(v10, (uint64_t)v11, v49);
    }
  }

    int v20 = 0;
    goto LABEL_12;
  }

id sub_100014398(uint64_t a1)
{
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:placeholder:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:placeholder:",  *(void *)(a1 + 32),  0LL));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 localizedName]);

  return v2;
}

LABEL_52:
LABEL_53:
    close(v23);
    goto LABEL_54;
  }

  __int16 v35 = v34;
  int v36 = pread(v23, v34, v33, v26 + v18);
  id v21 = v64;
  __int16 v37 = v36;
  if (v36 == -1 || v36 != __size)
  {
    unsigned __int8 v49 = v64;
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      if (v37 == -1)
      {
        __int128 v59 = __error();
        unsigned int v50 = strerror(*v59);
      }

      else
      {
        unsigned int v50 = "truncated";
      }

      sub_1000159E8((uint64_t)v50, (uint64_t)buf, (uint64_t)v12, v49);
    }

    close(v23);
    goto LABEL_66;
  }

  close(v23);
  *(void *)&self->_sdkVersion = 0LL;
  int v38 = v67;
  if (!v67)
  {
LABEL_47:
    id v46 = 0;
    uint64_t v47 = 0;
LABEL_88:
    free(v35);
    if (os_log_type_enabled((os_log_t)v64, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446978;
      unsigned int v70 = v12;
      BOOL v71 = 2048;
      *(void *)id v72 = v18;
      *(_WORD *)&v72[8] = 1024;
      *(_DWORD *)&v72[10] = v47;
      *(_WORD *)&v72[14] = 1024;
      *(_DWORD *)&v72[16] = v46;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v64,  OS_LOG_TYPE_INFO,  "%{public}s (offset %lld) linked against SDK version 0x%x, platform: %u",  buf,  0x22u);
    }

    double v10 = self->_sdkVersion;
    goto LABEL_4;
  }

  __int16 v39 = (unint64_t)v35 + __size;
  uint64_t v40 = v35;
  while (1)
  {
    if ((unint64_t)(v40 + 2) > v39)
    {
      if (os_log_type_enabled((os_log_t)v64, OS_LOG_TYPE_ERROR)) {
        sub_100015A34();
      }
      goto LABEL_66;
    }

    __int16 v41 = v40[1];
    double v42 = (int *)((char *)v40 + v41);
    if (v41 < 8 || (unint64_t)v42 > v39 || v42 < v35)
    {
      if (os_log_type_enabled((os_log_t)v64, OS_LOG_TYPE_ERROR)) {
        sub_100015A98();
      }
      goto LABEL_66;
    }

    uint64_t v45 = *v40;
    if (*v40 <= 46)
    {
      if (v45 == 36)
      {
        id v46 = 1;
      }

      else
      {
        if (v45 != 37) {
          goto LABEL_46;
        }
        id v46 = 2;
      }

LABEL_81:
      v9->_platformType = v46;
      uint64_t v47 = v40[3];
      goto LABEL_87;
    }

    if (v45 == 47)
    {
      id v46 = 3;
      goto LABEL_81;
    }

    if (v45 == 48) {
      break;
    }
    if (v45 == 50)
    {
      if ((unint64_t)(v40 + 6) > v39)
      {
        if (os_log_type_enabled((os_log_t)v64, OS_LOG_TYPE_ERROR)) {
          sub_100015B60();
        }
        goto LABEL_66;
      }

      uint64_t v47 = v40[4];
      self->_sdkVersion = v47;
      id v46 = v40[2];
      v9->_platformType = v46;
      if (v46 != 4) {
        goto LABEL_88;
      }
LABEL_86:
      v47 += 458752;
      id v46 = 4;
LABEL_87:
      self->_sdkVersion = v47;
      goto LABEL_88;
    }

LABEL_82:
  if (os_log_type_enabled((os_log_t)v64, OS_LOG_TYPE_ERROR)) {
    sub_100015AFC();
  }
LABEL_66:
  free(v35);
LABEL_54:

LABEL_55:
  int v8 = 0;
LABEL_56:
  objc_sync_exit(v9);

  return v8;
}

void sub_100015070(_Unwind_Exception *a1)
{
}

id sub_100015290(_OWORD *a1)
{
  __int128 v2 = a1[1];
  *(_OWORD *)atoken.val = *a1;
  *(_OWORD *)&atoken.val[4] = v2;
  uint64_t v3 = audit_token_to_pid(&atoken);
  __int128 v4 = a1[1];
  *(_OWORD *)atoken.val = *a1;
  *(_OWORD *)&atoken.val[4] = v4;
  uint64_t v5 = audit_token_to_pidversion(&atoken);
  __int128 v6 = a1[1];
  *(_OWORD *)atoken.val = *a1;
  *(_OWORD *)&atoken.val[4] = v6;
  id v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"{pid=%d, pidversion=%d, euid=%d}",  v3,  v5,  audit_token_to_euid(&atoken));
  return (id)objc_claimAutoreleasedReturnValue(v7);
}

  ;
}

  ;
}

void sub_100015348(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_100015354(void *a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  sub_100015348((void *)&_mh_execute_header, a3, (uint64_t)a3, "identityCache: evicting: %{public}@", (uint8_t *)a2);
}

void sub_1000153A0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000153D0(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 responsibleProcess]);
  __int128 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 responsiblePath]);
  sub_1000110AC();
  sub_100004C90( (void *)&_mh_execute_header,  a2,  v5,  "IDENTITY_ATTRIBUTION: Refusing executable path (%{public}@) which is not a bundle",  v6);

  sub_1000110B8();
}

void sub_100015464(uint64_t a1, os_log_s *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = *(_DWORD *)(a1 + 28);
  int v4 = 138543618;
  uint64_t v5 = v2;
  __int16 v6 = 1024;
  int v7 = v3;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "IDENTITY_ATTRIBUTION: identifier = %{public}@, type %u",  (uint8_t *)&v4,  0x12u);
  sub_100004C7C();
}

void sub_1000154E8(void *a1, os_log_s *a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue([a1 responsibleProcess]);
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 responsiblePath]);
  sub_1000110AC();
  sub_100004C90( (void *)&_mh_execute_header,  a2,  v5,  "IDENTITY_ATTRIBUTION: Refusing App Extension without attributed app bundle (%{public}@)",  v6);

  sub_1000110B8();
}

void sub_10001557C()
{
}

void sub_1000155E4()
{
}

void sub_100015644()
{
}

void sub_1000156A4()
{
}

void sub_10001570C()
{
}

void sub_100015770(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Using default policy for App Extension with unrecognized extension point policy: %d",  (uint8_t *)v2,  8u);
  sub_100004C60();
}

void sub_1000157E0(void *a1, os_log_s *a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue([a1 responsibleProcess]);
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 responsiblePath]);
  sub_1000110AC();
  sub_100015348((void *)&_mh_execute_header, a2, v5, "IDENTITY_ATTRIBUTION: starting for: %{public}@", v6);

  sub_1000110B8();
}

void sub_100015874( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000158A4(uint64_t *a1, id a2, os_log_s *a3)
{
  uint64_t v4 = *a1;
  int v5 = 136446978;
  __int16 v6 = "-[TCCDAccessIdentity initWithIdentifier:type:executableURL:SDKVersion:platformType:]";
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  id v10 = a2;
  __int16 v11 = 2082;
  id v12 = [a2 fileSystemRepresentation];
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "%{public}s: failed to construct bundle for: %{public}@, URL: %{public}@, %{public}s",  (uint8_t *)&v5,  0x2Au);
}

void sub_10001596C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001599C(void *a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  sub_100004C90( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "failed to get filesystem representation for %{public}@",  (uint8_t *)a2);
}

void sub_1000159E8(uint64_t a1, uint64_t a2, uint64_t a3, os_log_s *a4)
{
  *(_DWORD *)a2 = 136446466;
  *(void *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2082;
  *(void *)(a2 + 14) = a1;
  sub_1000110A0( (void *)&_mh_execute_header,  a4,  a3,  "failed to read commands from %{public}s: %{public}s",  (uint8_t *)a2);
}

void sub_100015A34()
{
}

void sub_100015A98()
{
}

void sub_100015AFC()
{
}

void sub_100015B60()
{
}

void sub_100015BC4(uint64_t *a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  int v4 = 138543362;
  uint64_t v5 = v3;
  sub_100004C90( (void *)&_mh_execute_header,  a2,  a3,  "_pluginBundleURL does not identify an accessible bundle directory: %{public}@",  (uint8_t *)&v4);
  sub_100004C7C();
}

uint64_t db_set_access_override(void *a1, int a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  if (a2)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    _OWORD v20[2] = sub_100015DE0;
    v20[3] = &unk_100064D00;
    __int16 v7 = &v21;
    id v21 = v5;
    uint64_t v8 = "INSERT OR IGNORE INTO access_overrides VALUES (?)";
    __int16 v9 = v20;
  }

  else
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    _OWORD v18[2] = sub_100015FDC;
    v18[3] = &unk_100064D00;
    __int16 v7 = &v19;
    id v19 = v5;
    uint64_t v8 = "DELETE FROM access_overrides WHERE service = ?";
    __int16 v9 = v18;
  }

  uint64_t v10 = sub_100016EEC((uint64_t)v8, v9, 0LL, 0);

  if (!(_DWORD)v10)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100016044;
    v16[3] = &unk_100064D00;
    id v17 = v5;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000160AC;
    v12[3] = &unk_100065340;
    char v15 = a2;
    id v13 = v6;
    id v14 = v17;
    uint64_t v10 = sub_100016EEC((uint64_t)"SELECT client, client_type, auth_value FROM access WHERE service = ?", v16, v12, 0);
    access_changed();
  }

  return v10;
}

uint64_t db_eval(uint64_t a1, void *a2, void *a3)
{
  return sub_100016EEC(a1, a2, a3, 0);
}

void sub_100015DE0(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
  LODWORD(a2) = sqlite3_bind_text( a2,  1,  (const char *)[v3 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  if ((_DWORD)a2) {
    _db_error(1);
  }
}

void _db_error(int a1)
{
  uint64_t v2 = sub_100016DE8();
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  int v4 = sqlite3_errmsg((sqlite3 *)qword_1000782F0);
  if (asprintf(&v12, "database error: %s", v4) != -1)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 server]);
    __int16 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 logHandle]);

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      __int16 v11 = " aborting...";
      *(_DWORD *)buf = 136446722;
      if (!a1) {
        __int16 v11 = "";
      }
      id v14 = v12;
      __int16 v15 = 2080;
      double v16 = v11;
      __int16 v17 = 2112;
      uint64_t v18 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s%s\n%@", buf, 0x20u);
    }
  }

  int v8 = sqlite3_errcode((sqlite3 *)qword_1000782F0);
  sqlite3_close((sqlite3 *)qword_1000782F0);
  qword_1000782F0 = 0LL;
  if (v8 == 26 || v8 == 11)
  {
    uint64_t v10 = db_dir_get();
    removefile(v10, 0LL, 3u);
    free(v10);
  }

  if (a1) {
    sub_10003C218();
  }
}

void sub_100015FDC(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
  LODWORD(a2) = sqlite3_bind_text( a2,  1,  (const char *)[v3 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  if ((_DWORD)a2) {
    _db_error(1);
  }
}

void sub_100016044(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
  LODWORD(a2) = sqlite3_bind_text( a2,  1,  (const char *)[v3 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  if ((_DWORD)a2) {
    _db_error(1);
  }
}

void sub_1000160AC(uint64_t a1, sqlite3_stmt *a2)
{
  int v4 = sqlite3_column_text(a2, 0);
  uint64_t v5 = sqlite3_column_int(a2, 1);
  int v6 = sqlite3_column_int(a2, 2);
  if (*(_BYTE *)(a1 + 48)) {
    uint64_t v7 = 0LL;
  }
  else {
    uint64_t v7 = v6;
  }
  __int16 v9 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v4));
  [v9 publishAccessChangedEvent:2 forService:v8 client:v10 clientType:v5 authValue:v7 andKillClient:1];
}

void access_changed()
{
  uint32_t v0 = notify_post("com.apple.tcc.access.changed");
  if (v0)
  {
    int v1 = v0;
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 server]);
    int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 logHandle]);

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100019A88(v1, v4);
    }
  }

uint64_t db_reset_access_internal(void *a1, void *a2, int a3, void *a4, uint64_t a5, char a6)
{
  id v10 = a1;
  id v11 = a2;
  id v12 = a4;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 name]);
  unsigned int v14 = [v13 isEqualToString:@"kTCCServiceAll"];

  unsigned int v15 = [v11 isEqualToString:@"kTCCClientAll"];
  if (!v14)
  {
    if (v15)
    {
      v68[0] = _NSConcreteStackBlock;
      v68[1] = 3221225472LL;
      v68[2] = sub_100016AF4;
      v68[3] = &unk_100064D00;
      id v19 = v10;
      id v69 = v19;
      int v20 = objc_retainBlock(v68);
      v65[0] = _NSConcreteStackBlock;
      v65[1] = 3221225472LL;
      v65[2] = sub_100016B5C;
      v65[3] = &unk_100064CD8;
      id v66 = v12;
      id v67 = v19;
      LODWORD(v19) = sub_100016EEC((uint64_t)"SELECT client, client_type FROM access WHERE service = ?", v20, v65, 0);
      v63[0] = _NSConcreteStackBlock;
      v63[1] = 3221225472LL;
      v63[2] = sub_100016BEC;
      v63[3] = &unk_100065390;
      id v64 = v20;
      id v21 = v20;
      uint64_t v17 = db_transaction(v63) | v19;

      id v18 = v69;
    }

    else
    {
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472LL;
      v59[2] = sub_100016C04;
      v59[3] = &unk_100065128;
      id v42 = v10;
      id v60 = v42;
      id v43 = v11;
      id v61 = v43;
      int v62 = a3;
      uint64_t v44 = objc_retainBlock(v59);
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472LL;
      v53[2] = sub_100016CBC;
      v53[3] = &unk_1000653B8;
      id v54 = v12;
      id v55 = v42;
      id v56 = v43;
      int v57 = a3;
      char v58 = a6;
      int v45 = sub_100016EEC( (uint64_t)"SELECT NULL FROM access WHERE service = ? AND client = ? AND client_type = ?",  v44,  v53,  0);
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472LL;
      v51[2] = sub_100016CDC;
      v51[3] = &unk_100065390;
      id v52 = v44;
      id v46 = v44;
      uint64_t v17 = db_transaction(v51) | v45;

      id v18 = v60;
    }

LABEL_18:
  access_changed();
  return v17;
}

void sub_100016834(uint64_t a1, sqlite3_stmt *a2)
{
  int v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) platform]);
  uint64_t v5 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", sqlite3_column_text(a2, 0));
  int v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 serviceByName:v6]);

  if (v7)
  {
    uint64_t v8 = sqlite3_column_text(a2, 1);
    __int16 v9 = *(void **)(a1 + 32);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v8));
    [v9 publishAccessChangedEvent:3 forService:v7 client:v10 clientType:0 authValue:1 andKillClient:0];

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 server]);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 logHandle]);

    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = *(void *)(a1 + 40);
      unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) name]);
      int v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v8));
      int v17 = 138412802;
      uint64_t v18 = v14;
      __int16 v19 = 2112;
      int v20 = v15;
      __int16 v21 = 2112;
      id v22 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Bundle Prefix: '%@'; deleting (%@ : %@)",
        (uint8_t *)&v17,
        0x20u);
    }
  }
}

uint64_t db_transaction(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  uint64_t v9 = 0LL;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  int v12 = 0;
  if (v1)
  {
    id v3 = (dispatch_queue_s *)qword_1000782E0;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100018D90;
    v6[3] = &unk_100065400;
    id v7 = v1;
    uint64_t v8 = &v9;
    dispatch_sync(v3, v6);
    uint64_t v4 = *((unsigned int *)v10 + 6);
  }

  else
  {
    uint64_t v4 = 1LL;
  }

  _Block_object_dispose(&v9, 8);

  return v4;
}

uint64_t sub_100016AC4(uint64_t a1)
{
  return sub_100016EEC((uint64_t)[*(id *)(a1 + 32) UTF8String], 0, 0, 1);
}

uint64_t db_eval_locked(uint64_t a1, void *a2, void *a3)
{
  return sub_100016EEC(a1, a2, a3, 1);
}

void sub_100016AF4(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
  LODWORD(a2) = sqlite3_bind_text( a2,  1,  (const char *)[v3 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  if ((_DWORD)a2) {
    _db_error(1);
  }
}

void sub_100016B5C(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v4 = sqlite3_column_text(a2, 0);
  uint64_t v5 = sqlite3_column_int(a2, 1);
  id v7 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v4));
  [v7 publishAccessChangedEvent:3 forService:v6 client:v8 clientType:v5 authValue:1 andKillClient:1];
}

uint64_t sub_100016BEC(uint64_t a1)
{
  return sub_100016EEC((uint64_t)"DELETE FROM access WHERE service = ?", *(void **)(a1 + 32), 0LL, 1);
}

void sub_100016C04(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
  if (sqlite3_bind_text( a2,  1,  (const char *)[v4 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)
    || sqlite3_bind_text( a2, 2, (const char *)[*(id *)(a1 + 40) UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {

LABEL_4:
    _db_error(1);
    return;
  }

  int v5 = sqlite3_bind_int(a2, 3, *(_DWORD *)(a1 + 48));

  if (v5) {
    goto LABEL_4;
  }
}

id sub_100016CBC(uint64_t a1)
{
  return [*(id *)(a1 + 32) publishAccessChangedEvent:3 forService:*(void *)(a1 + 40) client:*(void *)(a1 + 48) clientType:*(unsigned int *)(a1 + 56) authValue:1 andKillClient:*(unsigned __int8 *)(a1 + 60)];
}

uint64_t sub_100016CDC(uint64_t a1)
{
  return sub_100016EEC( (uint64_t)"DELETE FROM access WHERE service = ? AND client = ? AND client_type = ?",  *(void **)(a1 + 32),  0LL,  1);
}

void db_setup_queue()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.tcc.db_queue", 0LL);
  id v1 = (void *)qword_1000782E0;
  qword_1000782E0 = (uint64_t)v0;

  if (!v0) {
    sub_100019C00();
  }
}

uint64_t db_unavailable_get()
{
  return byte_1000782E8;
}

uint64_t db_commit()
{
  return sqlite3_exec((sqlite3 *)qword_1000782F0, "COMMIT", 0LL, 0LL, 0LL);
}

char *db_dir_get()
{
  dispatch_queue_t v0 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
  id v1 = (void *)objc_claimAutoreleasedReturnValue([v0 server]);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 stateDirectory]);

  if (!v2) {
    sub_10003C1E8();
  }
  id v3 = v2;
  id v4 = strdup((const char *)[v3 UTF8String]);
  if (!v4) {
    sub_10003C200();
  }
  int v5 = v4;

  return v5;
}

NSMutableString *sub_100016DE8()
{
  int v0 = backtrace(v6, 1024);
  id v1 = backtrace_symbols(v6, v0);
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  if (v1)
  {
    if (v0 >= 1)
    {
      for (unint64_t i = 0LL; i != v0; -[NSMutableString appendFormat:](v2, "appendFormat:", v4, v1[i++]))
      {
        if (!v1[i]) {
          break;
        }
        id v4 = i >= (v0 - 1) ? @"%s" : @"%s\n";
      }
    }

    free(v1);
  }

  return v2;
}

uint64_t sub_100016EEC(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v22 = 0LL;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000LL;
  int v25 = 0;
  if (!a1) {
    __assert_rtn("_db_eval", "TCCDDatabase.m", 605, "sql != NULL");
  }
  uint64_t v9 = v8;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100019170;
  v16[3] = &unk_100065448;
  __int16 v19 = &v22;
  uint64_t v20 = a1;
  int v21 = 0;
  id v10 = v7;
  id v17 = v10;
  id v11 = v9;
  id v18 = v11;
  int v12 = objc_retainBlock(v16);
  id v13 = v12;
  if (a4) {
    ((void (*)(void *))v12[2])(v12);
  }
  else {
    dispatch_sync((dispatch_queue_t)qword_1000782E0, v12);
  }
  uint64_t v14 = *((unsigned int *)v23 + 6);

  _Block_object_dispose(&v22, 8);
  return v14;
}

void sub_100017020(_Unwind_Exception *a1)
{
}

uint64_t _create_database(const char *a1, char *path)
{
  patha = 0LL;
  uint64_t v4 = mkpath_np(path, 0x1C0u);
  if ((_DWORD)v4 && (uint64_t v5 = v4, (_DWORD)v4 != 17))
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 server]);
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 logHandle]);

    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100019C18();
    }
  }

  else
  {
    uint64_t v5 = _sqlite3_integrity_check(patha);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 server]);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 logHandle]);

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v27 = patha;
      __int16 v28 = 1024;
      int v29 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "_sqlite3_integrity_check for %s returned (%d)",  buf,  0x12u);
    }

    if ((_DWORD)v5 == 11)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 server]);
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 logHandle]);

      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v27 = patha;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "database is corrupt: %s", buf, 0xCu);
      }

      if (!removefile(patha, 0LL, 3u)) {
        sub_100019C94();
      }
      int v12 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 server]);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 logHandle]);

      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100019D40();
      }
    }

    if (sqlite3_open_v2(patha, (sqlite3 **)&qword_1000782F0, 4227078, 0LL))
    {
      unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
      int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 server]);
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 logHandle]);

      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100019CAC(v17);
      }

      if (qword_1000782F0) {
        uint64_t v5 = sqlite3_errcode((sqlite3 *)qword_1000782F0);
      }
      else {
        uint64_t v5 = 12LL;
      }
    }

    else if (sqlite3_exec((sqlite3 *)qword_1000782F0, "PRAGMA journal_mode=WAL;PRAGMA foreign_keys=ON;", 0LL, 0LL, 0LL) {
           || sqlite3_exec((sqlite3 *)qword_1000782F0, "BEGIN", 0LL, 0LL, 0LL)
    }
           || sqlite3_exec((sqlite3 *)qword_1000782F0, a1, 0LL, 0LL, 0LL))
    {
      _db_error(0);
    }

    else
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 server]);
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v23 logHandle]);

      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446210;
        id v27 = patha;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "using database: %{public}s", buf, 0xCu);
      }

      uint64_t v5 = 0LL;
    }
  }

  if (patha) {
    free(patha);
  }
  return v5;
}

uint64_t _PLPlatformLimitedLibrarySupported()
{
  return 0LL;
}

uint64_t db_open()
{
  uint64_t v38 = 0LL;
  __int16 v39 = &v38;
  uint64_t v40 = 0x2020000000LL;
  int v41 = 0;
  if ((byte_1000782E8 & 1) != 0)
  {
    uint64_t database = 1LL;
    goto LABEL_90;
  }

  uint64_t v1 = db_dir_get();
  uint64_t database = _create_database( "CREATE TABLE IF NOT EXISTS admin (key TEXT PRIMARY KEY NOT NULL, value INTEGER NOT NULL);INSERT OR IGNORE"
               " INTO admin VALUES ('version', 30);CREATE TABLE IF NOT EXISTS policies(   id        INTEGER    NOT NULL"
               " PRIMARY KEY,     bundle_id    TEXT    NOT NULL,     uuid        TEXT    NOT NULL,     display        TEX"
               "T    NOT NULL,     UNIQUE (bundle_id, uuid));CREATE TABLE IF NOT EXISTS active_policy(   client        "
               "TEXT    NOT NULL,     client_type    INTEGER    NOT NULL,     policy_id    INTEGER NOT NULL,     PRIMARY "
               "KEY (client, client_type),     FOREIGN KEY (policy_id) REFERENCES policies(id) ON DELETE CASCADE ON UPDAT"
               "E CASCADE);CREATE INDEX IF NOT EXISTS active_policy_id ON active_policy(policy_id);CREATE TABLE IF NOT EX"
               "ISTS access(   service        TEXT        NOT NULL,     client         TEXT        NOT NULL,     client"
               "_type    INTEGER     NOT NULL,     auth_value     INTEGER     NOT NULL,     auth_reason    INTEGER     NO"
               "T NULL,     auth_version   INTEGER     NOT NULL,     csreq          BLOB,     policy_id      INTEGER,    "
               " indirect_object_identifier_type    INTEGER,     indirect_object_identifier         TEXT NOT NULL DEFAULT"
               " 'UNUSED',     indirect_object_code_identity      BLOB,     flags          INTEGER,     last_modified  IN"
               "TEGER     NOT NULL DEFAULT (CAST(strftime('%s','now') AS INTEGER)),     pid            INTEGER,     pid_v"
               "ersion    INTEGER,     boot_uuid      TEXT NOT NULL DEFAULT 'UNUSED',     last_reminded  INTEGER     NOT "
               "NULL DEFAULT (CAST(strftime('%s','now') AS INTEGER)),     PRIMARY KEY (service, client, client_type, indi"
               "rect_object_identifier),    FOREIGN KEY (policy_id) REFERENCES policies(id) ON DELETE CASCADE ON UPDATE C"
               "ASCADE);CREATE TABLE IF NOT EXISTS access_overrides(   service        TEXT    NOT NULL PRIMARY KEY);CRE"
               "ATE TABLE IF NOT EXISTS expired(   service        TEXT        NOT NULL,     client         TEXT        "
               "NOT NULL,     client_type    INTEGER     NOT NULL,     csreq          BLOB,     last_modified  INTEGER   "
               "  NOT NULL ,     expired_at     INTEGER     NOT NULL DEFAULT (CAST(strftime('%s','now') AS INTEGER)),    "
               " PRIMARY KEY (service, client, client_type));",
               v1);
  if (!(_DWORD)database)
  {
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_100018108;
    v37[3] = &unk_100064C68;
    v37[4] = &v38;
    uint64_t database = sub_100016EEC("SELECT value FROM admin WHERE key = 'version'", 0LL, v37, 1LL);
    if (!(_DWORD)database)
    {
      uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
      id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 server]);
      uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 logHandle]);

      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = *((_DWORD *)v39 + 6);
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v5;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "using database version: %d", buf, 8u);
      }

      switch(*((_DWORD *)v39 + 6))
      {
        case 1:
        case 2:
        case 3:
          if (sqlite3_exec( (sqlite3 *)qword_1000782F0,  "DROP TABLE access; DROP TABLE access_times; DROP TABLE access_overrides;",
                 0LL,
                 0LL,
                 0LL))
          {
            goto LABEL_86;
          }

          int v6 = sqlite3_exec( (sqlite3 *)qword_1000782F0,  "CREATE TABLE IF NOT EXISTS admin (key TEXT PRIMARY KEY NOT NULL, value INTEGER NOT NULL);INSERT OR IGNO"
                 "RE INTO admin VALUES ('version', 30);CREATE TABLE IF NOT EXISTS policies(   id        INTEGER    NOT "
                 "NULL PRIMARY KEY,     bundle_id    TEXT    NOT NULL,     uuid        TEXT    NOT NULL,     display     "
                 "   TEXT    NOT NULL,     UNIQUE (bundle_id, uuid));CREATE TABLE IF NOT EXISTS active_policy(   client"
                 "        TEXT    NOT NULL,     client_type    INTEGER    NOT NULL,     policy_id    INTEGER NOT NULL,   "
                 "  PRIMARY KEY (client, client_type),     FOREIGN KEY (policy_id) REFERENCES policies(id) ON DELETE CASC"
                 "ADE ON UPDATE CASCADE);CREATE INDEX IF NOT EXISTS active_policy_id ON active_policy(policy_id);CREATE T"
                 "ABLE IF NOT EXISTS access(   service        TEXT        NOT NULL,     client         TEXT        NOT "
                 "NULL,     client_type    INTEGER     NOT NULL,     auth_value     INTEGER     NOT NULL,     auth_reason"
                 "    INTEGER     NOT NULL,     auth_version   INTEGER     NOT NULL,     csreq          BLOB,     policy_"
                 "id      INTEGER,     indirect_object_identifier_type    INTEGER,     indirect_object_identifier        "
                 " TEXT NOT NULL DEFAULT 'UNUSED',     indirect_object_code_identity      BLOB,     flags          INTEGE"
                 "R,     last_modified  INTEGER     NOT NULL DEFAULT (CAST(strftime('%s','now') AS INTEGER)),     pid    "
                 "        INTEGER,     pid_version    INTEGER,     boot_uuid      TEXT NOT NULL DEFAULT 'UNUSED',     las"
                 "t_reminded  INTEGER     NOT NULL DEFAULT (CAST(strftime('%s','now') AS INTEGER)),     PRIMARY KEY (serv"
                 "ice, client, client_type, indirect_object_identifier),    FOREIGN KEY (policy_id) REFERENCES policies(i"
                 "d) ON DELETE CASCADE ON UPDATE CASCADE);CREATE TABLE IF NOT EXISTS access_overrides(   service       "
                 " TEXT    NOT NULL PRIMARY KEY);CREATE TABLE IF NOT EXISTS expired(   service        TEXT        NOT N"
                 "ULL,     client         TEXT        NOT NULL,     client_type    INTEGER     NOT NULL,     csreq       "
                 "   BLOB,     last_modified  INTEGER     NOT NULL ,     expired_at     INTEGER     NOT NULL DEFAULT (CAS"
                 "T(strftime('%s','now') AS INTEGER)),     PRIMARY KEY (service, client, client_type));",
                 0LL,
                 0LL,
                 0LL);
          goto LABEL_80;
        case 4:
          if (!sqlite3_exec((sqlite3 *)qword_1000782F0, "ALTER TABLE access ADD COLUMN csreq BLOB", 0LL, 0LL, 0LL)) {
            goto LABEL_17;
          }
          goto LABEL_86;
        case 5:
LABEL_17:
          if (!sqlite3_exec((sqlite3 *)qword_1000782F0, "DELETE FROM access_times", 0LL, 0LL, 0LL)) {
            goto LABEL_18;
          }
          goto LABEL_86;
        case 6:
LABEL_18:
          if (sqlite3_exec( (sqlite3 *)qword_1000782F0,  "DELETE FROM access WHERE service = 'kTCCServicePhotos' AND allowed = 0",  0LL,  0LL,  0LL))
          {
            goto LABEL_86;
          }

          access_changed();
LABEL_20:
          if (sqlite3_exec( (sqlite3 *)qword_1000782F0,  "CREATE TABLE IF NOT EXISTS NEW_access(   service        TEXT    NOT NULL,     client        TEXT    N OT NULL,     client_type    INTEGER    NOT NULL,     allowed        INTEGER    NOT NULL,     prompt_cou nt    INTEGER    NOT NULL,     csreq        BLOB,     policy_id    INTEGER,     PRIMARY KEY (service, c lient, client_type),    FOREIGN KEY (policy_id) REFERENCES policies(id) ON DELETE CASCADE ON UPDATE CASCADE)",  0LL,  0LL,  0LL)
            || sqlite3_exec( (sqlite3 *)qword_1000782F0,  "INSERT INTO NEW_access SELECT service, client, client_type, allowed, prompt_count, csreq, NULL FROM access",  0LL,  0LL,  0LL)
            || sqlite3_exec((sqlite3 *)qword_1000782F0, "DROP TABLE access", 0LL, 0LL, 0LL)
            || sqlite3_exec((sqlite3 *)qword_1000782F0, "ALTER TABLE NEW_access RENAME TO access", 0LL, 0LL, 0LL))
          {
            goto LABEL_86;
          }

LABEL_24:
          if (sqlite3_exec( (sqlite3 *)qword_1000782F0,  "DELETE FROM access WHERE(service = 'kTCCServicePhotos' or service = 'kTCCServicePhotosAdd')",  0LL,  0LL,  0LL))
          {
            goto LABEL_86;
          }

          access_changed();
LABEL_26:
          if (sqlite3_exec( (sqlite3 *)qword_1000782F0,  "CREATE TABLE IF NOT EXISTS NEW_access(   service        TEXT    NOT NULL,     client        TEXT    N OT NULL,     client_type    INTEGER    NOT NULL,     allowed        INTEGER    NOT NULL,     prompt_cou nt    INTEGER    NOT NULL,     csreq        BLOB,     policy_id    INTEGER,     indirect_object_identif ier_type        INTEGER,     indirect_object_identifier        TEXT NOT NULL,     indirect_object_code_ identity        BLOB,     PRIMARY KEY (service, client, client_type, indirect_object_identifier),    FO REIGN KEY (policy_id) REFERENCES policies(id) ON DELETE CASCADE ON UPDATE CASCADE)",  0LL,  0LL,  0LL)
            || sqlite3_exec( (sqlite3 *)qword_1000782F0,  "INSERT INTO NEW_access SELECT service, client, client_type, allowed, prompt_count, csreq, policy_id, NU LL, 'UNUSED', NULL FROM access",  0LL,  0LL,  0LL)
            || sqlite3_exec((sqlite3 *)qword_1000782F0, "DROP TABLE access", 0LL, 0LL, 0LL)
            || sqlite3_exec((sqlite3 *)qword_1000782F0, "ALTER TABLE NEW_access RENAME TO access", 0LL, 0LL, 0LL))
          {
            goto LABEL_86;
          }

  servicesToSubjects = v5->_servicesToSubjects;
  v5->_servicesToSubjects = (NSDictionary *)v9;

LABEL_25:
  id v34 = v5;
LABEL_33:

  return v34;
}

LABEL_30:
          if (!sqlite3_exec((sqlite3 *)qword_1000782F0, "ALTER TABLE access ADD COLUMN flags INTEGER", 0LL, 0LL, 0LL)) {
            goto LABEL_35;
          }
          uint64_t v14 = sqlite3_errmsg((sqlite3 *)qword_1000782F0);
          if (strcmp(v14, "duplicate column name: flags")) {
            goto LABEL_86;
          }
          unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
          int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 server]);
          id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 logHandle]);

          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Ignoring duplicate 'flags' column for version 10.",  buf,  2u);
          }

LABEL_35:
          sqlite3_exec((sqlite3 *)qword_1000782F0, "DROP TABLE access_times", 0LL, 0LL, 0LL);
          if (sqlite3_exec( (sqlite3 *)qword_1000782F0,  "CREATE TABLE IF NOT EXISTS NEW_access(   service        TEXT        NOT NULL,     client         TEXT NOT NULL,     client_type    INTEGER     NOT NULL,     allowed        INTEGER     NOT NULL, prompt_count   INTEGER     NOT NULL,     csreq          BLOB,     policy_id      INTEGER,     indirect _object_identifier_type    INTEGER,     indirect_object_identifier         TEXT DEFAULT 'UNUSED',     i ndirect_object_code_identity      BLOB,     flags          INTEGER,     last_modified  INTEGER     NOT NULL DEFAULT (CAST(strftime('%s','now') AS INTEGER)),     PRIMARY KEY (service, client, client_type, in direct_object_identifier),    FOREIGN KEY (policy_id) REFERENCES policies(id) ON DELETE CASCADE ON UPDATE CASCADE)",  0LL,  0LL,  0LL)
            || sqlite3_exec( (sqlite3 *)qword_1000782F0,  "INSERT INTO NEW_access SELECT service, client, client_type, allowed, prompt_count, csreq, policy_id, in direct_object_identifier_type, indirect_object_identifier, indirect_object_code_identity, flags, CAST(s trftime('%s','now') AS INTEGER) FROM access",  0LL,  0LL,  0LL)
            || sqlite3_exec((sqlite3 *)qword_1000782F0, "DROP TABLE access", 0LL, 0LL, 0LL)
            || sqlite3_exec((sqlite3 *)qword_1000782F0, "ALTER TABLE NEW_access RENAME TO access", 0LL, 0LL, 0LL))
          {
            goto LABEL_86;
          }

          access_changed();
LABEL_40:
          if (sqlite3_exec( (sqlite3 *)qword_1000782F0,  "CREATE TABLE IF NOT EXISTS expired(   service        TEXT        NOT NULL,     client         TEXT NOT NULL,     client_type    INTEGER     NOT NULL,     csreq          BLOB,     last_modified  INT EGER     NOT NULL ,     expired_at     INTEGER     NOT NULL DEFAULT (CAST(strftime('%s','now') AS INTEG ER)),     PRIMARY KEY (service, client, client_type))",  0LL,  0LL,  0LL))
          {
            goto LABEL_86;
          }

        -[TCCDPolicyOverride setPlistDictionary:](self, "setPlistDictionary:", 0LL);
LABEL_31:

        goto LABEL_32;
      }

      unsigned int v15 = [v7 code];

      if (v15 == (id)260) {
        goto LABEL_26;
      }
    }

    else
    {
    }

    if (qword_1000783C0 != -1) {
      dispatch_once(&qword_1000783C0, &stru_100065DC8);
    }
    uint64_t v14 = (os_log_s *)qword_1000783C8;
    if (os_log_type_enabled((os_log_t)qword_1000783C8, OS_LOG_TYPE_ERROR)) {
      sub_100032DDC((uint64_t)v3, (uint64_t)v7, v14);
    }
    goto LABEL_30;
  }

  if (qword_1000783C0 != -1) {
    dispatch_once(&qword_1000783C0, &stru_100065DC8);
  }
  int v12 = (os_log_s *)qword_1000783C8;
  if (os_log_type_enabled((os_log_t)qword_1000783C8, OS_LOG_TYPE_ERROR)) {
    sub_100032D9C(v12);
  }
LABEL_32:
}

LABEL_41:
LABEL_42:
          if (sqlite3_exec( (sqlite3 *)qword_1000782F0,  "DELETE FROM access WHERE client = 'com.apple.Health' AND service = 'kTCCServiceLiverpool'",  0LL,  0LL,  0LL))
          {
            goto LABEL_86;
          }

          access_changed();
LABEL_44:
          if (sqlite3_exec( (sqlite3 *)qword_1000782F0,  "DELETE FROM access WHERE client = '/usr/sbin/sshd' AND service = 'kTCCServiceSystemPolicyAllFiles'",  0LL,  0LL,  0LL))
          {
            goto LABEL_86;
          }

          access_changed();
LABEL_46:
          if (sqlite3_exec( (sqlite3 *)qword_1000782F0,  "DELETE FROM access WHERE service = 'kTCCServicePhotos' AND auth_xpc_object_t value = 3",  0LL,  0LL,  0LL))
          {
            goto LABEL_86;
          }

          access_changed();
LABEL_48:
          if (sqlite3_exec( (sqlite3 *)qword_1000782F0,  "UPDATE OR REPLACE access SET service = 'kTCCServiceSystemPolicyAllFiles' WHERE service = 'kTCCServiceEn dpointSecurityClient' and auth_xpc_object_t value = 2",  0LL,  0LL,  0LL)
            || sqlite3_exec( (sqlite3 *)qword_1000782F0,  "DELETE FROM access WHERE service = 'kTCCServiceEndpointSecurityClient'",  0LL,  0LL,  0LL))
          {
            goto LABEL_86;
          }

    uint64_t v14 = v22;
LABEL_42:
    if (a6) {
      *a6 = 0LL;
    }
    goto LABEL_44;
  }

  id v18 = 0LL;
LABEL_45:

  return v18;
}

                id v35 = 4;
                goto LABEL_57;
              }

              if (qword_1000783C0 != -1) {
                dispatch_once(&qword_1000783C0, &stru_100065DC8);
              }
              uint64_t v24 = (os_log_s *)qword_1000783C8;
              if (os_log_type_enabled((os_log_t)qword_1000783C8, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138544130;
                unint64_t v68 = v58;
                id v69 = 2114;
                unsigned int v70 = v17;
                id v71 = 2114;
                id v72 = v19;
                id v73 = 2114;
                id v74 = v20;
                _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "Override: service: %{public}@, processed entry: %{public}@, '%{public}@', %{public}@",  buf,  0x2Au);
              }

              int v25 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDPolicyOverride policyAccessByIdentifier](self, "policyAccessByIdentifier"));
              id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:v17]);

              if (!v26)
              {
                id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
                id v27 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDPolicyOverride policyAccessByIdentifier](v53, "policyAccessByIdentifier"));
                [v27 setObject:v26 forKeyedSubscript:v17];
              }

              __int16 v28 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:v51]);
              if (!v28)
              {
                __int16 v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
                [v26 setObject:v28 forKeyedSubscript:v51];
              }

              id v54 = v28;
              if (!v50)
              {
                int v29 = v28;
LABEL_43:
                [v29 setObject:v17 forKeyedSubscript:@"Identifier"];
                [v29 setObject:v18 forKeyedSubscript:@"IdentifierType"];
                [v29 setObject:v22 forKeyedSubscript:@"Allowed"];
                if (v23) {
                  int v36 = v23;
                }
                else {
                  int v36 = &off_10006CB18;
                }
                [v29 setObject:v36 forKeyedSubscript:@"StaticCode"];
                [v29 setObject:v55 forKeyedSubscript:@"CodeRequirementData"];
                if (qword_1000783C0 != -1) {
                  dispatch_once(&qword_1000783C0, &stru_100065DC8);
                }
                __int16 v37 = (void *)qword_1000783C8;
                if (os_log_type_enabled((os_log_t)qword_1000783C8, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v38 = v37;
                  uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDPolicyOverride policyAccessByIdentifier](v53, "policyAccessByIdentifier"));
                  logb = (os_log_t)objc_claimAutoreleasedReturnValue([v49 objectForKeyedSubscript:v17]);
                  *(_DWORD *)buf = 138412546;
                  unint64_t v68 = v17;
                  id v69 = 2112;
                  unsigned int v70 = (TCCDPolicyOverride *)logb;
                  _os_log_debug_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEBUG,  "Override: policyAccessByIdentifier[%@] = %@",  buf,  0x16u);
                }

                id v35 = 0;
                goto LABEL_56;
              }

              uint64_t v48 = v26;
              int v29 = (id)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"AEReceiverIdentifier"]);
              int v30 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"AEReceiverIdentifierType"]);
              __int16 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"AEReceiverCodeRequirement"]);
              if (-[TCCDPolicyOverride validateEntry:identifierType:codeRequirementString:serviceName:allowed:comment:]( v53,  "validateEntry:identifierType:codeRequirementString:serviceName:allowed:comment:",  v29,  v30,  v31,  v58,  v22,  v20))
              {
                int v32 = -[TCCDPolicyOverride parseCodeRequirements:](v53, "parseCodeRequirements:", v31);
                if (v32)
                {
                  id v43 = v32;
                  unsigned int log = v31;
                  id v33 = (void *)objc_claimAutoreleasedReturnValue([v54 objectForKeyedSubscript:v29]);
                  if (!v33)
                  {
                    id v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
                    [v54 setObject:v33 forKeyedSubscript:v29];
                  }

                  [v33 setObject:v29 forKeyedSubscript:@"AEReceiverIdentifier"];
                  [v33 setObject:v30 forKeyedSubscript:@"AEReceiverIdentifierType"];
                  [v33 setObject:v43 forKeyedSubscript:@"AEReceiverCodeRequirementData"];

                  int v29 = v33;
                  id v26 = v48;
                  goto LABEL_43;
                }

                if (qword_1000783C0 != -1) {
                  dispatch_once(&qword_1000783C0, &stru_100065DC8);
                }
                os_log_t loga = (os_log_s *)qword_1000783C8;
                if (os_log_type_enabled((os_log_t)qword_1000783C8, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v39;
                  unint64_t v68 = v58;
                  id v69 = 2114;
                  unsigned int v70 = v17;
                  id v71 = 2114;
                  id v72 = v29;
                  id v73 = 2114;
                  id v74 = v30;
                  id v75 = 2114;
                  id v76 = v31;
                  _os_log_error_impl( (void *)&_mh_execute_header,  loga,  OS_LOG_TYPE_ERROR,  "Override: invalid code requirements for Service %{public}@, Identifier: %{public}@, Target Identifie r: %{public}@, target type: %{public}@, target requirement: %{public}@",  buf,  0x34u);
                }
              }

              id v35 = 4;
              id v26 = v48;
LABEL_56:

              self = v53;
LABEL_57:

              if (v35) {
                goto LABEL_60;
              }
              unsigned int v15 = (char *)v15 + 1;
            }

            while (v57 != v15);
            int v57 = [v52 countByEnumeratingWithState:&v59 objects:v77 count:16];
          }

          while (v57);
        }

LABEL_53:
          if (sqlite3_exec( (sqlite3 *)qword_1000782F0,  "ALTER TABLE access ADD COLUMN last_reminded INTEGER NOT NULL DEFAULT 0",  0LL,  0LL,  0LL))
          {
            goto LABEL_86;
          }

LABEL_54:
          if (sqlite3_exec( (sqlite3 *)qword_1000782F0,  "DELETE FROM access WHERE client = 'com.apple.installer' and client_type = 0",  0LL,  0LL,  0LL))
          {
            goto LABEL_86;
          }

LABEL_55:
          *(void *)buf = 0LL;
          uint64_t v48 = buf;
          uint64_t v49 = 0x2020000000LL;
          int v50 = 0;
          v36[0] = _NSConcreteStackBlock;
          v36[1] = 3221225472LL;
          v36[2] = sub_1000181E8;
          v36[3] = &unk_100064C68;
          v36[4] = buf;
          if (sub_100016EEC( "SELECT COUNT(*) FROM pragma_table_info('access') WHERE name='pid'",  0LL,  v36,  1LL)) {
            goto LABEL_56;
          }
          if (*((_DWORD *)v48 + 6))
          {
            id v18 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
            __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 server]);
            uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 logHandle]);

            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(v44) = 136315138;
              *(void *)((char *)&v44 + 4) = "db_open";
              _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%s session cols present, not adding",  (uint8_t *)&v44,  0xCu);
            }
          }

          else
          {
            int v21 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 server]);
            id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 logHandle]);

            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(v44) = 136315138;
              *(void *)((char *)&v44 + 4) = "db_open";
              _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%s session cols not present, adding",  (uint8_t *)&v44,  0xCu);
            }

            if (sqlite3_exec((sqlite3 *)qword_1000782F0, "ALTER TABLE access ADD COLUMN pid INTEGER", 0LL, 0LL, 0LL)
              || sqlite3_exec( (sqlite3 *)qword_1000782F0,  "ALTER TABLE access ADD COLUMN pid_version INTEGER",  0LL,  0LL,  0LL)
              || sqlite3_exec( (sqlite3 *)qword_1000782F0,  "ALTER TABLE access ADD COLUMN boot_uuid TEXT NOT NULL DEFAULT 'UNUSED'",  0LL,  0LL,  0LL))
            {
LABEL_56:
              _db_error(0);
LABEL_57:
              _Block_object_dispose(buf, 8);
              goto LABEL_87;
            }
          }

          *(void *)&__int128 v44 = 0LL;
          *((void *)&v44 + 1) = &v44;
          uint64_t v45 = 0x2020000000LL;
          int v46 = 0;
          v35[0] = _NSConcreteStackBlock;
          v35[1] = 3221225472LL;
          v35[2] = sub_10001821C;
          v35[3] = &unk_100064C68;
          v35[4] = &v44;
          if (sub_100016EEC( "SELECT COUNT(*) FROM pragma_table_info('access') WHERE name='last_reminded'",  0LL,  v35,  1LL)) {
            goto LABEL_63;
          }
          if (*(_DWORD *)(*((void *)&v44 + 1) + 24LL))
          {
            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
            int v25 = (void *)objc_claimAutoreleasedReturnValue([v24 server]);
            id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([v25 logHandle]);

            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)id v42 = 136315138;
              id v43 = "db_open";
              _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%s last_reminded col present, not adding",  v42,  0xCu);
            }
          }

          else
          {
            int v32 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
            id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 server]);
            id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue([v33 logHandle]);

            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)id v42 = 136315138;
              id v43 = "db_open";
              _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "%s last_reminded col not present, adding",  v42,  0xCu);
            }

            if (sqlite3_exec( (sqlite3 *)qword_1000782F0,  "ALTER TABLE access ADD COLUMN last_reminded INTEGER NOT NULL DEFAULT 0",  0LL,  0LL,  0LL))
            {
LABEL_63:
              _db_error(0);
              _Block_object_dispose(&v44, 8);
              goto LABEL_57;
            }
          }

          _Block_object_dispose(&v44, 8);
          _Block_object_dispose(buf, 8);
LABEL_78:
          if (!sqlite3_exec( (sqlite3 *)qword_1000782F0,  "UPDATE access set auth_xpc_object_t value = 4, auth_reason = 4 WHERE service = 'kTCCServiceCalendar' and auth_xpc_object_t value = 2",  0LL,  0LL,  0LL))
          {
            int v6 = sqlite3_exec( (sqlite3 *)qword_1000782F0,  "UPDATE access set auth_version = 2 WHERE service = 'kTCCServiceCalendar'",  0LL,  0LL,  0LL);
LABEL_80:
            if (!v6)
            {
              access_changed();
LABEL_82:
              id v27 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
              __int16 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 server]);
              int v29 = (os_log_s *)objc_claimAutoreleasedReturnValue([v28 logHandle]);

              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                int v30 = *((_DWORD *)v39 + 6);
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&uint8_t buf[4] = v30;
                LOWORD(v4_Block_object_dispose((const void *)(v1 - 64), 8) = 1024;
                *(_DWORD *)((char *)&v48 + 2) = 30;
                _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Upgrading database from version %d to %d",  buf,  0xEu);
              }

              if (!sqlite3_exec( (sqlite3 *)qword_1000782F0,  "UPDATE admin SET xpc_object_t value = 30 WHERE key = 'version'",  0LL,  0LL,  0LL))
              {
LABEL_85:
                if (!sqlite3_exec((sqlite3 *)qword_1000782F0, "COMMIT", 0LL, 0LL, 0LL))
                {
                  free(v1);
                  uint64_t database = 0LL;
                  goto LABEL_90;
                }
              }
            }
          }

void sub_10001809C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, char a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
}

uint64_t sub_100018108(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t result = sqlite3_column_int(a2, 0);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t sub_10001813C(sqlite3 *a1)
{
  uint64_t v2 = sqlite3_exec( a1,  "CREATE TABLE IF NOT EXISTS NEW_access(   service        TEXT        NOT NULL,     client         TEXT NOT NULL,     client_type    INTEGER     NOT NULL,     auth_value     INTEGER     NOT NULL,     auth_reason INTEGER     NOT NULL,     auth_version   INTEGER     NOT NULL,     csreq          BLOB,     policy_id      INTE GER,     indirect_object_identifier_type    INTEGER,     indirect_object_identifier         TEXT NOT NULL DEFAU LT 'UNUSED',     indirect_object_code_identity      BLOB,     flags          INTEGER,     last_modified  INTEGE R     NOT NULL DEFAULT (CAST(strftime('%s','now') AS INTEGER)),     PRIMARY KEY (service, client, client_type, indirect_object_identifier),    FOREIGN KEY (policy_id) REFERENCES policies(id) ON DELETE CASCADE ON UPDATE CASCADE)",  0LL,  0LL,  0LL);
  if (!(_DWORD)v2)
  {
    uint64_t v2 = sub_100016EEC("SELECT * FROM access", 0LL, &stru_100065468, 1LL);
    if (!(_DWORD)v2)
    {
      uint64_t v2 = sqlite3_exec(a1, "DROP TABLE access", 0LL, 0LL, 0LL);
      if (!(_DWORD)v2) {
        return sqlite3_exec(a1, "ALTER TABLE NEW_access RENAME TO access", 0LL, 0LL, 0LL);
      }
    }
  }

  uint64_t v3 = v2;
  _db_error(0);
  return v3;
}

uint64_t sub_1000181E8(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t result = sqlite3_column_int(a2, 0);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t sub_10001821C(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t result = sqlite3_column_int(a2, 0);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t db_get_current_version()
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  int v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100018364;
  v5[3] = &unk_100064C68;
  v5[4] = &v6;
  if (sub_100016EEC((uint64_t)"SELECT value FROM admin WHERE key = 'version'", 0LL, v5, 0))
  {
    int v0 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
    uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([v0 server]);
    uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue([v1 logHandle]);

    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_10003C628();
    }
  }

  uint64_t v3 = *((unsigned int *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void sub_100018348( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100018364(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t result = sqlite3_column_int(a2, 0);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t db_get_current_version_locked()
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  int v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000184AC;
  v5[3] = &unk_100064C68;
  v5[4] = &v6;
  if (sub_100016EEC((uint64_t)"SELECT value FROM admin WHERE key = 'version'", 0LL, v5, 1))
  {
    int v0 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
    uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([v0 server]);
    uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue([v1 logHandle]);

    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_10003C628();
    }
  }

  uint64_t v3 = *((unsigned int *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void sub_100018490( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_1000184AC(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t result = sqlite3_column_int(a2, 0);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t db_persistent_state_get_value(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v14 = 0LL;
  unsigned int v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  int v17 = -1;
  id v4 = sub_100018670(a1, v3);
  int v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SELECT value FROM admin WHERE key = '%@'",  v5));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 server]);
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 logHandle]);

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100019D98();
    }

    id v10 = v6;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000187D4;
    v13[3] = &unk_100064C68;
    void v13[4] = &v14;
  }

  uint64_t v11 = *((unsigned int *)v15 + 6);

  _Block_object_dispose(&v14, 8);
  return v11;
}

void sub_10001864C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_100018670(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1 == 1)
  {
    if (v3)
    {
      int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"POST_UPGRADE_3_RIGHT_ALERT_%@",  v3));
      goto LABEL_9;
    }

    uint64_t v6 = @"Missing Service Name.";
  }

  else
  {
    uint64_t v6 = @"Invalid TCCDPersistentStateType.";
  }

  id v7 = sub_100016DE8();
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 server]);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 logHandle]);

  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v14 = a1;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Cannot construct Persistent State key name. type: %llu: %@\n%@",  buf,  0x20u);
  }

  int v5 = 0LL;
LABEL_9:

  return v5;
}

uint64_t sub_1000187D4(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t result = sqlite3_column_int(a2, 0);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

void db_persistent_state_set_value(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = sub_100018670(a1, a2);
  int v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v5)
  {
    if ((a3 & 0x80000000) != 0)
    {
      uint64_t v11 = sub_100016DE8();
      id v10 = (id)objc_claimAutoreleasedReturnValue(v11);
      int v12 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 server]);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 logHandle]);

      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109634;
        int v16 = a3;
        __int16 v17 = 2112;
        id v18 = v5;
        __int16 v19 = 2112;
        id v20 = v10;
        _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Persistent State value (%d) is negative; key name: %@\n%@",
          buf,
          0x1Cu);
      }
    }

    else
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"INSERT OR REPLACE INTO admin (key, value) VALUES ('%@', %d)",  v5,  a3));
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 server]);
      int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 logHandle]);

      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        sub_100019D98();
      }

      id v10 = v6;
    }
  }
}

void db_persistent_state_reset(uint64_t a1, void *a2)
{
  id v2 = sub_100018670(a1, a2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"DELETE FROM admin WHERE key = '%@'",  v3));
    int v5 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 server]);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 logHandle]);

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_100019D98();
    }

    id v8 = v4;
  }
}

uint64_t db_get_database_error_code()
{
  if (byte_1000782E8) {
    return dword_1000782F8;
  }
  else {
    return 0LL;
  }
}

const char *db_get_filename()
{
  uint64_t result = (const char *)qword_1000782F0;
  if (qword_1000782F0)
  {
    uint64_t result = sqlite3_db_filename((sqlite3 *)qword_1000782F0, "main");
    if (result)
    {
      if (!*result) {
        return 0LL;
      }
    }
  }

  return result;
}

id db_get_file_metadata(const char *a1)
{
  id v2 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  if (a1)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a1));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v3, @"FILENAME");

    if (!stat(a1, &v13))
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%o",  v13.st_mode));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v4, @"ST_MODE");

      int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v13.st_uid));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v5, @"ST_UID");

      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v13.st_gid));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v6, @"ST_GID");

      id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)v13.st_atimespec.tv_sec));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v7, @"ST_ATIME");

      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)v13.st_mtimespec.tv_sec));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v8, @"ST_MTIME");

      int v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)v13.st_ctimespec.tv_sec));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v9, @"ST_CTIME");

      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)v13.st_birthtimespec.tv_sec));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v10,  @"ST_BIRTHTIME");
    }
  }

  id v11 = -[NSMutableDictionary copy](v2, "copy");

  return v11;
}

void db_close()
{
}

void sub_100018D0C(id a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 server]);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue([v2 logHandle]);

  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100019DF8();
  }

  sqlite3_close((sqlite3 *)qword_1000782F0);
  qword_1000782F0 = 0LL;
}

uint64_t sub_100018D90(uint64_t a1)
{
  uint64_t result = sub_100016EEC((uint64_t)"BEGIN", 0LL, 0LL, 1);
  if ((_DWORD)result
    || (uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))(), (_DWORD)result)
    || (uint64_t result = sub_100016EEC((uint64_t)"END", 0LL, 0LL, 1), (_DWORD)result))
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }

  return result;
}

uint64_t db_test_corrupt(int a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 server]);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 logHandle]);

  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Corrupting database...", v10, 2u);
  }

  uint64_t v5 = sub_100016EEC((uint64_t)"SELECT * FROM active_policy WHERE client='NOT EXIST'", 0LL, 0LL, 0);
  if (!(_DWORD)v5)
  {
    uint64_t v6 = db_dir_get();
    *(void *)&v6[strlen(v6)] = 0x62642E4343542FLL;
    uint64_t v5 = 2LL;
    int v7 = open(v6, 2);
    if (v7 != -1)
    {
      int v8 = v7;
      lseek(v7, 0LL, 0);
      write(v8, "Let you corrupt", 0xFuLL);
      _db_error(a1);
      close(v8);
      return 0LL;
    }
  }

  return v5;
}

void sub_100018F34(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) platform]);
  uint64_t v5 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", sqlite3_column_text(a2, 0));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v11 = (id)objc_claimAutoreleasedReturnValue([v4 serviceByName:v6]);

  if (v11)
  {
    int v7 = sqlite3_column_text(a2, 1);
    uint64_t v8 = sqlite3_column_int(a2, 2);
    int v9 = *(void **)(a1 + 32);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v7));
    [v9 publishAccessChangedEvent:3 forService:v11 client:v10 clientType:v8 authValue:1 andKillClient:1];
  }
}

int sub_100019028(id a1)
{
  return sub_100016EEC((uint64_t)"DELETE FROM access", 0LL, 0LL, 1);
}

void sub_100019040(uint64_t a1, sqlite3_stmt *a2)
{
  if (sqlite3_bind_text( a2, 1, (const char *)[*(id *)(a1 + 32) UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)
    || sqlite3_bind_int(a2, 2, *(_DWORD *)(a1 + 40)))
  {
    _db_error(1);
  }

void sub_1000190AC(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) platform]);
  uint64_t v5 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", sqlite3_column_text(a2, 0));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v8 = (id)objc_claimAutoreleasedReturnValue([v4 serviceByName:v6]);

  int v7 = v8;
  if (v8)
  {
    [*(id *)(a1 + 32) publishAccessChangedEvent:3 forService:v8 client:*(void *)(a1 + 40) clientType:*(unsigned int *)(a1 + 48) authValue:1 andKillClient:1];
    int v7 = v8;
  }
}

uint64_t sub_100019158(uint64_t a1)
{
  return sub_100016EEC((uint64_t)"DELETE FROM access WHERE client = ? AND client_type = ?", *(void **)(a1 + 32), 0LL, 1);
}

void sub_100019170(uint64_t a1)
{
  id v2 = (sqlite3 *)qword_1000782F0;
  if (!qword_1000782F0)
  {
    if (db_open())
    {
LABEL_8:
      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
      return;
    }

    id v2 = (sqlite3 *)qword_1000782F0;
  }

  if (sqlite3_prepare_v2(v2, *(const char **)(a1 + 56), -1, &ppStmt, 0LL))
  {
LABEL_7:
    _db_error(0);
    goto LABEL_8;
  }

  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    goto LABEL_9;
  }
  while (1)
  {
    int v4 = sqlite3_step(ppStmt);
    if (v4 != 100) {
      break;
    }
    uint64_t v3 = *(void *)(a1 + 40);
LABEL_9:
    (*(void (**)(uint64_t, sqlite3_stmt *))(v3 + 16))(v3, ppStmt);
  }

  int v5 = v4;
  if (v4 != 101)
  {
    uint64_t v6 = sqlite3_expanded_sql(ppStmt);
    int v7 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 server]);
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 logHandle]);

    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      if (v10) {
        sub_10003C2BC((uint64_t)v6, v5, v9);
      }

      sqlite3_free(v6);
      _db_error(0);
    }

    else
    {
      if (v10) {
        sub_10003C250((uint64_t *)(a1 + 56), v9, v11);
      }
    }

    sqlite3_finalize(ppStmt);
    goto LABEL_7;
  }

  sqlite3_finalize(ppStmt);
}

void sub_1000192E8(id a1, sqlite3_stmt *a2)
{
  __s1 = (char *)sqlite3_column_text(a2, 0);
  id v34 = sqlite3_column_text(a2, 1);
  int v35 = sqlite3_column_int(a2, 2);
  int v3 = sqlite3_column_int(a2, 3);
  int v4 = sqlite3_column_int(a2, 4);
  int v33 = sqlite3_column_type(a2, 5);
  int v32 = sqlite3_column_blob(a2, 5);
  int v31 = sqlite3_column_bytes(a2, 5);
  int v30 = sqlite3_column_type(a2, 6);
  int v29 = sqlite3_column_int(a2, 6);
  int v28 = sqlite3_column_type(a2, 7);
  int v27 = sqlite3_column_int(a2, 7);
  int v5 = sqlite3_column_type(a2, 8);
  uint64_t v6 = sqlite3_column_text(a2, 8);
  int v7 = sqlite3_column_type(a2, 9);
  id v8 = sqlite3_column_blob(a2, 9);
  int v9 = sqlite3_column_bytes(a2, 9);
  int v10 = sqlite3_column_type(a2, 10);
  int v11 = sqlite3_column_int(a2, 10);
  int v12 = sqlite3_column_int(a2, 11);
  if (v4 == 1 || !v4 && !strcmp(__s1, "kTCCServiceAppleEvents"))
  {
    if (!v3)
    {
      uint64_t v13 = 0LL;
LABEL_13:
      uint64_t v26 = v13;
      id v18 = &off_100046000;
      BOOL v19 = v5 == 5;
      if (v5 == 5) {
        id v20 = "UNUSED";
      }
      else {
        id v20 = (const char *)v6;
      }
      if (v19 || (v21 = strcmp((const char *)v6, "UNUSED"), id v18 = &off_100046000, !v21))
      {
        uint64_t v63 = 0LL;
        id v64 = &v63;
        uint64_t v65 = 0x2020000000LL;
        char v66 = 0;
        id v55 = _NSConcreteStackBlock;
        uint64_t v56 = *((void *)v18 + 420);
        int v57 = sub_100019828;
        char v58 = &unk_100065488;
        __int128 v59 = __s1;
        id v60 = v34;
        id v61 = v20;
        int v62 = v35;
        v54[0] = _NSConcreteStackBlock;
        v54[1] = v56;
        v54[2] = sub_10001989C;
        v54[3] = &unk_100064C68;
        v54[4] = &v63;
        sub_100016EEC( (uint64_t)"SELECT count(*) FROM NEW_access WHERE service = ? AND client = ? AND client_type = ? AND indirect_obj ect_identifier = ?",  &v55,  v54,  1);
        if (*((_BYTE *)v64 + 24))
        {
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
          id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 server]);
          uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v23 logHandle]);

          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            int v25 = "(null)";
            *(_DWORD *)buf = 136316418;
            if (v6) {
              int v25 = (const char *)v6;
            }
            unint64_t v68 = __s1;
            __int16 v69 = 2080;
            unsigned int v70 = v34;
            __int16 v71 = 1024;
            int v72 = v35;
            __int16 v73 = 2080;
            id v74 = v25;
            __int16 v75 = 1024;
            int v76 = v3;
            __int16 v77 = 1024;
            int v78 = v4;
            _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "Dropping duplicate v15 access row: service=%s, client=%s, client_type=%d, indirect_object_identifier=%s, a llowed=%d, prompt_count=%d",  buf,  0x32u);
          }

          _Block_object_dispose(&v63, 8);
          return;
        }

        _Block_object_dispose(&v63, 8);
      }

      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472LL;
      v37[2] = sub_1000198D8;
      v37[3] = &unk_1000654A8;
      v37[4] = __s1;
      void v37[5] = v34;
      v37[6] = v26;
      __int128 v38 = xmmword_100046EC0;
      int v42 = v35;
      int v43 = v33;
      int v44 = v31;
      int v45 = v30;
      int v46 = v29;
      int v47 = v28;
      __int16 v39 = v32;
      uint64_t v40 = v20;
      int v48 = v27;
      int v49 = v7;
      int v41 = v8;
      int v50 = v9;
      int v51 = v10;
      int v52 = v11;
      int v53 = v12;
      sub_100016EEC( (uint64_t)"INSERT INTO NEW_access   (service, client, client_type, auth_value, auth_reason, auth_version, csreq, p olicy_id, indirect_object_identifier_type, indirect_object_identifier, indirect_object_code_identity, f lags, last_modified) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",  v37,  0LL,  1);
      return;
    }

    if (v3 == 1)
    {
      uint64_t v13 = 2LL;
      goto LABEL_13;
    }
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 server]);
  int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 logHandle]);

  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    __int16 v17 = "(null)";
    *(_DWORD *)buf = 136316418;
    if (v6) {
      __int16 v17 = (const char *)v6;
    }
    unint64_t v68 = __s1;
    __int16 v69 = 2080;
    unsigned int v70 = v34;
    __int16 v71 = 1024;
    int v72 = v35;
    __int16 v73 = 2080;
    id v74 = v17;
    __int16 v75 = 1024;
    int v76 = v3;
    __int16 v77 = 1024;
    int v78 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "Dropping invalid v15 access row: service=%s, client=%s, client_type=%d, indirect_object_identifier=%s, allowed=%d, prompt_count=%d",  buf,  0x32u);
  }
}

void sub_100019804(_Unwind_Exception *a1)
{
}

uint64_t sub_100019828(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_text(a2, 4, *(const char **)(a1 + 48), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

uint64_t sub_10001989C(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t result = sqlite3_column_int(a2, 0);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = (int)result > 0;
  return result;
}

uint64_t sub_1000198D8(uint64_t a1, sqlite3_stmt *a2)
{
  if (*(_DWORD *)(a1 + 100) == 5) {
    sqlite3_bind_null(a2, 7);
  }
  else {
    sqlite3_bind_blob( a2,  7,  *(const void **)(a1 + 72),  *(_DWORD *)(a1 + 104),  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  if (*(_DWORD *)(a1 + 108) == 5) {
    sqlite3_bind_null(a2, 8);
  }
  else {
    sqlite3_bind_int(a2, 8, *(_DWORD *)(a1 + 112));
  }
  if (*(_DWORD *)(a1 + 116) == 5) {
    sqlite3_bind_null(a2, 9);
  }
  else {
    sqlite3_bind_int(a2, 9, *(_DWORD *)(a1 + 120));
  }
  sqlite3_bind_text(a2, 10, *(const char **)(a1 + 80), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (*(_DWORD *)(a1 + 124) == 5) {
    sqlite3_bind_null(a2, 11);
  }
  else {
    sqlite3_bind_blob( a2,  11,  *(const void **)(a1 + 88),  *(_DWORD *)(a1 + 128),  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  if (*(_DWORD *)(a1 + 132) == 5) {
    sqlite3_bind_null(a2, 12);
  }
  else {
    sqlite3_bind_int(a2, 12, *(_DWORD *)(a1 + 136));
  }
  return sqlite3_bind_int(a2, 13, *(_DWORD *)(a1 + 140));
}

void sub_100019A78( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100019A88(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to post com.apple.tcc.access.changed notification (%u)",  (uint8_t *)v2,  8u);
  sub_100004C60();
}

void sub_100019AF8(void *a1, uint64_t a2, os_log_s *a3)
{
  int v5 = (void *)objc_claimAutoreleasedReturnValue([a1 name]);
  sub_1000110AC();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "VACUUM after DELETE of (%@ : %@)", v6, 0x16u);
}

void sub_100019BA0()
{
}

void sub_100019C00()
{
}

void sub_100019C18()
{
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Failed to create %{public}s (%d)", v2, 0x12u);
  sub_100004C7C();
}

void sub_100019C94()
{
}

void sub_100019CAC(os_log_s *a1)
{
  if (qword_1000782F0) {
    sqlite3_errmsg((sqlite3 *)qword_1000782F0);
  }
  sub_1000110AC();
  sub_100004C90((void *)&_mh_execute_header, a1, v2, "Failed to open database: %{public}s", v3);
}

void sub_100019D40()
{
}

void sub_100019D6C()
{
}

void sub_100019D98()
{
}

void sub_100019DF8()
{
}

id sub_10001A170(uint64_t a1)
{
  return [*(id *)(a1 + 32) watchPlistChanges];
}

LABEL_4:
  __int16 v7 = @"com.apple.Research.study.";
LABEL_7:

  return (id)v7;
}

void sub_10001AF58(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "_CFBundleCreateUnique failed for %{public}@",  (uint8_t *)&v2,  0xCu);
  sub_100004C7C();
}

void sub_10001AFC8()
{
}

void sub_10001B030()
{
}

void sub_10001B098(void *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 executableURL]);
  sub_10001AF40();
  sub_1000110A0((void *)&_mh_execute_header, a3, v5, "Unable to resolve realpath of: %{public}@: %{public}@", v6);

  sub_1000110B8();
}

void sub_10001B120(void *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 bundleURL]);
  sub_10001AF40();
  sub_1000110A0((void *)&_mh_execute_header, a3, v5, "Unable to resolve realpath of: %{public}@: %{public}@", v6);

  sub_1000110B8();
}

void sub_10001B6E8(uint64_t a1, os_log_s *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "+[TCCDIconGenerator _writeIcon:withDescriptor:toTempURL:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%s: unable to write icon to URL %@",  (uint8_t *)&v2,  0x16u);
}

void sub_10001BCF8( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

uint64_t sub_10001BD0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_opt_class(a1, a2, a3, a4);
}

void sub_10001BD14(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Invalid filter key: must be the name of a TCC service, found %{public}@",  (uint8_t *)&v2,  0xCu);
}

void sub_10001BD88(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  __int16 v7 = v5;
  uint64_t v8 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Invalid filter value: array must contain only strings, found %{public}@ in %{public}@: %{public}@",  v6,  0x20u);
}

void sub_10001BE24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void sub_10001BE90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void sub_10001BEFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void sub_10001C470(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 == 3) {
      return;
    }
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100022EB0(a1, a2, v4);
    }
  }

  else
  {
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) bundleIdentifier]);
      uint64_t v6 = *(void *)(a1 + 48);
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) name]);
      int v8 = 138543874;
      uint64_t v9 = v5;
      __int16 v10 = 2114;
      uint64_t v11 = v6;
      __int16 v12 = 2114;
      uint64_t v13 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Terminating plugin %{public}@ of %{public}@ because access to the %{public}@ service changed.",  (uint8_t *)&v8,  0x20u);
    }
  }
}

id sub_10001CA7C(uint64_t a1)
{
  int v2 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "analytics timer fired: attempting to surface events",  v4,  2u);
  }

  return [*(id *)(a1 + 32) sendRecordMetricsForService:"kTCCServiceCalendar"];
}

LABEL_15:
  __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TCCDServer logHandle](v2, "logHandle"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_10002317C();
  }

  uint64_t result = (NSString *)_os_crash("failed to realpath user home directory");
  __break(1u);
  return result;
}
}

uint64_t sub_10001D264(uint64_t a1, const char *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _indentForDepth:(*(_DWORD *)(a1 + 48) + 1)]);
  [v6 appendString:v7];

  if (!strcmp(a2, "target_token")
    || !strcmp(a2, "indirect_object_token")
    || !strcmp(a2, "TCCD_MSG_CREDENTIAL_AUTHENTICATOR_AUDIT_TOKEN_KEY"))
  {
    if (xpc_get_type(v5) == (xpc_type_t)&_xpc_type_data)
    {
      if (xpc_data_get_bytes(v5, &buffer, 0LL, 0x20uLL) == 32)
      {
        audit_token_t atoken = buffer;
        audit_token_to_au32(&atoken, &auidp, &euidp, 0LL, 0LL, 0LL, &pidp, 0LL, 0LL);
        objc_msgSend( *(id *)(a1 + 32),  "appendFormat:",  @"%s={pid:%d, auid:%d, euid:%d}",  a2,  pidp,  auidp,  euidp);
      }

      else
      {
        objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"%s={<malformed!>}", a2, v14, v15, v16);
      }
    }

    else
    {
      xpc_type_t type = xpc_get_type(v5);
      __int16 v12 = *(void **)(a1 + 32);
      if (type == (xpc_type_t)&_xpc_type_null) {
        objc_msgSend(v12, "appendFormat:", @"%s={NULL}", a2, v14, v15, v16);
      }
      else {
        objc_msgSend(v12, "appendFormat:", @"%s={<unknown type!>}", a2, v14, v15, v16);
      }
    }

    [*(id *)(a1 + 32) appendString:@"\n"];
  }

  else if (strcmp(a2, "target_csreq"))
  {
    int v8 = strcmp(a2, "extension");
    uint64_t v9 = *(void **)(a1 + 32);
    if (v8)
    {
      __int16 v10 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 40) _descriptionForXPCObject:v5 depth:(*(_DWORD *)(a1 + 48) + 1)]);
      [v9 appendFormat:@"%s=%@\n", a2, v10];
    }

    else
    {
      objc_msgSend(v9, "appendFormat:", @"%s={<redacted>}\n", a2);
    }
  }

  return 1LL;
}

uint64_t sub_10001D70C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _descriptionForXPCObject:a3 depth:*(unsigned int *)(a1 + 56)]);
  [*(id *)(a1 + 40) appendFormat:@"%@[%zu] = %@\n", *(void *)(a1 + 48), a2, v5];

  return 1LL;
}

LABEL_20:
          uint64_t v15 = 0;
          goto LABEL_21;
        }

LABEL_13:
        BOOL v19 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  @"com.apple.private.tcc.manager",  @"check-by-audit-token",  v23);
        goto LABEL_15;
      }

      __int16 v17 = @"delete";
    }

    id v18 = @"expiration";
    goto LABEL_12;
  }

  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TCCDServer logHandle](self, "logHandle"));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138544130;
    int v25 = v10;
    uint64_t v26 = 2114;
    int v27 = v11;
    int v28 = 2114;
    int v29 = v12;
    int v30 = 2114;
    int v31 = @"com.apple.private.tcc.manager";
    _os_log_debug_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "%{public}@ was allowed to call %{public}@ for %{public}@ with the deprecated %{public}@ entitlement",  buf,  0x2Au);
  }

  -[TCCDServer sendAnalyticsForEntitlement:withProcess:service:function:]( self,  "sendAnalyticsForEntitlement:withProcess:service:function:",  @"com.apple.private.tcc.manager",  v10,  v12,  v11);
  -[TCCDServer sendAnalyticsIfMigrationPluginForProcess:withService:API:]( self,  "sendAnalyticsIfMigrationPluginForProcess:withService:API:",  v10,  v12,  v11);
  uint64_t v15 = 1;
LABEL_22:

  return v15;
}

id sub_10001DE10(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) internalPreferenceBoolValueForName:@"generateBacktraceOnPrompt"];
  *(_BYTE *)(*(void *)(a1 + 32) + 40LL) = (_BYTE)result;
  return result;
}

uint64_t sub_10001E544(uint64_t a1)
{
  int v2 = -[NSMutableString initWithString:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithString:",  @"FROM access WHERE service = ? AND strftime('%s','now') - last_modified > ?");
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) logHandle]);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
    *(_DWORD *)buf = 136446466;
    id v20 = "-[TCCDServer purgeExpiredAccessEntriesForService:]_block_invoke";
    __int16 v21 = 2114;
    uint64_t v22 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%{public}s: Recording %{public}@ clients in expired table.",  buf,  0x16u);
  }

  id v5 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"INSERT OR REPLACE INTO expired (service, client, client_type, csreq, last_modified) SELECT service, client, client_type, csreq, last_modified %@", v2));
  id v6 = [v5 UTF8String];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10001E7D8;
  v17[3] = &unk_100064D00;
  id v18 = *(id *)(a1 + 32);
  uint64_t v7 = db_eval_locked((uint64_t)v6, v17, 0LL);

  if (!(_DWORD)v7)
  {
LABEL_7:
    id v8 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"DELETE %@", v2));
    id v9 = [v8 UTF8String];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10001E888;
    v15[3] = &unk_100064D00;
    id v16 = *(id *)(a1 + 32);
    uint64_t v7 = db_eval_locked((uint64_t)v9, v15, 0LL);
    if (!(_DWORD)v7)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_10001E938;
      v13[3] = &unk_100064CD8;
      int8x16_t v12 = *(int8x16_t *)(a1 + 32);
      id v10 = (id)v12.i64[0];
      int8x16_t v14 = vextq_s8(v12, v12, 8uLL);
      uint64_t v7 = db_eval_locked((uint64_t)"SELECT changes()", 0LL, v13);
    }
  }

  return v7;
}

void sub_10001E7D8(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
  if (sqlite3_bind_text( a2,  1,  (const char *)[v4 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) expirySeconds]);
    int v6 = sqlite3_bind_int(a2, 2, (int)[v5 intValue]);

    if (!v6) {
      return;
    }
  }

  _db_error(1);
}

void sub_10001E888(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
  if (sqlite3_bind_text( a2,  1,  (const char *)[v4 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) expirySeconds]);
    int v6 = sqlite3_bind_int(a2, 2, (int)[v5 intValue]);

    if (!v6) {
      return;
    }
  }

  _db_error(1);
}

void sub_10001E938(uint64_t a1, sqlite3_stmt *a2)
{
  int v3 = sqlite3_column_int(a2, 0);
  if (v3 >= 1)
  {
    int v4 = v3;
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) name]);
      int v9 = 136446722;
      id v10 = "-[TCCDServer purgeExpiredAccessEntriesForService:]_block_invoke_3";
      __int16 v11 = 1024;
      int v12 = v4;
      __int16 v13 = 2114;
      int8x16_t v14 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%{public}s: purged %d expired access records for service: %{public}@",  (uint8_t *)&v9,  0x1Cu);
    }

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(-32768LL, 0LL);
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_async(v8, &stru_100065660);
  }

id sub_10001EC8C(uint64_t a1)
{
  return [*(id *)(a1 + 32) purgeExpiredAccessEntriesForService:*(void *)(a1 + 40)];
}

id sub_10001EE94(uint64_t a1)
{
  return [*(id *)(a1 + 32) purgeExpiredAccessEntriesForService:*(void *)(a1 + 40)];
}

LABEL_8:
  return v12;
}
}

  return v5;
}

LABEL_29:
    __int16 v11 = v49;
    if ([v22 right] == (id)1)
    {
      int v33 = objc_claimAutoreleasedReturnValue([v10 accessingProcess]);
      if (v33)
      {
        int v28 = (void *)v33;
        id v34 = (void *)objc_claimAutoreleasedReturnValue([v10 accessingProcess]);
        if (([v34 hasEntitlement:@"com.apple.private.tcc.check-allow-on-responsible-process" containsServiceAllOrService:v12 options:1] & 1) == 0)
        {

LABEL_40:
          goto LABEL_41;
        }

        int v35 = (void *)objc_claimAutoreleasedReturnValue([v10 responsibleProcess]);

        if (!v35) {
          goto LABEL_41;
        }
LABEL_31:
        int v27 = (void *)objc_claimAutoreleasedReturnValue([v10 responsibleProcess]);
        int8x16_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[TCCDServer _evaluateForProcess:entitlementName:containsService:options:]( self,  "_evaluateForProcess:entitlementName:containsService:options:",  v27,  @"com.apple.private.tcc.allow",  v12,  1LL));

        if ([v14 right] == (id)1) {
          goto LABEL_42;
        }
        int v28 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDServer logHandle](self, "logHandle"));
        if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_INFO))
        {
          int v29 = (void *)objc_claimAutoreleasedReturnValue([v14 description]);
          int v30 = (void *)objc_claimAutoreleasedReturnValue([v12 name]);
          int v45 = (void *)objc_claimAutoreleasedReturnValue([v10 accessingProcess]);
          int v47 = a6;
          int v31 = (void *)objc_claimAutoreleasedReturnValue([v45 description]);
          int v43 = (void *)objc_claimAutoreleasedReturnValue([v10 responsibleProcess]);
          int v32 = (void *)objc_claimAutoreleasedReturnValue([v43 description]);
          *(_DWORD *)buf = 138544130;
          int v51 = v29;
          int v52 = 2114;
          int v53 = v30;
          id v54 = 2114;
          id v55 = v31;
          uint64_t v56 = 2114;
          int v57 = v32;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v28,  OS_LOG_TYPE_INFO,  "Auth:%{public}@ to %{public}@ because accessing process %{public}@ has the check-allow-on-responsible-proces s entitlement and responsible process %{public}@ has corresponding allow entitlement",  buf,  0x2Au);

          a6 = v47;
        }

        uint64_t v22 = v14;
        goto LABEL_40;
      }
    }

void sub_10001F84C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

uint64_t sub_10001F874(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10001F884(uint64_t a1)
{
}

void sub_10001F88C(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
  if (sqlite3_bind_text( a2,  1,  (const char *)[v4 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
    goto LABEL_4;
  }

  id v5 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) identifier]);
  if (sqlite3_bind_text( a2,  2,  (const char *)[v5 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {

LABEL_4:
LABEL_5:
    _db_error(1);
    return;
  }

  int v6 = sqlite3_bind_int(a2, 3, (int)objc_msgSend(*(id *)(a1 + 40), "client_type"));

  if (v6) {
    goto LABEL_5;
  }
}

void sub_10001F964(uint64_t a1, sqlite3_stmt *a2)
{
  **(void **)(a1 + 64) = sqlite3_column_int64(a2, 0);
  **(void **)(a1 + 72) = sqlite3_column_int64(a2, 1);
  if (*(void *)(a1 + 80)) {
    **(_DWORD **)(a1 + 80) = sqlite3_column_int(a2, 4);
  }
  if (objc_msgSend( *(id *)(a1 + 32),  "isAccessEntryWithAge:authorizationValue:expiredForService:",  sqlite3_column_int(a2, 3),  **(void **)(a1 + 64),  *(void *)(a1 + 40)))
  {
    id v4 = *(void **)(a1 + 72);
    **(void **)(a1 + 64) = 1LL;
    *id v4 = 5LL;
  }

  else if (sqlite3_column_type(a2, 2) != 5)
  {
    id v5 = sqlite3_column_blob(a2, 2);
    int v6 = sqlite3_column_bytes(a2, 2);
    if (v5 && v6 >= 1)
    {
      uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v5, v6));
      uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8LL);
      int v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;
    }

    else
    {
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1000232E4((id *)(a1 + 40), a1, v10);
      }

      __int16 v11 = *(void **)(a1 + 72);
      **(void **)(a1 + 64) = 0LL;
      *__int16 v11 = 1LL;
    }
  }

void sub_1000203EC(uint64_t a1, sqlite3_stmt *a2)
{
  if (!sqlite3_bind_text( a2, 1, (const char *)[*(id *)(a1 + 32) UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
    id v4 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) identifier]);
    if (sqlite3_bind_text( a2,  2,  (const char *)[v4 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)
      || sqlite3_bind_int(a2, 3, (int)[*(id *)(a1 + 40) identifierAuthority])
      || sqlite3_bind_int64(a2, 4, (sqlite3_int64)[*(id *)(a1 + 48) authorizationValue])
      || sqlite3_bind_int64(a2, 5, (sqlite3_int64)[*(id *)(a1 + 48) authorizationReason])
      || sqlite3_bind_int64(a2, 6, (sqlite3_int64)[*(id *)(a1 + 48) authorizationVersion]))
    {
    }

    else
    {
      int v15 = sqlite3_bind_int(a2, 12, *(_DWORD *)(a1 + 80));

      if (!v15) {
        goto LABEL_9;
      }
    }
  }

  _db_error(1);
LABEL_9:
  if ([*(id *)(a1 + 56) type] == (id)1 && (id v5 = *(void **)(a1 + 64)) != 0)
  {
    int v6 = [v5 identifierAuthority];
    uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) identifier]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) verifierData]);
  }

  else if ([*(id *)(a1 + 56) type] == (id)2)
  {
    uint64_t v7 = (__CFString *)*(id *)(a1 + 72);
    uint64_t v8 = 0LL;
    int v6 = 3;
  }

  else
  {
    int v6 = 0;
    uint64_t v8 = 0LL;
    uint64_t v7 = @"UNUSED";
  }

  if (sqlite3_bind_int(a2, 8, v6)
    || sqlite3_bind_text( a2, 9, (const char *)-[__CFString UTF8String](v7, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)
    || (id v9 = v8,
        sqlite3_bind_blob( a2,  10,  [v9 bytes],  (int)objc_msgSend(v9, "length"),  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)))
  {
    _db_error(1);
  }

  uint64_t v30 = 0LL;
  int v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  int v33 = sub_10001F874;
  id v34 = sub_10001F884;
  id v35 = 0LL;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1000208E4;
  v26[3] = &unk_100065368;
  id v27 = *(id *)(a1 + 32);
  id v28 = *(id *)(a1 + 40);
  id v10 = v7;
  int v29 = v10;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1000209D0;
  v25[3] = &unk_100064C68;
  v25[4] = &v30;
  if (db_eval_locked( (uint64_t)"SELECT csreq FROM access WHERE service = ? AND client = ? AND client_xpc_type_t type = ? AND indire ct_object_identifier = ?",  v26,  v25)) {
    _db_error(1);
  }

  if ([*(id *)(a1 + 40) verifierType] == (id)1
    && (__int16 v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) verifierData]),
        v11,
        v11)
    && (([*(id *)(a1 + 48) replaceStoredCodeRequirement] & 1) != 0 || !v31[5]))
  {
    id v12 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) verifierData]);
  }

  else
  {
    id v12 = (id)v31[5];
  }

  id v13 = v12;
  if (sqlite3_bind_blob( a2,  7,  [v13 bytes],  (int)objc_msgSend(v13, "length"),  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
    _db_error(1);
  }

  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  int v24 = 0;
  if ([*(id *)(a1 + 48) flags])
  {
    int v14 = [*(id *)(a1 + 48) flags];
    *((_DWORD *)v22 + 6) = v14;
  }

  else
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100020A5C;
    v17[3] = &unk_100065368;
    id v18 = *(id *)(a1 + 32);
    id v19 = *(id *)(a1 + 40);
    id v20 = v10;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100020B48;
    v16[3] = &unk_100064C68;
    void v16[4] = &v21;
    if (db_eval_locked( (uint64_t)"SELECT flags FROM access WHERE service = ? AND client = ? AND client_xpc_type_t type = ? AND indi rect_object_identifier = ?",  v17,  v16)) {
      _db_error(1);
    }

    int v14 = *((_DWORD *)v22 + 6);
  }

  sqlite3_bind_int(a2, 11, v14);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v30, 8);
}

void sub_1000208B0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_1000208E4(id *a1, sqlite3_stmt *a2)
{
  if (sqlite3_bind_text( a2, 1, (const char *)[a1[4] UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
    goto LABEL_5;
  }

  id v4 = objc_claimAutoreleasedReturnValue([a1[5] identifier]);
  if (sqlite3_bind_text( a2,  2,  (const char *)[v4 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)
    || sqlite3_bind_int(a2, 3, (int)[a1[5] identifierAuthority]))
  {

LABEL_5:
    _db_error(1);
    return;
  }

  int v5 = sqlite3_bind_text( a2, 4, (const char *)[a1[6] UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  if (v5) {
    goto LABEL_5;
  }
}

void sub_1000209D0(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = sqlite3_column_blob(a2, 0);
  int v5 = sqlite3_column_bytes(a2, 0);
  if (v4)
  {
    if (v5 >= 1)
    {
      uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v4, v5));
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
      uint64_t v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;
    }
  }

void sub_100020A5C(id *a1, sqlite3_stmt *a2)
{
  if (sqlite3_bind_text( a2, 1, (const char *)[a1[4] UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
    goto LABEL_5;
  }

  id v4 = objc_claimAutoreleasedReturnValue([a1[5] identifier]);
  if (sqlite3_bind_text( a2,  2,  (const char *)[v4 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)
    || sqlite3_bind_int(a2, 3, (int)[a1[5] identifierAuthority]))
  {

LABEL_5:
    _db_error(1);
    return;
  }

  int v5 = sqlite3_bind_text( a2, 4, (const char *)[a1[6] UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  if (v5) {
    goto LABEL_5;
  }
}

uint64_t sub_100020B48(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t result = sqlite3_column_int(a2, 0);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

void sub_1000210A4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

sqlite3_int64 sub_1000210C0(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 result = sqlite3_column_int64(a2, 0);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

void sub_1000215BC(uint64_t a1, uint64_t a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) accessRecordFromStep:a2]);
  if (v3)
  {
    id v4 = v3;
    [*(id *)(a1 + 40) addObject:v3];
    int v3 = v4;
  }
}

void sub_1000216BC(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  int v5 = *(void **)(a1 + 32);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a2 descriptionDictionary]);
  [v5 addObject:v6];

  *a4 = 0;
}

void sub_1000217EC(uint64_t a1, sqlite3_stmt *a2)
{
  int v3 = sqlite3_column_text(a2, 0);
  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v3));
    [v4 addObject:v5];
  }

void sub_100021940(uint64_t a1, sqlite3_stmt *a2)
{
  v13[0] = @"id";
  id v4 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", sqlite3_column_int(a2, 0));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v14[0] = v5;
  v13[1] = @"bundle_id";
  uint64_t v6 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", sqlite3_column_text(a2, 1));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v14[1] = v7;
  v13[2] = @"uuid";
  uint64_t v8 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", sqlite3_column_text(a2, 2));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v14[2] = v9;
  v13[3] = @"display";
  id v10 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", sqlite3_column_text(a2, 3));
  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v14[3] = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  4LL));

  [*(id *)(a1 + 32) addObject:v12];
}

void sub_100021BA0(uint64_t a1, sqlite3_stmt *a2)
{
  v9[0] = @"client";
  id v4 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", sqlite3_column_text(a2, 0));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v9[1] = @"policy_id";
  v10[0] = v5;
  uint64_t v6 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", sqlite3_column_int(a2, 2));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v10[1] = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  2LL));

  [*(id *)(a1 + 32) addObject:v8];
}

_DWORD *sub_100021F08(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(a2 + 16) & 0xFFFFFFFE) != 2) {
    return 0LL;
  }
  int v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stateDumpDictionary]);
  id v11 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v3,  200LL,  0LL,  &v11));
  id v5 = v11;
  if (v5)
  {
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000238E8();
    }
  }

  if ((unint64_t)[v4 length] >> 32)
  {
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000238AC(v9);
    }
    uint64_t v8 = 0LL;
  }

  else
  {
    unsigned int v7 = [v4 length];
    uint64_t v8 = calloc(1uLL, v7 + 200LL);
    _DWORD *v8 = 1;
    v8[1] = v7;
    __strlcpy_chk(v8 + 34, "tccd database", 64LL, 64LL);
    memcpy(v8 + 50, [v4 bytes], v7);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100023848();
    }
  }

  return v8;
}

void sub_100022434(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
  id v5 = (const char *)[v4 UTF8String];
  if (!v5) {
    id v5 = (const char *)[*(id *)(a1 + 40) UTF8String];
  }
  if (!sqlite3_bind_text(a2, 1, v5, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) subjectIdentity]);
    id v7 = objc_claimAutoreleasedReturnValue([v6 identifier]);
    if (!sqlite3_bind_text( a2,  2,  (const char *)[v7 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) subjectIdentity]);
      if (!sqlite3_bind_int(a2, 3, (int)objc_msgSend(v8, "client_type"))
        && !sqlite3_bind_int64(a2, 4, *(void *)(a1 + 72))
        && !sqlite3_bind_int64(a2, 5, (sqlite3_int64)[*(id *)(a1 + 56) authorizationReason])
        && !sqlite3_bind_int64(a2, 6, (sqlite3_int64)[*(id *)(a1 + 56) authorizationVersion])
        && !sqlite3_bind_text(a2, 9, "UNUSED", -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)
        && !sqlite3_bind_int(a2, 10, *(_DWORD *)(a1 + 80))
        && !sqlite3_bind_int(a2, 14, (int)[*(id *)(a1 + 56) lastReminderTime]))
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) subjectIdentity]);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "policy_id"));
        int v12 = sub_1000226D8(a2, v11);

        if (!v12) {
          goto LABEL_16;
        }
        goto LABEL_15;
      }
    }
  }

LABEL_15:
  _db_error(1);
LABEL_16:
  if (sqlite3_bind_null(a2, 11) || sqlite3_bind_null(a2, 12) || sqlite3_bind_null(a2, 13)) {
    _db_error(1);
  }
  id v9 = *(void **)(a1 + 64);
  if (v9)
  {
    if (sqlite3_bind_blob( a2, 7, [v9 bytes], (int)objc_msgSend(*(id *)(a1 + 64), "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      goto LABEL_24;
    }
  }

  else if (sqlite3_bind_null(a2, 7))
  {
LABEL_24:
    _db_error(1);
  }

uint64_t sub_1000226D8(sqlite3_stmt *a1, void *a2)
{
  if (a2) {
    return sqlite3_bind_int64(a1, 8, (sqlite3_int64)[a2 longLongValue]);
  }
  else {
    return sqlite3_bind_null(a1, 8);
  }
}

void sub_1000229F8(_Unwind_Exception *a1)
{
}

void sub_100022A28(uint64_t a1, sqlite3_stmt *a2)
{
  int v3 = sqlite3_column_text(a2, 0);
  uint64_t v4 = sqlite3_column_int(a2, 1);
  sqlite3_int64 v5 = sqlite3_column_int64(a2, 2);
  uint64_t v6 = sqlite3_column_text(a2, 6);
  uint64_t v7 = sqlite3_column_int(a2, 7);
  sqlite3_int64 v8 = sqlite3_column_int64(a2, 9);
  sqlite3_int64 v9 = sqlite3_column_int64(a2, 10);
  uint64_t v10 = sqlite3_column_int(a2, 11);
  v21[0] = @"subject_ID";
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v3));
  v22[0] = v11;
  v21[1] = @"subject_ID_type";
  int v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v4));
  v22[1] = v12;
  v21[2] = @"authorization_value";
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v5));
  v22[2] = v13;
  v21[3] = @"indirect_object_id";
  int v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v6));
  v22[3] = v14;
  v21[4] = @"indirect_object_type";
  int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v7));
  v22[4] = v15;
  v21[5] = @"auth_reason";
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v8));
  v22[5] = v16;
  v21[6] = @"auth_version";
  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v9));
  v22[6] = v17;
  v21[7] = @"flags";
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v10));
  v22[7] = v18;
  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  8LL));

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v19];
}

void sub_100022CC0(uint64_t a1, sqlite3_stmt *a2)
{
}

void sub_100022E30(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

void sub_100022E4C(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

void sub_100022E68(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

  ;
}

void sub_100022EB0(uint64_t a1, int a2, os_log_s *a3)
{
  sqlite3_int64 v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) bundleIdentifier]);
  sub_100022E9C();
  int v8 = a2;
  sub_100022E30((void *)&_mh_execute_header, a3, v6, "Unable to kill %{public}@ (%d)", v7);

  sub_1000110B8();
}

void sub_100022F40(void *a1, os_log_s *a2)
{
}

void sub_100022FC0()
{
  int v3 = v0;
  sub_100022E30((void *)&_mh_execute_header, v1, (uint64_t)v1, "Failed to post notification: %s, status=%d", v2);
  sub_100004C7C();
}

void sub_10002302C()
{
}

void sub_100023044()
{
}

void sub_10002305C()
{
}

void sub_100023074()
{
}

void sub_10002308C(os_log_s *a1)
{
}

void sub_100023104(os_log_s *a1)
{
}

void sub_10002317C()
{
  sub_1000110A0((void *)&_mh_execute_header, v0, (uint64_t)v0, "failed to realpath %{public}s: error=%{public}@", v1);
  sub_100004C7C();
}

void sub_1000231E4()
{
  sub_100022E68((void *)&_mh_execute_header, v0, (uint64_t)v0, "Found BOOLean preference value: %{public}@=%{BOOL}d", v1);
  sub_100004C7C();
}

void sub_10002324C(void *a1, os_log_s *a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 identifier]);
  [a1 pid];
  int v6 = 138543618;
  uint64_t v7 = v4;
  sub_100022E58();
  sub_100022E68((void *)&_mh_execute_header, a2, v5, "Process %{public}@[%d] is a composition manager.", (uint8_t *)&v6);

  sub_1000110B8();
}

void sub_1000232E4(id *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*a1 name]);
  int v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a2 + 48) identifier]);
  int v8 = 138543618;
  sqlite3_int64 v9 = v5;
  sub_100022E3C();
  sub_1000110A0( (void *)&_mh_execute_header,  a3,  v7,  "Stored code identity data is invalid for: Service: %{public}@), client: %{public}@",  (uint8_t *)&v8);

  sub_1000110B8();
}

void sub_10002338C(void *a1, void *a2, os_log_s *a3)
{
  id v5 = [a1 type];
  int v6 = (void *)objc_claimAutoreleasedReturnValue([a2 description]);
  int v8 = 134218242;
  id v9 = v5;
  sub_100022E3C();
  sub_1000110A0( (void *)&_mh_execute_header,  a3,  v7,  "Update Access Record: Unexpected indirect object identity type: %ld; for: %{public}@",
    (uint8_t *)&v8);

  sub_1000110B8();
}

void sub_100023428(void *a1, os_log_s *a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 subjectIdentity]);
  id v5 = [v4 identityType];
  int v6 = (void *)objc_claimAutoreleasedReturnValue([a1 description]);
  int v8 = 134218242;
  id v9 = v5;
  sub_100022E3C();
  sub_1000110A0( (void *)&_mh_execute_header,  a2,  v7,  "Update Access Record: Unexpected identity type: %ld; for: %{public}@",
    (uint8_t *)&v8);

  sub_1000110B8();
}

void sub_1000234D4()
{
  int v2 = 136446466;
  int v3 = "-[TCCDServer evaluateComposedAuthorizationToService:andAccessSubject:withRelation:authorizationResult:authorizati"
       "onReason:subjectCodeIdentityDataResult:]";
  sub_100022E3C();
  sub_1000110A0((void *)&_mh_execute_header, v0, v1, "%{public}s: %{public}@", (uint8_t *)&v2);
  sub_100004C7C();
}

void sub_100023548()
{
  int v2 = 136446466;
  int v3 = "-[TCCDServer numberOfRecordsForService:withAuthorizationValue:]";
  sub_100022E3C();
  sub_1000110A0( (void *)&_mh_execute_header,  v0,  v1,  "%{public}s: database access error for: %{public}@",  (uint8_t *)&v2);
  sub_100004C7C();
}

void sub_1000235BC()
{
}

void sub_100023620()
{
}

void sub_100023688()
{
}

void sub_1000236EC()
{
  int v2 = 136446466;
  int v3 = "-[TCCDServer fetchAllOverriddenServiceNames]";
  sub_100022E58();
  sub_100022E30( (void *)&_mh_execute_header,  v0,  v1,  "%{public}s: database access error for access_overrides: %d",  (uint8_t *)&v2);
  sub_100004C7C();
}

void sub_100023760()
{
  int v2 = 136446466;
  int v3 = "-[TCCDServer fetchAllPolicies]";
  sub_100022E58();
  sub_100022E30( (void *)&_mh_execute_header,  v0,  v1,  "%{public}s: database access error for policies: %d",  (uint8_t *)&v2);
  sub_100004C7C();
}

void sub_1000237D4()
{
  int v2 = 136446466;
  int v3 = "-[TCCDServer fetchAllActivePolicies]";
  sub_100022E58();
  sub_100022E30( (void *)&_mh_execute_header,  v0,  v1,  "%{public}s: database access error for policies: %d",  (uint8_t *)&v2);
  sub_100004C7C();
}

void sub_100023848()
{
}

void sub_1000238AC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Error serializing state data for tccd state dump: data size greater than UINT32_MAX",  v1,  2u);
  sub_100004C60();
}

void sub_1000238E8()
{
}

void sub_10002394C(void *a1, os_log_s *a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue([a1 subjectIdentity]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  sub_1000110AC();
  sub_100004C90( (void *)&_mh_execute_header,  a2,  v5,  "prompt type is upgrade but received a auth result of deny: %@",  v6);

  sub_1000110B8();
}

void sub_100024414(id a1)
{
  uint64_t v1 = -[UNUserNotificationCenter initWithBundleIdentifier:]( objc_alloc(&OBJC_CLASS___UNUserNotificationCenter),  "initWithBundleIdentifier:",  @"com.apple.tccd");
  int v2 = (void *)qword_100078310;
  qword_100078310 = (uint64_t)v1;

  int v3 = objc_opt_new(&OBJC_CLASS___TCCUserNotificationDelegate);
  uint64_t v4 = (void *)qword_100078318;
  qword_100078318 = (uint64_t)v3;

  [(id)qword_100078310 setDelegate:qword_100078318];
  [(id)qword_100078310 setWantsNotificationResponsesDelivered];
}

void sub_100024480(id a1, NSError *a2)
{
  int v2 = a2;
  if (v2)
  {
    id v3 = tcc_access_log();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100025DD4((uint64_t)v2, v4, v5);
    }
  }
}

void sub_100025638(id a1)
{
  dispatch_semaphore_t v1 = dispatch_semaphore_create(1LL);
  int v2 = (void *)qword_100078328;
  qword_100078328 = (uint64_t)v1;

  if (!v1) {
    sub_100026094();
  }
  dispatch_semaphore_t v3 = dispatch_semaphore_create(1LL);
  uint64_t v4 = (void *)qword_100078330;
  qword_100078330 = (uint64_t)v3;

  if (!v3) {
    sub_100026094();
  }
}

id sub_1000256F8()
{
  if (qword_100078350 != -1) {
    dispatch_once(&qword_100078350, &stru_1000658A8);
  }
  return (id)qword_100078348;
}

void sub_100025738(const char *a1, const char *a2)
{
  id v4 = tcc_access_log();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    int v25 = "notificationResponseHandler";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "user responded to notification for %{public}@ with %{public}@",  buf,  0xCu);
  }

  int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](&OBJC_CLASS___NSValue, "valueWithPointer:", a1));
  id v7 = sub_1000256F8();
  int v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v6]);
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:0]);

  id v11 = sub_1000256F8();
  int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v6]);
  int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:1]);

  id v15 = tcc_access_log();
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
  if (v10)
  {
    if (v17)
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v14 service]);
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 name]);
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v14 subjectIdentity]);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 identifier]);
      *(_DWORD *)buf = 134218498;
      int v25 = a2;
      __int16 v26 = 2114;
      id v27 = v19;
      __int16 v28 = 2114;
      int v29 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s: failed to instantiate notification center",  buf,  0x20u);
    }

    id v22 = sub_1000256F8();
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    [v23 removeObjectForKey:v6];

    __asm { BR              X10 }
  }

  if (v17)
  {
    *(_DWORD *)buf = 138412290;
    int v25 = a1;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s: called for %@", buf, 0xCu);
  }
}

void sub_100025BD0(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
  int v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) attributionChain]);
  dispatch_semaphore_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 accessingProcess]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) service]);
  [v5 runBacktraceToolOnProcess:v3 forService:v4];
}

void sub_100025C5C(id a1)
{
  dispatch_semaphore_t v1 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  int v2 = (void *)qword_100078348;
  qword_100078348 = (uint64_t)v1;
}

void sub_100025C84( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100025CF4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100025D64( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100025DD4(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 136315394;
  id v4 = "-[TCCDRequestContext(AsynchronousNotification) presentAsynchronousDenialNotificationWithMessage:buttonTitle:]_block_invoke";
  __int16 v5 = 2114;
  uint64_t v6 = a1;
  sub_1000110A0((void *)&_mh_execute_header, a2, a3, "%s: failed to add user notification: %{public}@", (uint8_t *)&v3);
  sub_100004C7C();
}

void sub_100025E50(void *a1, void *a2, os_log_s *a3)
{
  __int16 v5 = (void *)objc_claimAutoreleasedReturnValue([a1 name]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a2 identityDescription]);
  int v8 = 138543618;
  id v9 = v5;
  __int16 v10 = 2114;
  id v11 = v6;
  sub_1000110A0( (void *)&_mh_execute_header,  a3,  v7,  "Failed to construct localized notification string for service %{public}@ and subject %{public}@",  (uint8_t *)&v8);
}

void sub_100025F08()
{
  __assert_rtn("display_prompt", "TCCDRequestContext+Prompt.m", 306, "header != nil");
}

void sub_100025F30()
{
  __assert_rtn("display_prompt", "TCCDRequestContext+Prompt.m", 307, "aButtonTitle != nil");
}

void sub_100025F58()
{
  __assert_rtn("display_prompt", "TCCDRequestContext+Prompt.m", 308, "bButtonTitle != nil");
}

void sub_100025F80(os_log_t log)
{
  *(_WORD *)dispatch_semaphore_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Creating reminder notification", v1, 2u);
}

void sub_100025FC0(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "notification_dictionary: %@",  (uint8_t *)&v2,  0xCu);
  sub_100004C7C();
}

void sub_100026030( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100026094()
{
}

_DWORD *sub_100026524(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(a2 + 16) & 0xFFFFFFFE) == 2)
  {
    uint64_t v17 = 0LL;
    id v18 = &v17;
    uint64_t v19 = 0x3032000000LL;
    id v20 = sub_1000267F4;
    uint64_t v21 = sub_100026804;
    id v22 = 0LL;
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(dispatch_queue_s **)(v3 + 56);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10002680C;
    block[3] = &unk_1000658D0;
    block[4] = v3;
    void block[5] = &v17;
    dispatch_sync(v4, block);
    uint64_t v5 = v18[5];
    id v15 = 0LL;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v5,  200LL,  0LL,  &v15));
    id v7 = v15;
    if (v7)
    {
      int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100027F2C();
      }
    }

    else if ((unint64_t)[v6 length] >> 32)
    {
      int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100027EB0(v8);
      }
    }

    else
    {
      unsigned int v10 = [v6 length];
      id v11 = calloc(1uLL, v10 + 200LL);
      id v9 = v11;
      if (v11)
      {
        *id v11 = 1;
        v11[1] = v10;
        __strlcpy_chk(v11 + 34, "tccd AdhocSignatureCache", 64LL, 64LL);
        memcpy(v9 + 50, [v6 bytes], v10);
        int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          unsigned int v24 = v10;
          _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "AdhocSignatureCache dump of %u bytes",  buf,  8u);
        }

        goto LABEL_15;
      }

      int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v12 = __error();
        uint64_t v13 = strerror(*v12);
        sub_100027EF0((uint64_t)v13, (uint64_t)buf, v8);
      }
    }

    id v9 = 0LL;
LABEL_15:

    _Block_object_dispose(&v17, 8);
    return v9;
  }

  return 0LL;
}

void sub_1000267B8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_1000267F4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100026804(uint64_t a1)
{
}

void sub_10002680C(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stateDump]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_1000271CC(uint64_t a1)
{
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 8LL);
  id v3 = [v2 countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (!v3)
  {
LABEL_27:

    return;
  }

  id v4 = v3;
  uint64_t v5 = 0LL;
  uint64_t v6 = *(void *)v39;
  do
  {
    for (unint64_t i = 0LL; i != v4; unint64_t i = (char *)i + 1)
    {
      if (*(void *)v39 != v6) {
        objc_enumerationMutation(v2);
      }
      int v8 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:*(void *)(*((void *)&v38 + 1) + 8 * (void)i)]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"Size"]);
      uint64_t v5 = &v5[(void)[v9 unsignedIntegerValue]];
    }

    id v4 = [v2 countByEnumeratingWithState:&v38 objects:v47 count:16];
  }

  while (v4);

  unsigned int v10 = *(void **)(a1 + 32);
  if ((unint64_t)v5 > v10[3])
  {
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 logHandle]);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = *(void **)(*(void *)(a1 + 32) + 24LL);
      *(_DWORD *)buf = 134218240;
      int v44 = v5;
      __int16 v45 = 2048;
      id v46 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Cache size exceeds capacity, evicting lru items: cacheSize=%lu _capacity=%lu",  buf,  0x16u);
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1 + 32) + 8) keysSortedByValueUsingComparator:&stru_100065910]);
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    id v2 = v13;
    id v31 = [v2 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v31)
    {
      uint64_t v30 = *(void *)v35;
      *(void *)&__int128 v14 = 138543618LL;
      __int128 v29 = v14;
      do
      {
        for (j = 0LL; j != v31; j = (char *)j + 1)
        {
          if (*(void *)v35 != v30) {
            objc_enumerationMutation(v2);
          }
          id v16 = *(char **)(*((void *)&v34 + 1) + 8LL * (void)j);
          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "objectForKeyedSubscript:", v16, v29));
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:@"UUID"]);
          id v18 = *(void **)(*(void *)(a1 + 32) + 32LL);
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v17 UUIDString]);
          id v20 = (void *)objc_claimAutoreleasedReturnValue([v18 stringByAppendingPathComponent:v19]);

          uint64_t v21 = *(void **)(*(void *)(a1 + 32) + 48LL);
          id v33 = 0LL;
          unsigned __int8 v22 = [v21 removeItemAtPath:v20 error:&v33];
          id v23 = v33;
          unsigned int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
          int v25 = v24;
          if ((v22 & 1) != 0)
          {
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v29;
              int v44 = v16;
              __int16 v45 = 2114;
              id v46 = v20;
              _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "Evicted cached signature: key=%{public}@, path=%{public}@",  buf,  0x16u);
            }

            [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:v16];
            [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:v17];
            __int16 v26 = v32;
            id v27 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:@"Size"]);
            v5 -= (unint64_t)[v27 unsignedIntegerValue];
            unint64_t v28 = *(void *)(*(void *)(a1 + 32) + 24LL);

            if ((unint64_t)v5 < v28)
            {

              goto LABEL_26;
            }
          }

          else
          {
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v29;
              int v44 = (char *)v20;
              __int16 v45 = 2114;
              id v46 = v23;
              _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "Error removing item %{public}@: %{public}@",  buf,  0x16u);
            }

            __int16 v26 = v32;
          }
        }

        id v31 = [v2 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }

      while (v31);
    }

LABEL_26:
    [*(id *)(a1 + 32) saveKeysToDirectory];
    goto LABEL_27;
  }

  id v18 = -[NSMutableDictionary copy](v3, "copy");

  return v18;
}

int64_t sub_100027600(id a1, id a2, id a3)
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a2 objectForKey:@"LastUsed"]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"LastUsed"]);

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

void sub_100027764( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10002777C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:*(void *)(a1 + 40)]);
  id v3 = v2;
  if (v2)
  {
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"UUID"]);
    uint64_t v5 = objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 16) objectForKey:v4]);
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    int v8 = *(void **)(a1 + 32);
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL))
    {
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 logHandle]);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        sub_100028634();
      }
    }

    else
    {
      uint64_t v10 = objc_claimAutoreleasedReturnValue([v8 loadSignatureWithUUID:v4]);
      uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8LL);
      int v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL))
      {
        uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          sub_1000285D4();
        }

        [*(id *)(*(void *)(a1 + 32) + 16) setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKey:v4];
      }
    }

    __int128 v14 = *(void **)(a1 + 32);
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL))
    {
      id v15 = (dispatch_queue_s *)v14[7];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_100027994;
      v19[3] = &unk_1000656B0;
      id v16 = v3;
      uint64_t v17 = *(void *)(a1 + 32);
      id v20 = v16;
      uint64_t v21 = v17;
      dispatch_async(v15, v19);
      id v18 = v20;
    }

    else
    {
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 logHandle]);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100028570();
      }
    }
  }

  else
  {
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_100028510();
    }
  }
}

void sub_100027994(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [*(id *)(a1 + 32) setObject:v2 forKeyedSubscript:@"LastUsed"];

  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"UsedCount"]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  (char *)[v4 integerValue] + 1));
  [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:@"UsedCount"];

  [*(id *)(a1 + 40) saveKeysToDirectory];
}

void sub_100027B08(uint64_t a1)
{
  id v2 = (uint64_t *)(a1 + 40);
  uint64_t v3 = objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:*(void *)(a1 + 40)]);
  if (v3)
  {
    id v4 = (void *)v3;
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100028694();
    }
  }

  else
  {
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [*(id *)(a1 + 48) length]));
    v15[0] = @"UUID";
    v15[1] = @"Created";
    v16[0] = v5;
    v16[1] = v6;
    v15[2] = @"LastUsed";
    v15[3] = @"UsedCount";
    v16[2] = v6;
    v16[3] = &off_10006C848;
    void v15[4] = @"Size";
    void v16[4] = v7;
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  5LL));
    int v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v4));
    [*(id *)(*(void *)(a1 + 32) + 8) setObject:v8 forKeyedSubscript:*(void *)(a1 + 40)];

    objc_msgSend( *(id *)(*(void *)(a1 + 32) + 16),  "setObject:forKey:cost:",  *(void *)(a1 + 48),  v5,  objc_msgSend(v7, "unsignedIntegerValue"));
    [*(id *)(a1 + 32) saveKeysToDirectory];
    [*(id *)(a1 + 32) saveSignature:*(void *)(a1 + 48) withUUID:v5];
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *v2;
      int v11 = 138543618;
      uint64_t v12 = v10;
      __int16 v13 = 2114;
      __int128 v14 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Added signature: key=%{public}@ UUID=%{public}@",  (uint8_t *)&v11,  0x16u);
    }

    [*(id *)(a1 + 32) maintainSize];
  }
}

void sub_100027DB8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TCC", "AdhocSignatureCache");
  id v2 = (void *)qword_100078360;
  qword_100078360 = (uint64_t)v1;
}

void sub_100027DE8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

  ;
}

void sub_100027E2C(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(va, 8) = a1;
}

  ;
}

char *sub_100027E44()
{
  return strerror(v0);
}

void sub_100027E50()
{
}

void sub_100027EB0(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Error serializing state data for tccd state dump: data size greater than UINT32_MAX",  v1,  2u);
}

void sub_100027EF0(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(void *)(a2 + 4) = a1;
  sub_100004C90( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Error allocating memory for os_state_data_t: %s",  (uint8_t *)a2);
}

void sub_100027F2C()
{
}

void sub_100027F90()
{
}

void sub_100027FF0()
{
}

void sub_100028050()
{
}

void sub_1000280B0()
{
}

void sub_100028114()
{
}

void sub_100028174()
{
}

void sub_1000281D4(void *a1, os_log_s *a2)
{
  sub_100004C90( (void *)&_mh_execute_header,  a2,  v3,  "Failed to collect mount relative tracking info: path=%{public}s",  v4);
  sub_1000110E8();
}

void sub_10002824C(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_100027E44();
  sub_100027E14();
  sub_1000110A0( (void *)&_mh_execute_header,  v2,  v4,  "Failed to get path attributes: path=%{public}s error=%{public}s",  v5);

  sub_1000110B8();
}

void sub_1000282D0()
{
  sub_100019A78( (void *)&_mh_execute_header,  v0,  v1,  "No persistent object ids for volume: volumePath=%{public}s",  v2,  v3,  v4,  v5,  v6);
  sub_100004C7C();
}

void sub_100028330()
{
  sub_100019A78((void *)&_mh_execute_header, v0, v1, "No UUID for volume: volumePath=%{public}s", v2, v3, v4, v5, v6);
  sub_100004C7C();
}

void sub_100028390(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_100027E44();
  sub_100027E14();
  sub_1000110A0( (void *)&_mh_execute_header,  v2,  v4,  "Failed to get volume attributes: volumePath=%{public}s error=%{public}s",  v5);

  sub_1000110B8();
}

void sub_100028414(void *a1, os_log_s *a2)
{
  id v3 = __error();
  strerror(*v3);
  sub_100027E14();
  sub_1000110A0((void *)&_mh_execute_header, a2, v4, "Failed to stat path: path=%{public}s error=%{public}s", v5);
  sub_1000110E8();
}

void sub_10002849C(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "SecCodeCopyPath failed: result=%d",  (uint8_t *)v2,  8u);
}

void sub_100028510()
{
  sub_100019A78((void *)&_mh_execute_header, v0, v1, "No cache entry found: key=%{public}@", v2, v3, v4, v5, v6);
  sub_100004C7C();
}

void sub_100028570()
{
  sub_100004C90((void *)&_mh_execute_header, v0, v1, "No signature found: UUID=%{public}@", v2);
  sub_100004C7C();
}

void sub_1000285D4()
{
  sub_100019A78( (void *)&_mh_execute_header,  v0,  v1,  "Got signature from on-disk cache: key=%{public}@",  v2,  v3,  v4,  v5,  v6);
  sub_100004C7C();
}

void sub_100028634()
{
  sub_100019A78( (void *)&_mh_execute_header,  v0,  v1,  "Got signature from in-memory cache: key=%{public}@",  v2,  v3,  v4,  v5,  v6);
  sub_100004C7C();
}

void sub_100028694()
{
  sub_100004C90((void *)&_mh_execute_header, v0, v1, "Rejecting request to update signature: key=%{public}@", v2);
  sub_100004C7C();
}

void sub_100028738(id a1)
{
  uint64_t v1 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  uint64_t v2 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceAll",  &off_10006BD90);
  -[NSMutableSet addObject:](v1, "addObject:", v2);
  uint64_t v3 = (void *)qword_100078378;
  qword_100078378 = (uint64_t)v2;
  uint64_t v4 = v2;

  uint64_t v5 = objc_alloc(&OBJC_CLASS___TCCDService);
  uint8_t v6 = -[TCCDService initWithName:availability:]( v5,  "initWithName:availability:",  @"kTCCServiceAddressBook",  &off_10006BDB8);
  -[TCCDService setUsageDescriptionKeyName:](v6, "setUsageDescriptionKeyName:", @"NSContactsUsageDescription");
  -[TCCDService setMacos_pardonMissingUsage:](v6, "setMacos_pardonMissingUsage:", 1LL);
  -[TCCDService setShouldIssueSandboxExtension:](v6, "setShouldIssueSandboxExtension:", 1LL);
  -[TCCDService setMacos_helpAnchor:](v6, "setMacos_helpAnchor:", @"mh40711");
  -[TCCDService setMacos_hardenedRuntimeEntitlementName:]( v6,  "setMacos_hardenedRuntimeEntitlementName:",  @"com.apple.security.personal-information.addressbook");
  if (_os_feature_enabled_impl("Contacts", "LimitedAccess"))
  {
    -[TCCDService setAuthorizationVersionNumber:](v6, "setAuthorizationVersionNumber:", 1LL);
    -[TCCDService setDefaultDesiredAuth:](v6, "setDefaultDesiredAuth:", 2LL);
    -[TCCDService setAuthorizationRightsMask:](v6, "setAuthorizationRightsMask:", 7LL);
    -[TCCDService _makePromptAuthorizationChoiceBlock:](v6, "_makePromptAuthorizationChoiceBlock:", &stru_100065A28);
    -[TCCDService _makePromptButtonLocalizationKeyBlock:](v6, "_makePromptButtonLocalizationKeyBlock:", &stru_100065A68);
  }

  -[NSMutableSet addObject:](v1, "addObject:", v6);
  id v7 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceContactsLimited",  &off_10006BDE0);

  -[TCCDService setUsageDescriptionKeyName:](v7, "setUsageDescriptionKeyName:", @"NSContactsUsageDescription");
  -[TCCDService setMacos_pardonMissingUsage:](v7, "setMacos_pardonMissingUsage:", 1LL);
  -[TCCDService setShouldIssueSandboxExtension:](v7, "setShouldIssueSandboxExtension:", 1LL);
  -[TCCDService setMacos_helpAnchor:](v7, "setMacos_helpAnchor:", @"mh40711");
  -[TCCDService setMacos_hardenedRuntimeEntitlementName:]( v7,  "setMacos_hardenedRuntimeEntitlementName:",  @"com.apple.security.personal-information.addressbook");
  -[TCCDService setShouldTreatAsDeprecated:](v7, "setShouldTreatAsDeprecated:", 1LL);
  -[NSMutableSet addObject:](v1, "addObject:", v7);
  int v8 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceContactsFull",  &off_10006BE08);

  -[TCCDService setUsageDescriptionKeyName:](v8, "setUsageDescriptionKeyName:", @"NSContactsUsageDescription");
  -[TCCDService setMacos_pardonMissingUsage:](v8, "setMacos_pardonMissingUsage:", 1LL);
  -[TCCDService setShouldIssueSandboxExtension:](v8, "setShouldIssueSandboxExtension:", 1LL);
  -[TCCDService setMacos_helpAnchor:](v8, "setMacos_helpAnchor:", @"mh40711");
  -[TCCDService setMacos_hardenedRuntimeEntitlementName:]( v8,  "setMacos_hardenedRuntimeEntitlementName:",  @"com.apple.security.personal-information.addressbook");
  -[TCCDService setShouldTreatAsDeprecated:](v8, "setShouldTreatAsDeprecated:", 1LL);
  -[NSMutableSet addObject:](v1, "addObject:", v8);
  id v9 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceCalendar",  &off_10006BE30);

  -[TCCDService setUsageDescriptionKeyName:](v9, "setUsageDescriptionKeyName:", @"NSCalendarsUsageDescription");
  -[TCCDService setMacos_pardonMissingUsage:](v9, "setMacos_pardonMissingUsage:", 1LL);
  -[TCCDService setMacos_helpAnchor:](v9, "setMacos_helpAnchor:", @"mh43609");
  -[TCCDService setMacos_hardenedRuntimeEntitlementName:]( v9,  "setMacos_hardenedRuntimeEntitlementName:",  @"com.apple.security.personal-information.calendars");
  -[TCCDService setAddModifyAddedAuthorizationButtonTitleLocalizationKey:]( v9,  "setAddModifyAddedAuthorizationButtonTitleLocalizationKey:",  @"REQUEST_ACCESS_ADD_MODIFY_ADDED");
  -[TCCDService setRequestFullTitleTextLocalizationKey:]( v9,  "setRequestFullTitleTextLocalizationKey:",  @"REQUEST_ACCESS_SERVICE_kTCCServiceCalendar_FULL");
  -[TCCDService setRequestAddTitleTextLocalizationKey:]( v9,  "setRequestAddTitleTextLocalizationKey:",  @"REQUEST_ACCESS_SERVICE_kTCCServiceCalendar_ADD");
  -[TCCDService setRequestUpgradeTitleTextLocalizationKey:]( v9,  "setRequestUpgradeTitleTextLocalizationKey:",  @"REQUEST_ACCESS_UPGRADE_kTCCServiceCalendar");
  -[TCCDService setSettingsRequestFullTitleTextLocalizationKey:]( v9,  "setSettingsRequestFullTitleTextLocalizationKey:",  @"REQUEST_ACCESS_SETTINGS_FULL_kTCCServiceCalendar");
  -[TCCDService setFullAccessUsageDescriptionKeyName:]( v9,  "setFullAccessUsageDescriptionKeyName:",  @"NSCalendarsFullAccessUsageDescription");
  -[TCCDService setAddAccessUsageDescriptionKeyName:]( v9,  "setAddAccessUsageDescriptionKeyName:",  @"NSCalendarsWriteOnlyAccessUsageDescription");
  -[TCCDService setAuthorizationRightsMask:](v9, "setAuthorizationRightsMask:", 23LL);
  -[TCCDService setSupportsStagedPrompting:](v9, "setSupportsStagedPrompting:", 1LL);
  -[TCCDService setAuthorizationVersionNumber:](v9, "setAuthorizationVersionNumber:", 2LL);
  -[TCCDService setDefaultDesiredAuth:](v9, "setDefaultDesiredAuth:", 4LL);
  -[TCCDService _makePromptAuthorizationChoiceBlock:](v9, "_makePromptAuthorizationChoiceBlock:", &stru_100065A88);
  -[TCCDService _makePromptButtonLocalizationKeyBlock:](v9, "_makePromptButtonLocalizationKeyBlock:", &stru_100065AA8);
  id v206 = &off_10006C8F0;
  id v207 = @"com.apple.EventKitTCCUI.EventKitTCCFullAccessNotificationUIExtension";
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v207,  &v206,  1LL));
  -[TCCDService setAuthSpecificNotificationExtensionBundleIdentifier:]( v9,  "setAuthSpecificNotificationExtensionBundleIdentifier:",  v10);

  -[TCCDService _makeAuthTranslationBlock:](v9, "_makeAuthTranslationBlock:", &stru_100065AE8);
  v198[0] = _NSConcreteStackBlock;
  v198[1] = 3221225472LL;
  v198[2] = sub_10002B35C;
  v198[3] = &unk_100065B10;
  unsigned int v199 = v9;
  int v11 = v9;
  id v189 = objc_retainBlock(v198);
  -[TCCDService _makeAnalyticsPopulationBlock:](v11, "_makeAnalyticsPopulationBlock:");
  -[NSMutableSet addObject:](v1, "addObject:", v11);
  uint64_t v12 = objc_alloc(&OBJC_CLASS___TCCDService);

  __int16 v13 = -[TCCDService initWithName:availability:]( v12,  "initWithName:availability:",  @"kTCCServiceReminders",  &off_10006BE58);
  -[TCCDService setUsageDescriptionKeyName:](v13, "setUsageDescriptionKeyName:", @"NSRemindersUsageDescription");
  -[TCCDService setMacos_pardonMissingUsage:](v13, "setMacos_pardonMissingUsage:", 1LL);
  -[TCCDService setMacos_helpAnchor:](v13, "setMacos_helpAnchor:", @"mchlcfc41e54");
  -[TCCDService setFullAccessUsageDescriptionKeyName:]( v13,  "setFullAccessUsageDescriptionKeyName:",  @"NSRemindersFullAccessUsageDescription");
  -[NSMutableSet addObject:](v1, "addObject:", v13);
  __int128 v196 = 0u;
  __int128 v197 = 0u;
  __int128 v194 = 0u;
  __int128 v195 = 0u;
  id v14 = [&off_10006CB30 countByEnumeratingWithState:&v194 objects:v205 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v195;
    do
    {
      uint64_t v17 = 0LL;
      id v18 = v13;
      do
      {
        if (*(void *)v195 != v16) {
          objc_enumerationMutation(&off_10006CB30);
        }
        __int16 v13 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  *(void *)(*((void *)&v194 + 1) + 8LL * (void)v17),  &off_10006BE80);

        -[TCCDService setIsRevocable:](v13, "setIsRevocable:", 1LL);
        -[TCCDService setAlertStyle:](v13, "setAlertStyle:", 1LL);
        -[TCCDService setShouldTreatAsDeprecated:](v13, "setShouldTreatAsDeprecated:", 1LL);
        -[NSMutableSet addObject:](v1, "addObject:", v13);
        uint64_t v17 = (char *)v17 + 1;
        id v18 = v13;
      }

      while (v15 != v17);
      id v15 = [&off_10006CB30 countByEnumeratingWithState:&v194 objects:v205 count:16];
    }

    while (v15);
  }

  __int128 v192 = 0u;
  __int128 v193 = 0u;
  __int128 v190 = 0u;
  __int128 v191 = 0u;
  id v19 = [&off_10006CB48 countByEnumeratingWithState:&v190 objects:v204 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v191;
    do
    {
      unsigned __int8 v22 = 0LL;
      id v23 = v13;
      do
      {
        if (*(void *)v191 != v21) {
          objc_enumerationMutation(&off_10006CB48);
        }
        __int16 v13 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  *(void *)(*((void *)&v190 + 1) + 8LL * (void)v22),  &off_10006BEA8);

        -[TCCDService setIsRevocable:](v13, "setIsRevocable:", 1LL);
        -[TCCDService setAlertStyle:](v13, "setAlertStyle:", 1LL);
        -[TCCDService setIsAccessAllowedByDefault:](v13, "setIsAccessAllowedByDefault:", 1LL);
        -[TCCDService setMdm_macos_allowedInPayloadDefition:](v13, "setMdm_macos_allowedInPayloadDefition:", 0LL);
        -[NSMutableSet addObject:](v1, "addObject:", v13);
        unsigned __int8 v22 = (char *)v22 + 1;
        id v23 = v13;
      }

      while (v20 != v22);
      id v20 = [&off_10006CB48 countByEnumeratingWithState:&v190 objects:v204 count:16];
    }

    while (v20);
  }

  unsigned int v24 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServicePhotos",  &off_10006BED0);

  -[TCCDService setUsageDescriptionKeyName:]( v24,  "setUsageDescriptionKeyName:",  @"NSPhotoLibraryUsageDescription");
  -[TCCDService setShouldIssueSandboxExtension:](v24, "setShouldIssueSandboxExtension:", 1LL);
  -[TCCDService setMacos_hardenedRuntimeEntitlementName:]( v24,  "setMacos_hardenedRuntimeEntitlementName:",  @"com.apple.security.personal-information.photos-library");
  -[TCCDService setAuthorizationRightsMask:](v24, "setAuthorizationRightsMask:", 15LL);
  -[TCCDService setUpgradeV1AuthorizationValue:](v24, "setUpgradeV1AuthorizationValue:", 1LL);
  -[TCCDService setAuthorizationVersionNumber:](v24, "setAuthorizationVersionNumber:", 2LL);
  -[TCCDService setDowngradeAuthRight:](v24, "setDowngradeAuthRight:", 3LL);
  int v25 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService name](v24, "name"));
  __int16 v26 = (void *)objc_claimAutoreleasedReturnValue( +[TCCDService requestAllowAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:]( &OBJC_CLASS___TCCDService,  "requestAllowAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:",  v25));
  -[TCCDService setAllowAuthorizationButtonTitleLocalizationKey:]( v24,  "setAllowAuthorizationButtonTitleLocalizationKey:",  v26);

  id v27 = (void *)objc_claimAutoreleasedReturnValue( -[TCCDService allowAuthorizationButtonTitleLocalizationKey]( v24,  "allowAuthorizationButtonTitleLocalizationKey"));
  if (!v27) {
    sub_10002DAFC();
  }
  unint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService name](v24, "name"));
  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue( +[TCCDService requestDenyAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:]( &OBJC_CLASS___TCCDService,  "requestDenyAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:",  v28));
  -[TCCDService setDenyAuthorizationButtonTitleLocalizationKey:]( v24,  "setDenyAuthorizationButtonTitleLocalizationKey:",  v29);

  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( -[TCCDService denyAuthorizationButtonTitleLocalizationKey]( v24,  "denyAuthorizationButtonTitleLocalizationKey"));
  if (!v30) {
    sub_10002DAFC();
  }
  id v31 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService name](v24, "name"));
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[TCCDService requestLimitedAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:]( &OBJC_CLASS___TCCDService,  "requestLimitedAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:",  v31));
  -[TCCDService setLimitedAuthorizationButtonTitleLocalizationKey:]( v24,  "setLimitedAuthorizationButtonTitleLocalizationKey:",  v32);

  id v33 = (void *)objc_claimAutoreleasedReturnValue( -[TCCDService limitedAuthorizationButtonTitleLocalizationKey]( v24,  "limitedAuthorizationButtonTitleLocalizationKey"));
  if (!v33) {
    sub_10002DAFC();
  }
  -[TCCDService setMacos_helpAnchor:](v24, "setMacos_helpAnchor:", @"mchl325bd573");
  -[TCCDService setRequestFullTitleTextLocalizationKey:]( v24,  "setRequestFullTitleTextLocalizationKey:",  @"REQUEST_ACCESS_SERVICE_kTCCServicePhotos_FULL");
  -[TCCDService setRequestLimitedTitleTextLocalizationKey:]( v24,  "setRequestLimitedTitleTextLocalizationKey:",  @"REQUEST_ACCESS_SERVICE_kTCCServicePhotos_LIMITED");
  -[TCCDService setSettingsRequestFullTitleTextLocalizationKey:]( v24,  "setSettingsRequestFullTitleTextLocalizationKey:",  @"REQUEST_ACCESS_SETTINGS_FULL_kTCCServicePhotos");
  -[TCCDService setRequestUpgradeTitleTextLocalizationKey:]( v24,  "setRequestUpgradeTitleTextLocalizationKey:",  @"REQUEST_ACCESS_UPGRADE_kTCCServicePhotos");
  -[TCCDService setSupportsStagedPrompting:](v24, "setSupportsStagedPrompting:", 1LL);
  -[TCCDService setAddModifyAddedAuthorizationButtonTitleLocalizationKey:]( v24,  "setAddModifyAddedAuthorizationButtonTitleLocalizationKey:",  @"REQUEST_ACCESS_ADD_MODIFY_ADDED");
  -[TCCDService _makePromptAuthorizationChoiceBlock:](v24, "_makePromptAuthorizationChoiceBlock:", &stru_100065B30);
  -[TCCDService _makePromptButtonLocalizationKeyBlock:](v24, "_makePromptButtonLocalizationKeyBlock:", &stru_100065B50);
  __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService name](v24, "name"));
  __int128 v35 = (void *)objc_claimAutoreleasedReturnValue( +[TCCDService reminderTitleTextLocalizationKeyNameForServiceName:]( &OBJC_CLASS___TCCDService,  "reminderTitleTextLocalizationKeyNameForServiceName:",  v34));
  -[TCCDService setReminderTitleTextLocalizationKey:](v24, "setReminderTitleTextLocalizationKey:", v35);

  __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService name](v24, "name"));
  __int128 v37 = (void *)objc_claimAutoreleasedReturnValue( +[TCCDService reminderRequestAllowAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:]( &OBJC_CLASS___TCCDService,  "reminderRequestAllowAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:",  v36));
  -[TCCDService setReminderAllowButtonTitleTextLocalizationKey:]( v24,  "setReminderAllowButtonTitleTextLocalizationKey:",  v37);

  __int128 v38 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService name](v24, "name"));
  __int128 v39 = (void *)objc_claimAutoreleasedReturnValue( +[TCCDService reminderRequestLimitedAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:]( &OBJC_CLASS___TCCDService,  "reminderRequestLimitedAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:",  v38));
  -[TCCDService setReminderLimitedButtonTitleTextLocalizationKey:]( v24,  "setReminderLimitedButtonTitleTextLocalizationKey:",  v39);

  -[NSMutableSet addObject:](v1, "addObject:", v24);
  __int128 v40 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServicePhotosAdd",  &off_10006BEF8);

  -[TCCDService setUsageDescriptionKeyName:]( v40,  "setUsageDescriptionKeyName:",  @"NSPhotoLibraryAddUsageDescription");
  -[TCCDService setSecondaryUsageDescriptionKeyName:]( v40,  "setSecondaryUsageDescriptionKeyName:",  @"NSPhotoLibraryUsageDescription");
  -[TCCDService setIOS_minimumSDKVersionNumber:](v40, "setIOS_minimumSDKVersionNumber:", &off_10006C908);
  -[TCCDService setShouldIssueSandboxExtension:](v40, "setShouldIssueSandboxExtension:", 1LL);
  -[TCCDService setMacos_hardenedRuntimeEntitlementName:]( v40,  "setMacos_hardenedRuntimeEntitlementName:",  @"com.apple.security.personal-information.photos-library");
  -[TCCDService setMdm_macos_allowedInPayloadDefition:](v40, "setMdm_macos_allowedInPayloadDefition:", 0LL);
  -[NSMutableSet addObject:](v1, "addObject:", v40);
  __int128 v41 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceCamera",  &off_10006BF20);

  -[TCCDService setUsageDescriptionKeyName:](v41, "setUsageDescriptionKeyName:", @"NSCameraUsageDescription");
  -[TCCDService setSandboxOperationForDelegation:](v41, "setSandboxOperationForDelegation:", @"device-camera");
  -[TCCDService setMacos_hardenedRuntimeEntitlementName:]( v41,  "setMacos_hardenedRuntimeEntitlementName:",  @"com.apple.security.device.camera");
  -[TCCDService setMdm_isAuthorizationDenyOnly:](v41, "setMdm_isAuthorizationDenyOnly:", 1LL);
  -[TCCDService setMacos_helpAnchor:](v41, "setMacos_helpAnchor:", @"mchlf88b936b");
  -[TCCDService setAllowedForAvocadoWidget:](v41, "setAllowedForAvocadoWidget:", 0LL);
  -[NSMutableSet addObject:](v1, "addObject:", v41);
  int v42 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceMicrophone",  &off_10006BF48);

  -[TCCDService setUsageDescriptionKeyName:](v42, "setUsageDescriptionKeyName:", @"NSMicrophoneUsageDescription");
  -[TCCDService setSandboxOperationForDelegation:](v42, "setSandboxOperationForDelegation:", @"device-microphone");
  -[TCCDService setMacos_hardenedRuntimeEntitlementName:]( v42,  "setMacos_hardenedRuntimeEntitlementName:",  @"com.apple.security.device.audio-input");
  -[TCCDService setMdm_isAuthorizationDenyOnly:](v42, "setMdm_isAuthorizationDenyOnly:", 1LL);
  -[TCCDService setMacos_helpAnchor:](v42, "setMacos_helpAnchor:", @"mchl7fa8e3cc");
  -[TCCDService setAllowedForAvocadoWidget:](v42, "setAllowedForAvocadoWidget:", 0LL);
  -[NSMutableSet addObject:](v1, "addObject:", v42);
  int v43 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceWillow",  &off_10006BF70);

  -[TCCDService setUsageDescriptionKeyName:](v43, "setUsageDescriptionKeyName:", @"NSHomeKitUsageDescription");
  -[TCCDService setExternalName:](v43, "setExternalName:", @"HomeKit");
  -[TCCDService setMdm_macos_allowedInPayloadDefition:](v43, "setMdm_macos_allowedInPayloadDefition:", 0LL);
  -[NSMutableSet addObject:](v1, "addObject:", v43);
  int v44 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceMediaLibrary",  &off_10006BF98);

  -[TCCDService setUsageDescriptionKeyName:](v44, "setUsageDescriptionKeyName:", @"NSAppleMusicUsageDescription");
  -[TCCDService setShouldIssueSandboxExtension:](v44, "setShouldIssueSandboxExtension:", 1LL);
  -[TCCDService setMacos_minimumSDKVersionNumber:](v44, "setMacos_minimumSDKVersionNumber:", &off_10006C938);
  __int16 v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  59616000LL));
  -[TCCDService setExpirySeconds:](v44, "setExpirySeconds:", v45);

  -[TCCDService setExpireOnlyAllowedEntries:](v44, "setExpireOnlyAllowedEntries:", 1LL);
  -[TCCDService setSaveExpiredEntries:](v44, "setSaveExpiredEntries:", 1LL);
  id v46 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
  int v47 = (void *)objc_claimAutoreleasedReturnValue([v46 configurationDictionary]);
  int v48 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKeyedSubscript:@"expiration.kTCCServiceMediaLibrary"]);

  if (v48)
  {
    if ((uint64_t)[v48 integerValue] >= 1)
    {
      id v49 = [v48 integerValue];
      int v50 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService expirySeconds](v44, "expirySeconds"));
      id v51 = [v50 integerValue];

      if ((uint64_t)v49 < (uint64_t)v51)
      {
        -[TCCDService setExpirySeconds:](v44, "setExpirySeconds:", v48);
        int v52 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
        int v53 = (void *)objc_claimAutoreleasedReturnValue([v52 server]);
        id v54 = (os_log_s *)objc_claimAutoreleasedReturnValue([v53 logHandle]);

        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          id v55 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService name](v44, "name"));
          *(_DWORD *)buf = 138543618;
          v201 = v55;
          __int16 v202 = 2114;
          v203 = v48;
          _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "For %{public}@ set expirySeconds: %{public}@",  buf,  0x16u);
        }
      }
    }
  }

  -[NSMutableSet addObject:](v1, "addObject:", v44);
  uint64_t v56 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceSiri",  &off_10006BFC0);

  -[TCCDService setUsageDescriptionKeyName:](v56, "setUsageDescriptionKeyName:", @"NSSiriUsageDescription");
  int v57 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService name](v56, "name"));
  char v58 = (void *)objc_claimAutoreleasedReturnValue( +[TCCDService requestAdditionalTextLocalizationKeyNameForServiceName:]( &OBJC_CLASS___TCCDService,  "requestAdditionalTextLocalizationKeyNameForServiceName:",  v57));
  -[TCCDService setRequestAdditionalTextLocalizationKey:](v56, "setRequestAdditionalTextLocalizationKey:", v58);

  -[TCCDService setIsRevocable:](v56, "setIsRevocable:", 1LL);
  -[TCCDService setMdm_macos_allowedInPayloadDefition:](v56, "setMdm_macos_allowedInPayloadDefition:", 0LL);
  -[NSMutableSet addObject:](v1, "addObject:", v56);
  __int128 v59 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceMotion",  &off_10006BFE8);

  -[TCCDService setUsageDescriptionKeyName:](v59, "setUsageDescriptionKeyName:", @"NSMotionUsageDescription");
  -[TCCDService setDisallowedOnPlatformSubtypeNameList:](v59, "setDisallowedOnPlatformSubtypeNameList:", &off_10006CB60);
  -[TCCDService setMdm_macos_allowedInPayloadDefition:](v59, "setMdm_macos_allowedInPayloadDefition:", 0LL);
  -[NSMutableSet addObject:](v1, "addObject:", v59);
  id v60 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceSpeechRecognition",  &off_10006C010);

  -[TCCDService setUsageDescriptionKeyName:]( v60,  "setUsageDescriptionKeyName:",  @"NSSpeechRecognitionUsageDescription");
  id v61 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService name](v60, "name"));
  int v62 = (void *)objc_claimAutoreleasedReturnValue( +[TCCDService requestAdditionalTextLocalizationKeyNameForServiceName:]( &OBJC_CLASS___TCCDService,  "requestAdditionalTextLocalizationKeyNameForServiceName:",  v61));
  -[TCCDService setRequestAdditionalTextLocalizationKey:](v60, "setRequestAdditionalTextLocalizationKey:", v62);

  -[TCCDService setMacos_minimumSDKVersionNumber:](v60, "setMacos_minimumSDKVersionNumber:", &off_10006C8A8);
  -[NSMutableSet addObject:](v1, "addObject:", v60);
  uint64_t v63 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceUserTracking",  &off_10006C038);

  -[TCCDService setUsageDescriptionKeyName:]( v63,  "setUsageDescriptionKeyName:",  @"NSUserTrackingUsageDescription");
  -[TCCDService setMacos_minimumSDKVersionNumber:](v63, "setMacos_minimumSDKVersionNumber:", &off_10006C950);
  -[TCCDService setIOS_minimumSDKVersionNumber:](v63, "setIOS_minimumSDKVersionNumber:", &off_10006C968);
  -[TCCDService setWatchOS_minimumSDKVersionNumber:](v63, "setWatchOS_minimumSDKVersionNumber:", &off_10006C980);
  -[TCCDService setTvOS_minimumSDKVersionNumber:](v63, "setTvOS_minimumSDKVersionNumber:", &off_10006C968);
  id v64 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService name](v63, "name"));
  uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue( +[TCCDService requestAllowAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:]( &OBJC_CLASS___TCCDService,  "requestAllowAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:",  v64));
  -[TCCDService setAllowAuthorizationButtonTitleLocalizationKey:]( v63,  "setAllowAuthorizationButtonTitleLocalizationKey:",  v65);

  char v66 = (void *)objc_claimAutoreleasedReturnValue( -[TCCDService allowAuthorizationButtonTitleLocalizationKey]( v63,  "allowAuthorizationButtonTitleLocalizationKey"));
  if (!v66) {
    sub_10002DAFC();
  }
  id v67 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService name](v63, "name"));
  unint64_t v68 = (void *)objc_claimAutoreleasedReturnValue( +[TCCDService requestDenyAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:]( &OBJC_CLASS___TCCDService,  "requestDenyAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:",  v67));
  -[TCCDService setDenyAuthorizationButtonTitleLocalizationKey:]( v63,  "setDenyAuthorizationButtonTitleLocalizationKey:",  v68);

  __int16 v69 = (void *)objc_claimAutoreleasedReturnValue( -[TCCDService denyAuthorizationButtonTitleLocalizationKey]( v63,  "denyAuthorizationButtonTitleLocalizationKey"));
  if (!v69) {
    sub_10002DAFC();
  }
  -[NSMutableSet addObject:](v1, "addObject:", v63);
  unsigned int v70 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceBluetoothAlways",  &off_10006C060);

  -[TCCDService setUsageDescriptionKeyName:]( v70,  "setUsageDescriptionKeyName:",  @"NSBluetoothAlwaysUsageDescription");
  -[TCCDService setIOS_minimumSDKVersionNumber:](v70, "setIOS_minimumSDKVersionNumber:", &off_10006C8C0);
  -[TCCDService setWatchOS_minimumSDKVersionNumber:](v70, "setWatchOS_minimumSDKVersionNumber:", &off_10006C8D8);
  -[TCCDService setTvOS_minimumSDKVersionNumber:](v70, "setTvOS_minimumSDKVersionNumber:", &off_10006C8C0);
  -[TCCDService setMacos_minimumSDKVersionNumber:](v70, "setMacos_minimumSDKVersionNumber:", &off_10006C968);
  -[TCCDService setShouldUseADefaultDescriptionString:](v70, "setShouldUseADefaultDescriptionString:", 1LL);
  -[NSMutableSet addObject:](v1, "addObject:", v70);
  __int16 v71 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceWebKitIntelligentTrackingPrevention",  &off_10006C088);

  -[TCCDService setMacos_minimumSDKVersionNumber:](v71, "setMacos_minimumSDKVersionNumber:", &off_10006C950);
  -[TCCDService setIOS_minimumSDKVersionNumber:](v71, "setIOS_minimumSDKVersionNumber:", &off_10006C968);
  -[TCCDService setWatchOS_minimumSDKVersionNumber:](v71, "setWatchOS_minimumSDKVersionNumber:", &off_10006C980);
  -[TCCDService setTvOS_minimumSDKVersionNumber:](v71, "setTvOS_minimumSDKVersionNumber:", &off_10006C968);
  -[TCCDService setIsRevocable:](v71, "setIsRevocable:", 0LL);
  -[TCCDService setAlertStyle:](v71, "setAlertStyle:", 1LL);
  -[TCCDService setIsAccessAllowedByDefault:](v71, "setIsAccessAllowedByDefault:", 1LL);
  -[TCCDService setMdm_macos_allowedInPayloadDefition:](v71, "setMdm_macos_allowedInPayloadDefition:", 1LL);
  -[NSMutableSet addObject:](v1, "addObject:", v71);
  int v72 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServicePrototype3Rights",  &off_10006C0B0);

  -[TCCDService setMacos_minimumSDKVersionNumber:](v72, "setMacos_minimumSDKVersionNumber:", &off_10006C950);
  -[TCCDService setIOS_minimumSDKVersionNumber:](v72, "setIOS_minimumSDKVersionNumber:", &off_10006C968);
  -[TCCDService setWatchOS_minimumSDKVersionNumber:](v72, "setWatchOS_minimumSDKVersionNumber:", &off_10006C980);
  -[TCCDService setTvOS_minimumSDKVersionNumber:](v72, "setTvOS_minimumSDKVersionNumber:", &off_10006C968);
  -[TCCDService setMdm_macos_allowedInPayloadDefition:](v72, "setMdm_macos_allowedInPayloadDefition:", 0LL);
  -[NSMutableSet addObject:](v1, "addObject:", v72);
  __int16 v73 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServicePrototype4Rights",  &off_10006C0D8);

  -[TCCDService setMacos_minimumSDKVersionNumber:](v73, "setMacos_minimumSDKVersionNumber:", &off_10006C950);
  -[TCCDService setIOS_minimumSDKVersionNumber:](v73, "setIOS_minimumSDKVersionNumber:", &off_10006C968);
  -[TCCDService setWatchOS_minimumSDKVersionNumber:](v73, "setWatchOS_minimumSDKVersionNumber:", &off_10006C980);
  -[TCCDService setTvOS_minimumSDKVersionNumber:](v73, "setTvOS_minimumSDKVersionNumber:", &off_10006C968);
  -[TCCDService setMdm_macos_allowedInPayloadDefition:](v73, "setMdm_macos_allowedInPayloadDefition:", 0LL);
  -[TCCDService setAuthorizationRightsMask:](v73, "setAuthorizationRightsMask:", 15LL);
  -[TCCDService setUpgradeV1AuthorizationValue:](v73, "setUpgradeV1AuthorizationValue:", 1LL);
  -[TCCDService setAuthorizationVersionNumber:](v73, "setAuthorizationVersionNumber:", 2LL);
  id v74 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService name](v73, "name"));
  __int16 v75 = (void *)objc_claimAutoreleasedReturnValue( +[TCCDService requestLimitedAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:]( &OBJC_CLASS___TCCDService,  "requestLimitedAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:",  v74));
  -[TCCDService setLimitedAuthorizationButtonTitleLocalizationKey:]( v73,  "setLimitedAuthorizationButtonTitleLocalizationKey:",  v75);

  -[NSMutableSet addObject:](v1, "addObject:", v73);
  int v76 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceGameCenterFriends",  &off_10006C100);

  -[TCCDService setMacos_minimumSDKVersionNumber:](v76, "setMacos_minimumSDKVersionNumber:", &off_10006C998);
  -[TCCDService setIOS_minimumSDKVersionNumber:](v76, "setIOS_minimumSDKVersionNumber:", &off_10006C9B0);
  -[TCCDService setWatchOS_minimumSDKVersionNumber:](v76, "setWatchOS_minimumSDKVersionNumber:", &off_10006C9C8);
  -[TCCDService setTvOS_minimumSDKVersionNumber:](v76, "setTvOS_minimumSDKVersionNumber:", &off_10006C9B0);
  __int16 v77 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService name](v76, "name"));
  int v78 = (void *)objc_claimAutoreleasedReturnValue( +[TCCDService requestAllowAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:]( &OBJC_CLASS___TCCDService,  "requestAllowAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:",  v77));
  -[TCCDService setAllowAuthorizationButtonTitleLocalizationKey:]( v76,  "setAllowAuthorizationButtonTitleLocalizationKey:",  v78);

  uint64_t v79 = (void *)objc_claimAutoreleasedReturnValue( -[TCCDService allowAuthorizationButtonTitleLocalizationKey]( v76,  "allowAuthorizationButtonTitleLocalizationKey"));
  if (!v79) {
    sub_10002DAFC();
  }
  id v80 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService name](v76, "name"));
  id v81 = (void *)objc_claimAutoreleasedReturnValue( +[TCCDService requestDenyAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:]( &OBJC_CLASS___TCCDService,  "requestDenyAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:",  v80));
  -[TCCDService setDenyAuthorizationButtonTitleLocalizationKey:]( v76,  "setDenyAuthorizationButtonTitleLocalizationKey:",  v81);

  id v82 = (void *)objc_claimAutoreleasedReturnValue( -[TCCDService denyAuthorizationButtonTitleLocalizationKey]( v76,  "denyAuthorizationButtonTitleLocalizationKey"));
  if (!v82) {
    sub_10002DAFC();
  }
  -[TCCDService setDisallowedOnPlatformSubtypeNameList:](v76, "setDisallowedOnPlatformSubtypeNameList:", &off_10006CB78);
  -[TCCDService setUsageDescriptionKeyName:]( v76,  "setUsageDescriptionKeyName:",  @"NSGKFriendListUsageDescription");
  -[NSMutableSet addObject:](v1, "addObject:", v76);
  id v83 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceVoiceBanking",  &off_10006C128);

  int v84 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService name](v83, "name"));
  id v85 = (void *)objc_claimAutoreleasedReturnValue( +[TCCDService requestAdditionalTextLocalizationKeyNameForServiceName:]( &OBJC_CLASS___TCCDService,  "requestAdditionalTextLocalizationKeyNameForServiceName:",  v84));
  -[TCCDService setRequestAdditionalTextLocalizationKey:](v83, "setRequestAdditionalTextLocalizationKey:", v85);

  -[NSMutableSet addObject:](v1, "addObject:", v83);
  id v86 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceBluetoothPeripheral",  &off_10006C150);

  -[TCCDService setUsageDescriptionKeyName:]( v86,  "setUsageDescriptionKeyName:",  @"NSBluetoothPeripheralUsageDescription");
  -[NSMutableSet addObject:](v1, "addObject:", v86);
  int v87 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceBluetoothWhileInUse",  &off_10006C178);

  -[TCCDService setUsageDescriptionKeyName:]( v87,  "setUsageDescriptionKeyName:",  @"NSBluetoothWhileInUseUsageDescription");
  -[TCCDService setIOS_minimumSDKVersionNumber:](v87, "setIOS_minimumSDKVersionNumber:", &off_10006C8C0);
  -[TCCDService setWatchOS_minimumSDKVersionNumber:](v87, "setWatchOS_minimumSDKVersionNumber:", &off_10006C8D8);
  -[TCCDService setTvOS_minimumSDKVersionNumber:](v87, "setTvOS_minimumSDKVersionNumber:", &off_10006C8C0);
  -[TCCDService setShouldTreatAsDeprecated:](v87, "setShouldTreatAsDeprecated:", 1LL);
  -[NSMutableSet addObject:](v1, "addObject:", v87);
  id v88 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceKeyboardNetwork",  &off_10006C1A0);

  -[TCCDService setAlertStyle:](v88, "setAlertStyle:", 1LL);
  -[TCCDService setShouldIssueSandboxExtension:](v88, "setShouldIssueSandboxExtension:", 1LL);
  -[NSMutableSet addObject:](v1, "addObject:", v88);
  id v89 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceMSO",  &off_10006C1C8);

  -[TCCDService setIsRevocable:](v89, "setIsRevocable:", 1LL);
  -[TCCDService setAlertStyle:](v89, "setAlertStyle:", 1LL);
  -[NSMutableSet addObject:](v1, "addObject:", v89);
  id v90 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceCalls",  &off_10006C1F0);

  -[TCCDService setUsageDescriptionKeyName:](v90, "setUsageDescriptionKeyName:", @"NSVoIPUsageDescription");
  -[TCCDService setIOS_minimumSDKVersionNumber:](v90, "setIOS_minimumSDKVersionNumber:", &off_10006C9F8);
  -[TCCDService setIsRevocable:](v90, "setIsRevocable:", 1LL);
  -[NSMutableSet addObject:](v1, "addObject:", v90);
  id v91 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceFaceID",  &off_10006C218);

  -[TCCDService setUsageDescriptionKeyName:](v91, "setUsageDescriptionKeyName:", @"NSFaceIDUsageDescription");
  -[TCCDService setShouldUseADefaultDescriptionString:](v91, "setShouldUseADefaultDescriptionString:", 1LL);
  -[TCCDService setIOS_minimumSDKVersionNumber:](v91, "setIOS_minimumSDKVersionNumber:", &off_10006C998);
  -[NSMutableSet addObject:](v1, "addObject:", v91);
  unsigned int v92 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceExposureNotificationRegion",  &off_10006C240);

  -[TCCDService setIOS_minimumSDKVersionNumber:](v92, "setIOS_minimumSDKVersionNumber:", &off_10006CA28);
  -[TCCDService setIsRevocable:](v92, "setIsRevocable:", 1LL);
  -[TCCDService setAlertStyle:](v92, "setAlertStyle:", 1LL);
  -[NSMutableSet addObject:](v1, "addObject:", v92);
  unsigned int v93 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceExposureNotification",  &off_10006C268);
  os_log_t v94 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService name](v93, "name"));
  uint64_t v95 = (void *)objc_claimAutoreleasedReturnValue( +[TCCDService requestAdditionalTextLocalizationKeyNameForServiceName:]( &OBJC_CLASS___TCCDService,  "requestAdditionalTextLocalizationKeyNameForServiceName:",  v94));
  -[TCCDService setRequestAdditionalTextLocalizationKey:](v93, "setRequestAdditionalTextLocalizationKey:", v95);

  __int16 v96 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService requestAdditionalTextLocalizationKey](v93, "requestAdditionalTextLocalizationKey"));
  if (!v96) {
    sub_10002DAFC();
  }
  id v97 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService name](v93, "name"));
  __int16 v98 = (void *)objc_claimAutoreleasedReturnValue( +[TCCDService requestTitleTextForSubsequentRequestsLocalizationKeyNameForServiceName:]( &OBJC_CLASS___TCCDService,  "requestTitleTextForSubsequentRequestsLocalizationKeyNameForServiceName:",  v97));
  -[TCCDService setRequestTitleTextForSubsequentRequestsKey:](v93, "setRequestTitleTextForSubsequentRequestsKey:", v98);

  id v99 = (void *)objc_claimAutoreleasedReturnValue( -[TCCDService requestTitleTextForSubsequentRequestsKey]( v93,  "requestTitleTextForSubsequentRequestsKey"));
  if (!v99) {
    sub_10002DAFC();
  }
  __int16 v100 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService name](v93, "name"));
  v101 = (void *)objc_claimAutoreleasedReturnValue( +[TCCDService requestAdditionalTextForSubsequentRequestsKeyNameForServiceName:]( &OBJC_CLASS___TCCDService,  "requestAdditionalTextForSubsequentRequestsKeyNameForServiceName:",  v100));
  -[TCCDService setRequestAdditionalTextForSubsequentRequestsLocalizationKey:]( v93,  "setRequestAdditionalTextForSubsequentRequestsLocalizationKey:",  v101);

  id v102 = (void *)objc_claimAutoreleasedReturnValue( -[TCCDService requestAdditionalTextForSubsequentRequestsLocalizationKey]( v93,  "requestAdditionalTextForSubsequentRequestsLocalizationKey"));
  if (!v102) {
    sub_10002DAFC();
  }
  -[TCCDService setSubsequentRequestStringsRelatedService:](v93, "setSubsequentRequestStringsRelatedService:", v92);
  -[TCCDService setIOS_minimumSDKVersionNumber:](v93, "setIOS_minimumSDKVersionNumber:", &off_10006CA28);
  id v103 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService name](v93, "name"));
  uint64_t v104 = (void *)objc_claimAutoreleasedReturnValue( +[TCCDService requestAllowAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:]( &OBJC_CLASS___TCCDService,  "requestAllowAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:",  v103));
  -[TCCDService setAllowAuthorizationButtonTitleLocalizationKey:]( v93,  "setAllowAuthorizationButtonTitleLocalizationKey:",  v104);

  v105 = (void *)objc_claimAutoreleasedReturnValue( -[TCCDService allowAuthorizationButtonTitleLocalizationKey]( v93,  "allowAuthorizationButtonTitleLocalizationKey"));
  if (!v105) {
    sub_10002DAFC();
  }
  BOOL v106 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService name](v93, "name"));
  v107 = (void *)objc_claimAutoreleasedReturnValue( +[TCCDService requestDenyAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:]( &OBJC_CLASS___TCCDService,  "requestDenyAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:",  v106));
  -[TCCDService setDenyAuthorizationButtonTitleLocalizationKey:]( v93,  "setDenyAuthorizationButtonTitleLocalizationKey:",  v107);

  unsigned __int8 v108 = (void *)objc_claimAutoreleasedReturnValue( -[TCCDService denyAuthorizationButtonTitleLocalizationKey]( v93,  "denyAuthorizationButtonTitleLocalizationKey"));
  if (!v108) {
    sub_10002DAFC();
  }
  v109 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService name](v93, "name"));
  BOOL v110 = (void *)objc_claimAutoreleasedReturnValue( +[TCCDService subsequentRequestAllowAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:]( &OBJC_CLASS___TCCDService,  "subsequentRequestAllowAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:",  v109));
  -[TCCDService setSubsequentRequestAllowAuthorizationButtonTitleLocalizationKey:]( v93,  "setSubsequentRequestAllowAuthorizationButtonTitleLocalizationKey:",  v110);

  v111 = (void *)objc_claimAutoreleasedReturnValue( -[TCCDService subsequentRequestAllowAuthorizationButtonTitleLocalizationKey]( v93,  "subsequentRequestAllowAuthorizationButtonTitleLocalizationKey"));
  if (!v111) {
    sub_10002DAFC();
  }
  v112 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService name](v93, "name"));
  v113 = (void *)objc_claimAutoreleasedReturnValue( +[TCCDService subsequentRequestDenyAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:]( &OBJC_CLASS___TCCDService,  "subsequentRequestDenyAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:",  v112));
  -[TCCDService setSubsequentRequestDenyAuthorizationButtonTitleLocalizationKey:]( v93,  "setSubsequentRequestDenyAuthorizationButtonTitleLocalizationKey:",  v113);

  v114 = (void *)objc_claimAutoreleasedReturnValue( -[TCCDService subsequentRequestDenyAuthorizationButtonTitleLocalizationKey]( v93,  "subsequentRequestDenyAuthorizationButtonTitleLocalizationKey"));
  if (!v114) {
    sub_10002DAFC();
  }
  -[NSMutableSet addObject:](v1, "addObject:", v93);
  v115 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceContactlessAccess",  &off_10006C290);

  v116 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService name](v115, "name"));
  v117 = (void *)objc_claimAutoreleasedReturnValue( +[TCCDService requestAdditionalTextLocalizationKeyNameForServiceName:]( &OBJC_CLASS___TCCDService,  "requestAdditionalTextLocalizationKeyNameForServiceName:",  v116));
  -[TCCDService setRequestAdditionalTextLocalizationKey:](v115, "setRequestAdditionalTextLocalizationKey:", v117);

  -[TCCDService setIsRevocable:](v115, "setIsRevocable:", 1LL);
  -[NSMutableSet addObject:](v1, "addObject:", v115);
  v118 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceSecureElementAccess",  &off_10006C2B8);

  -[TCCDService setIsRevocable:](v118, "setIsRevocable:", 1LL);
  v119 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService name](v118, "name"));
  BOOL v120 = (void *)objc_claimAutoreleasedReturnValue( +[TCCDService requestAdditionalTextLocalizationKeyNameForServiceName:]( &OBJC_CLASS___TCCDService,  "requestAdditionalTextLocalizationKeyNameForServiceName:",  v119));
  -[TCCDService setRequestAdditionalTextLocalizationKey:](v118, "setRequestAdditionalTextLocalizationKey:", v120);

  -[NSMutableSet addObject:](v1, "addObject:", v118);
  v121 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceMicrophoneInjection",  &off_10006C2E0);

  -[TCCDService setUsageDescriptionKeyName:]( v121,  "setUsageDescriptionKeyName:",  @"NSMicrophoneInjectionUsageDescription");
  v122 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService name](v121, "name"));
  v123 = (void *)objc_claimAutoreleasedReturnValue( +[TCCDService requestAdditionalTextLocalizationKeyNameForServiceName:]( &OBJC_CLASS___TCCDService,  "requestAdditionalTextLocalizationKeyNameForServiceName:",  v122));
  -[TCCDService setRequestAdditionalTextLocalizationKey:](v121, "setRequestAdditionalTextLocalizationKey:", v123);

  -[NSMutableSet addObject:](v1, "addObject:", v121);
  v124 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceFallDetection",  &off_10006C308);

  -[TCCDService setUsageDescriptionKeyName:]( v124,  "setUsageDescriptionKeyName:",  @"NSFallDetectionUsageDescription");
  -[TCCDService setIOS_minimumSDKVersionNumber:](v124, "setIOS_minimumSDKVersionNumber:", &off_10006CA88);
  -[TCCDService setWatchOS_minimumSDKVersionNumber:](v124, "setWatchOS_minimumSDKVersionNumber:", &off_10006CAA0);
  -[TCCDService setMdm_macos_allowedInPayloadDefition:](v124, "setMdm_macos_allowedInPayloadDefition:", 0LL);
  v125 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService name](v124, "name"));
  v126 = (void *)objc_claimAutoreleasedReturnValue( +[TCCDService requestAdditionalTextLocalizationKeyNameForServiceName:]( &OBJC_CLASS___TCCDService,  "requestAdditionalTextLocalizationKeyNameForServiceName:",  v125));
  -[TCCDService setRequestAdditionalTextLocalizationKey:](v124, "setRequestAdditionalTextLocalizationKey:", v126);

  v127 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService requestAdditionalTextLocalizationKey](v124, "requestAdditionalTextLocalizationKey"));
  if (!v127) {
    sub_10002DAFC();
  }
  v128 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService name](v124, "name"));
  v129 = (void *)objc_claimAutoreleasedReturnValue( +[TCCDService requestAllowAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:]( &OBJC_CLASS___TCCDService,  "requestAllowAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:",  v128));
  -[TCCDService setAllowAuthorizationButtonTitleLocalizationKey:]( v124,  "setAllowAuthorizationButtonTitleLocalizationKey:",  v129);

  unsigned __int8 v130 = (void *)objc_claimAutoreleasedReturnValue( -[TCCDService allowAuthorizationButtonTitleLocalizationKey]( v124,  "allowAuthorizationButtonTitleLocalizationKey"));
  if (!v130) {
    sub_10002DAFC();
  }
  v131 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService name](v124, "name"));
  v132 = (void *)objc_claimAutoreleasedReturnValue( +[TCCDService requestDenyAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:]( &OBJC_CLASS___TCCDService,  "requestDenyAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:",  v131));
  -[TCCDService setDenyAuthorizationButtonTitleLocalizationKey:]( v124,  "setDenyAuthorizationButtonTitleLocalizationKey:",  v132);

  v133 = (void *)objc_claimAutoreleasedReturnValue( -[TCCDService denyAuthorizationButtonTitleLocalizationKey]( v124,  "denyAuthorizationButtonTitleLocalizationKey"));
  if (!v133) {
    sub_10002DAFC();
  }
  -[NSMutableSet addObject:](v1, "addObject:", v124);
  v134 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceSensorKitBedSensing",  &off_10006C330);

  -[TCCDService setIsRevocable:](v134, "setIsRevocable:", 1LL);
  -[TCCDService setAlertStyle:](v134, "setAlertStyle:", 1LL);
  -[NSMutableSet addObject:](v1, "addObject:", v134);
  v135 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceSensorKitSoundDetection",  &off_10006C358);

  -[TCCDService setIsRevocable:](v135, "setIsRevocable:", 1LL);
  -[TCCDService setAlertStyle:](v135, "setAlertStyle:", 1LL);
  -[NSMutableSet addObject:](v1, "addObject:", v135);
  v136 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceSensorKitBedSensingWriting",  &off_10006C380);

  -[TCCDService setUsageDescriptionKeyName:]( v136,  "setUsageDescriptionKeyName:",  @"NSSensorKitBedSensingWritingUsageDescription");
  -[TCCDService setIOS_minimumSDKVersionNumber:](v136, "setIOS_minimumSDKVersionNumber:", &off_10006C9B0);
  -[TCCDService setWatchOS_minimumSDKVersionNumber:](v136, "setWatchOS_minimumSDKVersionNumber:", &off_10006C9C8);
  v137 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService name](v136, "name"));
  v138 = (void *)objc_claimAutoreleasedReturnValue( +[TCCDService requestAdditionalTextLocalizationKeyNameForServiceName:]( &OBJC_CLASS___TCCDService,  "requestAdditionalTextLocalizationKeyNameForServiceName:",  v137));
  -[TCCDService setRequestAdditionalTextLocalizationKey:](v136, "setRequestAdditionalTextLocalizationKey:", v138);

  v139 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService requestAdditionalTextLocalizationKey](v136, "requestAdditionalTextLocalizationKey"));
  if (!v139) {
    sub_10002DAFC();
  }
  v140 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService name](v136, "name"));
  v141 = (void *)objc_claimAutoreleasedReturnValue( +[TCCDService requestAllowAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:]( &OBJC_CLASS___TCCDService,  "requestAllowAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:",  v140));
  -[TCCDService setAllowAuthorizationButtonTitleLocalizationKey:]( v136,  "setAllowAuthorizationButtonTitleLocalizationKey:",  v141);

  v142 = (void *)objc_claimAutoreleasedReturnValue( -[TCCDService allowAuthorizationButtonTitleLocalizationKey]( v136,  "allowAuthorizationButtonTitleLocalizationKey"));
  if (!v142) {
    sub_10002DAFC();
  }
  id v188 = v48;
  -[NSMutableSet addObject:](v1, "addObject:", v136);
  v143 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceNearbyInteraction",  &off_10006C3A8);

  -[TCCDService setUsageDescriptionKeyName:]( v143,  "setUsageDescriptionKeyName:",  @"NSNearbyInteractionUsageDescription");
  -[TCCDService setIOS_minimumSDKVersionNumber:](v143, "setIOS_minimumSDKVersionNumber:", &off_10006C938);
  -[TCCDService setWatchOS_minimumSDKVersionNumber:](v143, "setWatchOS_minimumSDKVersionNumber:", &off_10006CAB8);
  -[NSMutableSet addObject:](v1, "addObject:", v143);
  id v144 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceFinancialData",  &off_10006C3D0);

  -[TCCDService setUsageDescriptionKeyName:]( v144,  "setUsageDescriptionKeyName:",  @"NSFinancialDataUsageDescription");
  -[TCCDService setMdm_isAuthorizationDenyOnly:](v144, "setMdm_isAuthorizationDenyOnly:", 1LL);
  -[TCCDService setSupportsStagedPrompting:](v144, "setSupportsStagedPrompting:", 1LL);
  v145 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService name](v144, "name"));
  v146 = (void *)objc_claimAutoreleasedReturnValue( +[TCCDService requestLimitedAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:]( &OBJC_CLASS___TCCDService,  "requestLimitedAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:",  v145));
  -[TCCDService setLimitedAuthorizationButtonTitleLocalizationKey:]( v144,  "setLimitedAuthorizationButtonTitleLocalizationKey:",  v146);

  -[TCCDService setDefaultDesiredAuth:](v144, "setDefaultDesiredAuth:", 3LL);
  -[TCCDService setAuthorizationVersionNumber:](v144, "setAuthorizationVersionNumber:", 2LL);
  -[TCCDService _makePromptAuthorizationChoiceBlock:](v144, "_makePromptAuthorizationChoiceBlock:", &stru_100065B70);
  -[NSMutableSet addObject:](v1, "addObject:", v144);
  v147 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceWebBrowserPublicKeyCredential",  &off_10006C3F8);

  BOOL v148 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService name](v147, "name"));
  v149 = (void *)objc_claimAutoreleasedReturnValue( +[TCCDService requestAdditionalTextLocalizationKeyNameForServiceName:]( &OBJC_CLASS___TCCDService,  "requestAdditionalTextLocalizationKeyNameForServiceName:",  v148));
  -[TCCDService setRequestAdditionalTextLocalizationKey:](v147, "setRequestAdditionalTextLocalizationKey:", v149);

  -[TCCDService setMacos_pardonMissingUsage:](v147, "setMacos_pardonMissingUsage:", 1LL);
  -[NSMutableSet addObject:](v1, "addObject:", v147);
  v150 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServicePasteboard",  &off_10006C420);

  -[TCCDService setIOS_minimumSDKVersionNumber:](v150, "setIOS_minimumSDKVersionNumber:", &off_10006CA28);
  -[TCCDService setMacos_minimumSDKVersionNumber:](v150, "setMacos_minimumSDKVersionNumber:", &off_10006CA28);
  -[TCCDService setIsRevocable:](v150, "setIsRevocable:", 1LL);
  -[TCCDService setAlertStyle:](v150, "setAlertStyle:", 1LL);
  -[TCCDService setAuthorizationRightsMask:](v150, "setAuthorizationRightsMask:", 15LL);
  -[TCCDService setAuthorizationVersionNumber:](v150, "setAuthorizationVersionNumber:", 2LL);
  -[NSMutableSet addObject:](v1, "addObject:", v150);
  v151 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceFocusStatus",  &off_10006C448);

  -[TCCDService setUsageDescriptionKeyName:]( v151,  "setUsageDescriptionKeyName:",  @"NSFocusStatusUsageDescription");
  -[TCCDService setMacos_minimumSDKVersionNumber:](v151, "setMacos_minimumSDKVersionNumber:", &off_10006C9F8);
  -[TCCDService setIOS_minimumSDKVersionNumber:](v151, "setIOS_minimumSDKVersionNumber:", &off_10006C938);
  -[TCCDService setWatchOS_minimumSDKVersionNumber:](v151, "setWatchOS_minimumSDKVersionNumber:", &off_10006CAB8);
  v152 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService name](v151, "name"));
  v153 = (void *)objc_claimAutoreleasedReturnValue( +[TCCDService requestAllowAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:]( &OBJC_CLASS___TCCDService,  "requestAllowAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:",  v152));
  -[TCCDService setAllowAuthorizationButtonTitleLocalizationKey:]( v151,  "setAllowAuthorizationButtonTitleLocalizationKey:",  v153);

  v154 = (void *)objc_claimAutoreleasedReturnValue( -[TCCDService allowAuthorizationButtonTitleLocalizationKey]( v151,  "allowAuthorizationButtonTitleLocalizationKey"));
  if (!v154) {
    sub_10002DAFC();
  }
  v155 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService name](v151, "name"));
  v156 = (void *)objc_claimAutoreleasedReturnValue( +[TCCDService requestDenyAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:]( &OBJC_CLASS___TCCDService,  "requestDenyAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:",  v155));
  -[TCCDService setDenyAuthorizationButtonTitleLocalizationKey:]( v151,  "setDenyAuthorizationButtonTitleLocalizationKey:",  v156);

  v157 = (void *)objc_claimAutoreleasedReturnValue( -[TCCDService denyAuthorizationButtonTitleLocalizationKey]( v151,  "denyAuthorizationButtonTitleLocalizationKey"));
  if (!v157) {
    sub_10002DAFC();
  }
  -[TCCDService setMdm_macos_allowedInPayloadDefition:](v151, "setMdm_macos_allowedInPayloadDefition:", 1LL);
  -[NSMutableSet addObject:](v1, "addObject:", v151);
  v158 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceUserAvailability",  &off_10006C470);

  -[TCCDService setUsageDescriptionKeyName:]( v158,  "setUsageDescriptionKeyName:",  @"NSUserAvailabilityNameUsageDescription");
  -[TCCDService setMacos_minimumSDKVersionNumber:](v158, "setMacos_minimumSDKVersionNumber:", &off_10006C9F8);
  -[TCCDService setIOS_minimumSDKVersionNumber:](v158, "setIOS_minimumSDKVersionNumber:", &off_10006C938);
  -[TCCDService setWatchOS_minimumSDKVersionNumber:](v158, "setWatchOS_minimumSDKVersionNumber:", &off_10006CAB8);
  -[TCCDService setMdm_macos_allowedInPayloadDefition:](v158, "setMdm_macos_allowedInPayloadDefition:", 1LL);
  -[NSMutableSet addObject:](v1, "addObject:", v158);
  v159 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceLinkedIn",  &off_10006C498);

  -[TCCDService setAlertStyle:](v159, "setAlertStyle:", 1LL);
  -[TCCDService setIsRevocable:](v159, "setIsRevocable:", 1LL);
  -[TCCDService setShouldTreatAsDeprecated:](v159, "setShouldTreatAsDeprecated:", 1LL);
  -[NSMutableSet addObject:](v1, "addObject:", v159);
  v160 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceAccessibility",  &off_10006C4C0);

  -[TCCDService setAlertStyle:](v160, "setAlertStyle:", 1LL);
  -[TCCDService setShouldAllowUnrestrictedCheckAuditToken:](v160, "setShouldAllowUnrestrictedCheckAuditToken:", 1LL);
  -[TCCDService setHasParanoidSecurityPolicy:](v160, "setHasParanoidSecurityPolicy:", 1LL);
  -[TCCDService setMacos_isPerSystem:](v160, "setMacos_isPerSystem:", 1LL);
  -[TCCDService setMacos_compositionPromoteChildAuthorizationToParent:]( v160,  "setMacos_compositionPromoteChildAuthorizationToParent:",  1LL);
  -[NSMutableSet addObject:](v1, "addObject:", v160);
  v161 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServicePostEvent",  &off_10006C4E8);
  -[TCCDService setHasParanoidSecurityPolicy:](v161, "setHasParanoidSecurityPolicy:", 1LL);
  -[TCCDService setMacos_isPerSystem:](v161, "setMacos_isPerSystem:", 1LL);
  -[TCCDService setAlertStyle:](v161, "setAlertStyle:", 3LL);
  -[TCCDService setDoNotStoreDefaultAllowAccess:](v161, "setDoNotStoreDefaultAllowAccess:", 1LL);
  -[NSMutableSet addObject:](v1, "addObject:", v161);
  v162 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceListenEvent",  &off_10006C510);
  -[TCCDService setHasParanoidSecurityPolicy:](v162, "setHasParanoidSecurityPolicy:", 1LL);
  -[TCCDService setMacos_isPerSystem:](v162, "setMacos_isPerSystem:", 1LL);
  -[TCCDService setAlertStyle:](v162, "setAlertStyle:", 3LL);
  -[TCCDService setDoNotStoreDefaultAllowAccess:](v162, "setDoNotStoreDefaultAllowAccess:", 1LL);
  -[TCCDService setMdm_isAuthorizationDenyOnly:](v162, "setMdm_isAuthorizationDenyOnly:", 1LL);
  -[TCCDService setMdm_allowStandardUserToSetSystemService:](v162, "setMdm_allowStandardUserToSetSystemService:", 1LL);
  v163 = v162;
  -[NSMutableSet addObject:](v1, "addObject:", v163);
  -[TCCDService setMacos_compositionChildService:](v160, "setMacos_compositionChildService:", v161);
  -[TCCDService setMacos_compositionParentService:](v161, "setMacos_compositionParentService:", v160);
  -[TCCDService setMacos_compositionParentService:](v163, "setMacos_compositionParentService:", v161);

  v164 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceSystemPolicyAllFiles",  &off_10006C538);
  -[TCCDService setAlertStyle:](v164, "setAlertStyle:", 1LL);
  -[TCCDService setIsAccessDeniedByDefault:](v164, "setIsAccessDeniedByDefault:", 1LL);
  -[TCCDService setMacos_isPerSystem:](v164, "setMacos_isPerSystem:", 1LL);
  -[NSMutableSet addObject:](v1, "addObject:", v164);
  v165 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceSystemPolicyAppBundles",  &off_10006C560);

  -[TCCDService setAlertStyle:](v165, "setAlertStyle:", 2LL);
  v166 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL URLWithString:]( &OBJC_CLASS___NSURL,  "URLWithString:",  @"x-apple.systempreferences:com.apple.preference.security?Privacy_AppBundles"));
  -[TCCDService setNotificationActionURL:](v165, "setNotificationActionURL:", v166);

  -[TCCDService setUsageDescriptionKeyName:](v165, "setUsageDescriptionKeyName:", @"NSAppBundlesUsageDescription");
  -[TCCDService setIsAccessDeniedByDefault:](v165, "setIsAccessDeniedByDefault:", 1LL);
  -[NSMutableSet addObject:](v1, "addObject:", v165);
  id v167 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceSystemPolicySysAdminFiles",  &off_10006C588);

  -[TCCDService setUsageDescriptionKeyName:]( v167,  "setUsageDescriptionKeyName:",  @"NSSystemAdministrationUsageDescription");
  -[TCCDService setExpirySeconds:](v167, "setExpirySeconds:", &off_10006CB00);
  -[TCCDService setMacos_helpAnchor:](v167, "setMacos_helpAnchor:", @"mchlccb25729");
  -[NSMutableSet addObject:](v1, "addObject:", v167);
  v168 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceSystemPolicyDeveloperFiles",  &off_10006C5B0);

  -[TCCDService setShouldTreatAsDeprecated:](v168, "setShouldTreatAsDeprecated:", 1LL);
  -[NSMutableSet addObject:](v1, "addObject:", v168);
  v169 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceAppleEvents",  &off_10006C5D8);

  -[TCCDService setMacos_hasIndirectObject:](v169, "setMacos_hasIndirectObject:", 1LL);
  -[TCCDService setMacos_shouldAllowSameTeam:](v169, "setMacos_shouldAllowSameTeam:", 1LL);
  -[TCCDService setUsageDescriptionKeyName:]( v169,  "setUsageDescriptionKeyName:",  @"NSAppleEventsUsageDescription");
  -[TCCDService setMacos_helpAnchor:](v169, "setMacos_helpAnchor:", @"mchl108e1718");
  -[TCCDService setMacos_hardenedRuntimeEntitlementName:]( v169,  "setMacos_hardenedRuntimeEntitlementName:",  @"com.apple.security.automation.apple-events");
  -[NSMutableSet addObject:](v1, "addObject:", v169);
  id v170 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceScreenCapture",  &off_10006C600);

  -[TCCDService setCheckAllowEntitlementOnResponsibleProcess:]( v170,  "setCheckAllowEntitlementOnResponsibleProcess:",  1LL);
  -[TCCDService setMacos_isPerSystem:](v170, "setMacos_isPerSystem:", 1LL);
  -[TCCDService setAlertStyle:](v170, "setAlertStyle:", 3LL);
  -[TCCDService setDoNotStoreDefaultAllowAccess:](v170, "setDoNotStoreDefaultAllowAccess:", 1LL);
  -[TCCDService setMacos_helpAnchor:](v170, "setMacos_helpAnchor:", @"mchl592e5686");
  -[TCCDService setMdm_isAuthorizationDenyOnly:](v170, "setMdm_isAuthorizationDenyOnly:", 1LL);
  -[TCCDService setMdm_allowStandardUserToSetSystemService:](v170, "setMdm_allowStandardUserToSetSystemService:", 1LL);
  -[NSMutableSet addObject:](v1, "addObject:", v170);
  v171 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceRemoteDesktop",  &off_10006C628);

  -[TCCDService setMacos_minimumSDKVersionNumber:](v171, "setMacos_minimumSDKVersionNumber:", &off_10006C968);
  -[TCCDService setAlertStyle:](v171, "setAlertStyle:", 3LL);
  -[TCCDService setMacos_isPerSystem:](v171, "setMacos_isPerSystem:", 1LL);
  -[NSMutableSet addObject:](v1, "addObject:", v171);
  v172 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceDeveloperTool",  &off_10006C650);

  -[TCCDService setMacos_helpAnchor:](v172, "setMacos_helpAnchor:", @"mchl830dc1d6");
  -[TCCDService setAlertStyle:](v172, "setAlertStyle:", 1LL);
  -[TCCDService setMacos_isPerSystem:](v172, "setMacos_isPerSystem:", 1LL);
  -[TCCDService setCheckAllowEntitlementOnResponsibleProcess:]( v172,  "setCheckAllowEntitlementOnResponsibleProcess:",  1LL);
  -[TCCDService setMdm_macos_allowedInPayloadDefition:](v172, "setMdm_macos_allowedInPayloadDefition:", 0LL);
  -[NSMutableSet addObject:](v1, "addObject:", v172);
  v173 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceFSKitBlockDevice",  &off_10006C678);

  v174 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDService name](v173, "name"));
  v175 = (void *)objc_claimAutoreleasedReturnValue( +[TCCDService requestAdditionalTextLocalizationKeyNameForServiceName:]( &OBJC_CLASS___TCCDService,  "requestAdditionalTextLocalizationKeyNameForServiceName:",  v174));
  -[TCCDService setRequestAdditionalTextLocalizationKey:](v173, "setRequestAdditionalTextLocalizationKey:", v175);

  -[TCCDService setUsageDescriptionKeyName:]( v173,  "setUsageDescriptionKeyName:",  @"NSFSKitBlockDeviceUsageDescription");
  -[TCCDService setMacos_minimumSDKVersionNumber:](v173, "setMacos_minimumSDKVersionNumber:", &off_10006C938);
  -[NSMutableSet addObject:](v1, "addObject:", v173);
  id v176 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceFileProviderPresence",  &off_10006C6A0);

  -[TCCDService setUsageDescriptionKeyName:]( v176,  "setUsageDescriptionKeyName:",  @"NSFileProviderPresenceUsageDescription");
  -[TCCDService setMacos_minimumSDKVersionNumber:](v176, "setMacos_minimumSDKVersionNumber:", &off_10006C8A8);
  -[NSMutableSet addObject:](v1, "addObject:", v176);
  id v177 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceFileProviderDomain",  &off_10006C6C8);

  -[TCCDService setMacos_hasIndirectObject:](v177, "setMacos_hasIndirectObject:", 1LL);
  -[TCCDService setUsageDescriptionKeyName:]( v177,  "setUsageDescriptionKeyName:",  @"NSFileProviderDomainUsageDescription");
  -[TCCDService setMacos_minimumSDKVersionNumber:](v177, "setMacos_minimumSDKVersionNumber:", &off_10006C8A8);
  -[TCCDService setMdm_macos_allowedInPayloadDefition:](v177, "setMdm_macos_allowedInPayloadDefition:", 0LL);
  -[TCCDService setMacos_helpAnchor:](v177, "setMacos_helpAnchor:", @"mchl4206cab8");
  -[NSMutableSet addObject:](v1, "addObject:", v177);
  v178 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceSystemPolicyAppData",  &off_10006C6F0);

  -[TCCDService setUsageDescriptionKeyName:](v178, "setUsageDescriptionKeyName:", @"NSAppDataUsageDescription");
  -[TCCDService setMacos_minimumSDKVersionNumber:](v178, "setMacos_minimumSDKVersionNumber:", &off_10006CA28);
  -[TCCDService setShouldUseADefaultDescriptionString:](v178, "setShouldUseADefaultDescriptionString:", 1LL);
  -[TCCDService setSessionPidAuthorizationButtonTitleLocalizationKey:]( v178,  "setSessionPidAuthorizationButtonTitleLocalizationKey:",  @"REQUEST_ACCESS_SESSION_PID");
  -[TCCDService setAuthorizationRightsMask:](v178, "setAuthorizationRightsMask:", 39LL);
  -[TCCDService setSupportsStagedPrompting:](v178, "setSupportsStagedPrompting:", 1LL);
  -[TCCDService _makePromptAuthorizationChoiceBlock:](v178, "_makePromptAuthorizationChoiceBlock:", &stru_100065B90);
  -[NSMutableSet addObject:](v1, "addObject:", v178);
  v179 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceVirtualMachineNetworking",  &off_10006C718);

  -[TCCDService setMacos_minimumSDKVersionNumber:](v179, "setMacos_minimumSDKVersionNumber:", &off_10006C968);
  -[NSMutableSet addObject:](v1, "addObject:", v179);
  v180 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceSystemPolicyRemovableVolumes",  &off_10006C740);

  -[TCCDService setMacos_helpAnchor:](v180, "setMacos_helpAnchor:", @"mchl6f613f75");
  -[TCCDService setUsageDescriptionKeyName:]( v180,  "setUsageDescriptionKeyName:",  @"NSRemovableVolumesUsageDescription");
  -[NSMutableSet addObject:](v1, "addObject:", v180);
  v181 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceSystemPolicyNetworkVolumes",  &off_10006C768);

  -[TCCDService setMacos_helpAnchor:](v181, "setMacos_helpAnchor:", @"mchl336d3371");
  -[TCCDService setUsageDescriptionKeyName:]( v181,  "setUsageDescriptionKeyName:",  @"NSNetworkVolumesUsageDescription");
  -[NSMutableSet addObject:](v1, "addObject:", v181);
  v182 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceSystemPolicyDesktopFolder",  &off_10006C790);

  -[TCCDService setMacos_helpAnchor:](v182, "setMacos_helpAnchor:", @"mchlf62acc05");
  -[TCCDService setUsageDescriptionKeyName:]( v182,  "setUsageDescriptionKeyName:",  @"NSDesktopFolderUsageDescription");
  -[NSMutableSet addObject:](v1, "addObject:", v182);
  unsigned int v183 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceSystemPolicyDownloadsFolder",  &off_10006C7B8);

  -[TCCDService setMacos_helpAnchor:](v183, "setMacos_helpAnchor:", @"mchld27a5c7a");
  -[TCCDService setUsageDescriptionKeyName:]( v183,  "setUsageDescriptionKeyName:",  @"NSDownloadsFolderUsageDescription");
  -[NSMutableSet addObject:](v1, "addObject:", v183);
  v184 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceSystemPolicyDocumentsFolder",  &off_10006C7E0);

  -[TCCDService setMacos_helpAnchor:](v184, "setMacos_helpAnchor:", @"mchl1ffddf58");
  -[TCCDService setUsageDescriptionKeyName:]( v184,  "setUsageDescriptionKeyName:",  @"NSDocumentsFolderUsageDescription");
  -[NSMutableSet addObject:](v1, "addObject:", v184);
  unint64_t v185 = -[TCCDService initWithName:availability:]( objc_alloc(&OBJC_CLASS___TCCDService),  "initWithName:availability:",  @"kTCCServiceAudioCapture",  &off_10006C808);

  -[TCCDService setUsageDescriptionKeyName:]( v185,  "setUsageDescriptionKeyName:",  @"NSAudioCaptureUsageDescription");
  -[TCCDService setMacos_pardonMissingUsage:](v185, "setMacos_pardonMissingUsage:", 1LL);
  -[TCCDService setMdm_macos_allowedInPayloadDefition:](v185, "setMdm_macos_allowedInPayloadDefition:", 0LL);
  -[TCCDService setMacos_helpAnchor:](v185, "setMacos_helpAnchor:", @"mchl2844ecab");
  -[NSMutableSet addObject:](v1, "addObject:", v185);
  id v186 = -[NSMutableSet copy](v1, "copy");
  unint64_t v187 = (void *)qword_100078368;
  qword_100078368 = (uint64_t)v186;
}

int sub_10002B1DC( id a1, unint64_t a2, unint64_t a3, unint64_t *a4, unint64_t *a5, unint64_t *a6)
{
  if (a4) {
    BOOL v6 = a5 == 0LL;
  }
  else {
    BOOL v6 = 1;
  }
  int v8 = !v6 && a6 != 0LL;
  if (a2 != 1 || (a3 | 4) != 6) {
    return -1;
  }
  int result = 0;
  if (v8)
  {
    *a4 = 2LL;
    *a5 = 0LL;
    *a6 = 1LL;
  }

  return result;
}

NSString *__cdecl sub_10002B228(id a1, unint64_t a2, unint64_t a3)
{
  uint64_t v3 = @"REQUEST_ACCESS_DONT_ALLOW_kTCCServiceAddressBook_DONT_ALLOW";
  if (a2) {
    uint64_t v3 = 0LL;
  }
  uint64_t v4 = @"REQUEST_ACCESS_FULL_kTCCServiceAddressBook_FULL_ACCESS_PROMPT";
  if (a2 != 2) {
    uint64_t v4 = 0LL;
  }
  uint64_t v5 = @"REQUEST_ACCESS_LEARN_MORE_kTCCServiceAddressBook_LEARN_MORE";
  if (a2 != 6) {
    uint64_t v5 = 0LL;
  }
  if (a3 != 6) {
    uint64_t v5 = 0LL;
  }
  if (a3 != 2) {
    uint64_t v4 = v5;
  }
  if (a3) {
    return &v4->isa;
  }
  else {
    return &v3->isa;
  }
}

int sub_10002B274( id a1, unint64_t a2, unint64_t a3, unint64_t *a4, unint64_t *a5, unint64_t *a6)
{
  if (a4) {
    BOOL v6 = a5 == 0LL;
  }
  else {
    BOOL v6 = 1;
  }
  int v8 = !v6 && a6 != 0LL;
  if (a2 != 4)
  {
    if (a2 == 1)
    {
      if (a3 == 2)
      {
        if ((v8 & 1) != 0)
        {
          unint64_t v11 = 0LL;
          unint64_t v9 = 2LL;
          goto LABEL_25;
        }

        return 0;
      }

      if (a3 == 4)
      {
        if ((v8 & 1) != 0)
        {
          unint64_t v9 = 0LL;
LABEL_22:
          unint64_t v11 = 4LL;
LABEL_25:
          int result = 0;
          *a4 = v11;
          *a5 = v9;
          *a6 = 1LL;
          return result;
        }

        return 0;
      }
    }

    return -1;
  }

  if (a3 == 2)
  {
    int result = 0;
  }

  else
  {
    int v8 = 0;
    int result = -1;
  }

  if (v8 == 1)
  {
    unint64_t v9 = 2LL;
    goto LABEL_22;
  }

  return result;
}

NSString *__cdecl sub_10002B304(id a1, unint64_t a2, unint64_t a3)
{
  uint64_t v3 = @"REQUEST_ACCESS_FULL_kTCCServiceCalendar_FULL";
  if (a2 != 2) {
    uint64_t v3 = 0LL;
  }
  uint64_t v4 = @"REQUEST_ACCESS_ADD_kTCCServiceCalendar_ADD";
  if (a2 != 4) {
    uint64_t v4 = 0LL;
  }
  if (a3 != 4) {
    uint64_t v4 = 0LL;
  }
  if (a3 == 2) {
    return &v3->isa;
  }
  else {
    return &v4->isa;
  }
}

unint64_t sub_10002B338(id a1, unint64_t a2, BOOL a3)
{
  unint64_t v3 = 4LL;
  if (a2 != 2) {
    unint64_t v3 = a2;
  }
  if (a3) {
    return v3;
  }
  else {
    return 2LL * (a2 != 0);
  }
}

NSMutableDictionary *sub_10002B35C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v30[0] = @"subject_ID";
  v30[1] = @"subject_ID_type";
  v30[2] = @"authorization_value";
  v30[3] = @"auth_reason";
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 4LL));
  id v6 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (unint64_t i = 0LL; i != v7; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)i);
        unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v10, (void)v25));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v11, v10);
      }

      id v7 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }

    while (v7);
  }

  uint64_t v12 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v12, @"service");

  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"flags"]);
  LODWORD(v12) = [v13 intValue];

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", (v12 >> 4) & 1));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v14,  @"prompted_for_full");

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"auth_reason"]);
  unsigned int v16 = [v15 intValue];

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"authorization_value"]);
  uint64_t v18 = (int)[v17 intValue];

  BOOL v20 = (v12 & 0x10) == 0 && v16 == 2;
  BOOL v21 = v16 == 2;
  if (v18 != 4) {
    BOOL v21 = 0;
  }
  if (v18) {
    BOOL v22 = v21;
  }
  else {
    BOOL v22 = v20;
  }
  id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v22, (void)v25));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v23,  @"prompted_for_add");

  return v4;
}

int sub_10002B5EC( id a1, unint64_t a2, unint64_t a3, unint64_t *a4, unint64_t *a5, unint64_t *a6)
{
  if (a4) {
    BOOL v6 = a5 == 0LL;
  }
  else {
    BOOL v6 = 1;
  }
  int v8 = !v6 && a6 != 0LL;
  if (a2 == 4)
  {
    if (a3 == 2)
    {
      int result = 0;
    }

    else
    {
      int v8 = 0;
      int result = -1;
    }

    if (v8 == 1)
    {
      unint64_t v10 = 4LL;
      goto LABEL_22;
    }
  }

  else
  {
    if (a2 != 1) {
      return -1;
    }
    if (a3 == 2)
    {
      int result = 0;
    }

    else
    {
      LOBYTE(v_Block_object_dispose(va, 8) = 0;
      int result = -1;
    }

    if ((v8 & 1) != 0)
    {
      unint64_t v10 = 0LL;
LABEL_22:
      int result = 0;
      *a4 = 2LL;
      *a5 = v10;
      *a6 = 3LL;
    }
  }

  return result;
}

NSString *__cdecl sub_10002B660(id a1, unint64_t a2, unint64_t a3)
{
  id v3 = @"REQUEST_ACCESS_LIMITED_kTCCServicePhotos_FULL";
  if (a2 != 3) {
    id v3 = 0LL;
  }
  if (a2 == 2) {
    id v3 = @"REQUEST_ACCESS_FULL_kTCCServicePhotos_FULL";
  }
  if (a3 == 2) {
    return &v3->isa;
  }
  else {
    return 0LL;
  }
}

int sub_10002B68C( id a1, unint64_t a2, unint64_t a3, unint64_t *a4, unint64_t *a5, unint64_t *a6)
{
  BOOL v6 = a2 == 1 && a3 == 3;
  int v7 = !v6;
  int result = v7 << 31 >> 31;
  if (v6 && a4 && a5)
  {
    if (a6)
    {
      int result = 0;
      *a4 = 0LL;
      *a5 = 3LL;
      *a6 = 1LL;
    }
  }

  return result;
}

int sub_10002B6C8( id a1, unint64_t a2, unint64_t a3, unint64_t *a4, unint64_t *a5, unint64_t *a6)
{
  if (a3 == 2) {
    int result = 0;
  }
  else {
    int result = -1;
  }
  if (a3 == 2 && a4 && a5)
  {
    if (a6)
    {
      int result = 0;
      *a4 = 5LL;
      *a5 = 0LL;
      *a6 = 1LL;
    }
  }

  return result;
}

id sub_10002B770(uint64_t a1)
{
  return [*(id *)(a1 + 32) allServices];
}

void sub_10002C01C(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a2;
  id v9 = objc_msgSend((id)objc_opt_class(v6, v8), "tccdPlatformNameForDYLDPlatformName:", v7);
  id v11 = (id)objc_claimAutoreleasedReturnValue(v9);

  unint64_t v10 = v11;
  if (v11)
  {
    [*(id *)(a1 + 40) addObject:v11];
    unint64_t v10 = v11;
  }

  *a4 = 0;
}

int sub_10002C090( id a1, unint64_t a2, unint64_t a3, unint64_t *a4, unint64_t *a5, unint64_t *a6)
{
  return -1;
}

NSString *__cdecl sub_10002C098(id a1, unint64_t a2, unint64_t a3)
{
  return 0LL;
}

unint64_t sub_10002C0A0(id a1, unint64_t a2, BOOL a3)
{
  return a2;
}

NSDictionary *__cdecl sub_10002C0A8(id a1, NSDictionary *a2)
{
  return 0LL;
}

void sub_10002C718(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = a3;
  id v9 = a2;
  id v11 = objc_msgSend((id)objc_opt_class(v7, v10), "versionStringFromDYLDVersionNumber:", v8);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  [*(id *)(a1 + 32) setObject:v12 forKeyedSubscript:v9];
  *a4 = 0;
}

void sub_10002CB54(_Unwind_Exception *a1)
{
}

void sub_10002CB68(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 server]);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 logHandle]);

  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10002DB10(a1, v4, v5);
  }
}

void sub_10002CCD4(_Unwind_Exception *a1)
{
}

void sub_10002CCE8(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 server]);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 logHandle]);

  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10002DB94(a1, v4);
  }
}

uint64_t sub_10002DAF4()
{
  return _os_assert_log(0LL);
}

void sub_10002DAFC()
{
  uint64_t v0 = sub_10002DAF4();
  _os_crash(v0);
  __break(1u);
}

void sub_10002DB10(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 56);
  uint64_t v5 = *(void *)(v3 + 208);
  int v6 = 138543618;
  uint64_t v7 = v4;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  sub_1000110A0( (void *)&_mh_execute_header,  a2,  a3,  "Failed to load localizedResourcesBundle for %{public}@ from path %{public}@",  (uint8_t *)&v6);
}

void sub_10002DB94(uint64_t a1, os_log_s *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 56LL);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[TCCDService defaultLocalizedResourcesBundlePath]( &OBJC_CLASS___TCCDService,  "defaultLocalizedResourcesBundlePath"));
  int v6 = 138543618;
  uint64_t v7 = v3;
  __int16 v8 = 2114;
  uint64_t v9 = v4;
  sub_1000110A0( (void *)&_mh_execute_header,  a2,  v5,  "Failed to load default localization bundle for %{public}@ from path %{public}@",  (uint8_t *)&v6);
}

void sub_10002DC44(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v3 = *(void *)(a1 + 56);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  sub_1000110A0( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "NSLocalizedStringFromTableInBundle failed for service %{public}@: request_key=%{public}@",  (uint8_t *)&v4);
}

void sub_10002DEFC(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  uint64_t v2 = (void *)qword_100078398;
  qword_100078398 = (uint64_t)v1;

  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale localeWithLocaleIdentifier:]( &OBJC_CLASS___NSLocale,  "localeWithLocaleIdentifier:",  @"en_US_POSIX"));
  [(id)qword_100078398 setLocale:v3];

  [(id)qword_100078398 setDateFormat:@"yyyy-MM-dd HH:mm:ssZZZ"];
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](&OBJC_CLASS___NSTimeZone, "systemTimeZone"));
  [(id)qword_100078398 setTimeZone:v4];
}

void handle_TCCAccessResetInternal(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = -[TCCDAttributionChain initWithMessage:](objc_alloc(&OBJC_CLASS___TCCDAttributionChain), "initWithMessage:", v4);
  handle_TCCAccessResetInternal_with_attribution_chain(v4, v3, v5);
}

void handle_TCCAccessResetInternal_with_attribution_chain(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  xpc_object_t xdict = a2;
  __int16 v6 = (void *)objc_claimAutoreleasedReturnValue([a3 requestingProcess]);
  uint64_t v7 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v5, "function"));
  __int16 v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 server]);
  id v28 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 serviceFromMessage:v5 error:&v28]);
  id v12 = v28;

  if (!v11)
  {
    id v14 = objc_opt_new(&OBJC_CLASS___NSMutableString);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v9 server]);
    [v17 buildErrorString:v14 forError:v12 contextString:0];

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v9 server]);
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 logHandle]);

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100030D8C();
    }
    goto LABEL_15;
  }

  string = xpc_dictionary_get_string(v5, "client");
  if (string)
  {
    id v14 = -[TCCDAccessIdentity initWithMessage:](objc_alloc(&OBJC_CLASS___TCCDAccessIdentity), "initWithMessage:", v5);
    id v15 = objc_claimAutoreleasedReturnValue(-[NSMutableString identifier](v14, "identifier"));
    id v16 = [v15 UTF8String];

    if (!v16) {
      goto LABEL_16;
    }
  }

  else
  {
    id v14 = 0LL;
  }

  BOOL v20 = (void *)objc_claimAutoreleasedReturnValue([v9 server]);
  unsigned int v21 = [v20 canProcess:v6 callFunction:v8 forService:v11 withAccessIdentity:v14];

  if (v21)
  {
    __int128 v26 = v6;
    if (string) {
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[NSMutableString identifier](v14, "identifier"));
    }
    else {
      id v19 = (os_log_s *)@"kTCCClientAll";
    }
    char v22 = !xpc_dictionary_get_BOOL(v5, "noKill");
    int v23 = -[NSMutableString client_type](v14, "client_type");
    unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue([v9 server]);
    int v25 = db_reset_access_internal(v11, v19, v23, v24, 0LL, v22);

    if (!v25) {
      xpc_dictionary_set_BOOL(xdict, "result", 1);
    }
    __int16 v6 = v26;
LABEL_15:
  }

LABEL_16:
}

uint64_t showBundleForService(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 entitlements]);
  id v8 = objc_msgSend( v4,  "objectForKey:ofClass:",  @"com.apple.private.tcc.allow",  objc_opt_class(NSArray, v5, v6, v7));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
  LODWORD(v3) = [v9 containsObject:v10];

  return v3 ^ 1;
}

void handle_TCCAccessCopyInformation(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = -[TCCDAttributionChain initWithMessage:](objc_alloc(&OBJC_CLASS___TCCDAttributionChain), "initWithMessage:", v4);
  handle_TCCAccessCopyInformation_with_attribution_chain(v4, v3, v5);
}

void handle_TCCAccessCopyInformation_with_attribution_chain(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  xpc_object_t xdict = a2;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 requestingProcess]);
  id v8 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v5, "function"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 server]);
  id v56 = 0LL;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 serviceFromMessage:v5 error:&v56]);
  id v40 = v56;

  if (v12)
  {
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v10 server]);
    unsigned int v14 = [v13 canProcess:v7 callFunction:v9 forService:v12 withAccessIdentity:0];

    if (v14)
    {
      xpc_object_t value = xpc_dictionary_get_value(v5, "TCCD_MSG_SPI_VERSION");
      id v16 = (void *)objc_claimAutoreleasedReturnValue(value);

      if (v16) {
        uint64_t int64 = xpc_dictionary_get_uint64(v5, "TCCD_MSG_SPI_VERSION");
      }
      else {
        uint64_t int64 = 1LL;
      }
      uint64_t v50 = 0LL;
      id v51 = &v50;
      uint64_t v52 = 0x3032000000LL;
      int v53 = sub_10002ECE0;
      id v54 = sub_10002ECF0;
      id v55 = xpc_array_create(0LL, 0LL);
      if (!v51[5])
      {
LABEL_24:
        _Block_object_dispose(&v50, 8);

        goto LABEL_25;
      }

      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472LL;
      v45[2] = sub_10002ECF8;
      v45[3] = &unk_100065CC0;
      id v22 = v12;
      id v46 = v22;
      id v47 = 0LL;
      int v48 = &v50;
      uint64_t v49 = uint64;
      __int128 v38 = objc_retainBlock(v45);
      int v23 = (void *)objc_claimAutoreleasedReturnValue([v22 name]);
      if ([v23 isEqualToString:@"kTCCServiceSystemPolicyAllFiles"])
      {
        unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue([v10 server]);
        unsigned int v25 = [v24 canProcess:v7 manageESClientServiceWith:v9];

        if (v25)
        {
          v44[0] = _NSConcreteStackBlock;
          v44[1] = 3221225472LL;
          v44[2] = sub_10002F1D8;
          v44[3] = &unk_100064D00;
          __int128 v26 = v44;
          void v44[4] = v22;
          int v27 = db_eval( (uint64_t)"SELECT client, client_type, auth_value, csreq, last_modified, strftime('%s','now') - last_mod ified AS age, indirect_object_identifier, indirect_object_identifier_type, indirect_object_co de_identity, auth_reason, auth_version, flags, pid, pid_version, boot_uuid FROM access WHERE service = ? OR service = ?",  v44,  v38);
LABEL_15:
          int v28 = v27;

          if (!v28)
          {
            if ([v9 isEqualToString:@"TCCAccessCopyInformationForServices"])
            {
              id v29 = objc_claimAutoreleasedReturnValue([v22 name]);
              uint64_t v30 = (const char *)[v29 UTF8String];
              xpc_dictionary_set_value(xdict, v30, (xpc_object_t)v51[5]);
            }

            else
            {
              id v31 = tcc_access_log();
              uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
              BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG);

              if (v33)
              {
                id v34 = tcc_access_log();
                __int128 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
                if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
                {
                  size_t count = xpc_array_get_count((xpc_object_t)v51[5]);
                  sub_100030E64((uint64_t)v57, count, v35);
                }

                __int128 v37 = (void *)v51[5];
                applier[0] = _NSConcreteStackBlock;
                applier[1] = 3221225472LL;
                applier[2] = sub_10002F2D8;
                applier[3] = &unk_100065CE8;
                id v42 = v10;
                xpc_array_apply(v37, applier);
              }

              xpc_dictionary_set_value(xdict, "clients", (xpc_object_t)v51[5]);
            }
          }

          goto LABEL_24;
        }
      }

      else
      {
      }

      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472LL;
      v43[2] = sub_10002F26C;
      v43[3] = &unk_100064D00;
      __int128 v26 = v43;
      v43[4] = v22;
      int v27 = db_eval( (uint64_t)"SELECT client, client_type, auth_value, csreq, last_modified, strftime('%s','now') - last_modifie d AS age, indirect_object_identifier, indirect_object_identifier_type, indirect_object_code_ident ity, auth_reason, auth_version, flags, pid, pid_version, boot_uuid FROM access WHERE service = ?",  v43,  v38);
      goto LABEL_15;
    }
  }

  else
  {
    uint64_t v18 = objc_opt_new(&OBJC_CLASS___NSMutableString);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v10 server]);
    [v19 buildErrorString:v18 forError:v40 contextString:0];

    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue([v10 server]);
    unsigned int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 logHandle]);

    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100030DF8();
    }
  }

void sub_10002ECB8(_Unwind_Exception *a1)
{
}

uint64_t sub_10002ECE0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10002ECF0(uint64_t a1)
{
}

void sub_10002ECF8(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v3 = a1;
  id v4 = *(id *)(a1 + 32);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
  uint64_t v6 = sqlite3_column_int64(a2, 2);
  uint64_t v7 = sqlite3_column_int64(a2, 9);
  uint64_t v8 = sqlite3_column_int64(a2, 10);
  char v9 = sqlite3_column_int64(a2, 11);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 server]);
  unsigned __int8 v11 = objc_msgSend( v10,  "isAccessEntryWithAge:authorizationValue:expiredForService:",  sqlite3_column_int(a2, 5),  v6,  v4);

  if ((v11 & 1) == 0)
  {
    xpc_object_t v14 = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (v14)
    {
      xpc_object_t v15 = xpc_dictionary_create(0LL, 0LL, 0LL);
      int v16 = sqlite3_column_int(a2, 1);
      xpc_dictionary_set_uint64(v15, "TCCD_MSG_IDENTITY_TYPE_KEY", v16);
      uint64_t v17 = sqlite3_column_text(a2, 0);
      xpc_dictionary_set_string(v15, "TCCD_MSG_IDENTITY_ID_KEY", (const char *)v17);
      if (sqlite3_column_type(a2, 3) == 5)
      {
        xpc_dictionary_set_uint64(v15, "TCCD_MSG_IDENTITY_VERIFIER_TYPE_KEY", 0LL);
      }

      else
      {
        char v53 = v9;
        uint64_t v28 = v8;
        uint64_t v29 = v7;
        uint64_t v30 = v5;
        id v31 = v4;
        uint64_t v32 = v3;
        xpc_object_t v33 = v15;
        id v34 = sqlite3_column_blob(a2, 3);
        int v35 = sqlite3_column_bytes(a2, 3);
        __int128 v36 = v34;
        xpc_object_t v15 = v33;
        uint64_t v3 = v32;
        id v4 = v31;
        id v5 = v30;
        uint64_t v7 = v29;
        uint64_t v8 = v28;
        char v9 = v53;
        xpc_dictionary_set_data(v14, "code_requirement", v36, v35);
      }

      xpc_dictionary_set_value(v14, "TCC_MSG_REQUEST_AUTHORIZATION_SUBJECT_IDENTITY_DICTIONARY_KEY", v15);
      xpc_dictionary_set_BOOL(v14, "granted", v6 != 0);
      xpc_dictionary_set_uint64(v14, "auth_value", v6);
      xpc_dictionary_set_uint64(v14, "auth_reason", v7);
      xpc_dictionary_set_uint64(v14, "auth_version", v8);
      xpc_dictionary_set_BOOL(v14, "has_prompted_for_allow", (v9 & 0x10) != 0LL);
      sqlite3_int64 v37 = sqlite3_column_int64(a2, 4);
      xpc_dictionary_set_int64(v14, "last_modified", v37);
      int v38 = sqlite3_column_int(a2, 1);
      int v27 = (os_log_s *)v15;
      if (v38 == 2)
      {
        id v46 = tcc_access_log();
        id v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
          sub_100030FEC(a2, v47);
        }

        int v12 = 1;
        goto LABEL_21;
      }

      if (v38 == 1)
      {
        int v48 = sqlite3_column_text(a2, 0);
        xpc_dictionary_set_string(v14, "path", (const char *)v48);
        goto LABEL_20;
      }

      if (v38)
      {
        id v49 = tcc_access_log();
        uint64_t v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
          sub_100030EE4(a2, v50);
        }
      }

      else
      {
        __int128 v39 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  sqlite3_column_text(a2, 0));
        id v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
        if (v40)
        {
          id v41 = v40;
          xpc_dictionary_set_string(v14, "bundle_id", (const char *)[v41 UTF8String]);
          id v54 = 0LL;
          id v42 = [[LSApplicationRecord alloc] initWithBundleIdentifier:v41 allowPlaceholder:0 error:&v54];
          id v43 = v54;
          if (v42)
          {
            if (showBundleForService(v42, v4))
            {
              int v44 = (void *)objc_claimAutoreleasedReturnValue([v42 URL]);
              id v45 = objc_claimAutoreleasedReturnValue([v44 absoluteString]);
              xpc_dictionary_set_string(v14, "bundle", (const char *)[v45 UTF8String]);

LABEL_20:
              int v12 = 0;
LABEL_21:
              id v13 = v14;
LABEL_26:

              goto LABEL_27;
            }
          }

          else
          {
            id v51 = tcc_access_log();
            uint64_t v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
              sub_100030F6C((uint64_t)v41, (uint64_t)v43, v52);
            }
          }

          id v13 = v14;

          int v12 = 1;
          goto LABEL_26;
        }
      }
    }

    else
    {
      id v18 = tcc_access_log();
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      int v27 = v19;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100030EB0(v19, v20, v21, v22, v23, v24, v25, v26);
      }
    }

    int v12 = 0;
    id v13 = 0LL;
    goto LABEL_26;
  }

  int v12 = 0;
  id v13 = 0LL;
LABEL_27:

  if (v13 && (*(void *)(v3 + 56) != 1LL || !v12)) {
    xpc_array_append_value(*(xpc_object_t *)(*(void *)(*(void *)(v3 + 48) + 8LL) + 40LL), v13);
  }
}

void sub_10002F1D8(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
  if (sqlite3_bind_text( a2,  1,  (const char *)[v3 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
  }

  else
  {
    int v4 = sqlite3_bind_text( a2,  2,  "kTCCServiceEndpointSecurityClient",  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

    if (!v4) {
      return;
    }
  }

  _db_error(1);
}

void sub_10002F26C(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
  LODWORD(a2) = sqlite3_bind_text( a2,  1,  (const char *)[v3 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  if ((_DWORD)a2) {
    _db_error(1);
  }
}

uint64_t sub_10002F2D8(uint64_t a1, uint64_t a2, void *a3)
{
  int v4 = *(void **)(a1 + 32);
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 server]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 descriptionForMessage:v5]);

  id v8 = tcc_access_log();
  char v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100031070((uint64_t)v7, a2, v9);
  }

  return 1LL;
}

BOOL TCCDServerHasPolicyOverride(void *a1, id *a2, void **a3, id *a4)
{
  uint64_t v39 = 0LL;
  id v40 = &v39;
  uint64_t v41 = 0x2020000000LL;
  char v42 = 0;
  uint64_t v33 = 0LL;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000LL;
  __int128 v36 = sub_10002ECE0;
  sqlite3_int64 v37 = sub_10002ECF0;
  id v38 = 0LL;
  uint64_t v27 = 0LL;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  uint64_t v30 = sub_10002ECE0;
  id v31 = sub_10002ECF0;
  id v32 = 0LL;
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  uint64_t v24 = sub_10002ECE0;
  uint64_t v25 = sub_10002ECF0;
  id v26 = 0LL;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10002F690;
  v19[3] = &unk_100064D00;
  id v7 = a1;
  id v20 = v7;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  _OWORD v18[2] = sub_10002F700;
  v18[3] = &unk_100065D10;
  void v18[4] = &v33;
  v18[5] = &v27;
  v18[6] = &v21;
  v18[7] = &v39;
  db_eval( (uint64_t)"SELECT    id, uuid, display FROM    policies JOIN active_policy ON (policies.id = active_policy.policy_id) WHERE    active_policy.client_xpc_type_t type = ? AND active_policy.client = ?",  v19,  v18);
  if (*((_BYTE *)v40 + 24))
  {
    objc_storeStrong(a2, (id)v34[5]);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@:%@", v7, v28[5]));
    char v9 = *a3;
    *a3 = (void *)v8;

    objc_storeStrong(a4, (id)v22[5]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 server]);
    int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 logHandle]);

    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = v34[5];
      xpc_object_t v14 = *a3;
      uint64_t v15 = v22[5];
      *(_DWORD *)buf = 138544130;
      id v44 = v7;
      __int16 v45 = 2114;
      uint64_t v46 = v13;
      __int16 v47 = 2114;
      int v48 = v14;
      __int16 v49 = 2114;
      uint64_t v50 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "PolicyOverride: For %{public}@: policy_id:%{public}@, policy_client: %{public}@, display_name: %{public}@",  buf,  0x2Au);
    }

    BOOL v16 = *((_BYTE *)v40 + 24) != 0;
  }

  else
  {
    BOOL v16 = 0LL;
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  return v16;
}

void sub_10002F644( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, char a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, char a37)
{
}

void sub_10002F690(uint64_t a1, sqlite3_stmt *a2)
{
  if (sqlite3_bind_int(a2, 1, 0)
    || sqlite3_bind_text( a2, 2, (const char *)[*(id *)(a1 + 32) UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
    _db_error(1);
  }

void sub_10002F700(void *a1, sqlite3_stmt *a2)
{
  if (sqlite3_column_type(a2, 0) != 5)
  {
    int v4 = +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", sqlite3_column_int64(a2, 0));
    uint64_t v5 = objc_claimAutoreleasedReturnValue(v4);
    uint64_t v6 = *(void *)(a1[4] + 8LL);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }

  uint64_t v8 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", sqlite3_column_text(a2, 1));
  uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = *(void *)(a1[5] + 8LL);
  unsigned __int8 v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  int v12 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", sqlite3_column_text(a2, 2));
  uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
  uint64_t v14 = *(void *)(a1[6] + 8LL);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  *(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL) = 1;
}

BOOL has_private_tcc_entitlement(void *a1, void *a2, int a3)
{
  id v5 = a1;
  uint64_t v6 = a2;
  xpc_dictionary_get_audit_token(v5, &v23);
  audit_token_t token = v23;
  SecTaskRef v7 = SecTaskCreateWithAuditToken(0LL, &token);
  if (!v7)
  {
    BOOL v14 = 0LL;
LABEL_13:
    if (a3)
    {
      id v15 = v5;
      BOOL v16 = v6;
      xpc_dictionary_get_audit_token(v15, &token);
      audit_token_t atoken = token;
      audit_token_to_au32(&atoken, 0LL, 0LL, 0LL, 0LL, 0LL, &pidp, 0LL, 0LL);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 server]);
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 logHandle]);

      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        pid_t v21 = pidp;
        string = xpc_dictionary_get_string(v15, "function");
        atoken.val[0] = 67109634;
        atoken.val[1] = v21;
        LOWORD(atoken.val[2]) = 2082;
        *(void *)((char *)&atoken.val[2] + 2) = string;
        HIWORD(atoken.val[4]) = 2114;
        *(void *)&atoken.val[5] = v16;
        _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "pid %d attempted to call %{public}s without the %{public}@ entitlement",  (uint8_t *)&atoken,  0x1Cu);
      }
    }

    goto LABEL_17;
  }

  uint64_t v8 = v7;
  if (!v6) {
    goto LABEL_9;
  }
  if ((-[__CFString hasPrefix:](v6, "hasPrefix:", @"com.apple.private.tcc.") & 1) == 0)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 server]);
    unsigned __int8 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 logHandle]);

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000310E4();
    }
  }

  CFTypeRef v12 = SecTaskCopyValueForEntitlement(v8, v6, 0LL);
  if (v12)
  {
    uint64_t v13 = v12;
    BOOL v14 = CFEqual(v12, kCFBooleanTrue) != 0;
    CFRelease(v13);
  }

  else
  {
LABEL_9:
    BOOL v14 = 0LL;
  }

  CFRelease(v8);
  if (!v14) {
    goto LABEL_13;
  }
LABEL_17:

  return v14;
}

void handle_TCCAccessCopyBundleIdentifiersForService(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = -[TCCDAttributionChain initWithMessage:](objc_alloc(&OBJC_CLASS___TCCDAttributionChain), "initWithMessage:", v4);
  handle_TCCAccessCopyBundleIdentifiersForService_with_attribution_chain(v4, v3, v5);
}

void handle_TCCAccessCopyBundleIdentifiersForService_with_attribution_chain(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  xpc_object_t xdict = a2;
  id v6 = a3;
  SecTaskRef v7 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 requestingProcess]);
  uint64_t v9 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v5, "function"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v7 server]);
  v40[0] = 0LL;
  CFTypeRef v12 = (void *)objc_claimAutoreleasedReturnValue([v11 serviceFromMessage:v5 error:v40]);
  id v13 = v40[0];

  if (v12)
  {
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v7 server]);
    unsigned int v15 = [v14 canProcess:v8 callFunction:v10 forService:v12 withAccessIdentity:0];

    if (v15)
    {
      uint64_t v34 = 0LL;
      uint64_t v35 = &v34;
      uint64_t v36 = 0x3032000000LL;
      uint64_t v37 = sub_10002ECE0;
      id v38 = sub_10002ECF0;
      id v39 = xpc_array_create(0LL, 0LL);
      if (v35[5])
      {
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472LL;
        v30[2] = sub_10002FE68;
        v30[3] = &unk_100065D38;
        id v16 = v7;
        id v31 = v16;
        id v17 = v12;
        id v32 = v17;
        uint64_t v33 = &v34;
        id v26 = objc_retainBlock(v30);
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 server]);
        LODWORD(v16) = [v18 canProcess:v8 manageESClientServiceWith:v10];

        if ((_DWORD)v16)
        {
          v29[0] = _NSConcreteStackBlock;
          v29[1] = 3221225472LL;
          v29[2] = sub_10002FF2C;
          v29[3] = &unk_100064D00;
          id v19 = v29;
          v29[4] = v17;
          int v20 = db_eval( (uint64_t)"SELECT client, strftime('%s','now') - last_modified AS age, auth_value FROM access WHERE (ser vice = ? OR service = ?) AND client_type = ? AND auth_value != 0",  v29,  v26);
        }

        else
        {
          v28[0] = _NSConcreteStackBlock;
          v28[1] = 3221225472LL;
          v28[2] = sub_10002FFD0;
          v28[3] = &unk_100064D00;
          id v19 = v28;
          void v28[4] = v17;
          int v20 = db_eval( (uint64_t)"SELECT client, strftime('%s','now') - last_modified AS age, auth_value FROM access WHERE serv ice = ? AND client_type = ? AND auth_value != 0",  v28,  v26);
        }

        int v25 = v20;

        if (!v25) {
          xpc_dictionary_set_value(xdict, "clients", (xpc_object_t)v35[5]);
        }
      }

      _Block_object_dispose(&v34, 8);
    }
  }

  else
  {
    pid_t v21 = objc_opt_new(&OBJC_CLASS___NSMutableString);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v7 server]);
    [v22 buildErrorString:v21 forError:v13 contextString:0];

    audit_token_t v23 = (void *)objc_claimAutoreleasedReturnValue([v7 server]);
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v23 logHandle]);

    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_100031150();
    }
  }
}

void sub_10002FE50( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
}

void sub_10002FE68(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = sqlite3_column_int64(a2, 2);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) server]);
  LOBYTE(v4) = objc_msgSend( v5,  "isAccessEntryWithAge:authorizationValue:expiredForService:",  sqlite3_column_int(a2, 1),  v4,  *(void *)(a1 + 40));

  if ((v4 & 1) == 0)
  {
    id v6 = sqlite3_column_text(a2, 0);
    if (v6)
    {
      xpc_object_t v7 = xpc_string_create((const char *)v6);
      if (v7)
      {
        id v8 = v7;
        xpc_array_append_value(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), v7);
      }
    }
  }

void sub_10002FF2C(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
  if (sqlite3_bind_text( a2,  1,  (const char *)[v3 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)
    || sqlite3_bind_text(a2, 2, "kTCCServiceEndpointSecurityClient", -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {

LABEL_4:
    _db_error(1);
    return;
  }

  int v4 = sqlite3_bind_int(a2, 3, 0);

  if (v4) {
    goto LABEL_4;
  }
}

void sub_10002FFD0(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
  if (sqlite3_bind_text( a2,  1,  (const char *)[v3 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
  }

  else
  {
    int v4 = sqlite3_bind_int(a2, 2, 0);

    if (!v4) {
      return;
    }
  }

  _db_error(1);
}

void handle_TCCAccessCopyInformationForBundle(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = -[TCCDAttributionChain initWithMessage:](objc_alloc(&OBJC_CLASS___TCCDAttributionChain), "initWithMessage:", v4);
  handle_TCCAccessCopyInformationForBundle_with_attribution_chain(v4, v3, v5);
}

void handle_TCCAccessCopyInformationForBundle_with_attribution_chain(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 requestingProcess]);
  uint64_t v9 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v5, "function"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  string = xpc_dictionary_get_string(v5, "client");
  CFTypeRef v12 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 server]);
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDService serviceAll](&OBJC_CLASS___TCCDService, "serviceAll"));
  unsigned int v15 = [v13 canProcess:v8 callFunction:v10 forService:v14 withAccessIdentity:0];

  if (v15 && string)
  {
    uint64_t v20 = 0LL;
    pid_t v21 = &v20;
    uint64_t v22 = 0x3032000000LL;
    audit_token_t v23 = sub_10002ECE0;
    uint64_t v24 = sub_10002ECF0;
    id v25 = xpc_array_create(0LL, 0LL);
    if (v21[5])
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_1000302EC;
      v19[3] = &unk_100064FF8;
      void v19[4] = string;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_10003034C;
      v16[3] = &unk_100065048;
      id v17 = v12;
      id v18 = &v20;
      if (!db_eval( (uint64_t)"SELECT service, auth_value, last_modified, csreq, strftime('%s','now') - last_modif ied AS age, indirect_object_identifier, indirect_object_identifier_type, indirect_o bject_code_identity, auth_reason, auth_version, flags FROM access WHERE client = ? AND client_xpc_type_t type = ?",  v19,  v16)) {
        xpc_dictionary_set_value(v6, "services", (xpc_object_t)v21[5]);
      }
    }

    _Block_object_dispose(&v20, 8);
  }
}

void sub_1000302D4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_1000302EC(uint64_t a1, sqlite3_stmt *a2)
{
  if (sqlite3_bind_text(a2, 1, *(const char **)(a1 + 32), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)
    || sqlite3_bind_int(a2, 2, 0))
  {
    _db_error(1);
  }

void sub_10003034C(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = objc_autoreleasePoolPush();
  id v5 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", sqlite3_column_text(a2, 0));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v6)
  {
    uint64_t v7 = sqlite3_column_int64(a2, 1);
    sqlite3_int64 value = sqlite3_column_int64(a2, 8);
    uint64_t v8 = sqlite3_column_int64(a2, 9);
    char v9 = sqlite3_column_int64(a2, 10);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 serviceByName:v6]);

    if (v11)
    {
      CFTypeRef v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) server]);
      unsigned __int8 v13 = objc_msgSend( v12,  "isAccessEntryWithAge:authorizationValue:expiredForService:",  sqlite3_column_int(a2, 4),  v7,  v11);

      if ((v13 & 1) == 0)
      {
        xpc_object_t v14 = xpc_dictionary_create(0LL, 0LL, 0LL);
        if (v14)
        {
          xpc_dictionary_set_string( v14, "service", (const char *)[v6 UTF8String]);
          xpc_dictionary_set_BOOL(v14, "granted", v7 != 0);
          xpc_dictionary_set_uint64(v14, "auth_value", v7);
          xpc_dictionary_set_uint64(v14, "auth_reason", value);
          xpc_dictionary_set_uint64(v14, "auth_version", v8);
          xpc_dictionary_set_BOOL(v14, "has_prompted_for_allow", (v9 & 0x10) != 0LL);
          sqlite3_int64 v15 = sqlite3_column_int64(a2, 2);
          xpc_dictionary_set_int64(v14, "last_modified", v15);
          if (sqlite3_column_type(a2, 3) != 5)
          {
            id v16 = sqlite3_column_blob(a2, 3);
            int v17 = sqlite3_column_bytes(a2, 3);
            xpc_dictionary_set_data(v14, "code_requirement", v16, v17);
          }

          xpc_array_append_value(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), v14);
        }

        else
        {
          id v18 = tcc_access_log();
          id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            sub_1000311BC(v19, v20, v21);
          }
        }
      }
    }
  }

  objc_autoreleasePoolPop(v4);
}

void handle_TCCAccessCopyBundleIdentifiersDisabledForService(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = -[TCCDAttributionChain initWithMessage:](objc_alloc(&OBJC_CLASS___TCCDAttributionChain), "initWithMessage:", v4);
  handle_TCCAccessCopyBundleIdentifiersDisabledForService_with_attribution_chain(v4, v3, v5);
}

void handle_TCCAccessCopyBundleIdentifiersDisabledForService_with_attribution_chain( void *a1, void *a2, void *a3)
{
  id v5 = a1;
  xpc_object_t xdict = a2;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 requestingProcess]);
  uint64_t v8 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v5, "function"));
  char v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 server]);
  v40[0] = 0LL;
  CFTypeRef v12 = (void *)objc_claimAutoreleasedReturnValue([v11 serviceFromMessage:v5 error:v40]);
  id v13 = v40[0];

  if (v12)
  {
    xpc_object_t v14 = (void *)objc_claimAutoreleasedReturnValue([v10 server]);
    unsigned int v15 = [v14 canProcess:v7 callFunction:v9 forService:v12 withAccessIdentity:0];

    if (v15)
    {
      uint64_t v34 = 0LL;
      uint64_t v35 = &v34;
      uint64_t v36 = 0x3032000000LL;
      uint64_t v37 = sub_10002ECE0;
      id v38 = sub_10002ECF0;
      id v39 = xpc_array_create(0LL, 0LL);
      if (v35[5])
      {
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472LL;
        v30[2] = sub_1000309B0;
        v30[3] = &unk_100065D38;
        id v16 = v10;
        id v31 = v16;
        id v17 = v12;
        id v32 = v17;
        uint64_t v33 = &v34;
        id v26 = objc_retainBlock(v30);
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 server]);
        LODWORD(v16) = [v18 canProcess:v7 manageESClientServiceWith:v9];

        if ((_DWORD)v16)
        {
          v29[0] = _NSConcreteStackBlock;
          v29[1] = 3221225472LL;
          v29[2] = sub_100030A74;
          v29[3] = &unk_100064D00;
          id v19 = v29;
          v29[4] = v17;
          int v20 = db_eval( (uint64_t)"SELECT client, strftime('%s','now') - last_modified AS age, auth_value FROM access WHERE (ser vice = ? OR service = ?) AND client_type = ? AND auth_value = 0",  v29,  v26);
        }

        else
        {
          v28[0] = _NSConcreteStackBlock;
          v28[1] = 3221225472LL;
          v28[2] = sub_100030B18;
          v28[3] = &unk_100064D00;
          id v19 = v28;
          void v28[4] = v17;
          int v20 = db_eval( (uint64_t)"SELECT client, strftime('%s','now') - last_modified AS age, auth_value FROM access WHERE serv ice = ? AND client_type = ? AND auth_value = 0",  v28,  v26);
        }

        int v25 = v20;

        if (!v25) {
          xpc_dictionary_set_value(xdict, "clients", (xpc_object_t)v35[5]);
        }
      }

      _Block_object_dispose(&v34, 8);
    }
  }

  else
  {
    uint64_t v21 = objc_opt_new(&OBJC_CLASS___NSMutableString);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v10 server]);
    [v22 buildErrorString:v21 forError:v13 contextString:0];

    audit_token_t v23 = (void *)objc_claimAutoreleasedReturnValue([v10 server]);
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v23 logHandle]);

    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_100031230();
    }
  }
}

void sub_100030998( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
}

void sub_1000309B0(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = sqlite3_column_int64(a2, 2);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) server]);
  LOBYTE(v4) = objc_msgSend( v5,  "isAccessEntryWithAge:authorizationValue:expiredForService:",  sqlite3_column_int(a2, 1),  v4,  *(void *)(a1 + 40));

  if ((v4 & 1) == 0)
  {
    id v6 = sqlite3_column_text(a2, 0);
    if (v6)
    {
      xpc_object_t v7 = xpc_string_create((const char *)v6);
      if (v7)
      {
        id v8 = v7;
        xpc_array_append_value(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), v7);
      }
    }
  }

void sub_100030A74(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
  if (sqlite3_bind_text( a2,  1,  (const char *)[v3 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)
    || sqlite3_bind_text(a2, 2, "kTCCServiceEndpointSecurityClient", -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {

LABEL_4:
    _db_error(1);
    return;
  }

  int v4 = sqlite3_bind_int(a2, 3, 0);

  if (v4) {
    goto LABEL_4;
  }
}

void sub_100030B18(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
  if (sqlite3_bind_text( a2,  1,  (const char *)[v3 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
  }

  else
  {
    int v4 = sqlite3_bind_int(a2, 2, 0);

    if (!v4) {
      return;
    }
  }

  _db_error(1);
}

void handle_TCCAccessCopyInformationForServices(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = -[TCCDAttributionChain initWithMessage:](objc_alloc(&OBJC_CLASS___TCCDAttributionChain), "initWithMessage:", v4);
  handle_TCCAccessCopyCountInformationForServices_with_attribution_chain(v4, v3, v5);
}

void handle_TCCAccessCopyCountInformationForServices_with_attribution_chain(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  xpc_object_t array = xpc_dictionary_get_array(v5, "services");
  char v9 = (void *)objc_claimAutoreleasedReturnValue(array);
  if (xpc_get_type(v9) == (xpc_type_t)&_xpc_type_array)
  {
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472LL;
    applier[2] = sub_100030D34;
    applier[3] = &unk_100065D60;
    id v20 = v5;
    id v21 = v6;
    id v22 = v7;
    xpc_array_apply(v9, applier);
  }

  else
  {
    id v10 = tcc_access_log();
    unsigned __int8 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10003129C(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
}

uint64_t sub_100030D34(xpc_object_t *a1, int a2, xpc_object_t xstring)
{
  string_ptr = xpc_string_get_string_ptr(xstring);
  xpc_dictionary_set_string(a1[4], "service", string_ptr);
  handle_TCCAccessCopyInformation_with_attribution_chain(a1[4], a1[5], a1[6]);
  return 1LL;
}

void sub_100030D7C(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
}

void sub_100030D8C()
{
}

void sub_100030DF8()
{
}

void sub_100030E64(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a1 = 136446466;
  *(void *)(a1 + 4) = "handle_TCCAccessCopyInformation_with_attribution_chain";
  *(_WORD *)(a1 + 12) = 2048;
  *(void *)(a1 + 14) = a2;
  sub_100030D7C((void *)&_mh_execute_header, a2, a3, "%{public}s: returning %zu clients", (uint8_t *)a1);
}

void sub_100030EB0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100030EE4(sqlite3_stmt *a1, os_log_s *a2)
{
  v3[0] = 67109120;
  v3[1] = sqlite3_column_int(a1, 1);
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "handle_TCCAccessCopyInformation(): Unknown identity type: %d.",  (uint8_t *)v3,  8u);
  sub_100004C7C();
}

void sub_100030F6C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Failed to initialize LSApplicationRecord with bundle ID: %{public}@, error: %{public}@",  (uint8_t *)&v3,  0x16u);
  sub_100004C7C();
}

void sub_100030FEC(sqlite3_stmt *a1, os_log_s *a2)
{
  int v4 = 136446210;
  __int16 v5 = sqlite3_column_text(a1, 0);
  sub_100004C90( (void *)&_mh_execute_header,  a2,  v3,  "handle_TCCAccessCopyInformation(): skipping identity type: IDENTITY_TYPE_POLICY_ID for identifier: %{public}s.",  (uint8_t *)&v4);
}

void sub_100031070(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2114;
  uint64_t v6 = a1;
  sub_100030D7C((void *)&_mh_execute_header, a2, a3, "[%zu] = %{public}@", (uint8_t *)&v3);
  sub_100004C7C();
}

void sub_1000310E4()
{
}

void sub_100031150()
{
}

void sub_1000311BC(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315138;
  uint64_t v4 = "handle_TCCAccessCopyInformationForBundle_with_attribution_chain_block_invoke_2";
  sub_100004C90((void *)&_mh_execute_header, a1, a3, "%s: failed to allocate accessRecord dictionary", (uint8_t *)&v3);
  sub_100004C7C();
}

void sub_100031230()
{
}

void sub_10003129C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100031350(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.tccd.policy-override", &_dispatch_queue_attr_concurrent);
  uint64_t v2 = (void *)qword_1000783A8;
  qword_1000783A8 = (uint64_t)v1;
}

void sub_100031648( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_100031660(uint64_t a1)
{
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v14 objects:v24 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      uint64_t v6 = 0LL;
      while (2)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v14 + 1) + 8 * v6);
        id v8 = *(id *)(a1 + 40);
        do
        {
          *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = objc_msgSend( v7,  "_locked_evaluateAccessByIdentity:toService:wit hIndirectObjectIdentityIdentity:authorizationReason:",  *(void *)(a1 + 48),  v8,  *(void *)(a1 + 56),  *(void *)(a1 + 72),  (void)v14);
          if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) != 1LL)
          {
            id v10 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
            unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 server]);
            uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 logHandle]);

            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) identifier]);
              *(_DWORD *)buf = 138543874;
              id v19 = v7;
              __int16 v20 = 2114;
              id v21 = v8;
              __int16 v22 = 2114;
              audit_token_t v23 = v13;
              _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Override: found override in %{public}@ for %{public}@ and %{public}@",  buf,  0x20u);
            }

            goto LABEL_15;
          }

          uint64_t v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "macos_compositionParentService"));

          id v8 = (id)v9;
        }

        while (v9);
        if ((id)++v6 != v4) {
          continue;
        }
        break;
      }

      id v4 = [v2 countByEnumeratingWithState:&v14 objects:v24 count:16];
    }

    while (v4);
  }

void sub_100031D08(uint64_t a1)
{
  if (qword_1000783C0 != -1) {
    dispatch_once(&qword_1000783C0, &stru_100065DC8);
  }
  id v2 = (os_log_s *)qword_1000783C8;
  if (os_log_type_enabled((os_log_t)qword_1000783C8, OS_LOG_TYPE_DEBUG)) {
    sub_100032EBC(a1, v2);
  }
  [*(id *)(a1 + 32) loadPlist];
  [*(id *)(a1 + 32) parsePlist];
  access_changed();
}

LABEL_60:
        uint64_t v13 = v47 + 1;
      }

      while ((id)(v47 + 1) != v41);
      uint64_t v41 = [obj countByEnumeratingWithState:&v63 objects:v78 count:16];
      if (!v41)
      {
LABEL_62:

        return;
      }
    }
  }

id sub_100032BB8(uint64_t a1)
{
  id result = (id)dispatch_source_get_data(*(dispatch_source_t *)(a1 + 32));
  if (result)
  {
    id v3 = result;
    sleep(3u);
    if (qword_1000783C0 != -1) {
      dispatch_once(&qword_1000783C0, &stru_100065DC8);
    }
    id v4 = (os_log_s *)qword_1000783C8;
    if (os_log_type_enabled((os_log_t)qword_1000783C8, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = 134218242;
      id v7 = v3;
      __int16 v8 = 2114;
      uint64_t v9 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Override: watchPlistChanges: reloading (0x%lx): %{public}@",  (uint8_t *)&v6,  0x16u);
    }

    [*(id *)(a1 + 48) loadAndParse];
    return [*(id *)(a1 + 48) watchPlistChanges];
  }

  return result;
}

uint64_t sub_100032CBC(uint64_t a1)
{
  int handle = dispatch_source_get_handle(*(dispatch_source_t *)(a1 + 32));
  return close(handle);
}

void sub_100032D6C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TCC", "access");
  id v2 = (void *)qword_1000783C8;
  qword_1000783C8 = (uint64_t)v1;
}

void sub_100032D9C(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Override: no plist file path.", v1, 2u);
}

void sub_100032DDC(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)id v3 = 138543618;
  *(void *)&void v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  sub_100027DE8( (void *)&_mh_execute_header,  a2,  a3,  "Override: error opening: %{public}@: %@",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16]);
  sub_100004C7C();
}

void sub_100032E4C(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)id v3 = 138543618;
  *(void *)&void v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  sub_100027DE8( (void *)&_mh_execute_header,  a2,  a3,  "Override:  found a config file at %{public}@ but could not get a plist from it: %{public}@",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16]);
  sub_100004C7C();
}

void sub_100032EBC(uint64_t a1, os_log_s *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Override: loading policy data for %{public}@",  (uint8_t *)&v3,  0xCu);
  sub_100004C7C();
}

void sub_100032F30(uint64_t a1, void *a2)
{
  int v3 = a2;
  int v4 = *__error();
  int v5 = 138543618;
  uint64_t v6 = a1;
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "Override: watchPlistChanges: failed to open(%{public}@, O_EVTONLY): %{darwin.errno}d ",  (uint8_t *)&v5,  0x12u);
}

LABEL_36:
    uint64_t v41 = 0LL;
    goto LABEL_52;
  }

  if (!a5) {
    goto LABEL_36;
  }
  id v19 = @"Refusing Request for missing function key.";
  __int16 v20 = 7LL;
LABEL_35:
  uint64_t v41 = 0LL;
  *a5 = +[TCCDServer newErrorWithCode:format:](&OBJC_CLASS___TCCDServer, "newErrorWithCode:format:", v20, v19);
LABEL_52:

  return v41;
}

void sub_100033B18(uint64_t *a1, os_log_s *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "%{public}@ read client data",  (uint8_t *)&v3,  0xCu);
}

CFStringRef TCCDPromptPolicyResultString(unint64_t a1)
{
  if (a1 > 4) {
    return @"<Invalid Prompt Policy Result>";
  }
  else {
    return *(&off_100065F20 + a1);
  }
}

void sub_100033BF4(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"TCCDPlatformMacOS",  @"TCCDPlatformIOS",  @"TCCDPlatformWatchOS",  @"TCCDPlatformTVOS",  0LL));
  uint64_t v2 = (void *)qword_1000783D0;
  qword_1000783D0 = v1;
}

void sub_100033C90(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"TCCDPlatformIOS",  @"TCCDPlatformWatchOS",  @"TCCDPlatformTVOS",  0LL));
  uint64_t v2 = (void *)qword_1000783E0;
  qword_1000783E0 = v1;
}

void sub_100033D24(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", @"TCCDPlatformMacOS", 0LL));
  uint64_t v2 = (void *)qword_1000783F0;
  qword_1000783F0 = v1;
}

void sub_100033DA4(id a1)
{
  uint64_t v1 = -[TCCDPlatform initWithName:]( objc_alloc(&OBJC_CLASS___TCCDPlatformTVOS),  "initWithName:",  @"TCCDPlatformTVOS");
  uint64_t v2 = (void *)qword_100078400;
  qword_100078400 = (uint64_t)v1;
}

void sub_100033E18(id a1)
{
  v3[0] = @"com.apple.private.tcc.manager";
  v3[1] = @"com.apple.private.tcc.manager.set-responsible";
  _DWORD v3[2] = @"com.apple.private.tcc.manager.compute-designated-requirement";
  v3[3] = @"com.apple.private.tcc.manager.compute-indirect-object-identity";
  void v3[4] = @"com.apple.private.tcc.manager.service-composition";
  v3[5] = @"com.apple.private.tcc.manager.check-by-audit-token";
  v3[6] = @"com.apple.private.tcc.manager.access.read";
  v3[7] = @"com.apple.private.tcc.manager.access.modify";
  uint8_t v3[8] = @"com.apple.private.tcc.manager.access.modify.webapp";
  v3[9] = @"com.apple.private.tcc.manager.access.delete";
  v3[10] = @"com.apple.private.tcc.manager.access.report";
  v3[11] = @"com.apple.private.tcc.manager.service-override.modify";
  v3[12] = @"com.apple.private.tcc.manager.expiration.read";
  v3[13] = @"com.apple.private.tcc.manager.expiration.delete";
  v3[14] = @"com.apple.private.tcc.test-manager.service-composition";
  v3[15] = @"com.apple.private.tcc.allow";
  uint8_t v3[16] = @"com.apple.private.tcc.allow.overridable";
  v3[17] = @"com.apple.private.tcc.allow-or-regional-prompt";
  v3[18] = @"com.apple.private.tcc.allow-or-regional-prompt.overridable";
  v3[19] = @"com.apple.private.tcc.check-allow-on-responsible-process";
  v3[20] = @"com.apple.private.tcc.system";
  v3[21] = @"com.apple.private.tcc.policy-override";
  v3[22] = @"com.apple.private.tcc.allow-prompting";
  v3[23] = @"com.apple.security.personal-information.addressbook";
  _BYTE v3[24] = @"com.apple.security.personal-information.calendars";
  v3[25] = @"com.apple.security.personal-information.photos-library";
  v3[26] = @"com.apple.security.device.camera";
  v3[27] = @"com.apple.security.device.audio-input";
  v3[28] = @"com.apple.security.automation.apple-events";
  v3[29] = @"com.apple.private.tcc.override-prompt-policy";
  v3[30] = @"com.apple.tcc.delegated-services";
  v3[31] = @"com.apple.developer.on-demand-install-capable";
  v3[32] = @"com.apple.private.attribution.implicitly-assumed-identity";
  v3[33] = @"com.apple.private.attribution.explicitly-assumed-identities";
  v3[34] = @"com.apple.developer.endpoint-security.client";
  v3[35] = @"com.apple.private.tcc.set_client_data";
  v3[36] = @"com.apple.private.tcc.ifdreader";
  v3[37] = @"com.apple.developer.arkit.barcode-detection.allow";
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v3, 38LL));
  uint64_t v2 = (void *)qword_100078418;
  qword_100078418 = v1;
}

void sub_10003432C(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDService allServices](&OBJC_CLASS___TCCDService, "allServices"));
  int v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (unint64_t i = 0LL; i != v6; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "validOnPlatformNames", (void)v15));
        unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
        unsigned int v12 = [v10 containsObject:v11];

        if (v12)
        {
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v9, v13);
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v6);
  }

  id v14 = -[NSMutableDictionary copy](v3, "copy");
  [*(id *)(a1 + 32) setServicesByName:v14];

  [*(id *)(a1 + 32) _configureServices];
}

NSMutableDictionary *sub_100034DA8(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  int v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v3, @"service");

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  *(void *)(a1 + 40),  @"API");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  *(void *)(a1 + 48),  @"plugin");
  return v2;
}

void sub_100034E30()
{
  id v0 = tcc_access_log();
  uint64_t v1 = (os_log_s *)objc_claimAutoreleasedReturnValue(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    sub_100035DBC();
  }
}

NSMutableDictionary *sub_1000351F0(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  int v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stringForAnalyticsAction:*(void *)(a1 + 80)]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v3, @"action");

  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) name]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v4, @"service");

  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *(void *)(a1 + 88)));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v5,  @"authorization_value");

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", *(void *)(a1 + 96)));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v6, @"prompt_type");

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) authorizationRightStateForValue:*(void *)(a1 + 88) reason:0]);
  int v8 = v7;
  if (v7)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 rightDescription]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v9,  @"authorization_right");
  }

  if (*(_BYTE *)(a1 + 120))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 40) authorizationRightStateForValue:*(void *)(a1 + 104) reason:0]);

    if (v10)
    {
      unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 rightDescription]);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v11,  @"v1_authorization_right");

      int v8 = v10;
    }

    else
    {
      int v8 = 0LL;
    }
  }

  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) name]);
  unsigned __int8 v13 = [v12 isEqualToString:@"kTCCServiceUserTracking"];

  if ((v13 & 1) == 0)
  {
    uint64_t v14 = *(void *)(a1 + 48);
    if (v14) {
      [*(id *)(a1 + 32) updateAnalyticsEvent:v2 fromIdentity:v14 keyPrefix:@"subject"];
    }
    uint64_t v15 = *(void *)(a1 + 56);
    if (v15) {
      [*(id *)(a1 + 32) updateAnalyticsEvent:v2 fromIdentity:v15 keyPrefix:@"indirect_object"];
    }
  }

  uint64_t v16 = *(void *)(a1 + 64);
  if (v16) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v16,  @"request_reason");
  }
  if (*(void *)(a1 + 112))
  {
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v17, @"desired_auth");
  }

  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) server]);
  id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 logHandle]);

  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    uint64_t v20 = *(void *)(a1 + 72);
    int v22 = 138543618;
    uint64_t v23 = v20;
    __int16 v24 = 2114;
    int v25 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "Analytics Event sending: %{public}@\n%{public}@",  (uint8_t *)&v22,  0x16u);
  }

  return v2;
}

void sub_1000354D8()
{
  id v0 = tcc_access_log();
  uint64_t v1 = (os_log_s *)objc_claimAutoreleasedReturnValue(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    sub_100035E28();
  }
}

id sub_1000356D0(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) server]);
  int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue([v2 logHandle]);

  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    int v7 = 138543618;
    uint64_t v8 = v4;
    __int16 v9 = 2114;
    uint64_t v10 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Analytics Event sending: %{public}@\n%{public}@",  (uint8_t *)&v7,  0x16u);
  }

  return *(id *)(a1 + 48);
}

void sub_1000357A4()
{
  id v0 = tcc_access_log();
  uint64_t v1 = (os_log_s *)objc_claimAutoreleasedReturnValue(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    sub_100035E94();
  }
}

id sub_10003599C(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) server]);
  int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue([v2 logHandle]);

  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    int v7 = 138543618;
    uint64_t v8 = v4;
    __int16 v9 = 2114;
    uint64_t v10 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Analytics Event async sending: %{public}@\n%{public}@",  (uint8_t *)&v7,  0x16u);
  }

  return *(id *)(a1 + 48);
}

void sub_100035A70()
{
  id v0 = tcc_access_log();
  uint64_t v1 = (os_log_s *)objc_claimAutoreleasedReturnValue(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    sub_100035F00();
  }
}

void sub_100035C30(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(va, 8) = a1;
}

void sub_100035C3C(uint64_t a1, void *a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a2 localizedDescription]);
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  __int16 v9 = v5;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "configurationDictionary:  found a config file at %{public}@ but could not get a plist from it: %{public}@",  (uint8_t *)&v6,  0x16u);

  sub_1000110B8();
}

void sub_100035CE0()
{
  __assert_rtn("-[TCCDPlatform bootUUID]", "TCCDPlatform.m", 283, "len == sizeof(uuidString)");
}

void sub_100035D08(void *a1, void *a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  int v6 = (void *)objc_claimAutoreleasedReturnValue([a2 path]);
  int v7 = 138412546;
  __int16 v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_DEBUG,  "Identified provisional outer-most app bundle for %@ as %@",  (uint8_t *)&v7,  0x16u);

  sub_1000110B8();
}

void sub_100035DBC()
{
}

void sub_100035E28()
{
}

void sub_100035E94()
{
}

void sub_100035F00()
{
}

void sub_1000367A8(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 error]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedDescription]);
  int v5 = 138543362;
  int v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);
}

void sub_100036894(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___TCCDEventPublisher);
  uint64_t v2 = (void *)qword_100078448;
  qword_100078448 = (uint64_t)v1;
}

void sub_100036A64( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_100036A94(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  int v6 = (id *)(a1 + 32);
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _handleEventWithAction:a2 token:a3 descriptor:v7];
}

void sub_100036AF4(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleError:a2];
}

void sub_100036DA0(void *a1)
{
  uint64_t v2 = -[TCCDEventFilter initWithCriteria:](objc_alloc(&OBJC_CLASS___TCCDEventFilter), "initWithCriteria:", a1[4]);
  uint64_t v3 = -[TCCDEventSubscriber initWithToken:filter:fromPublisher:]( objc_alloc(&OBJC_CLASS___TCCDEventSubscriber),  "initWithToken:filter:fromPublisher:",  a1[6],  v2,  a1[5]);
  uint64_t v4 = a1[6];
  int v5 = *(void **)(a1[5] + 24LL);
  int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v4));
  [v5 setObject:v3 forKeyedSubscript:v6];

  id v7 = tcc_events_log();
  __int16 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 138543362;
    uint64_t v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Added subscriber %{public}@", (uint8_t *)&v9, 0xCu);
  }
}

void sub_100036F84(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_dictionary_get_audit_token(v3, &v19);
    int v9 = (const char *)xpc_copy_code_signing_identity_for_token(&v19);
    if (v9)
    {
      uint64_t v10 = -[NSString initWithBytesNoCopy:length:encoding:freeWhenDone:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytesNoCopy:length:encoding:freeWhenDone:",  v9,  strlen(v9),  4LL,  1LL);
    }

    else
    {
      unsigned __int8 v11 = xpc_copy_description(v3);
      id v12 = tcc_events_log();
      unsigned __int8 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1000379D4(a1, (uint64_t)v11, v13);
      }

      free(v11);
      uint64_t v10 = 0LL;
    }

    uint64_t v14 = (void *)xpc_copy_entitlement_for_token("com.apple.private.tcc.events.subscriber", &v19);
    uint64_t v15 = v14;
    if (v14 && xpc_get_type(v14) == (xpc_type_t)&_xpc_type_BOOL)
    {
      BOOL value = xpc_BOOL_get_value(v15);
      (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
      if (value) {
        goto LABEL_14;
      }
    }

    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    }

    objc_msgSend(*(id *)(a1 + 40), "_removeSubscriber:", objc_msgSend(*(id *)(a1 + 32), "token"));
LABEL_14:

    goto LABEL_15;
  }

  int v5 = type;
  int v6 = xpc_copy_description(v3);
  id v7 = tcc_events_log();
  __int16 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    name = xpc_type_get_name(v5);
    uint64_t v18 = *(void *)(a1 + 32);
    int v19 = 136446722;
    uint64_t v20 = v6;
    __int16 v21 = 2082;
    int v22 = name;
    __int16 v23 = 2114;
    uint64_t v24 = v18;
    _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Received invalid reply %{public}s of type %{public}s from subscriber %{public}@",  (uint8_t *)&v19,  0x20u);
  }

  free(v6);
  objc_msgSend(*(id *)(a1 + 40), "_removeSubscriber:", objc_msgSend(*(id *)(a1 + 32), "token"));
LABEL_15:
}

void sub_100037228(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24LL);
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *(void *)(a1 + 40)));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:v3]);

  uint64_t v5 = *(void *)(a1 + 40);
  int v6 = *(void **)(*(void *)(a1 + 32) + 24LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v5));
  [v6 removeObjectForKey:v7];

  id v8 = tcc_events_log();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = 138543362;
    unsigned __int8 v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Removed subscriber %{public}@",  (uint8_t *)&v10,  0xCu);
  }
}

void sub_10003768C(uint64_t a1)
{
  uint64_t v2 = *(_BYTE **)(a1 + 32);
  if (v2[32])
  {
    id v3 = tcc_events_log();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      id v6 = [*(id *)(*(void *)(a1 + 32) + 24) count];
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 24LL);
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v5;
      __int16 v21 = 2048;
      id v22 = v6;
      __int16 v23 = 2114;
      uint64_t v24 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Publishing %{public}@ to %lu subscribers: %{public}@",  buf,  0x20u);
    }

    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v8 = *(id *)(*(void *)(a1 + 32) + 24LL);
    id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        id v12 = 0LL;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*(void *)(a1 + 32) + 24),  "objectForKeyedSubscript:",  *(void *)(*((void *)&v14 + 1) + 8 * (void)v12),  (void)v14));
          [v13 publish:*(void *)(a1 + 40)];

          id v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }

      while (v10);
    }
  }

  else
  {
    [v2 _addPendingEvent:*(void *)(a1 + 40)];
  }

void sub_1000378AC(uint64_t a1, os_log_s *a2)
{
  int v3 = 136315138;
  uint64_t v4 = xpc_strerror();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Received error: %s", (uint8_t *)&v3, 0xCu);
  sub_1000110E8();
}

void sub_10003792C(int a1, uint64_t a2, os_log_t log)
{
  int v3 = "Add";
  if (a1 == 1) {
    int v3 = "Remove";
  }
  if (a1 == 2) {
    int v3 = "Initial Barrier";
  }
  int v4 = 136446466;
  uint64_t v5 = v3;
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Received event: action=%{public}s, token=%llu",  (uint8_t *)&v4,  0x16u);
  sub_100004C7C();
}

void sub_1000379D4(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2082;
  uint64_t v7 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Failed to copy code signing identity of subscriber %{public}@ from reply: %{public}s",  (uint8_t *)&v4,  0x16u);
  sub_100004C7C();
}

void sub_100037A58(uint64_t a1, os_log_s *a2)
{
  int v4 = 138543362;
  uint64_t v5 = objc_opt_class(a1, a2);
  sub_100015348( (void *)&_mh_execute_header,  a2,  v3,  "%{public}@ pendingEvents exceeded limit, removed oldest event",  (uint8_t *)&v4);
  sub_1000110E8();
}

void sub_100037AD0(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = a1;
  sub_100015348((void *)&_mh_execute_header, a2, a3, "Added pending event: %@", (uint8_t *)&v3);
  sub_100004C7C();
}

LABEL_3:
  unsigned __int8 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TCCDProcess logHandle](self, "logHandle"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    __int128 v15 = objc_opt_class(self, v14);
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDProcess identifier](self, "identifier"));
    __int128 v17 = -[TCCDProcess pid](self, "pid");
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
    int v19 = (void *)objc_claimAutoreleasedReturnValue([0 name]);
    uint64_t v27 = 138544642;
    uint64_t v28 = v15;
    uint64_t v29 = 2114;
    uint64_t v30 = v16;
    id v31 = 1024;
    id v32 = v17;
    uint64_t v33 = 2114;
    uint64_t v34 = v8;
    uint64_t v35 = 2114;
    uint64_t v36 = v18;
    uint64_t v37 = 2114;
    id v38 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "<%{public}@: identifier=%{public}@, pid=%d> has the %{public}@ entitlement for service %{public}@ (composed to par ent: %{public}@)",  (uint8_t *)&v27,  0x3Au);
  }

  uint64_t v20 = 1;
LABEL_12:

  return v20;
}

void sub_100038A64(void *a1, os_log_s *a2)
{
  unsigned int v3 = [a1 pid];
  int v4 = *__error();
  uint64_t v5 = __error();
  __int16 v6 = strerror(*v5);
  v7[0] = 67109634;
  v7[1] = v3;
  __int16 v8 = 1024;
  int v9 = v4;
  __int16 v10 = 2082;
  uint64_t v11 = v6;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "proc_pidpath_audittoken() failed from PID[%d]: (#%d) %{public}s",  (uint8_t *)v7,  0x18u);
  sub_1000110B8();
}

void sub_100038B18(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 136446466;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Failed to get realpath of binaryPath: %{public}s: %{public}@",  (uint8_t *)&v3,  0x16u);
  sub_100004C7C();
}

void sub_100038B98(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 description]);
  sub_10001AF40();
  sub_10001BCF8( (void *)&_mh_execute_header,  v2,  v3,  "%{public}@: Entitlement: %{public}@ is not of type Boolean/NSNumber as expected.",  v4,  v5,  v6,  v7,  v8);

  sub_1000110B8();
}

void sub_100038C18(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 description]);
  sub_10001AF40();
  sub_10001BCF8( (void *)&_mh_execute_header,  v2,  v3,  "%{public}@: Entitlement: %{public}@ is not of type NSArray as required.",  v4,  v5,  v6,  v7,  v8);

  sub_1000110B8();
}

void sub_100038C98(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 description]);
  sub_10001AF40();
  sub_10001BCF8( (void *)&_mh_execute_header,  v2,  v3,  "%{public}@: Entitlement: %{public}@ is not of type NSDictionary as required.",  v4,  v5,  v6,  v7,  v8);

  sub_1000110B8();
}

void sub_100038D18( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100038D80()
{
}

void sub_100038DE8()
{
}

void sub_100038E50( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100038EB8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void log_open_file_descriptors()
{
  id v0 = tcc_open_fds_log();
  os_log_t v1 = (os_log_s *)objc_claimAutoreleasedReturnValue(v0);
  pid_t v2 = getpid();
  int v3 = proc_pidinfo(v2, 1, 0LL, 0LL, 0);
  if (v3 == -1)
  {
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      sub_1000393EC(v1, v20, v21, v22, v23, v24, v25, v26);
    }
  }

  else
  {
    int v4 = v3;
    uint64_t v5 = (int *)malloc(v3);
    if (v5)
    {
      uint64_t v6 = v5;
      int v7 = proc_pidinfo(v2, 1, 0LL, v5, v4);
      if (v7 == -1)
      {
        if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
          sub_10003944C(v1, v34, v35, v36, v37, v38, v39, v40);
        }
      }

      else
      {
        int v8 = v7;
        int v9 = v7 >> 3;
        if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67240192;
          *(_DWORD *)&uint8_t buf[4] = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEFAULT,  "%{public}d open file descriptors",  buf,  8u);
        }

        if (v8 >= 8)
        {
          if (v9 <= 1) {
            uint64_t v10 = 1LL;
          }
          else {
            uint64_t v10 = v9;
          }
          uint64_t v11 = v6 + 1;
          do
          {
            if (*v11 == 1)
            {
              memcpy(buf, "<path not found>", sizeof(buf));
              fcntl(*(v11 - 1), 50, buf);
              if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
              {
                int v12 = *(v11 - 1);
                int v13 = *v11;
                v41[0] = 67240706;
                v41[1] = v12;
                __int16 v42 = 1026;
                int v43 = v13;
                __int16 v44 = 2082;
                __int16 v45 = buf;
                __int128 v14 = (uint8_t *)v41;
                __int128 v15 = v1;
                __int128 v16 = "%{public}d|%{public}d : %{public}s";
                uint32_t v17 = 24;
LABEL_16:
                _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v16, v14, v17);
              }
            }

            else if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
            {
              int v18 = *(v11 - 1);
              int v19 = *v11;
              *(_DWORD *)buf = 67240448;
              *(_DWORD *)&uint8_t buf[4] = v18;
              *(_WORD *)&uint8_t buf[8] = 1026;
              *(_DWORD *)&buf[10] = v19;
              __int128 v14 = buf;
              __int128 v15 = v1;
              __int128 v16 = "%{public}d|%{public}d";
              uint32_t v17 = 14;
              goto LABEL_16;
            }

            v11 += 2;
            --v10;
          }

          while (v10);
        }
      }

      free(v6);
    }

    else if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      sub_10003941C(v1, v27, v28, v29, v30, v31, v32, v33);
    }
  }
}

void exhaust_file_descriptors()
{
  id v0 = tcc_open_fds_log();
  os_log_t v1 = (os_log_s *)objc_claimAutoreleasedReturnValue(v0);
  pid_t v2 = getpid();
  int v3 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 server]);
  id v5 = objc_claimAutoreleasedReturnValue([v4 temporaryDirectory]);
  uint64_t v6 = (const char *)[v5 UTF8String];

  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    int v18 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEFAULT,  "Exhausting available file descriptors by opening files in %{public}s",  buf,  0xCu);
  }

  bzero(buf, 0x400uLL);
  if ((snprintf((char *)buf, 0x400uLL, "%s/tccd-%d-%04d", v6, v2, 0) & 0x80000000) == 0)
  {
    int v7 = 1;
    do
    {
      if (open((const char *)buf, 513, 493LL) == -1)
      {
        int v8 = v1;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          int v10 = *__error();
          *(_DWORD *)uint64_t v11 = 136446722;
          int v12 = "exhaust_file_descriptors";
          __int16 v13 = 2082;
          __int128 v14 = buf;
          __int16 v15 = 1024;
          int v16 = v10;
          _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%{public}s: failed to open temp file at path %{public}s: open() failed with errno %d",  v11,  0x1Cu);
        }
      }

      int v9 = snprintf((char *)buf, 0x400uLL, "%s/tccd-%d-%04d", v6, v2, v7++);
    }

    while ((v9 & 0x80000000) == 0);
  }

  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    sub_10003947C(v1);
  }
}

void sub_1000393EC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003941C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003944C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003947C(os_log_t log)
{
  int v1 = 136446210;
  pid_t v2 = "exhaust_file_descriptors";
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%{public}s: failed to format string for temp_file_path",  (uint8_t *)&v1,  0xCu);
}

id sub_100039620(uint64_t a1)
{
  pid_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TCCDPolicyOverride logHandle](&OBJC_CLASS___TCCDPolicyOverride, "logHandle"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "MDMPolicyOverride: configuration profile changed; reloading.",
      v4,
      2u);
  }

  return [*(id *)(a1 + 32) loadAndParse];
}

void sub_100039BE0(_Unwind_Exception *a1)
{
}

void sub_100039C28(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
  if (sqlite3_bind_text( a2,  1,  (const char *)[v4 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)
    || sqlite3_bind_text( a2, 2, (const char *)[*(id *)(a1 + 40) UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {

LABEL_4:
    _db_error(1);
    return;
  }

  int v5 = sqlite3_bind_int(a2, 3, *(_DWORD *)(a1 + 48));

  if (v5) {
    goto LABEL_4;
  }
}

uint64_t sub_100039CE4(uint64_t a1, sqlite3_stmt *a2)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
  uint64_t result = sqlite3_column_int(a2, 0);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result;
  return result;
}

void sub_100039D28(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
  if (sqlite3_bind_text( a2,  2,  (const char *)[v4 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)
    || sqlite3_bind_text( a2, 3, (const char *)[*(id *)(a1 + 40) UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {

LABEL_5:
    _db_error(1);
    return;
  }

  int v5 = sqlite3_bind_int(a2, 4, *(_DWORD *)(a1 + 48));

  if (v5) {
    goto LABEL_5;
  }
}

void sub_100039DF8(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
  if (sqlite3_bind_text( a2,  1,  (const char *)[v4 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)
    || sqlite3_bind_text( a2, 2, (const char *)[*(id *)(a1 + 40) UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)
    || sqlite3_bind_int(a2, 3, *(_DWORD *)(a1 + 56))
    || sqlite3_bind_int64(a2, 4, 0LL)
    || sqlite3_bind_int64(a2, 5, 6LL)
    || sqlite3_bind_int64(a2, 6, 2LL)
    || sqlite3_bind_blob( a2, 7, [*(id *)(a1 + 48) bytes], (int)objc_msgSend(*(id *)(a1 + 48), "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)
    || sqlite3_bind_null(a2, 8)
    || sqlite3_bind_text(a2, 9, "UNUSED", -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {

LABEL_11:
    _db_error(1);
    return;
  }

  int v5 = sqlite3_bind_int(a2, 10, *(_DWORD *)(a1 + 64));

  if (v5) {
    goto LABEL_11;
  }
}

void sub_10003A1F4(uint64_t a1, sqlite3_stmt *a2)
{
}

void sub_10003A228(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", sqlite3_column_text(a2, 0));
  int v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", sqlite3_column_text(a2, 1));
  int v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  int v8 = sqlite3_column_int(a2, 2);
  int v9 = sqlite3_column_int(a2, 3);
  int v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) policyAccessByIdentifier]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v7]);

  if (!v11) {
    goto LABEL_10;
  }
  int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v5]);
  __int16 v13 = v12;
  if (v12)
  {
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"IdentifierType"]);
    else {
      BOOL v15 = 0;
    }
    if (v15)
    {
    }

    else
    {
      int v16 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"IdentifierType"]);
      unsigned int v17 = [v16 isEqualToString:@"path"];

      if (!v17 || v8 != 1) {
        goto LABEL_9;
      }
    }

    goto LABEL_17;
  }

void sub_10003A4C0(uint64_t a1, sqlite3_stmt *a2)
{
  if (sqlite3_bind_int(a2, 1, *(_DWORD *)(a1 + 48))
    || sqlite3_bind_text( a2, 2, (const char *)[*(id *)(a1 + 32) UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)
    || sqlite3_bind_text( a2, 3, (const char *)[*(id *)(a1 + 40) UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)
    || sqlite3_bind_int(a2, 4, *(_DWORD *)(a1 + 52)))
  {
    _db_error(1);
  }

void sub_10003A728(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Skipping MDM policy authorization record with invalid IdentifierType: %{public}@",  (uint8_t *)&v2,  0xCu);
}

void sub_10003A974(_Unwind_Exception *a1)
{
}

void sub_10003A988(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  int v7 = *(os_unfair_lock_s **)(a1 + 32);
  uint64_t v6 = (id *)(a1 + 32);
  int v8 = v7 + 6;
  os_unfair_lock_lock(v7 + 6);
  id v9 = [v5 copy];
  int v10 = (void *)*((void *)*v6 + 6);
  *((void *)*v6 + 6) = v9;

  uint64_t v11 = *v6;
  if (a3)
  {
    uint8_t v11[4] = 2LL;
    id v12 = tcc_events_log();
    __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_10003AD68((uint64_t)v6, v13, v14, v15, v16, v17, v18, v19);
    }

    [*v6 _publishPendingEvents];
  }

  else
  {
    uint8_t v11[4] = 3LL;
    id v20 = tcc_events_log();
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10003ADD0((uint64_t *)v6, v21);
    }
  }

  os_unfair_lock_unlock(v8);
}

void sub_10003AA68(_Unwind_Exception *a1)
{
}

void sub_10003AB1C(_Unwind_Exception *a1)
{
}

void sub_10003AD68( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003ADD0(uint64_t *a1, os_log_s *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%{public}@ failed entitlement check",  (uint8_t *)&v3,  0xCu);
  sub_100004C7C();
}

void sub_10003AE44( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

LABEL_12:
  v10->_responsibleProcessIsValid = 1;
  responsibleProcess = v10->_responsibleProcess;
  v10->_responsibleProcess = 0LL;

LABEL_13:
  id v23 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 server]);
  int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue([v24 logHandle]);

  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    int v26 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDAttributionChain description](v10, "description"));
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v26;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "AttributionChain: %{public}@", buf, 0xCu);
  }

LABEL_20:
  return v10;
}

void sub_10003B90C(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a2 requestingProcess]);
  int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 description]);
  sub_10003B8F4();
  sub_10001BCF8( (void *)&_mh_execute_header,  v4,  v5,  "Failed to build 'accessingProcess' from %{public}s in message from <%{public}@>",  v6,  v7,  v8,  v9,  v10);

  sub_1000110B8();
}

void sub_10003B9A0(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a2 requestingProcess]);
  int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 description]);
  sub_10003B8F4();
  sub_10001BCF8( (void *)&_mh_execute_header,  v4,  v5,  "'%{public}s' is wrong size in message from %{public}@",  v6,  v7,  v8,  v9,  v10);

  sub_1000110B8();
}

void sub_10003BA34(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "BUNDLE_ATTRIBUTION: attributed bundle creation fails for: %{public}@",  (uint8_t *)&v2,  0xCu);
}

id sub_10003BCB4(uint64_t a1)
{
  return [*(id *)(a1 + 32) display];
}

LABEL_19:
    uint64_t v17 = -[TCCDAlert persistentStateType](self, "persistentStateType");
    uint64_t v19 = (id)objc_claimAutoreleasedReturnValue(-[TCCDAlert service](self, "service"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v19 name]);
    db_persistent_state_reset(v17, v11);
LABEL_23:

    return;
  }

  uint64_t v9 = -[TCCDAlert persistentStateValue](self, "persistentStateValue");
  if (v9 < -[TCCDAlert displayCountlimit](self, "displayCountlimit"))
  {
    uint8_t v10 = -[TCCDAlert persistentStateType](self, "persistentStateType");
    uint64_t v19 = (id)objc_claimAutoreleasedReturnValue(-[TCCDAlert service](self, "service"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v19 name]);
    id v12 = -[TCCDAlert persistentStateValue](self, "persistentStateValue") + 1;
    __int16 v13 = v10;
    uint64_t v14 = v11;
LABEL_22:
    db_persistent_state_set_value(v13, v14, v12);
    goto LABEL_23;
  }

void sub_10003C1D0()
{
}

void sub_10003C1E8()
{
}

void sub_10003C200()
{
}

void sub_10003C218()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
  [v0 prepareForAbort];

  _os_crash("_db_error");
  __break(1u);
}

void sub_10003C250(uint64_t *a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  int v4 = 136446210;
  uint64_t v5 = v3;
  sub_100004C90((void *)&_mh_execute_header, a2, a3, "sqlite3_expanded_sql failed on %{public}s", (uint8_t *)&v4);
  sub_100004C7C();
}

void sub_10003C2BC(uint64_t a1, int a2, os_log_s *a3)
{
  int v4 = 136446722;
  uint64_t v5 = a1;
  __int16 v6 = 1024;
  int v7 = a2;
  __int16 v8 = 2080;
  uint64_t v9 = sqlite3_errstr(a2);
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "sqlite3_step() for %{public}s failed: %d (%s)",  (uint8_t *)&v4,  0x1Cu);
}

void sub_10003C370(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)uint64_t v3 = 136446466;
  *(void *)&void v3[4] = a1;
  *(_WORD *)&v3[12] = 1024;
  *(_DWORD *)&v3[14] = a2;
  sub_100004C68( (void *)&_mh_execute_header,  a2,  a3,  "Failed to create %{public}s (%d)",  *(void *)v3,  *(void *)&v3[8],  *(_WORD *)&v3[16]);
  sub_100004C7C();
}

void sub_10003C3E0()
{
}

void sub_10003C3F8(void *a1, os_log_s *a2)
{
  if ([a1 registryDBHandle]) {
    uint64_t v5 = sqlite3_errmsg((sqlite3 *)[a1 registryDBHandle]);
  }
  else {
    uint64_t v5 = "allocation failed";
  }
  int v6 = 136446210;
  int v7 = v5;
  sub_100004C90((void *)&_mh_execute_header, a2, v4, "Failed to open database: %{public}s", (uint8_t *)&v6);
}

void sub_10003C498( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003C4FC(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)uint64_t v3 = 136446466;
  *(void *)&void v3[4] = a1;
  *(_WORD *)&v3[12] = 1026;
  *(_DWORD *)&v3[14] = a2;
  sub_100004C68( (void *)&_mh_execute_header,  a2,  a3,  "Failed to query registry for db at path %{public}s: error %{public}d",  *(void *)v3,  *(void *)&v3[8],  *(_WORD *)&v3[16]);
  sub_100004C7C();
}

void sub_10003C56C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003C5D0()
{
}

void sub_10003C5FC()
{
}

void sub_10003C628()
{
}

void sub_10003C654()
{
}

void sub_10003C680( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003C6E4(uint64_t *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  int v5 = 136446722;
  uint8_t v6 = "-[TCCDMessageController init]";
  __int16 v7 = 2048;
  uint64_t v8 = v3;
  __int16 v9 = 2048;
  uint64_t v10 = v4;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%{public}s: Allocation failure: _queue %p, _messageTypesToHandlers: %p",  (uint8_t *)&v5,  0x20u);
}

void sub_10003C780( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003C7F4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003C868(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Platform does not support sending messages!",  v1,  2u);
}

void sub_10003C8A8()
{
}

void sub_10003C914()
{
}

void sub_10003C92C(void *a1)
{
  id v2 = a1;
  sub_1000110D8();
  sub_1000110AC();
  sub_100004C90((void *)&_mh_execute_header, v1, v3, "service handler: %{public}s", v4);

  sub_1000110B8();
}

void sub_10003C9B8(void *a1)
{
  id v2 = a1;
  sub_1000110D8();
  sub_1000110AC();
  sub_100004C90((void *)&_mh_execute_header, v1, v3, "client handler: %{public}s", v4);

  sub_1000110B8();
}

void sub_10003CA44()
{
}

void sub_10003CAA4()
{
}

void sub_10003CB04()
{
}

void sub_10003CB64()
{
}

void sub_10003CBC4()
{
}

void sub_10003CC30()
{
}

void sub_10003CC9C()
{
}

void sub_10003CCFC()
{
}

void sub_10003CD68()
{
}

void sub_10003CDD4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (os_log_s *)sub_1000110F4(a1);
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue([a2 name]);
  sub_1000110AC();
  __int16 v8 = 2112;
  uint64_t v9 = a3;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "VACUUM expired after DELETE of (%@ : %@)",  v7,  0x16u);

  sub_1000110B8();
}

void sub_10003CE7C()
{
}

void sub_10003CEDC()
{
}

void sub_10003CF48(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 5;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Generating bogus DB query in %u seconds...",  (uint8_t *)v1,  8u);
  sub_100004C60();
}

void sub_10003CFC0()
{
  __int16 v3 = 2082;
  uint64_t v4 = v0;
  sub_1000110A0( (void *)&_mh_execute_header,  v1,  (uint64_t)v1,  "show-alert: Invalid parameters service arg: %{public}s, condition arg: %{public}s",  v2);
  sub_100004C7C();
}

void sub_10003D034()
{
}

void sub_10003D094()
{
}

void sub_10003D0F4()
{
}

void sub_10003D154()
{
}

void sub_10003D1C0()
{
}

void sub_10003D22C(void *a1, void *a2)
{
  uint64_t v3 = (os_log_s *)sub_1000110F4(a1);
  int v5 = 136446466;
  uint8_t v6 = "handle_TCCGetIdentityForCredential";
  __int16 v7 = 2082;
  __int16 v8 = xpc_copy_description(a2);
  sub_1000110A0( (void *)&_mh_execute_header,  v3,  v4,  "%{public}s: Failed to initialize attributionChain for message: %{public}s",  (uint8_t *)&v5);

  sub_1000110E8();
}

void sub_10003D2C4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003D33C()
{
}

void sub_10003D3A8()
{
}

void sub_10003D414( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003D484(void *a1, void *a2)
{
  uint64_t v3 = (os_log_s *)sub_1000110F4(a1);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a2 messageIdentifier]);
  sub_1000110AC();
  sub_100004C90((void *)&_mh_execute_header, v3, v5, "AUTHREQ_ERROR: msgID=%{public}@, nil result", v6);

  sub_1000110E8();
}

void sub_10003D510(void *a1, void *a2, uint64_t a3, os_log_s *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  sub_1000110A0( (void *)&_mh_execute_header,  a4,  a3,  "AUTHREQ_ERROR: Failed to retrieve %@ record from db for client: %@",  (uint8_t *)a3);
}

void sub_10003D574()
{
}

void sub_10003D5A0(uint64_t a1, uint64_t a2, uint64_t a3, os_log_s *a4)
{
  *(_DWORD *)a1 = 134218240;
  *(void *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 12) = 2048;
  *(void *)(a1 + 14) = a3;
  sub_1000110A0( (void *)&_mh_execute_header,  a4,  a3,  "Staged prompting request is invalid: currentAuth: %llu desiredAuth: %llu",  (uint8_t *)a1);
}

void sub_10003D5EC(uint8_t *buf, int a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "client has already prompted for full access, flags: %d",  buf,  8u);
}

void sub_10003D630()
{
}

void sub_10003D65C(uint64_t a1, int a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
  v6[0] = 67109378;
  v6[1] = a2;
  __int16 v7 = 2114;
  __int16 v8 = v5;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "handle_TCCExpirationCopyInformationForService(): unexpected client_type: %d for query for service %{public}@.",  (uint8_t *)v6,  0x12u);

  sub_1000110B8();
}

void sub_10003D700()
{
}

void sub_10003D72C()
{
}

id objc_msgSend__createCacheKeyWithAccessorAuditToken_responsibleAuditToken_isSpecificIdentity_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createCacheKeyWithAccessorAuditToken:responsibleAuditToken:isSpecificIdentity:");
}

id objc_msgSend__locked_evaluateAccessByIdentity_toService_withIndirectObjectIdentityIdentity_authorizationReason_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_locked_evaluateAccessByIdentity:toService:withIndirectObjectIdentityIdentity:authorizationReason:");
}

id objc_msgSend_attributedBundleUsingOutermostBundle_computedStaticCodeRef_computedNonIdentifiableBundleURL_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "attributedBundleUsingOutermostBundle:computedStaticCodeRef:computedNonIdentifiableBundleURL:");
}

id objc_msgSend_authorizationChoicesForCurrentAuth_desiredAuth_aButtonAuth_bButtonAuth_cButtonAuth_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authorizationChoicesForCurrentAuth:desiredAuth:aButtonAuth:bButtonAuth:cButtonAuth:");
}

id objc_msgSend_evaluateAccessToService_defaultAccessAllowed_by_checkCodeRequirements_authorizationResult_authorizationReason_flags_subjectCodeIdentityDataResult_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "evaluateAccessToService:defaultAccessAllowed:by:checkCodeRequirements:authorizationResult:authorizationReason :flags:subjectCodeIdentityDataResult:");
}

id objc_msgSend_evaluateComposedAuthorizationToService_andAccessSubject_withRelation_authorizationResult_authorizationReason_subjectCodeIdentityDataResult_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "evaluateComposedAuthorizationToService:andAccessSubject:withRelation:authorizationResult:authorizationReason: subjectCodeIdentityDataResult:");
}

id objc_msgSend_initWithEventType_service_subjectIdentifierType_subjectIdentifier_authValue_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEventType:service:subjectIdentifierType:subjectIdentifier:authValue:");
}

id objc_msgSend_initWithIdentifier_authority_displayNamePolicyIdentifier_verifierType_verifierData_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:authority:displayNamePolicyIdentifier:verifierType:verifierData:");
}

id objc_msgSend_initWithSubject_object_authorizationValue_authorizationReason_authorizationVersion_lastModified_flags_replaceStoredCodeRequirement_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithSubject:object:authorizationValue:authorizationReason:authorizationVersion:lastModified:flags:replace StoredCodeRequirement:");
}

id objc_msgSend_presentSynchronousPromptWithHeader_message_aButtonTitle_aButtonAuth_bButtonTitle_bButtonAuth_cButtonTitle_cButtonAuth_currentAuth_updatingResult_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "presentSynchronousPromptWithHeader:message:aButtonTitle:aButtonAuth:bButtonTitle:bButtonAuth:cButtonTitle:cBu ttonAuth:currentAuth:updatingResult:");
}

id objc_msgSend_presentSynchronousPromptWithHeader_message_aButtonTitle_aButtonAuth_bButtonTitle_bButtonAuth_cButtonTitle_cButtonAuth_currentAuth_withTimeoutInSeconds_updatingResult_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "presentSynchronousPromptWithHeader:message:aButtonTitle:aButtonAuth:bButtonTitle:bButtonAuth:cButtonTitle:cBu ttonAuth:currentAuth:withTimeoutInSeconds:updatingResult:");
}

id objc_msgSend_presentSynchronousPromptWithHeader_message_aButtonTitle_aButtonAuth_bButtonTitle_bButtonAuth_currentAuth_updatingResult_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "presentSynchronousPromptWithHeader:message:aButtonTitle:aButtonAuth:bButtonTitle:bButtonAuth:currentAuth:updatingResult:");
}

id objc_msgSend_publishAccessChangedEvent_forService_client_clientType_authValue_andKillClient_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "publishAccessChangedEvent:forService:client:clientType:authValue:andKillClient:");
}

id objc_msgSend_reminderRequestAllowAuthorizationButtonTitleTextLocalizationKeyNameForServiceName_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reminderRequestAllowAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:");
}

id objc_msgSend_reminderRequestLimitedAuthorizationButtonTitleTextLocalizationKeyNameForServiceName_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reminderRequestLimitedAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:");
}

id objc_msgSend_requestAllowAuthorizationButtonTitleTextLocalizationKeyNameForServiceName_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestAllowAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:");
}

id objc_msgSend_requestDenyAuthorizationButtonTitleTextLocalizationKeyNameForServiceName_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestDenyAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:");
}

id objc_msgSend_requestLimitedAuthorizationButtonTitleTextLocalizationKeyNameForServiceName_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestLimitedAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:");
}

id objc_msgSend_sendAnalyticsForAction_service_subjectIdentity_indirectObjectIdentity_authValue_includeV1AuthValue_v1AuthValue_desiredAuth_domainReason_promptType_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "sendAnalyticsForAction:service:subjectIdentity:indirectObjectIdentity:authValue:includeV1AuthValue:v1AuthValu e:desiredAuth:domainReason:promptType:");
}

id objc_msgSend_subsequentRequestAllowAuthorizationButtonTitleTextLocalizationKeyNameForServiceName_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subsequentRequestAllowAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:");
}

id objc_msgSend_subsequentRequestDenyAuthorizationButtonTitleTextLocalizationKeyNameForServiceName_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subsequentRequestDenyAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:");
}

id objc_msgSend_translateAllFilesToEndpointSecurity_withClient_clientType_requestingProcess_function_attributionChain_executablePath_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "translateAllFilesToEndpointSecurity:withClient:clientType:requestingProcess:function:attributionChain:executablePath:");
}

id objc_msgSend_updateAccessRecord_replaceOnly_doCompositionWithChildService_withRequestingProcess_function_accessIdentity_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "updateAccessRecord:replaceOnly:doCompositionWithChildService:withRequestingProcess:function:accessIdentity:");
}

id objc_msgSend_validateEntry_identifierType_codeRequirementString_serviceName_allowed_comment_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateEntry:identifierType:codeRequirementString:serviceName:allowed:comment:");
}

id objc_msgSend_xpcObject(void *a1, const char *a2, ...)
{
  return [a1 xpcObject];
}