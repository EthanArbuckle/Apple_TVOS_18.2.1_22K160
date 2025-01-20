id sub_2858(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return [a4 onEventCallback:a1 token:a2 event:a3];
}

id sub_286C(uint64_t a1, void *a2)
{
  return [a2 onDaemonStart];
}

void sub_2C8C(id a1, NSString *a2, NSNumber *a3, BOOL *a4)
{
  v5 = a2;
  v6 = a3;
  id v7 = sub_3180(&qword_4A78);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412546;
    v10 = v5;
    __int16 v11 = 2112;
    v12 = v6;
    _os_log_debug_impl(&dword_0, v8, OS_LOG_TYPE_DEBUG, "%@, %@", (uint8_t *)&v9, 0x16u);
  }
}
}

void sub_3018(id a1, NSString *a2, NSNumber *a3, BOOL *a4)
{
  v5 = a2;
  v6 = a3;
  id v7 = sub_3180(&qword_4A78);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412546;
    v10 = v5;
    __int16 v11 = 2112;
    v12 = v6;
    _os_log_debug_impl(&dword_0, v8, OS_LOG_TYPE_DEBUG, "restoration identifier, %@, token, %@", (uint8_t *)&v9, 0x16u);
  }
}

void initRoutinedEventAgent()
{
  v0 = objc_opt_new(&OBJC_CLASS___RTEventAgent);
  v1 = (void *)qword_4A90;
  qword_4A90 = (uint64_t)v0;
}

id sub_3180(dispatch_once_t *predicate)
{
  if (*predicate != -1) {
    dispatch_once_f(predicate, predicate, (dispatch_function_t)sub_31C4);
  }
  return (id)predicate[2];
}

os_log_t sub_31C4(uint64_t a1)
{
  os_log_t result = os_log_create("com.apple.CoreRoutine", *(const char **)(a1 + 8));
  *(void *)(a1 + 16) = result;
  return result;
}

void xpc_event_provider_create()
{
  while (1)
    ;
}

void xpc_event_provider_get_queue()
{
  while (1)
    ;
}

void xpc_event_provider_token_fire()
{
  while (1)
    ;
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}