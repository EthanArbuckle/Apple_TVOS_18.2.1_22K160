void sub_10000468C(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  unint64_t Nanoseconds;
  id v7;
  os_log_s *v8;
  os_log_s *v9;
  os_signpost_id_t v10;
  id v11;
  os_log_s *v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15[8];
  void v16[4];
  id v17;
  uint64_t v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  v28 = 0LL;
  v29 = &v28;
  v30 = 0x2020000000LL;
  v31 = 1;
  v22 = 0LL;
  v23 = &v22;
  v24 = 0x3032000000LL;
  v25 = sub_100004890;
  v26 = sub_1000048A0;
  v27 = 0LL;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000048A8;
  v16[3] = &unk_100008228;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(void *)(a1 + 48);
  v5 = *(void **)(a1 + 56);
  v17 = v3;
  v18 = v4;
  v19 = v5;
  v20 = &v22;
  v21 = &v28;
  [v2 enumerateKeysAndObjectsUsingBlock:v16];
  [*(id *)(a1 + 48) _decrementBusyCounterForAccount:*(void *)(a1 + 40)];
  Nanoseconds = _ACSignpostGetNanoseconds(*(void *)(a1 + 72), *(void *)(a1 + 80));
  v7 = sub_1000059B4();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  v10 = *(void *)(a1 + 72);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v15 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_END,  v10,  "PerformActions",  (const char *)&unk_100007411,  v15,  2u);
  }

  v11 = sub_1000059B4();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_100005FC8((uint64_t *)(a1 + 72), v12, v13, (double)Nanoseconds / 1000000000.0);
  }

  v14 = *(void *)(a1 + 64);
  if (v14) {
    (*(void (**)(uint64_t, void, uint64_t))(v14 + 16))(v14, *((unsigned __int8 *)v29 + 24), v23[5]);
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);
}

void sub_100004860( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t sub_100004890(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000048A0(uint64_t a1)
{
}

void sub_1000048A8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = objc_autoreleasePoolPush();
  id v8 = sub_1000059B4();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  os_signpost_id_t v10 = _ACSignpostCreate();
  uint64_t v12 = v11;

  id v13 = sub_1000059B4();
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  v15 = v14;
  unint64_t v50 = v10 - 1;
  os_signpost_id_t spid = v10;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_DWORD *)buf = 138543618;
    os_signpost_id_t v54 = (os_signpost_id_t)v5;
    __int16 v55 = 1026;
    LODWORD(v56) = [v6 type];
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v15,  OS_SIGNPOST_INTERVAL_BEGIN,  v10,  "PerformActionOwner",  " Dataclass=%{public,signpost.telemetry:string1,name=Dataclass}@  Action=%{public,signpost.telemetry:number1,name=A ction}d  enableTelemetry=YES ",  buf,  0x12u);
  }

  id v16 = sub_1000059B4();
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v48 = [v6 type];
    *(_DWORD *)buf = 134218498;
    os_signpost_id_t v54 = v10;
    __int16 v55 = 2114;
    id v56 = v5;
    __int16 v57 = 1026;
    LODWORD(v5_Block_object_dispose((const void *)(v11 - 80), 8) = v48;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "BEGIN [%lld]: PerformActionOwner  Dataclass=%{public,signpost.telemetry:string1,name=Dataclass}@  Action=%{public, signpost.telemetry:number1,name=Action}d  enableTelemetry=YES ",  buf,  0x1Cu);
  }

  uint64_t v19 = _ACLogSystem(v18);
  v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v49 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    os_signpost_id_t v54 = (os_signpost_id_t)v5;
    __int16 v55 = 2112;
    id v56 = v6;
    __int16 v57 = 2112;
    uint64_t v58 = v49;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "Asking owner of dataclass %@ to perform action %@ for account %@",  buf,  0x20u);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _ownerForDataclass:v5]);
  if ((objc_opt_respondsToSelector(v21, "performAction:forAccount:withChildren:forDataclass:withError:") & 1) != 0)
  {
    uint64_t v22 = *(void *)(a1 + 32);
    uint64_t v23 = *(void *)(a1 + 48);
    id v52 = 0LL;
    unsigned __int8 v24 = [v21 performAction:v6 forAccount:v22 withChildren:v23 forDataclass:v5 withError:&v52];
    id v25 = v52;
    v26 = v25;
  }

  else
  {
    uint64_t v27 = objc_opt_respondsToSelector(v21, "performAction:forAccount:withChildren:forDataclass:");
    if ((v27 & 1) == 0)
    {
      uint64_t v32 = _ACLogSystem(v27);
      v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        sub_100006114((uint64_t)v21, v33);
      }
      v29 = v6;

      unsigned __int8 v24 = 0;
      v26 = 0LL;
      BOOL v28 = 1;
      goto LABEL_18;
    }

    id v25 = [v21 performAction:v6 forAccount:*(void *)(a1 + 32) withChildren:*(void *)(a1 + 48) forDataclass:v5];
    unsigned __int8 v24 = v25;
    v26 = 0LL;
  }

  BOOL v28 = v26 == 0LL;
  v29 = v6;
  if (!v26 && (v24 & 1) != 0)
  {
    v30 = v7;
    v26 = 0LL;
    unsigned __int8 v24 = 1;
    uint64_t v31 = v12;
    goto LABEL_24;
  }

