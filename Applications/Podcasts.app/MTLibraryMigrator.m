@interface MTLibraryMigrator
+ (BOOL)_hasMTImageStoreContent;
+ (BOOL)_needsImageStoreMigration;
+ (BOOL)globalDownloadPolicyRequiresMigration;
+ (BOOL)hasBeenInactiveForTimeInterval:(double)a3;
+ (BOOL)isDefaultSettingsForPlaylist:(id)a3 title:(id)a4 episodesToShow:(int64_t)a5 showPlayedEpisodes:(BOOL)a6 includeAllPodcasts:(BOOL)a7;
+ (BOOL)moveSQLiteFilesFromDocumentsToSharedContainer;
+ (BOOL)needToMigrateDataToSharedContainer;
+ (BOOL)needsMigration;
+ (BOOL)needsToComputeLastLaunch;
+ (BOOL)podcastMigrationForVersion8to9:(id)a3;
+ (BOOL)runCoreDataMigration;
+ (BOOL)runDataMigration;
+ (BOOL)runImageFormatMigration;
+ (BOOL)runImageStoreMigration;
+ (BOOL)runImageStorePathMigration;
+ (BOOL)runMigrationForPodcast:(id)a3 version:(int64_t)a4;
+ (double)inactiveIntervalForDownloadPolicyUpgrade;
+ (id)_fetchRequestForMostRecentlyPlayedEpisode;
+ (id)_mostRecentPlayTimeFromDatabase;
+ (id)legacyLibraryPath;
+ (int)episodesToKeepDefaultValue;
+ (int64_t)episodesToKeepToEpisodeLimit:(int)a3;
+ (void)_migrateToImageProvider;
+ (void)_removeImageStoreContent;
+ (void)_updateGlobalPolicyLimitIfMoreRestrictiveInDefaults:(id)a3;
+ (void)allEpisodesMigrationForVersion40to41In:(id)a3;
+ (void)allEpisodesMigrationForVersion43to44In:(id)a3;
+ (void)allEpisodesMigrationForVersion45to46In:(id)a3;
+ (void)allEpisodesMigrationForVersion46to47In:(id)a3;
+ (void)allEpisodesMigrationForVersion47to48In:(id)a3;
+ (void)allEpisodesMigrationForVersion51to52In:(id)a3;
+ (void)allEpisodesMigrationForVersion53to54In:(id)a3;
+ (void)allEpisodesMigrationForVersion54to55In:(id)a3;
+ (void)allEpisodesMigrationForVersion59to60In:(id)a3;
+ (void)allEpisodesMigrationForVersion65to66In:(id)a3;
+ (void)allEpisodesMigrationForVersion68to69In:(id)a3;
+ (void)deleteDuplicateVideoEpisodesForRdar59691904;
+ (void)deleteOrUpdatePlaylist:(id)a3 ifIsDefault:(BOOL)a4;
+ (void)episodeMigrationForVersion0to1:(id)a3;
+ (void)episodeMigrationForVersion13to14:(id)a3;
+ (void)episodeMigrationForVersion16to17:(id)a3;
+ (void)episodeMigrationForVersion17to18:(id)a3;
+ (void)episodeMigrationForVersion21to22:(id)a3;
+ (void)episodeMigrationForVersion23to24:(id)a3;
+ (void)episodeMigrationForVersion29to30:(id)a3;
+ (void)episodeMigrationForVersion6to7:(id)a3;
+ (void)fixupDataMigrationVersion;
+ (void)migrateDatabaseToSharedContainerIfNeeded;
+ (void)migrateDefaultPlaylistsForVersion18to19;
+ (void)migratePlaylistDefaultsForVersion66to67;
+ (void)migratePlaylistDefaultsForVersion7to8;
+ (void)migratePlaylistsForVersion:(int64_t)a3;
+ (void)migrateSerpentId;
+ (void)migrateSettingDefaultsForVersion10to11;
+ (void)migrateSettingDefaultsForVersion42to43;
+ (void)migrateSettingDefaultsForVersion44to45;
+ (void)migrateSettingDefaultsForVersion48to49;
+ (void)migrateSettingDefaultsForVersion58to59;
+ (void)migrateSettingDefaultsForVersion6to7;
+ (void)migrateSettingDefaultsForVersion9to10;
+ (void)migrateSettingsForVersion:(unint64_t)a3;
+ (void)moveEpisodeAssetsToSharedContainer;
+ (void)podcastMigrationForVersion11to12:(id)a3;
+ (void)podcastMigrationForVersion14to15:(id)a3;
+ (void)podcastMigrationForVersion19to20:(id)a3;
+ (void)podcastMigrationForVersion20to21:(id)a3;
+ (void)podcastMigrationForVersion27to28:(id)a3;
+ (void)podcastMigrationForVersion28to29:(id)a3;
+ (void)podcastMigrationForVersion32to33:(id)a3;
+ (void)podcastMigrationForVersion34to35:(id)a3;
+ (void)podcastMigrationForVersion36to37:(id)a3;
+ (void)podcastMigrationForVersion38to39:(id)a3;
+ (void)podcastMigrationForVersion41to42:(id)a3;
+ (void)podcastMigrationForVersion42to43:(id)a3;
+ (void)podcastMigrationForVersion44to45:(id)a3;
+ (void)podcastMigrationForVersion49to50:(id)a3;
+ (void)podcastMigrationForVersion50to51:(id)a3;
+ (void)podcastMigrationForVersion55to56:(id)a3;
+ (void)podcastMigrationForVersion56to57:(id)a3;
+ (void)podcastMigrationForVersion58to59:(id)a3;
+ (void)podcastMigrationForVersion62to63:(id)a3;
+ (void)podcastMigrationForVersion66to67:(id)a3;
+ (void)podcastMigrationForVersion6to7:(id)a3;
+ (void)podcastMigrationForVersion9to10:(id)a3;
+ (void)prunePersistentHistory;
+ (void)recalculateAllPlaylists;
+ (void)removeAllEpisodesFromMediaLibrary;
+ (void)rollbackMigrationV40IfNeededInContext:(id)a3;
+ (void)runMigrationOnAllEpisodesForVersion:(int64_t)a3;
+ (void)runMigrationOnEpisodesByPodcastForVersion:(int64_t)a3;
+ (void)setLastLaunchFromDatabase;
+ (void)touchAllMigrationVersions;
+ (void)touchCoreDataMigrationVersion;
+ (void)touchLibraryMigrationVersion;
+ (void)updateGlobalDownloadPolicyIfNecessary;
@end

@implementation MTLibraryMigrator

+ (BOOL)runDataMigration
{
  uint64_t v4 = _MTLogCategoryDatabase(v3);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v50 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Migration] (Data) Acquired lock.", v50, 2u);
  }

  unsigned int v6 = +[MTLibraryMigrationUtil needsDataMigration]( &OBJC_CLASS___MTLibraryMigrationUtil,  "needsDataMigration");
  if (v6)
  {
    unint64_t v7 = (unint64_t)+[MTDB libraryDataVersion](&OBJC_CLASS___MTDB, "libraryDataVersion");
    uint64_t v8 = _MTLogCategoryDatabase(v7);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v50 = 134217984;
      *(void *)&v50[4] = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[Migration] (Data) Needs migration with dataVersion %ld.",  v50,  0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTLibrary sharedInstance](&OBJC_CLASS___MTLibrary, "sharedInstance"));
    [v10 deleteOrphanedEpisodes];

    uint64_t v12 = _MTLogCategoryDatabase(v11);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v50 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[Migration] (Data) Deleted orphaned episodes.",  v50,  2u);
    }

    uint64_t v14 = _MTLogCategoryDatabase([a1 migrateSettingsForVersion:v7]);
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v50 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[Migration] (Data) Finished migration for settings.",  v50,  2u);
    }

    uint64_t v16 = _MTLogCategoryDatabase([a1 migratePlaylistsForVersion:v7]);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v50 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[Migration] (Data) Finished migration for playlists.",  v50,  2u);
    }

    uint64_t v18 = _MTLogCategoryDatabase([a1 runMigrationOnEpisodesByPodcastForVersion:v7]);
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v50 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "[Migration] (Data) Finished migration for episodes by podcast.",  v50,  2u);
    }

    uint64_t v20 = _MTLogCategoryDatabase([a1 runMigrationOnAllEpisodesForVersion:v7]);
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v50 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "[Migration] (Data) Finished migration for ALL episodes.",  v50,  2u);
    }

    if (v7 == 15)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      [v25 setObject:0 forKey:@"MTPodcastManifestUuid"];

      uint64_t v27 = _MTLogCategoryDatabase(v26);
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v50 = 0;
        v24 = "[Migration] (Data) Set kMTPodcastManifestUuid to nil in defaults.";
        goto LABEL_22;
      }
    }

    else
    {
      if (v7 != 3)
      {
        if ((uint64_t)v7 >= 23)
        {
          if (v7 == 32)
          {
            if (+[PFClientUtil isRunningOnInternalOS]( &OBJC_CLASS___PFClientUtil,  "isRunningOnInternalOS"))
            {
              uint64_t v49 = _MTLogCategoryDatabase([a1 deleteDuplicateVideoEpisodesForRdar59691904]);
              v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
              if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_27;
              }
              *(_WORD *)v50 = 0;
              v32 = "[Migration] (Data) Deleted duplicate video episodes.";
              goto LABEL_26;
            }
          }

          else if (v7 >= 0x22)
          {
            if (v7 > 0x3D)
            {
              if (v7 > 0x45) {
                goto LABEL_36;
              }
              goto LABEL_35;
            }

+ (void)_migrateToImageProvider
{
  uint64_t v3 = _MTLogCategoryArtworkDownload(a1);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Beginning artwork migration from MTImageStore to ImageProvider",  buf,  2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "_applePodcastsFoundationSharedUserDefaults"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[PUIObjCArtworkProvider shared](&OBJC_CLASS___PUIObjCArtworkProvider, "shared"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100107D64;
  v8[3] = &unk_100245108;
  id v9 = v5;
  id v10 = a1;
  id v7 = v5;
  [v6 migrateLibraryArtworkFromImageStoreWithCompletionHandler:v8];
}

+ (void)_removeImageStoreContent
{
  id v2 = +[PFClientUtil supportsImageStore](&OBJC_CLASS___PFClientUtil, "supportsImageStore");
  if (!(_DWORD)v2)
  {
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[MTImageStoreConstants defaultImageStoreURL]( &OBJC_CLASS___MTImageStoreConstants,  "defaultImageStoreURL"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v16 = 0LL;
    unsigned int v6 = [v5 removeItemAtURL:v4 error:&v16];
    id v7 = v16;

    uint64_t v9 = _MTLogCategoryArtworkDownload(v8);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    uint64_t v11 = v10;
    if (v6)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        uint64_t v12 = "Successfully removed image store directory";
        v13 = v11;
        os_log_type_t v14 = OS_LOG_TYPE_INFO;
        uint32_t v15 = 2;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v13, v14, v12, buf, v15);
      }
    }

    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v7;
      uint64_t v12 = "Failed to remove image store directory: %@";
      v13 = v11;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      uint32_t v15 = 12;
      goto LABEL_9;
    }

    goto LABEL_11;
  }

  uint64_t v3 = _MTLogCategoryArtworkDownload(v2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Skipping image store removal, client supports image store",  buf,  2u);
  }

+ (BOOL)_hasMTImageStoreContent
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[MTImageStoreConstants defaultImageStoreURL]( &OBJC_CLASS___MTImageStoreConstants,  "defaultImageStoreURL"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  char v8 = 0;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 path]);
  unsigned __int8 v5 = [v3 fileExistsAtPath:v4 isDirectory:&v8];
  if (v8) {
    BOOL v6 = v5;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

+ (void)migratePlaylistsForVersion:(int64_t)a3
{
  if ((unint64_t)(a3 - 19) >= 0x31)
  {
    if ((unint64_t)(a3 - 7) >= 0xC)
    {
      [a1 migratePlaylistDefaultsForVersion7to8];
    }

    [a1 migrateDefaultPlaylistsForVersion18to19];
  }

  _[a1 migratePlaylistDefaultsForVersion66to67];
}

+ (void)migratePlaylistDefaultsForVersion66to67
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 mainOrPrivateContext]);

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10010817C;
  v5[3] = &unk_10023FF98;
  id v6 = v3;
  id v4 = v3;
  [v4 performBlockAndWaitWithSave:v5];
}

