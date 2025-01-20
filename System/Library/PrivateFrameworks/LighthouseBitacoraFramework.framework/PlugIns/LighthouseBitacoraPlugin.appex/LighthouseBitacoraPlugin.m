void OUTLINED_FUNCTION_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void LBPluginLoggingUtilsInit()
{
  if (LBPluginLoggingUtilsInit_once != -1) {
    dispatch_once(&LBPluginLoggingUtilsInit_once, &__block_literal_global);
  }
}

id objc_msgSend_upload_uploadRawEvents_skipNullIdentifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "upload:uploadRawEvents:skipNullIdentifiers:");
}