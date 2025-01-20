@interface SKSyncCommand
- (BOOL)returnWithError:(id *)a3;
- (NSError)error;
- (void)onCallbackWithError:(id)a3;
- (void)setError:(id)a3;
@end

@implementation SKSyncCommand

- (void)onCallbackWithError:(id)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SKSyncCommand setError:](self, "setError:", v4);
  if (v4)
  {
    SKGetOSLog();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      v7 = "-[SKSyncCommand onCallbackWithError:]";
      __int16 v8 = 2112;
      id v9 = v4;
      _os_log_impl(&dword_188F75000, v5, OS_LOG_TYPE_ERROR, "%s: Error details: %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (BOOL)returnWithError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 && v5)
  {
    -[SKSyncCommand error](self, "error");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  -[SKSyncCommand error](self, "error");
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v7 = v6 == 0LL;

  return v7;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end