+ (void)migratePlaylistDefaultsForVersion7to8
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 mainOrPrivateContext]);

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100108354;
  v5[3] = &unk_10023FF98;
  id v6 = v3;
  id v4 = v3;
  [v4 performBlockAndWaitWithSave:v5];
}

+ (void)migrateDefaultPlaylistsForVersion18to19
{
  uint64_t v3 = _MTLogCategoryDatabase(a1);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[Migration] (Data) Migrating playlists from version 18 to 19.",  buf,  2u);
  }

  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mainOrPrivateContext]);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100108578;
  v8[3] = &unk_100241568;
  id v9 = v6;
  id v10 = a1;
  id v7 = v6;
  [v7 performBlockAndWaitWithSave:v8];
}

+ (void)deleteOrUpdatePlaylist:(id)a3 ifIsDefault:(BOOL)a4
{
  if (a4)
  {
    id v4 = a3;
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[MTLibrary sharedInstance](&OBJC_CLASS___MTLibrary, "sharedInstance"));
    [v5 deletePlaylist:v4];
  }

  else
  {
    id v5 = a3;
    [v5 setIsBuiltIn:0];
  }
}

+ (BOOL)isDefaultSettingsForPlaylist:(id)a3 title:(id)a4 episodesToShow:(int64_t)a5 showPlayedEpisodes:(BOOL)a6 includeAllPodcasts:(BOOL)a7
{
  int v7 = a7;
  int v8 = a6;
  id v11 = a3;
  id v12 = a4;
  v13 = (void *)objc_claimAutoreleasedReturnValue([v11 title]);
  unsigned int v14 = [v13 isEqualToString:v12];

  if (v14)
  {
    uint32_t v15 = (void *)objc_claimAutoreleasedReturnValue([v11 defaultSettings]);
    BOOL v16 = [v15 episodesToShow] == (id)a5
       && [v15 showPlayedEpisodes] == v8
       && [v11 includesAllPodcasts] == v7
       && [v15 mediaType] == 0;
  }

  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

+ (void)migrateSettingsForVersion:(unint64_t)a3
{
  uint64_t v8 = v4;
  uint64_t v9 = v3;
  switch(a3)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
      [a1 migrateSettingDefaultsForVersion6to7];
      goto LABEL_3;
    case 7uLL:
    case 8uLL:
    case 9uLL:
LABEL_3:
      objc_msgSend(a1, "migrateSettingDefaultsForVersion9to10", v4, v9, v5, v6);
      goto LABEL_4;
    case 0xAuLL:
LABEL_4:
      objc_msgSend(a1, "migrateSettingDefaultsForVersion10to11", v8, v9);
      goto LABEL_5;
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
    case 0x1DuLL:
    case 0x1EuLL:
LABEL_5:
      objc_msgSend(a1, "migrateSettingDefaultsForVersion30to31", v8, v9);
      goto LABEL_6;
    case 0x1FuLL:
    case 0x20uLL:
    case 0x21uLL:
    case 0x22uLL:
    case 0x23uLL:
    case 0x24uLL:
    case 0x25uLL:
    case 0x26uLL:
    case 0x27uLL:
    case 0x28uLL:
    case 0x29uLL:
    case 0x2AuLL:
LABEL_6:
      objc_msgSend(a1, "migrateSettingDefaultsForVersion42to43", v8, v9);
      goto LABEL_7;
    case 0x2BuLL:
    case 0x2CuLL:
LABEL_7:
      objc_msgSend(a1, "migrateSettingDefaultsForVersion44to45", v8, v9);
      goto LABEL_8;
    case 0x2DuLL:
    case 0x2EuLL:
    case 0x2FuLL:
    case 0x30uLL:
LABEL_8:
      objc_msgSend(a1, "migrateSettingDefaultsForVersion48to49", v8, v9);
      goto LABEL_9;
    case 0x31uLL:
    case 0x32uLL:
    case 0x33uLL:
    case 0x34uLL:
    case 0x35uLL:
    case 0x36uLL:
    case 0x37uLL:
    case 0x38uLL:
    case 0x39uLL:
    case 0x3AuLL:
LABEL_9:
      objc_msgSend(a1, "migrateSettingDefaultsForVersion58to59", v8, v9);
      goto LABEL_10;
    case 0x3BuLL:
    case 0x3CuLL:
LABEL_10:
      _[a1 migrateSettingDefaultsForVersion60to61];
      break;
    default:
      return;
  }

+ (void)migrateSettingDefaultsForVersion6to7
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v3 floatForKey:@"MTAutoDownload"];
  int v5 = (int)v4;

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v6 setBool:(v5 - 1) < 2 forKey:@"MTAutoDownloadDefaultKey"];

  id v7 = objc_msgSend(a1, "episodesToKeepToEpisodeLimit:", objc_msgSend(a1, "episodesToKeepDefaultValue"));
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v8 setInteger:v7 forKey:kMTPodcastEpisodeLimitDefaultKey];
}

+ (void)migrateSettingDefaultsForVersion9to10
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v3 = [v2 BOOLForKey:@"MTCellularDownload"];

  if (v3)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v4 setBool:0 forKey:kMTWiFiDownloadOnly];
  }

+ (void)migrateSettingDefaultsForVersion10to11
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  uint64_t v9 = @"MTAutoDownloadDefaultKey";
  id v10 = &__kCFBooleanTrue;
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  [v2 registerDefaults:v3];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v5 = [v4 BOOLForKey:@"MTAutoDownloadDefaultKey"];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v7 = v6;
  LODWORD(v8) = 0;
  if (v5) {
    *(float *)&double v8 = 3.0;
  }
  [v6 setFloat:kMTPodcastAutoDownloadStateDefaultKey forKey:v8];
}

+ (void)migrateSettingDefaultsForVersion42to43
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults _applePodcastsFoundationSettingsUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "_applePodcastsFoundationSettingsUserDefaults"));
  uint64_t v3 = kMTPodcastAutoDownloadStateDefaultKey;
  unsigned int v4 = [v2 integerForKey:kMTPodcastAutoDownloadStateDefaultKey];

  if (v4 == 1)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSUserDefaults _applePodcastsFoundationSettingsUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "_applePodcastsFoundationSettingsUserDefaults"));
    LODWORD(v5) = 3.0;
    [v6 setFloat:v3 forKey:v5];
  }

+ (void)migrateSettingDefaultsForVersion44to45
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults _applePodcastsFoundationSettingsUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "_applePodcastsFoundationSettingsUserDefaults"));
  uint64_t v3 = kMTPodcastAutoDownloadStateDefaultKey;
  unsigned int v4 = [v2 integerForKey:kMTPodcastAutoDownloadStateDefaultKey];

  if (v4 == 0x7FFFFFFF)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSUserDefaults _applePodcastsFoundationSettingsUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "_applePodcastsFoundationSettingsUserDefaults"));
    LODWORD(v5) = 3.0;
    [v6 setFloat:v3 forKey:v5];
  }

+ (void)migrateSettingDefaultsForVersion48to49
{
  uint64_t v2 = _MTLogCategoryDatabase(a1);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[Migration] (Data) Migrating setting defaults from version 48 to 49.",  buf,  2u);
  }

  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "_applePodcastsFoundationSharedUserDefaults"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults showListShowsAllShowsKey](&OBJC_CLASS___NSUserDefaults, "showListShowsAllShowsKey"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v5]);

  if (!v6)
  {
    *(void *)buf = 0LL;
    id v18 = buf;
    uint64_t v19 = 0x2020000000LL;
    char v20 = 0;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
    double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mainOrPrivateContext]);

    id v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472LL;
    v13 = sub_100108F2C;
    unsigned int v14 = &unk_1002409A8;
    id v9 = v8;
    id v15 = v9;
    BOOL v16 = buf;
    [v9 performBlockAndWait:&v11];
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "_applePodcastsFoundationSharedUserDefaults",  v11,  v12,  v13,  v14));
    [v10 setShowListShowsAllShows:v18[24]];

    _Block_object_dispose(buf, 8);
  }

+ (void)migrateSettingDefaultsForVersion58to59
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "_applePodcastsFoundationSharedUserDefaults"));
  else {
    uint64_t v2 = &off_100254E60;
  }
  [v3 setObject:v2 forKey:kMTPodcastEpisodeLimitDefaultKey];
}

+ (void)runMigrationOnEpisodesByPodcastForVersion:(int64_t)a3
{
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mainOrPrivateContext]);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001091DC;
  v8[3] = &unk_100245130;
  id v9 = v6;
  int64_t v10 = a3;
  id v11 = a1;
  id v7 = v6;
  [v7 performBlockAndWaitWithSave:v8];
}