LABEL_18:
  v30 = v7;
  uint64_t v34 = _ACLogSystem(v25);
  v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
    sub_1000060A4();
  }

  if (v28)
  {
    uint64_t v36 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  ACErrorDomain,  17LL,  0LL));
    uint64_t v37 = *(void *)(*(void *)(a1 + 56) + 8LL);
    v38 = *(void **)(v37 + 40);
    *(void *)(v37 + 40) = v36;
  }

  else
  {
    uint64_t v39 = *(void *)(*(void *)(a1 + 56) + 8LL);
    id v40 = v26;
    v38 = *(void **)(v39 + 40);
    *(void *)(v39 + 40) = v40;
  }

  uint64_t v31 = v12;

LABEL_24:
  _ACSignpostGetNanoseconds(spid, v31);
  id v41 = sub_1000059B4();
  v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
  v43 = v42;
  if (v50 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v43,  OS_SIGNPOST_INTERVAL_END,  spid,  "PerformActionOwner",  (const char *)&unk_100007411,  buf,  2u);
  }

  id v44 = sub_1000059B4();
  v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
    sub_100006040();
  }

  uint64_t v46 = *(void *)(*(void *)(a1 + 64) + 8LL);
  if (*(_BYTE *)(v46 + 24)) {
    unsigned __int8 v47 = v24;
  }
  else {
    unsigned __int8 v47 = 0;
  }
  *(_BYTE *)(v46 + 24) = v47;

  objc_autoreleasePoolPop(v30);
}

void sub_100004DE0(_Unwind_Exception *a1)
{
}

void sub_100004EF4(_Unwind_Exception *a1)
{
}

void sub_100005014(_Unwind_Exception *a1)
{
}

void sub_100005158( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100005170(uint64_t a1, void *a2)
{
}

void sub_100005850(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void sub_100005864(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
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

int main(int argc, const char **argv, const char **envp)
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener", envp));
  v4 = objc_alloc_init(&OBJC_CLASS___ACDataclassOwnersManagerListener);
  uint64_t v5 = _ACLogSystem([v3 setDelegate:v4]);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "DOM XPC Service resuming...", buf, 2u);
  }

  uint64_t v7 = _ACLogSystem([v3 resume]);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_signpost_id_t v10 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "DOM XPC Service is returning control!",  v10,  2u);
  }

  return 0;
}

id sub_1000059B4()
{
  if (qword_10000CA30 != -1) {
    dispatch_once(&qword_10000CA30, &stru_1000082B8);
  }
  return (id)qword_10000CA28;
}

void sub_1000059F4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.accounts", "dataclass.signpost");
  v2 = (void *)qword_10000CA28;
  qword_10000CA28 = (uint64_t)v1;
}

void sub_100005AD4()
{
}

void sub_100005B38(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "ACRemoteDataclassOwnersManager did preload dataclass owners",  v1,  2u);
}

void sub_100005B78(uint64_t a1, os_log_s *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "BEGIN [%lld]: DataclassPreload ",  (uint8_t *)&v2,  0xCu);
  sub_100005888();
}

void sub_100005BE8()
{
}

void sub_100005C4C()
{
  sub_100005850( (void *)&_mh_execute_header,  v0,  v1,  "ACRemoteDataclassOwnersManager returning actions %@ for dataclass %@");
  sub_100005888();
}

void sub_100005CAC()
{
  sub_100005850( (void *)&_mh_execute_header,  v0,  v1,  "BEGIN [%lld]: ActionsForAdding  Dataclass=%{public,signpost.telemetry:string1,name=Dataclass}@ ");
  sub_100005888();
}

void sub_100005D0C()
{
}

void sub_100005D70()
{
  sub_100005850( (void *)&_mh_execute_header,  v0,  v1,  "BEGIN [%lld]: ActionsForDeleting  Dataclass=%{public,signpost.telemetry:string1,name=Dataclass}@ ");
  sub_100005888();
}

void sub_100005DD0()
{
}

void sub_100005E34()
{
  sub_100005850( (void *)&_mh_execute_header,  v0,  v1,  "BEGIN [%lld]: ActionsForEnabling  Dataclass=%{public,signpost.telemetry:string1,name=Dataclass}@ ");
  sub_100005888();
}

void sub_100005E94()
{
}

void sub_100005EF8()
{
  sub_100005850( (void *)&_mh_execute_header,  v0,  v1,  "BEGIN [%lld]: ActionsForDisabling  Dataclass=%{public,signpost.telemetry:string1,name=Dataclass}@ ");
  sub_100005888();
}

void sub_100005F58(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)uint64_t v3 = 134218242;
  *(void *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  sub_100005850( (void *)&_mh_execute_header,  a2,  a3,  "BEGIN [%lld]: PerformActions actions: %@",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16]);
  sub_100005888();
}

void sub_100005FC8(uint64_t *a1, os_log_s *a2, uint64_t a3, double a4)
{
  uint64_t v4 = *a1;
  int v5 = 134218240;
  uint64_t v6 = v4;
  __int16 v7 = 2048;
  double v8 = a4;
  sub_100005864((void *)&_mh_execute_header, a2, a3, "END [%lld] %fs: PerformActions ", (uint8_t *)&v5);
  sub_100005888();
}

void sub_100006040()
{
}

void sub_1000060A4()
{
}

void sub_100006114(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Dataclass owner does not implement performAction:forAccount:withChildren:forDataclass: %@",  (uint8_t *)&v2,  0xCu);
  sub_100005888();
}

void sub_100006184(uint8_t *a1, void *a2, void *a3, os_log_s *a4)
{
  __int16 v7 = (void *)objc_claimAutoreleasedReturnValue([a2 bundlePath]);
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a4,  OS_LOG_TYPE_DEBUG,  "Found dataclass owner at path %@",  a1,  0xCu);
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}