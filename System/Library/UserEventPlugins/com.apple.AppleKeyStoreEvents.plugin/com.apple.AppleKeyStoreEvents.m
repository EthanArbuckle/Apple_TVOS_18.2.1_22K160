void init_keystore_events()
{
  xpc_event_module_get_queue();
}

void sub_3C54(uint64_t a1, uint64_t a2, int a3)
{
  switch(a3)
  {
    case -469774319:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "KeyStoreNotifier posting memento effacement",  v4,  2u);
      }

      v3 = "com.apple.keystore.memento.effaced";
      break;
    case -469774321:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "KeyStoreNotifier posting first unlock",  v5,  2u);
      }

      v3 = "com.apple.keystore.firstunlock";
      break;
    case -469774323:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "KeyStoreNotifier posting lockstate change",  buf,  2u);
      }

      v3 = "com.apple.keystore.lockstatus";
      break;
    default:
      return;
  }

  notify_post(v3);
}

void xpc_event_module_get_queue()
{
  while (1)
    ;
}