+ (void)episodeMigrationForVersion29to30:(id)a3
{
  id v8 = a3;
  if ([v8 isBackCatalogItem] && objc_msgSend(v8, "saved"))
  {
    [v8 playhead];
    int v4 = v3;
    else {
      uint64_t v5 = 2LL;
    }
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTLibrary sharedInstance](&OBJC_CLASS___MTLibrary, "sharedInstance"));
    [v6 setPlayState:v5 manually:1 forUserActionOnEpisode:v8 saveChanges:0];

    LODWORD(v7) = v4;
    [v8 setPlayhead:v7];
  }
}

+ (void)migrateSerpentId
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 mainOrPrivateContext]);

  int v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  kMTEpisodeEntityName));
  [v4 setReturnsObjectsAsFaults:0];
  [v4 setFetchBatchSize:200];
  double v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  id v9 = sub_100109B28;
  int64_t v10 = &unk_100240240;
  id v11 = v3;
  id v12 = v4;
  id v5 = v4;
  id v6 = v3;
  [v6 performBlockAndWaitWithSave:&v7];
  +[MTDB setSerpentIdMigrationComplete:](&OBJC_CLASS___MTDB, "setSerpentIdMigrationComplete:", 1LL, v7, v8, v9, v10);
}

+ (void)episodeMigrationForVersion0to1:(id)a3
{
  id v5 = a3;
  unint64_t v3 = (unint64_t)[v5 flags];
  if (v3)
  {
    unint64_t v4 = v3;
    [v5 setVideo:(v3 >> 3) & 1];
    [v5 setAudio:(v4 >> 4) & 1];
    [v5 setExternalType:(v4 >> 5) & 1];
    [v5 setFlags:0];
  }
}

+ (void)episodeMigrationForVersion6to7:(id)a3
{
  id v15 = a3;
  if (![v15 playState])
  {
    int64_t v3 = +[MTLibraryLegacyUtil playStateFromHasBeenPlayed:andPlayCount:]( MTLibraryLegacyUtil,  "playStateFromHasBeenPlayed:andPlayCount:",  [v15 hasBeenPlayed],  objc_msgSend(v15, "playCount"));
    if (v3) {
      id v4 = [v15 manuallyAdded];
    }
    else {
      id v4 = (id)([v15 visible] ^ 1);
    }
    [v15 setPlayState:v3 manually:v4 source:8];
  }

  if ([v15 persistentID])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](&OBJC_CLASS___MPMediaLibrary, "defaultMediaLibrary"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemWithPersistentID:", objc_msgSend(v15, "persistentID")));

    double v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTMLMediaItem itemWithMPMediaItem:](&OBJC_CLASS___MTMLMediaItem, "itemWithMPMediaItem:", v6));
    uint64_t v8 = v7;
    if (v7) {
      BOOL v9 = v6 == 0LL;
    }
    else {
      BOOL v9 = 1;
    }
    if (!v9)
    {
      objc_msgSend(v15, "setIsFromITunesSync:", objc_msgSend(v7, "isFromITunesSync"));
    }
  }

  int64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v15 podcast]);
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v15 assetURL]);
  if (!v11) {
    goto LABEL_23;
  }
  id v12 = (void *)v11;
  unsigned __int8 v13 = [v15 isFromITunesSync];

  unsigned int v14 = v15;
  if ((v13 & 1) == 0)
  {
    [v15 setSaved:1];
    int64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v15 podcast]);
    [v10 setShowPlacardForSavedEpisodes:1];
LABEL_23:

    unsigned int v14 = v15;
  }

  [v14 setSuppressAutoDownload:1];
  [v15 pubDate];
  objc_msgSend(v15, "setImportDate:");
}

+ (void)episodeMigrationForVersion13to14:(id)a3
{
  id v3 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue([v3 podcast]);
  [v3 pubDate];
  double v5 = v4;
  [v7 lastTouchDate];
  [v3 setIsNew:v5 > v6];
}

+ (void)episodeMigrationForVersion16to17:(id)a3
{
  id v3 = a3;
  if (![v3 playState]
    && [v3 playStateManuallySet]
    && [v3 playStateSource] == (id)6)
  {
    [v3 setBackCatalog:1];
  }
}

+ (void)episodeMigrationForVersion17to18:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue([v3 itemDescription]);
  objc_msgSend(v3, "setItemDescriptionHasHTML:", objc_msgSend(v4, "hasHTML"));
}

+ (void)episodeMigrationForVersion21to22:(id)a3
{
  id v5 = a3;
  if ([v5 itemDescriptionHasHTML])
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v5 itemDescription]);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringBySmartlyStrippingHTML]);
    [v5 setItemDescriptionWithoutHTML:v4];
  }
}

+ (void)episodeMigrationForVersion23to24:(id)a3
{
  id v12 = a3;
  +[MTUniversalPlaybackPositionDataSource uppLastSyncTime]( &OBJC_CLASS___MTUniversalPlaybackPositionDataSource,  "uppLastSyncTime");
  double v4 = v3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v12 managedObjectContext]);
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v12 metadataIdentifier]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 uppMetadataForMetadataIdentifier:v6]);

  if (v7)
  {
    [v12 metadataTimestamp];
    double v9 = v8;
    [v7 timestamp];
    if (v9 != v10)
    {
      [v12 metadataTimestamp];
      if (v11 < v4) {
        [v12 updateUPPTimestamp];
      }
    }
  }
}

+ (BOOL)runMigrationForPodcast:(id)a3 version:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = _MTLogCategoryDatabase(v6);
  double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    double v9 = (void *)objc_claimAutoreleasedReturnValue([v6 uuid]);
    int v14 = 138543618;
    id v15 = v9;
    __int16 v16 = 2048;
    int64_t v17 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[Migration] (Data) Running migration on podcast with uuid %{public}@ for version %ld",  (uint8_t *)&v14,  0x16u);
  }

  switch(a4)
  {
    case 0LL:
    case 1LL:
    case 2LL:
      if (([v6 flags] & 0x40) != 0)
      {
        uint64_t v10 = 0x7FFFFFFFLL;
      }

      else
      {
        uint64_t v10 = 1LL;
      }

      [v6 setAutoDownloadType:v10];
      goto LABEL_9;
    case 3LL:
    case 4LL:
    case 5LL:
LABEL_9:
      [v6 setUpdateInterval:0];
      id v11 = [v6 darkCount];
      goto LABEL_11;
    case 6LL:
LABEL_11:
      [a1 podcastMigrationForVersion6to7:v6];
      goto LABEL_12;
    case 7LL:
    case 8LL:
LABEL_12:
      BOOL v12 = 1;
      goto LABEL_42;
    case 9LL:
LABEL_14:
      [a1 podcastMigrationForVersion9to10:v6];
      goto LABEL_15;
    case 10LL:
    case 11LL:
LABEL_15:
      [a1 podcastMigrationForVersion11to12:v6];
      goto LABEL_16;
    case 12LL:
    case 13LL:
    case 14LL:
LABEL_16:
      [a1 podcastMigrationForVersion14to15:v6];
      goto LABEL_17;
    case 15LL:
    case 16LL:
    case 17LL:
    case 18LL:
    case 19LL:
LABEL_17:
      [a1 podcastMigrationForVersion19to20:v6];
      goto LABEL_18;
    case 20LL:
LABEL_18:
      [a1 podcastMigrationForVersion20to21:v6];
      goto LABEL_19;
    case 21LL:
    case 22LL:
    case 23LL:
    case 24LL:
LABEL_19:
      [a1 podcastMigrationForVersion24to25:v6];
      goto LABEL_20;
    case 25LL:
LABEL_20:
      [a1 podcastMigrationForVersion25to26:v6];
      goto LABEL_21;
    case 26LL:
LABEL_21:
      [a1 podcastMigrationForVersion26to27:v6];
      goto LABEL_22;
    case 27LL:
LABEL_22:
      [a1 podcastMigrationForVersion27to28:v6];
      goto LABEL_23;
    case 28LL:
LABEL_23:
      [a1 podcastMigrationForVersion28to29:v6];
      goto LABEL_24;
    case 29LL:
    case 30LL:
    case 31LL:
LABEL_24:
      [a1 podcastMigrationForVersion32to33:v6];
      goto LABEL_25;
    case 32LL:
    case 33LL:
    case 34LL:
LABEL_25:
      [a1 podcastMigrationForVersion34to35:v6];
      goto LABEL_26;
    case 35LL:
LABEL_26:
      [a1 podcastMigrationForVersion35to36:v6];
      goto LABEL_27;
    case 36LL:
LABEL_27:
      [a1 podcastMigrationForVersion36to37:v6];
      goto LABEL_28;
    case 37LL:
    case 38LL:
LABEL_28:
      [a1 podcastMigrationForVersion38to39:v6];
      goto LABEL_29;
    case 39LL:
    case 40LL:
    case 41LL:
LABEL_29:
      [a1 podcastMigrationForVersion41to42:v6];
      goto LABEL_30;
    case 42LL:
LABEL_30:
      [a1 podcastMigrationForVersion42to43:v6];
      goto LABEL_31;
    case 43LL:
    case 44LL:
LABEL_31:
      [a1 podcastMigrationForVersion44to45:v6];
      goto LABEL_32;
    case 45LL:
    case 46LL:
    case 47LL:
    case 48LL:
    case 49LL:
LABEL_32:
      [a1 podcastMigrationForVersion49to50:v6];
      goto LABEL_33;
    case 50LL:
LABEL_33:
      [a1 podcastMigrationForVersion50to51:v6];
      goto LABEL_34;
    case 51LL:
    case 52LL:
    case 53LL:
    case 54LL:
    case 55LL:
LABEL_34:
      [a1 podcastMigrationForVersion55to56:v6];
      goto LABEL_35;
    case 56LL:
LABEL_35:
      [a1 podcastMigrationForVersion56to57:v6];
      goto LABEL_36;
    case 57LL:
LABEL_36:
      [a1 podcastMigrationForVersion57to58:v6];
      goto LABEL_37;
    case 58LL:
LABEL_37:
      [a1 podcastMigrationForVersion58to59:v6];
      goto LABEL_38;
    case 59LL:
LABEL_38:
      [a1 podcastMigrationForVersion59to60:v6];
      goto LABEL_39;
    case 60LL:
    case 61LL:
    case 62LL:
LABEL_39:
      [a1 podcastMigrationForVersion62to63:v6];
      goto LABEL_40;
    case 63LL:
    case 64LL:
    case 65LL:
    case 66LL:
LABEL_40:
      [a1 podcastMigrationForVersion66to67:v6];
      break;
    default:
      break;
  }

  BOOL v12 = 0;
LABEL_42:

  return v12;
}

