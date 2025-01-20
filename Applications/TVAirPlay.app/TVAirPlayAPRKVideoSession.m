@interface TVAirPlayAPRKVideoSession
- (APRKStreamRenderer)streamRenderer;
- (NSString)description;
- (OS_dispatch_source)userActivityTimer;
- (TVAirPlayAPRKSessionDelegate)delegate;
- (TVAirPlayAPRKVideoSession)initWithStreamRenderer:(id)a3;
- (UIView)videoView;
- (UIViewController)videoViewController;
- (int64_t)sessionType;
- (void)setDelegate:(id)a3;
- (void)setStreamRenderer:(id)a3;
- (void)setUserActivityTimer:(id)a3;
- (void)setVideoView:(id)a3;
- (void)setVideoViewController:(id)a3;
- (void)userStop;
@end

@implementation TVAirPlayAPRKVideoSession

- (TVAirPlayAPRKVideoSession)initWithStreamRenderer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVAirPlayAPRKVideoSession;
  v6 = -[TVAirPlayAPRKVideoSession init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_streamRenderer, a3);
  }

  return v7;
}

- (UIView)videoView
{
  videoView = self->_videoView;
  if (!videoView)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayAPRKVideoSession streamRenderer](self, "streamRenderer"));
    id v5 = (UIView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tvap_videoSessionView"));
    v6 = self->_videoView;
    self->_videoView = v5;

    videoView = self->_videoView;
  }

  return videoView;
}

- (UIViewController)videoViewController
{
  videoViewController = self->_videoViewController;
  if (!videoViewController)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayAPRKVideoSession streamRenderer](self, "streamRenderer"));
    id v5 = (UIViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tvap_videoSessionViewController"));
    v6 = self->_videoViewController;
    self->_videoViewController = v5;

    videoViewController = self->_videoViewController;
  }

  return videoViewController;
}

- (NSString)description
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVAirPlayAPRKVideoSession;
  v4 = -[TVAirPlayAPRKVideoSession description](&v11, "description");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[NSMutableArray addObject:](v3, "addObject:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayAPRKVideoSession streamRenderer](self, "streamRenderer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@=%@",  @"streamRenderer",  v6));
  -[NSMutableArray addObject:](v3, "addObject:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v3, "componentsJoinedByString:", @", "));
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"<%@>", v8));

  return (NSString *)v9;
}

- (int64_t)sessionType
{
  return 6LL;
}

- (void)userStop
{
  id v3 = sub_100004330();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[APRKStreamRenderer managedClientName](self->_streamRenderer, "managedClientName"));
    streamRenderer = self->_streamRenderer;
    int v8 = 136315650;
    objc_super v9 = "-[TVAirPlayAPRKVideoSession userStop]";
    __int16 v10 = 2114;
    objc_super v11 = v5;
    __int16 v12 = 2048;
    v13 = streamRenderer;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s: User dismissed session. {clientName=%{public}@, streamRenderer=%p}",  (uint8_t *)&v8,  0x20u);
  }

  -[APRKStreamRenderer stop](self->_streamRenderer, "stop");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayAPRKVideoSession delegate](self, "delegate"));
  [v7 sessionDidReceiveUserStop:self];
}

- (TVAirPlayAPRKSessionDelegate)delegate
{
  return (TVAirPlayAPRKSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (APRKStreamRenderer)streamRenderer
{
  return self->_streamRenderer;
}

- (void)setStreamRenderer:(id)a3
{
}

- (void)setVideoView:(id)a3
{
}

- (void)setVideoViewController:(id)a3
{
}

- (OS_dispatch_source)userActivityTimer
{
  return self->_userActivityTimer;
}

- (void)setUserActivityTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end