void sub_3C3C(uint64_t a1)
{
  uint32_t numer;
  uint32_t denom;
  uint64_t v4;
  uint64_t v5;
  int v6;
  mach_timebase_info info;
  uint8_t buf[4];
  double v9;
  __int16 v10;
  int v11;
  mach_timebase_info(&info);
  numer = info.numer;
  denom = info.denom;
  v4 = mach_absolute_time();
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = _MGWriteCacheOnHelper();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = mach_absolute_time();
    v6 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    *(_DWORD *)buf = 134218240;
    v9 = (double)(numer / denom) * (double)(v5 - v4);
    v10 = 1024;
    v11 = v6;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Migrator rebuilt MGCache in %lf seconds. Success %d",  buf,  0x12u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

ch_group_enter(v2);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Rebuilding cache on helper.", v7, 2u);
    }

    global_queue = dispatch_get_global_queue(0LL, 0LL);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_3C3C;
    v6[3] = &unk_4098;
    v6[4] = v2;
    v6[5] = buf;
    dispatch_async(global_queue, v6);
    v4 = dispatch_time(0LL, 100000000LL);
    dispatch_group_wait(v2, v4);
    if (!v9[24] && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Migrator failed to generate new MobileGestalt cache.",  v7,  2u);
    }

    _Block_object_dispose(buf, 8);
  }

  return 1;
}

- (float)estimatedDuration
{
  return 1.0;
}

- (float)migrationProgress
{
  return 0.5;
}
@end