+ (void)podcastMigrationForVersion66to67:(id)a3
{
  id v3 = a3;
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 managedObjectContext]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  kMTEpisodeEntityName));
  [v5 setReturnsObjectsAsFaults:0];
  [v5 setFetchBatchSize:200];
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 uuid]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForAllEpisodesOnPodcastUuid:]( &OBJC_CLASS___MTEpisode,  "predicateForAllEpisodesOnPodcastUuid:",  v6));
  [v5 setPredicate:v7];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10010A524;
  v11[3] = &unk_100240980;
  id v12 = v4;
  id v13 = v5;
  id v14 = v3;
  id v8 = v3;
  id v9 = v5;
  id v10 = v4;
  [v10 performBlockAndWaitWithSave:v11];
}

+ (void)podcastMigrationForVersion62to63:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10010A708;
  v5[3] = &unk_100240240;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue([v6 managedObjectContext]);
  id v3 = v7;
  id v4 = v6;
  [v3 performBlockAndWait:v5];
}

+ (void)podcastMigrationForVersion58to59:(id)a3
{
  id v7 = a3;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults _applePodcastsFoundationSettingsUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "_applePodcastsFoundationSettingsUserDefaults"));
  id v4 = (const mach_header_64 *)[v3 episodeLimitForKey:kMTPodcastEpisodeLimitDefaultKey];

  if (![v7 autoDownloadEnabled])
  {
    id v5 = v7;
    if (v4 == &_mh_execute_header) {
      id v6 = (const mach_header_64 *)((char *)&_mh_execute_header.magic + 1);
    }
    else {
      id v6 = &_mh_execute_header;
    }
    goto LABEL_7;
  }

  if ([v7 episodeLimit] == v4)
  {
    id v5 = v7;
    id v6 = &_mh_execute_header + 1;
LABEL_7:
    [v5 setEpisodeLimit:v6];
  }
}

+ (void)podcastMigrationForVersion56to57:(id)a3
{
  id v4 = a3;
  else {
    uint64_t v3 = (uint64_t)[v4 isImplicitlyFollowed];
  }
  [v4 setIsHiddenOrImplicitlyFollowed:v3];
}

+ (void)podcastMigrationForVersion55to56:(id)a3
{
  id v3 = a3;
}

+ (void)podcastMigrationForVersion50to51:(id)a3
{
  id v5 = a3;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults _applePodcastsFoundationSettingsUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "_applePodcastsFoundationSettingsUserDefaults"));
  id v4 = [v3 BOOLForKey:kMTPodcastAutoDownloadStateDefaultKey];

  [v5 setAutoDownloadEnabled:v4];
}

+ (void)podcastMigrationForVersion49to50:(id)a3
{
  uint64_t v3 = _MTLogCategoryDatabase(a1, a2, a3);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[Migration] (Data) Migrating podcasts from version 49 to 50.",  v5,  2u);
  }
}

+ (void)podcastMigrationForVersion44to45:(id)a3
{
  id v5 = a3;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults _applePodcastsFoundationSettingsUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "_applePodcastsFoundationSettingsUserDefaults"));
  id v4 = [v3 integerForKey:kMTPodcastAutoDownloadStateDefaultKey];
}

+ (void)podcastMigrationForVersion42to43:(id)a3
{
  id v3 = a3;
}

+ (void)podcastMigrationForVersion41to42:(id)a3
{
  id v7 = a3;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v7 displayType]);

  if (!v3)
  {
    uint64_t v5 = NSPersistentStringForMTDisplayType(0LL, v4);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    [v7 setDisplayType:v6];
  }
}

+ (void)podcastMigrationForVersion38to39:(id)a3
{
  id v8 = a3;
  id v3 = [v8 showTypeSetting];
  if (v3 == (id)3)
  {
    uint64_t v5 = (uint64_t)+[MTPodcast defaultShowType](&OBJC_CLASS___MTPodcast, "defaultShowType");
LABEL_14:
    id v7 = v8;
LABEL_15:
    [v7 setShowTypeSetting:v5];
    uint64_t v4 = v8;
    goto LABEL_16;
  }

  if (v3 == (id)2)
  {
    BOOL v6 = [v8 isSerialShowTypeInFeed] == 0;
    id v7 = v8;
    if (v6) {
      uint64_t v5 = 4LL;
    }
    else {
      uint64_t v5 = 2LL;
    }
    goto LABEL_15;
  }

  uint64_t v4 = v8;
  if (!v3)
  {
    if ([v8 sortAscending]
      && ([v8 isSerialShowTypeInFeed] & 1) != 0)
    {
      uint64_t v5 = 2LL;
    }

    else if ([v8 sortAscending])
    {
      uint64_t v5 = 4LL;
    }

    else
    {
      uint64_t v5 = 1LL;
    }

    goto LABEL_14;
  }

+ (void)podcastMigrationForVersion36to37:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 managedObjectContext]);
  uint64_t v5 = kMTEpisodeEntityName;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v3 uuid]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForListenNowForPodcastUuid:]( &OBJC_CLASS___MTEpisode,  "predicateForListenNowForPodcastUuid:",  v6));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode sortDescriptorsForListenNow](&OBJC_CLASS___MTEpisode, "sortDescriptorsForListenNow"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( [v4 objectsInEntity:v5 predicate:v7 sortDescriptors:v8 returnsObjectsAsFaults:0 limit:0]);

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uuid", (void)v19));
        int64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v3 nextEpisodeUuid]);
        unsigned __int8 v18 = [v16 isEqualToString:v17];

        if ((v18 & 1) == 0) {
          [v15 setListenNowEpisode:0];
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v12);
  }
}

+ (void)podcastMigrationForVersion34to35:(id)a3
{
  id v16 = a3;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v16 managedObjectContext]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v16 uuid]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[MTRecencyUtil upNextForPodcastUuid:excludeExplicit:ctx:]( &OBJC_CLASS___MTRecencyUtil,  "upNextForPodcastUuid:excludeExplicit:ctx:",  v4,  0LL,  v3));

  [v5 modifiedDate];
  objc_msgSend(v16, "setModifiedDate:");
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v16 nextEpisodeUuid]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 episodeUuid]);
  unsigned __int8 v8 = [v6 isEqualToString:v7];

  if ((v8 & 1) == 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v16 nextEpisodeUuid]);

    if (v9)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v16 nextEpisodeUuid]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 episodeForUuid:v10]);

      [v11 setListenNowEpisode:0];
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 episodeUuid]);

    if (v12)
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v5 episodeUuid]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 episodeForUuid:v13]);

      [v14 setListenNowEpisode:1];
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue([v5 episodeUuid]);
    [v16 setNextEpisodeUuid:v15];
  }
}

+ (void)podcastMigrationForVersion32to33:(id)a3
{
}

+ (void)podcastMigrationForVersion28to29:(id)a3
{
  id v9 = a3;
  [v9 addedDate];
  double v4 = v3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v9 newestEpisode]);
  [v5 pubDate];
  if (v6 > 0.0)
  {
    [v5 pubDate];
LABEL_5:
    double v4 = v7;
    goto LABEL_6;
  }

  [v5 importDate];
  if (v8 > 0.0)
  {
    [v5 importDate];
    goto LABEL_5;
  }

+ (void)podcastMigrationForVersion27to28:(id)a3
{
  id v3 = a3;
  if ([v3 episodeLimit] == (id)0xFFFFFFFFLL) {
    objc_msgSend( v3,  "setEpisodeLimit:",  +[MTPodcast episodeLimitDefaultValue](MTPodcast, "episodeLimitDefaultValue"));
  }
}

+ (void)podcastMigrationForVersion20to21:(id)a3
{
}

+ (void)podcastMigrationForVersion19to20:(id)a3
{
  id v3 = a3;
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 managedObjectContext]);
  uint64_t v5 = kMTEpisodeEntityName;
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v3 uuid]);
  double v7 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForAllEpisodesOnPodcastUuid:]( &OBJC_CLASS___MTEpisode,  "predicateForAllEpisodesOnPodcastUuid:",  v6));
  uint64_t v8 = kEpisodeLastDatePlayed;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  kEpisodeLastDatePlayed,  0LL));
  int64_t v17 = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
  uint64_t v16 = v8;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  LOBYTE(v15) = 0;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( [v4 objectDictionariesInEntity:v5 predicate:v7 sortDescriptors:v10 propertiesToFetch:v11 includeObjectId:0 limit:1 distinct:v15 groupBy:0]);

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 firstObject]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v8]);

  if (v14)
  {
    [v14 timeIntervalSinceReferenceDate];
    objc_msgSend(v3, "setLastDatePlayed:");
  }
}

+ (void)podcastMigrationForVersion14to15:(id)a3
{
  id v9 = a3;
  [v9 setNeedsArtworkUpdate:1];
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v9 imageURL]);

  if (v3)
  {
    id v4 = objc_alloc(&OBJC_CLASS____TtC18PodcastsFoundation22DownloadableURLOptions);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v9 imageURL]);
    id v6 = objc_msgSend(v4, "init:nonAppInitiated:", v5, objc_msgSend(v9, "requestsAreNonAppInitiated"));

    double v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTImageDownloader sharedInstance](&OBJC_CLASS___MTImageDownloader, "sharedInstance"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v9 uuid]);
    [v7 downloadImageForPodcastUuid:v8 urlOptions:v6 userInitiated:0 useBackgroundFetch:0 callback:0];
  }
}

+ (void)podcastMigrationForVersion11to12:(id)a3
{
  id v3 = a3;
}

+ (void)podcastMigrationForVersion9to10:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "setDarkCountLocal:", objc_msgSend(v3, "darkCount"));
}

+ (void)podcastMigrationForVersion6to7:(id)a3
{
  id v9 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v9 uuid]);

  if (!v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString UUID](&OBJC_CLASS___NSString, "UUID"));
    [v9 setUuid:v5];
  }

  id v6 = [v9 keepEpisodes];
  unsigned int v7 = v6;
  if ((_DWORD)v6 == -1) {
    unsigned int v7 = [a1 episodesToKeepDefaultValue];
  }
  if (v7 == 1) {
    uint64_t v8 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v8 = 0LL;
  }
  [v9 setDeletePlayedEpisodes:v8];
  if (v7 != 1) {
    [v9 setShowPlacardForRemovePlayedEpisodes:1];
  }
  objc_msgSend(v9, "setEpisodeLimit:", objc_msgSend(a1, "episodesToKeepToEpisodeLimit:", v6));
}

