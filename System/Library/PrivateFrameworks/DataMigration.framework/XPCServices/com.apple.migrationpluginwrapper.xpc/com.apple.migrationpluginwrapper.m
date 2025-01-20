void sub_1000052D8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

  ;
}

  ;
}

void sub_100005964(uint64_t a1)
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[DMPluginSpecificUtilitiesManager utilitiesForPluginIdentifier:]( &OBJC_CLASS___DMPluginSpecificUtilitiesManager,  "utilitiesForPluginIdentifier:",  *(void *)(a1 + 32)));
  v4 = (os_activity_s *)objc_claimAutoreleasedReturnValue([v3 activity]);

  if (v4) {
    os_activity_scope_enter(v4, &state);
  }
  uint64_t v5 = _DMLogFunc(v1, 7LL);
  uint64_t v6 = _DMPluginSignpostLog(v5);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_signpost_enabled(v7))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    uint64_t v27 = v8;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v7,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "loadAndPerformMigration",  "plugin=%{signpost.description:attribute, public}@",  buf,  0xCu);
  }

  v9 = objc_autoreleasePoolPush();
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[DataClassMigrator dataClassMigratorForBundleAtPath:]( &OBJC_CLASS___DataClassMigrator,  "dataClassMigratorForBundleAtPath:",  *(void *)(a1 + 48)));
  [v10 setContext:*(void *)(a1 + 56)];
  [v10 setUserDataDisposition:*(unsigned int *)(a1 + 112)];
  [v10 setRestoredBackupBuildVersion:*(void *)(a1 + 64)];
  [v10 setRestoredBackupProductType:*(void *)(a1 + 72)];
  [v10 setRestoredBackupDeviceName:*(void *)(a1 + 80)];
  id v11 = [v10 userDataDisposition];
  v12 = (void *)objc_claimAutoreleasedReturnValue([v10 restoredBackupBuildVersion]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v10 restoredBackupProductType]);
  v24 = (void *)objc_claimAutoreleasedReturnValue([v10 restoredBackupDeviceName]);
  id v22 = v11;
  _DMLogFunc(v1, 7LL);

  if (*(_BYTE *)(a1 + 116))
  {
    unsigned __int8 v13 = 1;
  }

  else
  {
    v14 = objc_alloc(&OBJC_CLASS___DMMigrationPluginWrapperWatchdog);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dmBundleIdentifier", v22, v12, v23, v24));
    v16 = -[DMMigrationPluginWrapperWatchdog initWithPluginBundleIdentifier:backupDeviceUUID:]( v14,  "initWithPluginBundleIdentifier:backupDeviceUUID:",  v15,  *(void *)(a1 + 88));

    -[DMMigrationPluginWrapperWatchdog resume](v16, "resume");
    _DMLogFunc(v1, 7LL);
    unsigned __int8 v13 = [v10 performMigration];
    -[DMMigrationPluginWrapperWatchdog cancel](v16, "cancel");
  }

  objc_autoreleasePoolPop(v9);
  uint64_t v18 = _DMPluginSignpostLog(v17);
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_signpost_enabled(v19))
  {
    uint64_t v20 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    uint64_t v27 = v20;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v19,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "loadAndPerformMigration",  "plugin=%{signpost.description:attribute, public}@",  buf,  0xCu);
  }

  if (v4) {
    os_activity_scope_leave(&state);
  }
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 96));
  xpc_dictionary_set_BOOL(reply, "migrationResult", v13);
  xpc_connection_send_message( *(xpc_connection_t *)(*(void *)(a1 + 104) + OBJC_IVAR___DMXPCConnection__connection),  reply);
}

void sub_100005CA0(id a1)
{
  v3[0] = 0LL;
  v3[1] = v3;
  v3[2] = 0x3032000000LL;
  v3[3] = sub_100005D60;
  v3[4] = sub_100005D70;
  id v4 = (id)os_transaction_create("com.apple.migrationpluginwrapper.ensureExitAfterThrottlePeriod");
  dispatch_time_t v1 = dispatch_time(0LL, 10000000000LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100005D78;
  block[3] = &unk_10000C328;
  block[4] = v3;
  dispatch_after(v1, &_dispatch_main_q, block);
  _Block_object_dispose(v3, 8);
}

uint64_t sub_100005D60(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100005D70(uint64_t a1)
{
}

uint64_t sub_100005D78(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8LL);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0LL;

  uint64_t v4 = _DMLogFunc(v1, 7LL, @"DMMigrationPluginWrapperProxy will attempt to exit clean.");
  return xpc_transaction_exit_clean(v4);
}

int main(int argc, const char **argv, const char **envp)
{
}

void sub_100005DE4(void *a1)
{
  id v2 = a1;
  uint64_t v3 = -[DMMigrationPluginWrapperProxy initWithConnection:]( objc_alloc(&OBJC_CLASS___DMMigrationPluginWrapperProxy),  "initWithConnection:",  v2);
  _DMLogFunc(v1, 7LL);
  if (qword_100015450 != -1) {
    dispatch_once(&qword_100015450, &stru_10000C348);
  }
  objc_msgSend((id)qword_100015440, "lock", v3);
  [(id)qword_100015448 addObject:v3];
  [(id)qword_100015440 unlock];
  objc_initWeak(&location, v3);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100005FEC;
  v6[3] = &unk_10000C370;
  objc_copyWeak(&v7, &location);
  -[DMMigrationPluginWrapperProxy setInvalidationHandler:](v3, "setInvalidationHandler:", v6);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000060E4;
  v4[3] = &unk_10000C370;
  objc_copyWeak(&v5, &location);
  -[DMMigrationPluginWrapperProxy setInterruptionHandler:](v3, "setInterruptionHandler:", v4);
  -[DMMigrationPluginWrapperProxy resume](v3, "resume");
  _DMLogFunc(v1, 7LL);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void sub_100005F70(_Unwind_Exception *a1)
{
}

void sub_100005FA0(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___NSLock);
  id v2 = (void *)qword_100015440;
  qword_100015440 = (uint64_t)v1;

  uint64_t v3 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 1LL);
  uint64_t v4 = (void *)qword_100015448;
  qword_100015448 = (uint64_t)v3;
}

