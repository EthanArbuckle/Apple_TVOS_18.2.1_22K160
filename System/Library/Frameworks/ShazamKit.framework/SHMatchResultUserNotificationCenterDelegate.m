@interface SHMatchResultUserNotificationCenterDelegate
- (SHMediaItemPresenter)mediaItemPresenter;
- (void)setMediaItemPresenter:(id)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation SHMatchResultUserNotificationCenterDelegate

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v6 = a4;
  v7 = (void (**)(void))a5;
  uint64_t v9 = sh_log_object(v7, v8);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 notification]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 request]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v6 notification]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 request]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 content]);
    int v16 = 138412802;
    id v17 = v6;
    __int16 v18 = 2112;
    v19 = v12;
    __int16 v20 = 2112;
    v21 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "Received notification response %@ for request %@ with content %@",  (uint8_t *)&v16,  0x20u);
  }

  v7[2](v7);
}

- (SHMediaItemPresenter)mediaItemPresenter
{
  return self->_mediaItemPresenter;
}

- (void)setMediaItemPresenter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end