+ (BOOL)podcastMigrationForVersion8to9:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 feedURL]);
  if (![v4 length])
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 episodes]);
    id v6 = [v5 count];

    if (v6 != (id)1) {
      goto LABEL_6;
    }
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v3 episodes]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 anyObject]);

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 assetURL]);
    if ([v9 length])
    {
    }

    else
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 enclosureURL]);
      id v13 = [v12 length];

      if (!v13)
      {
        uint64_t v15 = _MTLogCategoryDatabase(v14);
        uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v3 uuid]);
          int v20 = 138543362;
          __int128 v21 = v17;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "[Migration] (Data) Will delete podcast %{public}@ during migration",  (uint8_t *)&v20,  0xCu);
        }

        unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue(+[MTLibrary sharedInstance](&OBJC_CLASS___MTLibrary, "sharedInstance"));
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v3 uuid]);
        [v18 deletePodcastWithUuid:v19];

        BOOL v10 = 1;
        goto LABEL_10;
      }
    }

    BOOL v10 = 0;
LABEL_10:

    goto LABEL_7;
  }

LABEL_6:
  BOOL v10 = 0;
LABEL_7:

  return v10;
}

+ (void)runMigrationOnAllEpisodesForVersion:(int64_t)a3
{
  uint64_t v5 = _MTLogCategoryDatabase(a1);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v15 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[Migration] (Data) Running migration on all episodes for version %ld",  buf,  0xCu);
  }

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mainOrPrivateContext]);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10010B654;
  v10[3] = &unk_100245130;
  int64_t v12 = a3;
  id v13 = a1;
  id v11 = v8;
  id v9 = v8;
  [v9 performBlockAndWaitWithSave:v10];
}

+ (void)allEpisodesMigrationForVersion68to69In:(id)a3
{
  id v3 = a3;
  uint64_t v4 = _MTLogCategoryDatabase(v3);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[Migration] (Data) Deleting itemDescriptionWithHTML for upgrade from version 68 to 69.",  buf,  2u);
  }

  id v6 = objc_alloc(&OBJC_CLASS___NSBatchUpdateRequest);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode entity](&OBJC_CLASS___MTEpisode, "entity"));
  uint64_t v8 = -[NSBatchUpdateRequest initWithEntity:](v6, "initWithEntity:", v7);

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%@ != nil",  @"itemDescriptionWithHTML"));
  -[NSBatchUpdateRequest setPredicate:](v8, "setPredicate:", v9);

  uint64_t v27 = @"itemDescriptionWithHTML";
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  v28 = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
  -[NSBatchUpdateRequest setPropertiesToUpdate:](v8, "setPropertiesToUpdate:", v11);

  id v22 = 0LL;
  id v12 = [v3 executeRequest:v8 error:&v22];
  id v13 = v22;
  uint64_t v14 = _MTLogCategoryDatabase(v13);
  int64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  uint64_t v16 = v15;
  if (v13)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      id v17 = +[MTDB libraryDataVersion](&OBJC_CLASS___MTDB, "libraryDataVersion");
      *(_DWORD *)buf = 134218242;
      id v24 = v17;
      __int16 v25 = 2112;
      id v26 = v13;
      unsigned __int8 v18 = "[Migration] (Data) (Initial Version: %li) itemDescriptionWithHTML migration failed with error %@";
      __int128 v19 = v16;
      os_log_type_t v20 = OS_LOG_TYPE_FAULT;
      uint32_t v21 = 22;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v19, v20, v18, buf, v21);
    }
  }

  else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    unsigned __int8 v18 = "[Migration] (Data) Finished deleting itemDescriptionWithHTML for upgrade from version 68 to 69.";
    __int128 v19 = v16;
    os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
    uint32_t v21 = 2;
    goto LABEL_8;
  }
}

+ (void)allEpisodesMigrationForVersion65to66In:(id)a3
{
  id v3 = a3;
  uint64_t v4 = _MTLogCategoryDatabase(v3);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[Migration] (Data) Migrating all episodes from version 65 to 66 (migrate all Up Next episodes to have calculated m odifiedDateScore values",  buf,  2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForListenNow](&OBJC_CLASS___MTEpisode, "predicateForListenNow"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10010BA54;
  v8[3] = &unk_10023FF98;
  id v9 = (id)objc_claimAutoreleasedReturnValue([v3 objectsInEntity:kMTEpisodeEntityName predicate:v6 sortDescriptors:0]);
  id v7 = v9;
  [v3 performBlockAndWaitWithSave:v8];
}

+ (void)allEpisodesMigrationForVersion59to60In:(id)a3
{
  id v3 = a3;
  uint64_t v4 = _MTLogCategoryDatabase(v3);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[Migration] (Data) Migrating all trailers from version 54 to 55 (migrate all episode 0's to nulls",  buf,  2u);
  }

  uint64_t v6 = kEpisodeEpisodeNumber;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(%K = 0)",  kEpisodeEpisodeNumber));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForEpisodeType:](&OBJC_CLASS___MTEpisode, "predicateForEpisodeType:", 1LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 AND:v8]);

  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSBatchUpdateRequest batchUpdateRequestWithEntityName:]( &OBJC_CLASS___NSBatchUpdateRequest,  "batchUpdateRequestWithEntityName:",  kMTEpisodeEntityName));
  [v10 setPredicate:v9];
  uint64_t v22 = v6;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  v23 = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
  [v10 setPropertiesToUpdate:v12];

  [v10 setResultType:2];
  id v19 = 0LL;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v3 executeRequest:v10 error:&v19]);

  id v14 = v19;
  uint64_t v15 = _MTLogCategoryDatabase(v14);
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  id v17 = v16;
  if (v14)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "[Migration] (Data) Batch request to migrate all episode 0's to nulls failed with error: %@",  buf,  0xCu);
    }
  }

  else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue([v13 result]);
    *(_DWORD *)buf = 138412290;
    id v21 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[Migration] (Data) %@ episodes successfully migrated from episode 0 to null",  buf,  0xCu);
  }
}

+ (void)allEpisodesMigrationForVersion54to55In:(id)a3
{
  id v3 = a3;
  uint64_t v4 = _MTLogCategoryDatabase(v3);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[Migration] (Data) Migrating all trailers from version 54 to 55 (migrate all episode 0's to nulls",  buf,  2u);
  }

  uint64_t v6 = kEpisodeEpisodeNumber;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(%K = NULL)",  kEpisodeEpisodeNumber));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForEpisodeType:](&OBJC_CLASS___MTEpisode, "predicateForEpisodeType:", 1LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 AND:v8]);

  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSBatchUpdateRequest batchUpdateRequestWithEntityName:]( &OBJC_CLASS___NSBatchUpdateRequest,  "batchUpdateRequestWithEntityName:",  kMTEpisodeEntityName));
  [v10 setPredicate:v9];
  uint64_t v21 = v6;
  uint64_t v22 = &off_100254E78;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
  [v10 setPropertiesToUpdate:v11];

  [v10 setResultType:2];
  id v18 = 0LL;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 executeRequest:v10 error:&v18]);

  id v13 = v18;
  uint64_t v14 = _MTLogCategoryDatabase(v13);
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  uint64_t v16 = v15;
  if (v13)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "[Migration] (Data) Batch request to migrate all episode 0's to nulls failed with error: %@",  buf,  0xCu);
    }
  }

  else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v12 result]);
    *(_DWORD *)buf = 138412290;
    id v20 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "[Migration] (Data) %@ episodes successfully migrated from episode 0 to null",  buf,  0xCu);
  }
}

+ (void)allEpisodesMigrationForVersion53to54In:(id)a3
{
  id v3 = a3;
  uint64_t v4 = _MTLogCategoryDatabase(v3);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[Migration] (Data) Migrating all episodes from version 53 to 54 (migrate all episode 0's to nulls",  buf,  2u);
  }

  uint64_t v6 = kEpisodeEpisodeNumber;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(%K = 0)",  kEpisodeEpisodeNumber));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSBatchUpdateRequest batchUpdateRequestWithEntityName:]( &OBJC_CLASS___NSBatchUpdateRequest,  "batchUpdateRequestWithEntityName:",  kMTEpisodeEntityName));
  [v8 setPredicate:v7];
  uint64_t v20 = v6;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  uint64_t v21 = v9;
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
  [v8 setPropertiesToUpdate:v10];

  [v8 setResultType:2];
  id v17 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 executeRequest:v8 error:&v17]);

  id v12 = v17;
  uint64_t v13 = _MTLogCategoryDatabase(v12);
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t v15 = v14;
  if (v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "[Migration] (Data) Batch request to migrate all episode 0's to nulls failed with error: %@",  buf,  0xCu);
    }
  }

  else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v11 result]);
    *(_DWORD *)buf = 138412290;
    id v19 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[Migration] (Data) %@ episodes successfully migrated from episode 0 to null",  buf,  0xCu);
  }
}

+ (void)allEpisodesMigrationForVersion51to52In:(id)a3
{
  id v3 = a3;
  uint64_t v4 = _MTLogCategoryDatabase(v3);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[Migration] (Data) Migrating all episodes from version 51 to 52 (migrate all season 0's to nulls",  buf,  2u);
  }

  uint64_t v6 = kEpisodeSeasonNumber;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(%K = 0)",  kEpisodeSeasonNumber));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSBatchUpdateRequest batchUpdateRequestWithEntityName:]( &OBJC_CLASS___NSBatchUpdateRequest,  "batchUpdateRequestWithEntityName:",  kMTEpisodeEntityName));
  [v8 setPredicate:v7];
  uint64_t v20 = v6;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  uint64_t v21 = v9;
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
  [v8 setPropertiesToUpdate:v10];

  [v8 setResultType:2];
  id v17 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 executeRequest:v8 error:&v17]);

  id v12 = v17;
  uint64_t v13 = _MTLogCategoryDatabase(v12);
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t v15 = v14;
  if (v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "[Migration] (Data) Batch request to migrate all season 0's to nulls failed with error: %@",  buf,  0xCu);
    }
  }

  else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v11 result]);
    *(_DWORD *)buf = 138412290;
    id v19 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[Migration] (Data) %@ episodes successfully migrated from season 0 to null",  buf,  0xCu);
  }
}

