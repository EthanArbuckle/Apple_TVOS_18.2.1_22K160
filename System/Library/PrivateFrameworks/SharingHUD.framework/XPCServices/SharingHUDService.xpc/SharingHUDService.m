int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  os_log_s *v4;
  uint8_t v6[16];
  v3 = sharingHUDLog(*(void *)&argc, argv, envp);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "SharingHUDService - main. returning 0", v6, 2u);
  }

  return 0;
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return [a1 settings];
}