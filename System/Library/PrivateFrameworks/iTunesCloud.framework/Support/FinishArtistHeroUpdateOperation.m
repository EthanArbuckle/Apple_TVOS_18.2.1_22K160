@interface FinishArtistHeroUpdateOperation
- (int64_t)currentDatabaseRevision;
- (void)main;
- (void)setCurrentDatabaseRevision:(int64_t)a3;
@end

@implementation FinishArtistHeroUpdateOperation

- (void)main
{
  if (!-[QueueAwareOperation shouldProcessSpecificArtists](self, "shouldProcessSpecificArtists"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation musicLibrary](self, "musicLibrary"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v5 = v3;
    [v4 timeIntervalSinceReferenceDate];
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    [v5 setValue:v6 forDatabaseProperty:@"MLArtistHeroImageImportDate"];
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[QueueAwareOperation musicLibrary](self, "musicLibrary"));
  sub_10005E640(v7, -[FinishArtistHeroUpdateOperation currentDatabaseRevision](self, "currentDatabaseRevision"));

  v8 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Updating artist hero images complete.", v9, 2u);
  }
}

- (int64_t)currentDatabaseRevision
{
  return (int64_t)self->super._artistPersistentIDsToUpdate;
}

- (void)setCurrentDatabaseRevision:(int64_t)a3
{
  self->super._artistPersistentIDsToUpdate = (NSArray *)a3;
}

@end