+ (void)allEpisodesMigrationForVersion47to48In:(id)a3
{
  id v3 = a3;
  uint64_t v4 = _MTLogCategoryDatabase(v3);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[Migration] (Data) Migrating all episodes from version 47 to 48.",  buf,  2u);
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForDownloaded:excludeHidden:]( &OBJC_CLASS___MTEpisode,  "predicateForDownloaded:excludeHidden:",  0LL,  0LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForDownloadBehavior:]( &OBJC_CLASS___MTEpisode,  "predicateForDownloadBehavior:",  3LL));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate notPredicateWithSubpredicate:]( &OBJC_CLASS___NSCompoundPredicate,  "notPredicateWithSubpredicate:",  v7));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 AND:v8]);

  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSBatchUpdateRequest batchUpdateRequestWithEntityName:]( &OBJC_CLASS___NSBatchUpdateRequest,  "batchUpdateRequestWithEntityName:",  kMTEpisodeEntityName));
  [v10 setPredicate:v9];
  uint64_t v21 = kEpisodeDownloadBehavior;
  uint64_t v22 = &off_100254E90;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
  [v10 setPropertiesToUpdate:v11];

  [v10 setResultType:2];
  id v18 = 0LL;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 executeRequest:v10 error:&v18]);

  id v13 = v18;
  uint64_t v14 = _MTLogCategoryDatabase(v13);
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  uint64_t v16 = v15;
  if (v13)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "[Migration] (Data) Batch request to migrate undownloaded episodes to MTEpisodeDownloadBehaviorAutomaticSuppressed %@",  buf,  0xCu);
    }
  }

  else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v12 result]);
    *(_DWORD *)buf = 138412290;
    id v20 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "[Migration] (Data) %@ My Episodes successfully migrated undownloaded episodes to MTEpisodeDownloadBehaviorAutomaticSuppressed",  buf,  0xCu);
  }
}

+ (void)allEpisodesMigrationForVersion46to47In:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForEpisodesWhichNeedEntitlementStateUpdate]( &OBJC_CLASS___MTEpisode,  "predicateForEpisodesWhichNeedEntitlementStateUpdate"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectsInEntity:kMTEpisodeEntityName predicate:v4 sortDescriptors:0]);
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) updateEntitlementState];
        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }
}

+ (void)allEpisodesMigrationForVersion45to46In:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForSaved:](&OBJC_CLASS___MTEpisode, "predicateForSaved:", 1LL));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForDownloaded:excludeHidden:]( &OBJC_CLASS___MTEpisode,  "predicateForDownloaded:excludeHidden:",  1LL,  0LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 AND:v5]);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10010C968;
  v8[3] = &unk_10023FF98;
  id v9 = (id)objc_claimAutoreleasedReturnValue([v3 objectsInEntity:kMTEpisodeEntityName predicate:v6 sortDescriptors:0]);
  id v7 = v9;
  [v3 performBlockAndWaitWithSave:v8];
}

+ (void)allEpisodesMigrationForVersion43to44In:(id)a3
{
  id v4 = a3;
  [a1 rollbackMigrationV40IfNeededInContext:v4];
  uint64_t v5 = kMTEpisodeEntityName;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForSaved:](&OBJC_CLASS___MTEpisode, "predicateForSaved:", 1LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode sortDescriptorsForPubDateAscending:]( &OBJC_CLASS___MTEpisode,  "sortDescriptorsForPubDateAscending:",  0LL));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectsInEntity:v5 predicate:v6 sortDescriptors:v7]);

  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v10)
  {
    id v11 = v10;
    unint64_t v12 = 0LL;
    uint64_t v13 = *(void *)v31;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
        if (v12 > 0x12B)
        {
          [*(id *)(*((void *)&v30 + 1) + 8 * (void)i) setIsBookmarksMigrationRecoveredEpisode:1];
        }

        else
        {
          [*(id *)(*((void *)&v30 + 1) + 8 * (void)i) setIsBookmarked:1];
          [v15 pubDate];
          objc_msgSend(v15, "setLastBookmarkedDate:");
          ++v12;
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }

    while (v11);
  }

  else
  {
    unint64_t v12 = 0LL;
  }

  uint64_t v17 = _MTLogCategoryDatabase(v16);
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v37 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[Migration] (Data) Bookmarks migration run for %lu previously saved episodes.",  buf,  0xCu);
  }

  if ((unint64_t)[v9 count] >= 0x12D)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v19 setBool:1 forKey:kHasSavedEpisodesOffLimitsMigratedOnDataVersion44];
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSBatchUpdateRequest batchUpdateRequestWithEntityName:]( &OBJC_CLASS___NSBatchUpdateRequest,  "batchUpdateRequestWithEntityName:",  v5));
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  kEpisodeUserEpisode,  &__kCFBooleanTrue));
  [v20 setPredicate:v21];

  uint64_t v34 = kEpisodeIsBookmarksMigrationRecoveredEpisode;
  uint64_t v35 = &__kCFBooleanTrue;
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v35,  &v34,  1LL));
  [v20 setPropertiesToUpdate:v22];

  [v20 setResultType:2];
  id v29 = 0LL;
  v23 = (void *)objc_claimAutoreleasedReturnValue([v4 executeRequest:v20 error:&v29]);
  id v24 = v29;
  uint64_t v25 = _MTLogCategoryDatabase(v24);
  id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  uint64_t v27 = v26;
  if (v24)
  {
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v37 = (unint64_t)v24;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "[Migration] (Data) Batch request to migrate My Episodes to recoveredEpisodes failed %@",  buf,  0xCu);
    }
  }

  else if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue([v23 result]);
    *(_DWORD *)buf = 138412290;
    unint64_t v37 = (unint64_t)v28;
    _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "[Migration] (Data) %@ My Episodes successfully migrated to Recovered Episodes.",  buf,  0xCu);
  }
}

+ (void)rollbackMigrationV40IfNeededInContext:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[BookmarksMigrationRegistry migrationRegisteredAtVersion:]( &OBJC_CLASS____TtC8Podcasts26BookmarksMigrationRegistry,  "migrationRegisteredAtVersion:",  40LL));
  uint64_t v5 = v4;
  if (v4)
  {
    __int128 v33 = v3;
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 uuids]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v6));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForEpisodeUuids:](&OBJC_CLASS___MTEpisode, "predicateForEpisodeUuids:", v7));

    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForAllBookmarkedEpisodes]( &OBJC_CLASS___MTEpisode,  "predicateForAllBookmarkedEpisodes"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForSaved:](&OBJC_CLASS___MTEpisode, "predicateForSaved:", 0LL));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 date]);
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 dateByAddingTimeInterval:120.0]);

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v5 date]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 dateByAddingTimeInterval:-120.0]);

    uint64_t v15 = kEpisodeLastBookmarkedDate;
    __int128 v30 = (void *)v12;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateForDateKey:isLessThanOrEqualToDate:]( &OBJC_CLASS___NSPredicate,  "predicateForDateKey:isLessThanOrEqualToDate:",  kEpisodeLastBookmarkedDate,  v12));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateForDateKey:isGreaterThanOrEqualToDate:]( &OBJC_CLASS___NSPredicate,  "predicateForDateKey:isGreaterThanOrEqualToDate:",  v15,  v14));
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 AND:v16]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSBatchUpdateRequest batchUpdateRequestWithEntityName:]( &OBJC_CLASS___NSBatchUpdateRequest,  "batchUpdateRequestWithEntityName:",  kMTEpisodeEntityName));
    __int128 v31 = v10;
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v10 AND:v18]);
    __int128 v32 = v9;
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v9 AND:v20]);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v8 AND:v21]);
    [v19 setPredicate:v22];

    id v3 = v33;
    uint64_t v37 = kEpisodeIsBookmarked;
    uint64_t v38 = &__kCFBooleanFalse;
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v38,  &v37,  1LL));
    [v19 setPropertiesToUpdate:v23];

    id v34 = 0LL;
    id v24 = [v33 executeRequest:v19 error:&v34];
    id v25 = v34;
    uint64_t v26 = _MTLogCategoryDatabase(v25);
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    v28 = v27;
    if (v25)
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v36 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "[Migration] (Data) Batch request to roll back version 40 migration failed %@",  buf,  0xCu);
      }
    }

    else
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "[Migration] (Data) Version 40 migration correctly rolled back.",  buf,  2u);
      }

      +[BookmarksMigrationRegistry deleteMigrationRegistryAtVersion:]( &OBJC_CLASS____TtC8Podcasts26BookmarksMigrationRegistry,  "deleteMigrationRegistryAtVersion:",  40LL);
    }
  }

  else
  {
    uint64_t v29 = _MTLogCategoryDatabase(0LL);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  OS_LOG_TYPE_DEFAULT,  "[Migration] (Data) No v40 migration detected, nothing to roll back",  buf,  2u);
    }
  }
}

+ (void)allEpisodesMigrationForVersion40to41In:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  kMTEpisodeEntityName));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForSuppressAutoDownload:]( &OBJC_CLASS___MTEpisode,  "predicateForSuppressAutoDownload:",  1LL));
  [v4 setPredicate:v5];

  [v4 setReturnsObjectsAsFaults:0];
  [v4 setFetchBatchSize:200];
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue([v3 executeFetchRequest:v4]);
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = 0LL;
    uint64_t v10 = *(void *)v15;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)v11);
        uint64_t v13 = objc_autoreleasePoolPush();
        objc_msgSend(v12, "setDownloadBehavior:", 1, (void)v14);
        objc_autoreleasePoolPop(v13);
        id v11 = (char *)v11 + 1;
      }

      while (v8 != v11);
      v9 += (uint64_t)v8;
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }

  [v3 saveInCurrentBlock];
}

+ (void)deleteDuplicateVideoEpisodesForRdar59691904
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_10010D4A4;
  uint64_t v10 = sub_10010D4B4;
  id v11 = 0LL;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 mainOrPrivateContext]);

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10010D4BC;
  v5[3] = &unk_100240E78;
  void v5[4] = &v6;
  [v3 performBlockAndWait:v5];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTLibrary sharedInstance](&OBJC_CLASS___MTLibrary, "sharedInstance"));
  [v4 deleteEpisodeUuids:v7[5] forced:1];

  _Block_object_dispose(&v6, 8);
}

+ (void)moveEpisodeAssetsToSharedContainer
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 mainOrPrivateContext]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  kMTEpisodeEntityName));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForDownloaded:excludeHidden:]( &OBJC_CLASS___MTEpisode,  "predicateForDownloaded:excludeHidden:",  1LL,  0LL));
  [v5 setPredicate:v6];

  v15[0] = kEpisodeUuid;
  v15[1] = kEpisodeAssetURL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));
  [v5 setPropertiesToFetch:v7];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10010D890;
  v11[3] = &unk_100240980;
  id v12 = v3;
  id v13 = v5;
  id v14 = v4;
  id v8 = v4;
  id v9 = v5;
  id v10 = v3;
  [v10 performBlockAndWaitWithSave:v11];
}

