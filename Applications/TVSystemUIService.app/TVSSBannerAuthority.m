@interface TVSSBannerAuthority
- (BOOL)isDoNotDisturbEnabled;
- (TVSSMenuModeController)menuModeController;
- (int64_t)shouldOverlapPresentable:(id)a3 withPresentable:(id)a4;
- (int64_t)shouldPostPresentable:(id)a3 userInfo:(id)a4 reason:(id *)a5;
- (int64_t)shouldPresentPresentable:(id)a3 withPresentedPresentables:(id)a4 responsiblePresentable:(id *)a5;
- (void)setDoNotDisturbEnabled:(BOOL)a3;
- (void)setMenuModeController:(id)a3;
@end

@implementation TVSSBannerAuthority

- (int64_t)shouldPostPresentable:(id)a3 userInfo:(id)a4 reason:(id *)a5
{
  v38 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v36 = 0LL;
  objc_storeStrong(&v36, a4);
  v35 = a5;
  id v18 = [v36 objectForKeyedSubscript:TVSPBannerPresentableKeyBannerType];
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber);
  id v19 = sub_1000945D8(v18, v5);

  id v33 = v19;
  id v20 = [v19 integerValue];

  id v34 = v20;
  char v29 = 0;
  unsigned __int8 v21 = 0;
  if (v20 == (id)1)
  {
    id v14 = [v36 objectForKeyedSubscript:TVSPBannerPresentableKeyHighPriority];
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber);
    id v15 = sub_1000945D8(v14, v6);

    id v31 = v15;
    id v30 = v15;
    char v29 = 1;
    unsigned __int8 v21 = [v15 BOOLValue];
  }

  if ((v29 & 1) != 0) {

  }
  char v32 = v21 & 1;
  if (!v38->_doNotDisturbEnabled || (v32 & 1) != 0)
  {
    if ((id)-[TVSSMenuModeController mode](v38->_menuModeController, "mode") != (id)3) {
      goto LABEL_19;
    }
    if (v34)
    {
      if (v34 == (id)1)
      {
        int64_t v39 = 1LL;
        int v25 = 1;
        goto LABEL_20;
      }

      if (v34 != (id)2)
      {
LABEL_19:
        int64_t v39 = 1LL;
        int v25 = 1;
        goto LABEL_20;
      }
    }

    os_log_t oslog = (os_log_t)BannerAuthorityLog();
    os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v8 = oslog;
      os_log_type_t v9 = v23;
      id v10 = (id)BNEffectivePresentableDescription(location[0]);
      id v22 = v10;
      sub_100094698((uint64_t)v40, (uint64_t)v22, (uint64_t)v34, (uint64_t)v36);
      _os_log_impl( (void *)&_mh_execute_header,  v8,  v9,  "Menu Bar is interactive mode, presentable won't be posted. {presentable=%{public}@, bannerType=%ld, userInfo=%@}",  v40,  0x20u);

      objc_storeStrong(&v22, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    int64_t v39 = -1LL;
    int v25 = 1;
  }

  else
  {
    id v28 = BannerAuthorityLog();
    os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_DEFAULT))
    {
      log = (os_log_s *)v28;
      os_log_type_t type = v27;
      id v13 = (id)BNEffectivePresentableDescription(location[0]);
      id v26 = v13;
      sub_100094698((uint64_t)v41, (uint64_t)v26, (uint64_t)v34, (uint64_t)v36);
      _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "Do Not Disturb is enabled, presentable won't be posted. {presentable=%{public}@, bannerType=%ld, userInfo=%@}",  v41,  0x20u);

      objc_storeStrong(&v26, 0LL);
    }

    objc_storeStrong(&v28, 0LL);
    int64_t v39 = -1LL;
    int v25 = 1;
  }

- (int64_t)shouldPresentPresentable:(id)a3 withPresentedPresentables:(id)a4 responsiblePresentable:(id *)a5
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v10 = 0LL;
  objc_storeStrong(&v10, a4);
  BOOL v5 = [v10 count] == 0;
  uint64_t v6 = -1LL;
  if (v5) {
    uint64_t v6 = 1LL;
  }
  int64_t v9 = v6;
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(location, 0LL);
  return v9;
}

- (int64_t)shouldOverlapPresentable:(id)a3 withPresentable:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v6 = 0LL;
  objc_storeStrong(&v6, a4);
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
  return -1LL;
}

- (TVSSMenuModeController)menuModeController
{
  return self->_menuModeController;
}

- (void)setMenuModeController:(id)a3
{
}

- (BOOL)isDoNotDisturbEnabled
{
  return self->_doNotDisturbEnabled;
}

- (void)setDoNotDisturbEnabled:(BOOL)a3
{
  self->_doNotDisturbEnabled = a3;
}

- (void).cxx_destruct
{
}

@end