void sub_100005FEC(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = objc_loadWeakRetained(v1);
    sub_100006038(v3);

    id WeakRetained = v4;
  }
}

void sub_100006038(void *a1)
{
  id v2 = a1;
  _DMLogFunc(v1, 7LL);
  objc_msgSend((id)qword_100015440, "lock", v2);
  [(id)qword_100015448 removeObject:v2];
  if (![(id)qword_100015448 count]) {
    _DMLogFunc(v1, 7LL);
  }
  [(id)qword_100015440 unlock];
  _DMLogFunc(v1, 7LL);
}

void sub_1000060E4(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = objc_loadWeakRetained(v1);
    sub_100006038(v3);

    id WeakRetained = v4;
  }
}

id sub_10000629C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) fireCount];
  id v3 = *(void **)(a1 + 32);
  if (v2 == (id)1)
  {
    [v3 _migrationPluginDuration5Minutes];
    uint64_t v4 = 300LL;
LABEL_9:
    [*(id *)(a1 + 32) setSecondsBeforeNextFault:v4];
    return [*(id *)(a1 + 32) secondsBeforeNextFault];
  }

  id v5 = [v3 fireCount];
  uint64_t v6 = *(void **)(a1 + 32);
  if (v5 == (id)2)
  {
    [v6 _migrationPluginDuration10Minutes];
    uint64_t v4 = 600LL;
    goto LABEL_9;
  }

  id v7 = [v6 fireCount];
  uint64_t v8 = *(void **)(a1 + 32);
  if (v7 == (id)3)
  {
    [v8 _migrationPluginDuration20Minutes];
    uint64_t v4 = 1200LL;
    goto LABEL_9;
  }

  if ([v8 fireCount] == (id)4)
  {
    [*(id *)(a1 + 32) _migrationPluginDuration40Minutes];
    uint64_t v4 = 86400LL;
    goto LABEL_9;
  }

  return [*(id *)(a1 + 32) secondsBeforeNextFault];
}

void sub_100006980()
{
}

void sub_1000069E0()
{
}

void sub_100006A40()
{
}

void sub_100006AA0()
{
}

void sub_100006B00()
{
}

void sub_100006B60()
{
}

void sub_100006BC0()
{
}

void sub_100006C20()
{
}

void sub_100006C80()
{
}

void sub_100006CE0()
{
}

void sub_100006D40()
{
}

void sub_100006DA0()
{
}

void sub_100006E00()
{
}

void sub_100006E60()
{
}

void sub_100006EC0()
{
}

void sub_100006F20()
{
}

void sub_100006F80()
{
}

void sub_100006FE0()
{
}

void sub_100007040()
{
}

void sub_1000070A0()
{
}

void sub_100007100()
{
}

void sub_100007160()
{
}

void sub_1000071C0()
{
}

void sub_100007220()
{
}

void sub_100007280()
{
}

void sub_1000072E0()
{
}

void sub_100007340()
{
}

void sub_1000073A0()
{
}

void sub_100007400()
{
}

void sub_100007460()
{
}

void sub_1000074C0()
{
}

void sub_100007520()
{
}

void sub_100007580()
{
}

void sub_1000075E0()
{
}

void sub_100007640()
{
}

void sub_1000076A0()
{
}

void sub_100007700()
{
}

void sub_100007760()
{
}

void sub_1000077C0()
{
}

void sub_100007820()
{
}

void sub_100007880()
{
}

void sub_1000078E0()
{
}

void sub_100007940()
{
}

void sub_1000079A0()
{
}

void sub_100007A00()
{
}

void sub_100007A60()
{
}

void sub_100007AC0()
{
}

void sub_100007B20()
{
}

void sub_100007B80()
{
}

void sub_100007BE0()
{
}

void sub_100007C40()
{
}

void sub_100007CA0()
{
}

void sub_100007D00()
{
}

void sub_100007D60()
{
}

void sub_100007DC0()
{
}

void sub_100007E20()
{
}

void sub_100007E80()
{
}

void sub_100007EE0()
{
}

void sub_100007F40(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 message]);
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "unknown plugin fault %@",  (uint8_t *)&v4,  0xCu);
}

id objc_msgSend__messageStringWithPluginBundleIdentifier_durationDescription_backupDeviceUUID_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_messageStringWithPluginBundleIdentifier:durationDescription:backupDeviceUUID:");
}

id objc_msgSend_utilitiesForPluginIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "utilitiesForPluginIdentifier:");
}