+ (void)removeAllEpisodesFromMediaLibrary
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10010DEDC;
  v12[3] = &unk_100245158;
  id v13 = (id)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](&OBJC_CLASS___MPMediaLibrary, "defaultMediaLibrary"));
  id v2 = v13;
  [v2 performTransactionWithBlock:v12];
  +[MPMediaQuery setFilteringDisabled:](&OBJC_CLASS___MPMediaQuery, "setFilteringDisabled:", 0LL);
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSBatchUpdateRequest batchUpdateRequestWithEntityName:]( &OBJC_CLASS___NSBatchUpdateRequest,  "batchUpdateRequestWithEntityName:",  kMTEpisodeEntityName));
  uint64_t v14 = kEpisodePersistentID;
  __int128 v15 = &off_100254E78;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
  [v3 setPropertiesToUpdate:v4];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mainOrPrivateContext]);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10010DF20;
  v9[3] = &unk_100240240;
  id v10 = v6;
  id v11 = v3;
  id v7 = v3;
  id v8 = v6;
  [v8 performBlockAndWait:v9];
}

+ (void)prunePersistentHistory
{
  uint64_t v2 = _MTLogCategoryDatabase(a1);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v15 = 14;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[Migration] (Data) Will prune persistent history older than %d days old",  buf,  8u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  -1209600.0));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPersistentHistoryChangeRequest deleteHistoryBeforeDate:]( &OBJC_CLASS___NSPersistentHistoryChangeRequest,  "deleteHistoryBeforeDate:",  v4));

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 mainOrPrivateContext]);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10010E190;
  v10[3] = &unk_100244168;
  id v11 = v7;
  id v12 = v5;
  int v13 = 14;
  id v8 = v5;
  id v9 = v7;
  [v9 performBlockAndWait:v10];
}

+ (int)episodesToKeepDefaultValue
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  int v3 = [v2 integerForKey:@"MTPodcastKeepEpisodesDefault"];

  return v3;
}

+ (int64_t)episodesToKeepToEpisodeLimit:(int)a3
{
  else {
    return qword_1001C3B58[a3 + 1];
  }
}

+ (void)recalculateAllPlaylists
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 mainOrPrivateContext]);

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10010E3B4;
  v5[3] = &unk_10023FF98;
  id v6 = v3;
  id v4 = v3;
  [v4 performBlockAndWaitWithSave:v5];
}

+ (void)touchAllMigrationVersions
{
}

+ (void)touchLibraryMigrationVersion
{
}

+ (void)touchCoreDataMigrationVersion
{
}

+ (BOOL)needToMigrateDataToSharedContainer
{
  id v2 = [(id)objc_opt_class(a1) legacyLibraryPath];
  int v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v6 = [v5 fileExistsAtPath:v4];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB libraryPath](&OBJC_CLASS___MTDB, "libraryPath"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v10 = [v9 fileExistsAtPath:v8];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](&OBJC_CLASS___IMLogger, "sharedLogger"));
  id v12 = v11;
  int v13 = @"not required";
  int v14 = v6 & (v10 ^ 1);
  if (v14) {
    int v13 = @"required";
  }
  [v11 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/Migration/MTLibraryMigrator.m", 2561, @"Migrate data to shared container is %@", v13 lineNumber format];

  return v14;
}

+ (void)migrateDatabaseToSharedContainerIfNeeded
{
  if ((+[MTDB quickCheckForNeedsContainerMigration]( &OBJC_CLASS___MTDB,  "quickCheckForNeedsContainerMigration") & 1) == 0)
  {
    if (([a1 needToMigrateDataToSharedContainer] & 1) == 0) {
      +[MTDB setQuickCheckForNeedsContainerMigration:]( &OBJC_CLASS___MTDB,  "setQuickCheckForNeedsContainerMigration:",  1LL);
    }
  }

+ (BOOL)needsMigration
{
  if (+[MTLibraryMigrationUtil isNewInstall](&OBJC_CLASS___MTLibraryMigrationUtil, "isNewInstall"))
  {
    +[IMMetrics recordUserAction:](&OBJC_CLASS___IMMetrics, "recordUserAction:", @"is_new_install");
    [a1 touchAllMigrationVersions];
    return 0;
  }

  [a1 fixupDataMigrationVersion];
  if ((+[MTLibraryMigrationUtil needsCoreDataMigration]( MTLibraryMigrationUtil,  "needsCoreDataMigration") & 1) != 0 || (+[MTLibraryMigrationUtil needsDataMigration]( MTLibraryMigrationUtil,  "needsDataMigration") & 1) != 0 || (+[MTLibraryMigrationUtil needsImageStoreMigration]( MTLibraryMigrationUtil,  "needsImageStoreMigration") & 1) != 0 || (+[MTDB isCorrupt](MTDB, "isCorrupt") & 1) != 0 || (+[MTDB needsSerpentIdEpisodeMigration](MTDB, "needsSerpentIdEpisodeMigration") & 1) != 0 || (+[MTDB needsCacheBustForFreeAndPaidUrlStorage]( MTDB,  "needsCacheBustForFreeAndPaidUrlStorage") & 1) != 0 || (+[MTDB needsMigrationToDeltaFeedUpdates](MTDB, "needsMigrationToDeltaFeedUpdates") & 1) != 0 || ([a1 globalDownloadPolicyRequiresMigration] & 1) != 0 || +[MTDataMigrator requiresMigration](MTDataMigrator, "requiresMigration")
    || ([a1 _needsImageStoreMigration] & 1) != 0)
  {
    return 1;
  }

  return [a1 _hasMTImageStoreContent];
}

+ (BOOL)_needsImageStoreMigration
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "_applePodcastsFoundationSharedUserDefaults"));
  char v3 = [v2 BOOLForKey:kMTImageProviderMigrationHasOccurred] ^ 1;

  return v3;
}

+ (void)fixupDataMigrationVersion
{
  if (!+[MTDB libraryDataVersion](&OBJC_CLASS___MTDB, "libraryDataVersion"))
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue( +[MTConstants managedObjectModelDefinitionURL]( &OBJC_CLASS___MTConstants,  "managedObjectModelDefinitionURL"));
    char v3 = (void *)objc_claimAutoreleasedReturnValue([v2 URLByAppendingPathComponent:@"/MTLibrary 19.mom"]);

    id v4 = -[NSManagedObjectModel initWithContentsOfURL:]( objc_alloc(&OBJC_CLASS___NSManagedObjectModel),  "initWithContentsOfURL:",  v3);
    id v5 = +[MTLibraryMigrationUtil isMomCompatible:](&OBJC_CLASS___MTLibraryMigrationUtil, "isMomCompatible:", v4);
    if ((_DWORD)v5)
    {
      uint64_t v6 = _MTLogCategoryDatabase(v5);
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[Migration] Setting library to data version 6 which matches database version 19",  v8,  2u);
      }

      +[MTDB setLibraryDataVersion:](&OBJC_CLASS___MTDB, "setLibraryDataVersion:", 6LL);
    }
  }

+ (BOOL)runCoreDataMigration
{
  uint64_t v4 = _MTLogCategoryDatabase(v3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v19) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[Migration] (CoreData) Acquired lock.",  (uint8_t *)&v19,  2u);
  }

  if (+[MTDB isCorrupt](&OBJC_CLASS___MTDB, "isCorrupt"))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1002B6BE8);
    uint64_t v7 = _MTLogCategoryDatabase(v6);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v19) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "[Migration] (CoreData) DB is corrupt, returning immediately.",  (uint8_t *)&v19,  2u);
    }

    LOBYTE(v9) = 0;
  }

  else if ((+[MTLibraryMigrationUtil needsCoreDataMigration]( &OBJC_CLASS___MTLibraryMigrationUtil,  "needsCoreDataMigration") & 1) != 0)
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB fetchManagedObjectModelFromDisk](&OBJC_CLASS___MTDB, "fetchManagedObjectModelFromDisk"));
    unsigned int v9 = +[MTLibraryMigrationUtil createPersistentStoreForModel:attemptMigration:]( &OBJC_CLASS___MTLibraryMigrationUtil,  "createPersistentStoreForModel:attemptMigration:",  v10,  1LL);

    if (v9)
    {
      uint64_t v12 = _MTLogCategoryDatabase(v11);
      int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = +[MTDB coreDataVersion](&OBJC_CLASS___MTDB, "coreDataVersion");
        int v19 = 134218240;
        id v20 = v14;
        __int16 v21 = 2048;
        uint64_t v22 = 142LL;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[Migration] (CoreData) Successfully migrated. Set migration version from %ld to %ld",  (uint8_t *)&v19,  0x16u);
      }

      [a1 touchCoreDataMigrationVersion];
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1002B6BE8);
  }

  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1002B6BE8);
    uint64_t v16 = _MTLogCategoryDatabase(v15);
    __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[Migration] (CoreData) DB does not need migration, returning immediately.",  (uint8_t *)&v19,  2u);
    }

    LOBYTE(v9) = 1;
  }

  return v9;
}

+ (id)legacyLibraryPath
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 URLsForDirectory:9 inDomains:1]);

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lastObject]);
  id v5 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v6 = (objc_class *)objc_opt_class(&OBJC_CLASS___MTLibrary);
  uint64_t v7 = NSStringFromClass(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  unsigned int v9 = -[NSString initWithFormat:](v5, "initWithFormat:", @"%@.sqlite", v8);

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v4 URLByAppendingPathComponent:v9]);
  return v10;
}

+ (BOOL)moveSQLiteFilesFromDocumentsToSharedContainer
{
  id v2 = [(id)objc_opt_class(a1) legacyLibraryPath];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB libraryPath](&OBJC_CLASS___MTDB, "libraryPath"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v36 = 0LL;
  unsigned int v6 = [v5 moveItemAtURL:v3 toURL:v4 error:&v36];
  id v7 = v36;

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](&OBJC_CLASS___IMLogger, "sharedLogger"));
    [v8 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/Migration/MTLibraryMigrator.m", 2729, @"Error moving database to %@ from %@", v4, v3 lineNumber format];

    [v7 logAndThrow:0 printStackTrace:0];
  }

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v3 absoluteString]);
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingString:@"-shm"]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v10));

  if (v6)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v11 path]);
    unsigned int v14 = [v12 fileExistsAtPath:v13];

    if (v14)
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v4 absoluteString]);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 stringByAppendingString:@"-shm"]);
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v16));

      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      id v35 = 0LL;
      [v18 moveItemAtURL:v11 toURL:v17 error:&v35];
      id v19 = v35;

      if (v19)
      {
        id v20 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](&OBJC_CLASS___IMLogger, "sharedLogger"));
        [v20 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/Migration/MTLibraryMigrator.m", 2742, @"Error moving database shm to %@ from %@", v17, v11 lineNumber format];

        [v19 logAndThrow:0 printStackTrace:0];
      }
    }
  }

  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v3 absoluteString]);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 stringByAppendingString:@"-wal"]);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v22));

  if (v6)
  {
    id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v23 path]);
    unsigned int v26 = [v24 fileExistsAtPath:v25];

    if (v26)
    {
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v4 absoluteString]);
      v28 = (void *)objc_claimAutoreleasedReturnValue([v27 stringByAppendingString:@"-wal"]);
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v28));

      __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      id v34 = 0LL;
      [v30 moveItemAtURL:v23 toURL:v29 error:&v34];
      id v31 = v34;

      if (v31)
      {
        __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](&OBJC_CLASS___IMLogger, "sharedLogger"));
        [v32 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/Migration/MTLibraryMigrator.m", 2756, @"Error moving database wal to %@ from %@", v31, v23 lineNumber format];

        [v31 logAndThrow:0 printStackTrace:0];
      }
    }
  }

  return v6;
}

