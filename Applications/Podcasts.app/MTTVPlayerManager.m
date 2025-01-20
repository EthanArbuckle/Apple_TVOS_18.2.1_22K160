@interface MTTVPlayerManager
+ (id)defaultPlayer;
+ (id)sharedInstance;
- (MTTVPlayerManager)init;
- (TVPPlayback)player;
- (void)setPlayer:(id)a3;
@end

@implementation MTTVPlayerManager

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000852D4;
  block[3] = &unk_100240300;
  block[4] = a1;
  if (qword_1002B6A40 != -1) {
    dispatch_once(&qword_1002B6A40, block);
  }
  return (id)qword_1002B6A38;
}

+ (id)defaultPlayer
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTTVPlayerManager sharedInstance](&OBJC_CLASS___MTTVPlayerManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 player]);

  return v3;
}

- (MTTVPlayerManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTTVPlayerManager;
  v2 = -[MTTVPlayerManager init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___MTTVMusicPlayer);
    player = v2->_player;
    v2->_player = (TVPPlayback *)v3;
  }

  return v2;
}

- (TVPPlayback)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end