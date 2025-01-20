@interface MRDNowPlayingDataSource
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)sharedDataSource;
- (BOOL)nowPlayingApplicationIsInterrupted;
- (BOOL)nowPlayingApplicationIsPlaying;
- (BOOL)shouldSendCommand:(id)a3;
- (MRDNowPlayingDataSource)init;
- (NSDictionary)nowPlayingApplications;
- (NSDictionary)nowPlayingAudioFormatContentInfos;
- (NSDictionary)nowPlayingSessions;
- (NSString)nowPlayingApplicationDisplayID;
- (NSString)topOfNowPlayingAppStack;
- (id)observersForSelector:(SEL)a3;
- (id)pickableRoutesForCategory:(id)a3;
- (int)nowPlayingApplicationPID;
- (void)addObserver:(id)a3;
- (void)popNowPlayingAppStack:(BOOL)a3 forReason:(int64_t)a4;
- (void)removeObserver:(id)a3;
@end

@implementation MRDNowPlayingDataSource

+ (id)sharedDataSource
{
  if (qword_1003FDC58 != -1) {
    dispatch_once(&qword_1003FDC58, &stru_10039ADD0);
  }
  return (id)qword_1003FDC50;
}

- (MRDNowPlayingDataSource)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRDNowPlayingDataSource;
  return -[MRDNowPlayingDataSource init](&v3, "init");
}

+ (id)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class(&OBJC_CLASS___MRDNowPlayingDataSource) == a1) {
    return +[MRDNowPlayingDataSource allocWithZone:]( &OBJC_CLASS___MRDMediaServerNowPlayingDataSource,  "allocWithZone:",  a3);
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MRDNowPlayingDataSource;
  return objc_msgSendSuper2(&v6, "allocWithZone:", a3);
}

- (void)addObserver:(id)a3
{
  id v8 = a3;
  v4 = self;
  objc_sync_enter(v4);
  weakObservers = v4->_weakObservers;
  if (!weakObservers)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    v7 = v4->_weakObservers;
    v4->_weakObservers = (NSHashTable *)v6;

    weakObservers = v4->_weakObservers;
  }

  -[NSHashTable addObject:](weakObservers, "addObject:", v8);
  objc_sync_exit(v4);
}

- (void)removeObserver:(id)a3
{
  id v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSHashTable removeObject:](v4->_weakObservers, "removeObject:", v5);
  objc_sync_exit(v4);
}

- (id)observersForSelector:(SEL)a3
{
  v4 = self;
  objc_sync_enter(v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](v4->_weakObservers, "allObjects"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100039004;
  v8[3] = &unk_10039ADF0;
  v8[4] = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "msv_filter:", v8));

  objc_sync_exit(v4);
  return v6;
}

- (id)pickableRoutesForCategory:(id)a3
{
  return 0LL;
}

- (BOOL)shouldSendCommand:(id)a3
{
  return 1;
}

- (NSDictionary)nowPlayingApplications
{
  return 0LL;
}

- (NSDictionary)nowPlayingSessions
{
  return 0LL;
}

- (NSString)topOfNowPlayingAppStack
{
  return 0LL;
}

- (void)popNowPlayingAppStack:(BOOL)a3 forReason:(int64_t)a4
{
  BOOL v4 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000390CC;
  v6[3] = &unk_10039AE10;
  v6[4] = a4;
  BOOL v7 = a3;
  MRAnalyticsSendEvent(@"com.apple.mediaremote.nowplaying.pop-now-playing-app-stack", 0LL, v6);
  if (v4) {
    -[MRDNowPlayingDataSource _popNowPlayingAppStack](self, "_popNowPlayingAppStack");
  }
}

- (NSDictionary)nowPlayingAudioFormatContentInfos
{
  return self->_nowPlayingAudioFormatContentInfos;
}

- (NSString)nowPlayingApplicationDisplayID
{
  return self->_nowPlayingApplicationDisplayID;
}

- (int)nowPlayingApplicationPID
{
  return self->_nowPlayingApplicationPID;
}

- (BOOL)nowPlayingApplicationIsPlaying
{
  return self->_nowPlayingApplicationIsPlaying;
}

- (BOOL)nowPlayingApplicationIsInterrupted
{
  return self->_nowPlayingApplicationIsInterrupted;
}

- (void).cxx_destruct
{
}

@end