+ (BOOL)runImageStoreMigration
{
  uint64_t v3 = _MTLogCategoryDatabase(a1);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[Migration] (ImageStore) Start image store migration.",  buf,  2u);
  }

  unsigned __int8 v5 = [a1 runImageStorePathMigration];
  id v6 = [a1 runImageFormatMigration];
  char v7 = (char)v6;
  uint64_t v8 = _MTLogCategoryDatabase(v6);
  unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[Migration] (ImageStore) Image store migration has been completed.",  v11,  2u);
  }

  return v5 | v7;
}

+ (BOOL)runImageStorePathMigration
{
  if (+[MTLibraryMigrationUtil needsImageStoreMigration]( &OBJC_CLASS___MTLibraryMigrationUtil,  "needsImageStoreMigration"))
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue( +[MTImageStoreConstants deprecatedImageStoreURL]( &OBJC_CLASS___MTImageStoreConstants,  "deprecatedImageStoreURL"));
    uint64_t v3 = objc_claimAutoreleasedReturnValue([v2 path]);

    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[MTImageStoreConstants defaultImageStoreURL]( &OBJC_CLASS___MTImageStoreConstants,  "defaultImageStoreURL"));
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 path]);

    id v6 = &OBJC_CLASS___DebugUtil_ptr;
    char v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v44 = (void *)v3;
    uint64_t v8 = v3;
    unsigned int v9 = (void *)v5;
    unsigned int v10 = [v7 fileExistsAtPath:v8];

    if (v10)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      unsigned __int8 v12 = [v11 fileExistsAtPath:v5];

      if ((v12 & 1) == 0)
      {
        int v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        id v52 = 0LL;
        unsigned __int8 v14 = [v13 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:&v52];
        id v15 = v52;

        if ((v14 & 1) == 0)
        {
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](&OBJC_CLASS___IMLogger, "sharedLogger"));
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v15 localizedDescription]);
          [v16 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/Migration/MTLibraryMigrator.m", 2792, @"Failed to create new image store at %@: %@", v9, v17 lineNumber format];
        }
      }

      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      id v51 = 0LL;
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 contentsOfDirectoryAtPath:v44 error:&v51]);
      id v20 = v51;

      if (v20)
      {
        __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](&OBJC_CLASS___IMLogger, "sharedLogger"));
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v20 localizedDescription]);
        [v21 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/Migration/MTLibraryMigrator.m", 2801, @"Error enumerating image cache directory for migration: %@", v22 lineNumber format];
      }

      v41 = v20;
      char v42 = v10;
      __int128 v49 = 0u;
      __int128 v50 = 0u;
      __int128 v47 = 0u;
      __int128 v48 = 0u;
      id obj = v19;
      id v23 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
      if (v23)
      {
        id v24 = v23;
        uint64_t v25 = *(void *)v48;
        do
        {
          for (i = 0LL; i != v24; i = (char *)i + 1)
          {
            if (*(void *)v48 != v25) {
              objc_enumerationMutation(obj);
            }
            uint64_t v27 = *(void *)(*((void *)&v47 + 1) + 8LL * (void)i);
            v28 = (void *)objc_claimAutoreleasedReturnValue([v44 stringByAppendingPathComponent:v27]);
            uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingPathComponent:v27]);
            __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v6[139] defaultManager]);
            id v46 = 0LL;
            [v30 moveItemAtPath:v28 toPath:v29 error:&v46];
            id v31 = v46;

            if (v31)
            {
              __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](&OBJC_CLASS___IMLogger, "sharedLogger"));
              __int128 v33 = v9;
              id v34 = v6;
              id v35 = (void *)objc_claimAutoreleasedReturnValue([v31 localizedDescription]);
              [v32 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/Migration/MTLibraryMigrator.m", 2813, @"Error moving image to new cache location: %@", v35 lineNumber format];

              id v6 = v34;
              unsigned int v9 = v33;
            }
          }

          id v24 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
        }

        while (v24);
      }

      id v36 = (void *)objc_claimAutoreleasedReturnValue([v6[139] defaultManager]);
      id v45 = 0LL;
      [v36 removeItemAtPath:v44 error:&v45];
      id v37 = v45;

      if (v37)
      {
        uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](&OBJC_CLASS___IMLogger, "sharedLogger"));
        v39 = (void *)objc_claimAutoreleasedReturnValue([v37 localizedDescription]);
        [v38 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/Migration/MTLibraryMigrator.m", 2822, @"Error deleting old image cache: %@", v39 lineNumber format];
      }

      LOBYTE(v10) = v42;
    }
  }

  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

+ (BOOL)runImageFormatMigration
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTImageStoreConstants fileType](&OBJC_CLASS___MTImageStoreConstants, "fileType"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[MTImageStoreConstants defaultImageStoreURL]( &OBJC_CLASS___MTImageStoreConstants,  "defaultImageStoreURL"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMImageStore defaultStore](&OBJC_CLASS___IMImageStore, "defaultStore"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 diskCache]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  NSURLResourceKey v21 = NSURLContentTypeKey;
  char v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
  id v20 = 0LL;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( [v6 contentsOfDirectoryAtURL:v3 includingPropertiesForKeys:v7 options:0 error:&v20]);
  id v9 = v20;

  if (v9)
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](&OBJC_CLASS___IMLogger, "sharedLogger"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedDescription]);
    [v10 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/Migration/MTLibraryMigrator.m", 2841, @"Error enumerating image cache directory for migration: %@", v11 lineNumber format];
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
  int v13 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10010F790;
  v17[3] = &unk_1002451A8;
  id v18 = v2;
  id v19 = v5;
  id v14 = v5;
  id v15 = v2;
  [v8 concurrentMapWithStrideSize:5 on:v13 withBlock:v17];

  +[MTLibraryMigrationUtil setLibraryImageStoreType:]( &OBJC_CLASS___MTLibraryMigrationUtil,  "setLibraryImageStoreType:",  v15);
  return 1;
}

+ (BOOL)globalDownloadPolicyRequiresMigration
{
  return objc_msgSend(a1, "hasBeenInactiveForTimeInterval:");
}

+ (BOOL)needsToComputeLastLaunch
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "_applePodcastsFoundationSharedUserDefaults"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 lastAppUseDate]);

  uint64_t v4 = _MTLogCategoryLifecycle();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    uint64_t v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Last application use: %@", (uint8_t *)&v7, 0xCu);
  }

  return v3 == 0LL;
}

+ (void)setLastLaunchFromDatabase
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "_applePodcastsFoundationSharedUserDefaults"));
  uint64_t v4 = _MTLogCategoryLifecycle();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  int v7 = v5;
  uint64_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  OS_SIGNPOST_INTERVAL_BEGIN,  v6,  "SourceLastLaunchFromDB",  "",  (uint8_t *)&v15,  2u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _mostRecentPlayTimeFromDatabase]);
  unsigned int v10 = v8;
  uint64_t v11 = v10;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v11,  OS_SIGNPOST_INTERVAL_END,  v6,  "SourceLastLaunchFromDB",  "",  (uint8_t *)&v15,  2u);
  }

  uint64_t v12 = _MTLogCategoryLifecycle();
  int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = v13;
  if (v9)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412290;
      uint64_t v16 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Setting new value for last use from database: %@",  (uint8_t *)&v15,  0xCu);
    }

    [v3 setLastAppUseDate:v9];
  }

  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Failed to update last launch from the database.",  (uint8_t *)&v15,  2u);
    }
  }
}

+ (id)_mostRecentPlayTimeFromDatabase
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 privateQueueContext]);

  uint64_t v12 = 0LL;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  int v15 = sub_10010D4A4;
  uint64_t v16 = sub_10010D4B4;
  id v17 = 0LL;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10010FD78;
  v8[3] = &unk_100240530;
  id v11 = a1;
  id v5 = v4;
  id v9 = v5;
  unsigned int v10 = &v12;
  [v5 performBlockAndWait:v8];
  id v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

+ (id)_fetchRequestForMostRecentlyPlayedEpisode
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  kMTEpisodeEntityName));
  [v2 setResultType:2];
  uint64_t v3 = objc_alloc(&OBJC_CLASS___NSSortDescriptor);
  uint64_t v4 = kEpisodeLastDatePlayed;
  id v5 = -[NSSortDescriptor initWithKey:ascending:](v3, "initWithKey:ascending:", kEpisodeLastDatePlayed, 0LL);
  id v11 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
  [v2 setSortDescriptors:v6];

  v10[0] = kObjectID;
  v10[1] = v4;
  int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 2LL));
  [v2 setPropertiesToFetch:v7];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K != NULL",  v4));
  [v2 setPredicate:v8];

  [v2 setFetchLimit:1];
  return v2;
}

+ (void)updateGlobalDownloadPolicyIfNecessary
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "_applePodcastsFoundationSharedUserDefaults"));
  [a1 inactiveIntervalForDownloadPolicyUpgrade];
}

+ (void)_updateGlobalPolicyLimitIfMoreRestrictiveInDefaults:(id)a3
{
  id v3 = a3;
  uint64_t v4 = kMTPodcastEpisodeLimitDefaultKey;
  id v8 = v3;
  id v5 = [v3 episodeLimitForKey:kMTPodcastEpisodeLimitDefaultKey];
  uint64_t v6 = PFMostRestrictiveLimit( +[MTPreferences defaultEpisodeLimit](&OBJC_CLASS___MTPreferences, "defaultEpisodeLimit"),  v5);
  if ((id)v6 != v5)
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v6));
    [v8 setObject:v7 forKey:v4];
  }
}

+ (BOOL)hasBeenInactiveForTimeInterval:(double)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "_applePodcastsFoundationSharedUserDefaults"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lastAppUseDate]);
  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    [v6 timeIntervalSinceDate:v5];
    double v8 = v7;

    BOOL v9 = v8 > a3;
  }

  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

+ (double)inactiveIntervalForDownloadPolicyUpgrade
{
  return 63072000.0;
}

@end