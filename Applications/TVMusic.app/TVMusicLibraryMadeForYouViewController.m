@interface TVMusicLibraryMadeForYouViewController
- (TVMusicLibraryMadeForYouViewController)init;
- (id)cellForItemAtIndexPath:(id)a3;
- (id)subtitleForPlaylist:(id)a3;
@end

@implementation TVMusicLibraryMadeForYouViewController

- (TVMusicLibraryMadeForYouViewController)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory personalizedMixPlaylists]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "personalizedMixPlaylists"));
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVMusicLibraryMadeForYouViewController;
  v4 = -[TVMusicMPRequestViewController initWithTitle:libraryRequest:pageType:]( &v6,  "initWithTitle:libraryRequest:pageType:",  0LL,  v3,  7LL);

  if (v4) {
    -[TVMusicMPRequestViewController setShowIndexBarTitles:](v4, "setShowIndexBarTitles:", 1LL);
  }
  return v4;
}

- (id)cellForItemAtIndexPath:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVMusicLibraryMadeForYouViewController;
  id v3 = -[TVMusicLibraryPlaylistsViewController cellForItemAtIndexPath:](&v6, "cellForItemAtIndexPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  [v4 setAdjustsFontSizeToFitWidth:1];
  return v4;
}

- (id)subtitleForPlaylist:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lastModifiedDateComponents]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 date]);

  if (v5)
  {
    objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[TVMusicLibraryUtilities descriptionForUpdatedDate:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "descriptionForUpdatedDate:",  v5));
    v7 = v6;
    if (v6)
    {
      v7 = v6;
      v8 = v7;
    }

    else
    {
      id v11 = sub_1000A86EC();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        v15 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Can't get description for date: %@",  (uint8_t *)&v14,  0xCu);
      }

      v8 = 0LL;
    }
  }

  else
  {
    id v9 = sub_1000A86EC();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
      int v14 = 138412290;
      v15 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "No date is available for playlist \"%@\"",  (uint8_t *)&v14,  0xCu);
    }

    v8 = 0LL;
  }

  return v8;
}

@end