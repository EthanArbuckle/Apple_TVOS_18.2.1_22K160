void start()
{
  uint64_t v0;
  os_log_s *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  _BYTE v9[128];
  os_log_type_t v10;
  unsigned int v11;
  v0 = _set_user_dir_suffix("com.apple.mediaplaybackd");
  FigEnableCustomAllocatorsOnDaemonStartup(v0);
  FigCommonMediaProcessInitialization(2LL, 0LL);
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace(538247193LL, 0LL, 0LL, 0LL, 0LL);
  }
  v11 = 0;
  v10 = OS_LOG_TYPE_DEFAULT;
  os_log_and_send_and_compose_flags_and_os_log_type = (os_log_s *)fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type( 0LL,  1LL,  &v11,  &v10);
  v2 = v11;
  v3 = v10;
  if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, v10)) {
    v4 = v2;
  }
  else {
    v4 = v2 & 0xFFFFFFFE;
  }
  if ((_DWORD)v4)
  {
    v7 = 136315138;
    v8 = "main";
    v5 = (_BYTE *)_os_log_send_and_compose_impl( v4,  0LL,  v9,  128LL,  &_mh_execute_header,  os_log_and_send_and_compose_flags_and_os_log_type,  v3,  "<<<< mediaplaybackd >>>> %s: 👋",  (const char *)&v7);
    v2 = v11;
  }

  else
  {
    v5 = 0LL;
  }

  v6 = fig_log_call_emit_and_clean_up_after_send_and_compose(0LL, 1LL, 1LL, v5, v5 != v9, v2, 0LL);
  FigInitializePlayerProcess(v6);
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace(538247194LL, 0LL, 0LL, 0LL, 0LL);
  }
  dispatch_main();
}