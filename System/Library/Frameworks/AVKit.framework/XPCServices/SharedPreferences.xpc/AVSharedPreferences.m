@interface AVSharedPreferences
- (void)setAutomaticVideoGravity:(id)a3 completion:(id)a4;
- (void)setString:(id)a3 forKey:(id)a4 completion:(id)a5;
@end

@implementation AVSharedPreferences

- (void)setString:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v7 = a3;
  v8 = (__CFString *)a4;
  v9 = (void (**)(void))a5;
  id v10 = sub_1000038B8();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543618;
    id v15 = v7;
    __int16 v16 = 2114;
    v17 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "setString: %{public}@ forKey:%{public}@",  (uint8_t *)&v14,  0x16u);
  }

  CFPreferencesSetValue(v8, v7, @"com.apple.avkit", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (v9) {
    v9[2](v9);
  }
  id v12 = sub_1000038B8();
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "setString complete", (uint8_t *)&v14, 2u);
  }
}

- (void)setAutomaticVideoGravity:(id)a3 completion:(id)a4
{
}

@end