@interface MTEmptyDownloadsGateway
- (BOOL)resumeOrPauseEpisodeDownloadWithUuid:(id)a3;
- (id)cancelAllDownloadsUserInitiated:(BOOL)a3;
- (id)episodeUuidForDownloadWithAdamID:(id)a3;
@end

@implementation MTEmptyDownloadsGateway

- (id)cancelAllDownloadsUserInitiated:(BOOL)a3
{
  return +[NSSet set](&OBJC_CLASS___NSSet, "set", a3);
}

- (id)episodeUuidForDownloadWithAdamID:(id)a3
{
  return 0LL;
}

- (BOOL)resumeOrPauseEpisodeDownloadWithUuid:(id)a3
{
  return 0;
}

@end