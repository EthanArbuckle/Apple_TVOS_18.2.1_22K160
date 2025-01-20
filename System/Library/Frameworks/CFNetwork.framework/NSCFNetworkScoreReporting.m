@interface NSCFNetworkScoreReporting
@end

@implementation NSCFNetworkScoreReporting

void __48____NSCFNetworkScoreReporting_createConnection___block_invoke_4(uint64_t a1)
{
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
  }
  v2 = (os_log_s *)(id)CFNLog::logger;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_18298D000, v2, OS_LOG_TYPE_DEFAULT, "[NETWORKSCORE] connection was invalidated", v5, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    v4 = *(void **)(v3 + 8);
  }
  else {
    v4 = 0LL;
  }
  [v4 invalidate];
  -[__NSCFNetworkScoreReporting setConnection:](*(void *)(a1 + 32));
}

void __48____NSCFNetworkScoreReporting_createConnection___block_invoke()
{
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
  }
  v0 = (os_log_s *)(id)CFNLog::logger;
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_18298D000, v0, OS_LOG_TYPE_DEFAULT, "[NETWORKSCORE] daemon connection was interrupted", v1, 2u);
  }
}

void __49____NSCFNetworkScoreReporting_sendMetrics_queue___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
  }
  v4 = (os_log_s *)(id)CFNLog::logger;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    [v3 localizedDescription];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    int v8 = 138412290;
    v9 = v5;
    _os_log_impl( &dword_18298D000,  v4,  OS_LOG_TYPE_DEFAULT,  "[NETWORKSCORE] connection failed with error : %@",  (uint8_t *)&v8,  0xCu);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    v7 = *(void **)(v6 + 8);
  }
  else {
    v7 = 0LL;
  }
  [v7 invalidate];
  -[__NSCFNetworkScoreReporting setConnection:](*(void *)(a1 + 32));
}

@end