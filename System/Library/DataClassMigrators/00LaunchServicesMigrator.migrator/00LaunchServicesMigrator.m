void sub_38CC(os_log_t log)
{
  uint8_t v1[16];
  *(_WORD *)v1 = 0;
  _os_log_error_impl( &dword_0,  log,  OS_LOG_TYPE_ERROR,  "Returning migration failed. Please include the all of your /var/mobile/Library/Caches/com.apple.LaunchServices-* fil es, the contents of /var/mobile/Library/Logs/MobileInstallation and /var/Mobile/Library/Logs/DataMigration in a bug report.",  v1,  2u);
}

id objc_msgSend_removeTVAppSystemAppRemovedRestrictionFor12_3(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeTVAppSystemAppRemovedRestrictionFor12_3");
}