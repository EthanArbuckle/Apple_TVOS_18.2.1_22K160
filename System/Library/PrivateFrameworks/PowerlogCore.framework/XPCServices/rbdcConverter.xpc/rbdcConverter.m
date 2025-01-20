int main(int argc, const char **argv, const char **envp)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100003EE4();
  }
  return 0;
}

void sub_100003EE4()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Application not supported on this platform",  v0,  2u);
}