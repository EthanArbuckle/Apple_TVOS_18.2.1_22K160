@interface TVHSearchResultsDataSource
+ (TVHSearchResultsDataSource)new;
+ (void)_addDisplayableItem:(id)a3 toArray:(id)a4;
- (NSArray)indexTitles;
- (NSArray)items;
- (NSOrderedSet)sectionIdentifiers;
- (TVHDiffableDataSourceContentProviderDelegate)diffableDataSourceContentProviderDelegate;
- (TVHSearchResultsDataSource)init;
- (TVHSearchResultsDataSource)initWithShelfViewControllerBlock:(id)a3;
- (TVHSearchResultsDataSourceItem)audiobookChaptersItem;
- (TVHSearchResultsDataSourceItem)audiobooksItem;
- (TVHSearchResultsDataSourceItem)homeVideosItem;
- (TVHSearchResultsDataSourceItem)iTunesUCoursesItem;
- (TVHSearchResultsDataSourceItem)iTunesUEpisodesItem;
- (TVHSearchResultsDataSourceItem)movieRentalsItem;
- (TVHSearchResultsDataSourceItem)moviesItem;
- (TVHSearchResultsDataSourceItem)musicAlbumArtistsItem;
- (TVHSearchResultsDataSourceItem)musicAlbumsItem;
- (TVHSearchResultsDataSourceItem)musicSongsItem;
- (TVHSearchResultsDataSourceItem)musicVideosItem;
- (TVHSearchResultsDataSourceItem)podcastEpisodesItem;
- (TVHSearchResultsDataSourceItem)podcastsItem;
- (TVHSearchResultsDataSourceItem)showEpisodesItem;
- (TVHSearchResultsDataSourceItem)showsItem;
- (id)_displayableItems;
- (id)_itemForIndexPath:(id)a3;
- (id)indexPathForIndexTitle:(id)a3 atIndex:(int64_t)a4;
- (id)itemIdentifierForIndexPath:(id)a3;
- (id)itemIdentifiersInSectionWithIdentifier:(id)a3;
- (id)mediaEntitiesShelfViewControllerAtIndexPath:(id)a3;
- (id)mediaEntitiesShelfViewControllerForItemIdentifier:(id)a3;
- (id)sectionTitleAIndex:(unint64_t)a3;
- (id)shelfViewControllerBlock;
- (void)_enumerateItemsWithSearchControllerResult:(id)a3 block:(id)a4;
- (void)_notfiyDiffableDataSourceContentProviderDelegateMediaEntitiesDidChangeWithAnimateChanges:(BOOL)a3 itemIdentifiersOfAmendedItems:(id)a4;
- (void)_updateDataSource:(id)a3 withMediaEntities:(id)a4 andChangeSet:(id)a5;
- (void)mediaEntitiesDataSource:(id)a3 mediaEntitiesDidChange:(id)a4;
- (void)setAudiobookChaptersItem:(id)a3;
- (void)setAudiobooksItem:(id)a3;
- (void)setDiffableDataSourceContentProviderDelegate:(id)a3;
- (void)setHomeVideosItem:(id)a3;
- (void)setITunesUCoursesItem:(id)a3;
- (void)setITunesUEpisodesItem:(id)a3;
- (void)setItems:(id)a3;
- (void)setMovieRentalsItem:(id)a3;
- (void)setMoviesItem:(id)a3;
- (void)setMusicAlbumArtistsItem:(id)a3;
- (void)setMusicAlbumsItem:(id)a3;
- (void)setMusicSongsItem:(id)a3;
- (void)setMusicVideosItem:(id)a3;
- (void)setPodcastEpisodesItem:(id)a3;
- (void)setPodcastsItem:(id)a3;
- (void)setShowEpisodesItem:(id)a3;
- (void)setShowsItem:(id)a3;
- (void)updateWithSearchControllerResult:(id)a3;
@end

@implementation TVHSearchResultsDataSource

+ (TVHSearchResultsDataSource)new
{
  return 0LL;
}

- (TVHSearchResultsDataSource)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHSearchResultsDataSource)initWithShelfViewControllerBlock:(id)a3
{
  id v4 = a3;
  v128.receiver = self;
  v128.super_class = (Class)&OBJC_CLASS___TVHSearchResultsDataSource;
  v5 = -[TVHSearchResultsDataSource init](&v128, "init");
  if (v5)
  {
    id v6 = [v4 copy];
    id shelfViewControllerBlock = v5->_shelfViewControllerBlock;
    v5->_id shelfViewControllerBlock = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v126 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedStringForKey:@"AUDIOBOOKS_TITLE" value:0 table:0]);

    v9 = objc_alloc(&OBJC_CLASS___TVHSearchResultsDataSourceItem);
    id v127 = v4;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType audiobook](&OBJC_CLASS___TVHKMediaEntityType, "audiobook"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v10));
    v12 = -[TVHSearchResultsDataSourceItem initWithIdentifier:title:mediaEntityTypes:]( v9,  "initWithIdentifier:title:mediaEntityTypes:",  @"Audiobooks",  v126,  v11);
    audiobooksItem = v5->_audiobooksItem;
    v5->_audiobooksItem = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v125 = (void *)objc_claimAutoreleasedReturnValue( [v14 localizedStringForKey:@"AUDIOBOOK_CHAPTERS_TITLE" value:0 table:0]);

    v15 = objc_alloc(&OBJC_CLASS___TVHSearchResultsDataSourceItem);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType audiobookChapter](&OBJC_CLASS___TVHKMediaEntityType, "audiobookChapter"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v16));
    v18 = -[TVHSearchResultsDataSourceItem initWithIdentifier:title:mediaEntityTypes:]( v15,  "initWithIdentifier:title:mediaEntityTypes:",  @"AudiobookChapters",  v125,  v17);
    audiobookChaptersItem = v5->_audiobookChaptersItem;
    v5->_audiobookChaptersItem = v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v124 = (void *)objc_claimAutoreleasedReturnValue([v20 localizedStringForKey:@"HOME_VIDEOS_TITLE" value:0 table:0]);

    v21 = objc_alloc(&OBJC_CLASS___TVHSearchResultsDataSourceItem);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType homeVideo](&OBJC_CLASS___TVHKMediaEntityType, "homeVideo"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v22));
    v24 = -[TVHSearchResultsDataSourceItem initWithIdentifier:title:mediaEntityTypes:]( v21,  "initWithIdentifier:title:mediaEntityTypes:",  @"HomeVideos",  v124,  v23);
    homeVideosItem = v5->_homeVideosItem;
    v5->_homeVideosItem = v24;

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v123 = (void *)objc_claimAutoreleasedReturnValue([v26 localizedStringForKey:@"ITUNES_U_EPISODES_TITLE" value:0 table:0]);

    v27 = objc_alloc(&OBJC_CLASS___TVHSearchResultsDataSourceItem);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType iTunesUAudioEpisode](&OBJC_CLASS___TVHKMediaEntityType, "iTunesUAudioEpisode"));
    v131[0] = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType iTunesUVideoEpisode](&OBJC_CLASS___TVHKMediaEntityType, "iTunesUVideoEpisode"));
    v131[1] = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v131, 2LL));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v30));
    v32 = -[TVHSearchResultsDataSourceItem initWithIdentifier:title:mediaEntityTypes:]( v27,  "initWithIdentifier:title:mediaEntityTypes:",  @"iTunesUEpisodes",  v123,  v31);
    iTunesUEpisodesItem = v5->_iTunesUEpisodesItem;
    v5->_iTunesUEpisodesItem = v32;

    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v122 = (void *)objc_claimAutoreleasedReturnValue([v34 localizedStringForKey:@"ITUNES_U_TITLE" value:0 table:0]);

    v35 = objc_alloc(&OBJC_CLASS___TVHSearchResultsDataSourceItem);
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType iTunesUCourse](&OBJC_CLASS___TVHKMediaEntityType, "iTunesUCourse"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v36));
    v38 = -[TVHSearchResultsDataSourceItem initWithIdentifier:title:mediaEntityTypes:]( v35,  "initWithIdentifier:title:mediaEntityTypes:",  @"iTunesUCourses",  v122,  v37);
    iTunesUCoursesItem = v5->_iTunesUCoursesItem;
    v5->_iTunesUCoursesItem = v38;

    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v121 = (void *)objc_claimAutoreleasedReturnValue([v40 localizedStringForKey:@"MOVIE_RENTALS_TITLE" value:0 table:0]);

    v41 = objc_alloc(&OBJC_CLASS___TVHSearchResultsDataSourceItem);
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType movieRental](&OBJC_CLASS___TVHKMediaEntityType, "movieRental"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v42));
    v44 = -[TVHSearchResultsDataSourceItem initWithIdentifier:title:mediaEntityTypes:]( v41,  "initWithIdentifier:title:mediaEntityTypes:",  @"MovieRentals",  v121,  v43);
    movieRentalsItem = v5->_movieRentalsItem;
    v5->_movieRentalsItem = v44;

    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v120 = (void *)objc_claimAutoreleasedReturnValue([v46 localizedStringForKey:@"MOVIES_TITLE" value:0 table:0]);

    v47 = objc_alloc(&OBJC_CLASS___TVHSearchResultsDataSourceItem);
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType movie](&OBJC_CLASS___TVHKMediaEntityType, "movie"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v48));
    v50 = -[TVHSearchResultsDataSourceItem initWithIdentifier:title:mediaEntityTypes:]( v47,  "initWithIdentifier:title:mediaEntityTypes:",  @"Movies",  v120,  v49);
    moviesItem = v5->_moviesItem;
    v5->_moviesItem = v50;

    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v119 = (void *)objc_claimAutoreleasedReturnValue([v52 localizedStringForKey:@"MUSIC_ALBUMS_TITLE" value:0 table:0]);

    v53 = objc_alloc(&OBJC_CLASS___TVHSearchResultsDataSourceItem);
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType musicAlbum](&OBJC_CLASS___TVHKMediaEntityType, "musicAlbum"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v54));
    v56 = -[TVHSearchResultsDataSourceItem initWithIdentifier:title:mediaEntityTypes:]( v53,  "initWithIdentifier:title:mediaEntityTypes:",  @"MusicAlbums",  v119,  v55);
    musicAlbumsItem = v5->_musicAlbumsItem;
    v5->_musicAlbumsItem = v56;

    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v118 = (void *)objc_claimAutoreleasedReturnValue([v58 localizedStringForKey:@"ARTISTS_TITLE" value:0 table:0]);

    v59 = objc_alloc(&OBJC_CLASS___TVHSearchResultsDataSourceItem);
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType musicAlbumArtist](&OBJC_CLASS___TVHKMediaEntityType, "musicAlbumArtist"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v60));
    v62 = -[TVHSearchResultsDataSourceItem initWithIdentifier:title:mediaEntityTypes:]( v59,  "initWithIdentifier:title:mediaEntityTypes:",  @"MusicAlbumArtists",  v118,  v61);
    musicAlbumArtistsItem = v5->_musicAlbumArtistsItem;
    v5->_musicAlbumArtistsItem = v62;

    v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v117 = (void *)objc_claimAutoreleasedReturnValue([v64 localizedStringForKey:@"SONGS_TITLE" value:0 table:0]);

    v65 = objc_alloc(&OBJC_CLASS___TVHSearchResultsDataSourceItem);
    v66 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType musicSong](&OBJC_CLASS___TVHKMediaEntityType, "musicSong"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v66));
    v68 = -[TVHSearchResultsDataSourceItem initWithIdentifier:title:mediaEntityTypes:]( v65,  "initWithIdentifier:title:mediaEntityTypes:",  @"MusicSongs",  v117,  v67);
    musicSongsItem = v5->_musicSongsItem;
    v5->_musicSongsItem = v68;

    v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v116 = (void *)objc_claimAutoreleasedReturnValue([v70 localizedStringForKey:@"MUSIC_VIDEOS_TITLE" value:0 table:0]);

    v71 = objc_alloc(&OBJC_CLASS___TVHSearchResultsDataSourceItem);
    v72 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType musicVideo](&OBJC_CLASS___TVHKMediaEntityType, "musicVideo"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v72));
    v74 = -[TVHSearchResultsDataSourceItem initWithIdentifier:title:mediaEntityTypes:]( v71,  "initWithIdentifier:title:mediaEntityTypes:",  @"MusicVideos",  v116,  v73);
    musicVideosItem = v5->_musicVideosItem;
    v5->_musicVideosItem = v74;

    v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v115 = (void *)objc_claimAutoreleasedReturnValue([v76 localizedStringForKey:@"PODCASTS_TITLE" value:0 table:0]);

    v77 = objc_alloc(&OBJC_CLASS___TVHSearchResultsDataSourceItem);
    v78 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType podcast](&OBJC_CLASS___TVHKMediaEntityType, "podcast"));
    v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v78));
    v80 = -[TVHSearchResultsDataSourceItem initWithIdentifier:title:mediaEntityTypes:]( v77,  "initWithIdentifier:title:mediaEntityTypes:",  @"Podcasts",  v115,  v79);
    podcastsItem = v5->_podcastsItem;
    v5->_podcastsItem = v80;

    v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v83 = (void *)objc_claimAutoreleasedReturnValue([v82 localizedStringForKey:@"PODCAST_EPISODES_TITLE" value:0 table:0]);

    v84 = objc_alloc(&OBJC_CLASS___TVHSearchResultsDataSourceItem);
    v85 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType podcastAudioEpisode](&OBJC_CLASS___TVHKMediaEntityType, "podcastAudioEpisode"));
    v130[0] = v85;
    v86 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType podcastVideoEpisode](&OBJC_CLASS___TVHKMediaEntityType, "podcastVideoEpisode"));
    v130[1] = v86;
    v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v130, 2LL));
    v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v87));
    v89 = -[TVHSearchResultsDataSourceItem initWithIdentifier:title:mediaEntityTypes:]( v84,  "initWithIdentifier:title:mediaEntityTypes:",  @"PodcastEpisodes",  v83,  v88);
    podcastEpisodesItem = v5->_podcastEpisodesItem;
    v5->_podcastEpisodesItem = v89;

    v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v92 = (void *)objc_claimAutoreleasedReturnValue([v91 localizedStringForKey:@"SHOWS_TITLE" value:0 table:0]);

    v93 = objc_alloc(&OBJC_CLASS___TVHSearchResultsDataSourceItem);
    v94 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType show](&OBJC_CLASS___TVHKMediaEntityType, "show"));
    v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v94));
    v96 = -[TVHSearchResultsDataSourceItem initWithIdentifier:title:mediaEntityTypes:]( v93,  "initWithIdentifier:title:mediaEntityTypes:",  @"Shows",  v92,  v95);
    showsItem = v5->_showsItem;
    v5->_showsItem = v96;

    v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v99 = (void *)objc_claimAutoreleasedReturnValue([v98 localizedStringForKey:@"TV_EPISODES_TITLE" value:0 table:0]);

    v100 = objc_alloc(&OBJC_CLASS___TVHSearchResultsDataSourceItem);
    v101 = (void *)objc_claimAutoreleasedReturnValue(+[TVHKMediaEntityType showEpisode](&OBJC_CLASS___TVHKMediaEntityType, "showEpisode"));
    v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v101));
    v103 = v100;
    id v4 = v127;
    v104 = -[TVHSearchResultsDataSourceItem initWithIdentifier:title:mediaEntityTypes:]( v103,  "initWithIdentifier:title:mediaEntityTypes:",  @"ShowEpisodes",  v99,  v102);
    showEpisodesItem = v5->_showEpisodesItem;
    v5->_showEpisodesItem = v104;

    v106 = v5->_moviesItem;
    v129[0] = v5->_movieRentalsItem;
    v129[1] = v106;
    v107 = v5->_showsItem;
    v129[2] = v5->_showEpisodesItem;
    v129[3] = v107;
    v108 = v5->_musicAlbumArtistsItem;
    v129[4] = v5->_musicAlbumsItem;
    v129[5] = v108;
    v109 = v5->_musicVideosItem;
    v129[6] = v5->_musicSongsItem;
    v129[7] = v109;
    v110 = v5->_podcastEpisodesItem;
    v111 = v5->_podcastsItem;
    v129[8] = v5->_homeVideosItem;
    v129[9] = v110;
    v129[10] = v111;
    v129[11] = v5->_iTunesUEpisodesItem;
    v129[12] = v5->_iTunesUCoursesItem;
    v129[13] = v5->_audiobookChaptersItem;
    v129[14] = v5->_audiobooksItem;
    uint64_t v112 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v129, 15LL));
    items = v5->_items;
    v5->_items = (NSArray *)v112;
  }

  return v5;
}

- (void)updateWithSearchControllerResult:(id)a3
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100070FD8;
  v8[3] = &unk_1000FEF18;
  v8[4] = self;
  id v4 = a3;
  -[TVHSearchResultsDataSource _enumerateItemsWithSearchControllerResult:block:]( self,  "_enumerateItemsWithSearchControllerResult:block:",  v4,  v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 responseChanges]);

  BOOL v6 = v5 != 0LL;
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVHSearchResultsDataSource diffableDataSourceContentProviderDelegate]( self,  "diffableDataSourceContentProviderDelegate"));
  [v7 diffableDataSourceContentProvider:self contentDidChangeWithAnimateChanges:v6 itemIdentifiersOfAmendedItems:0];
}

- (id)mediaEntitiesShelfViewControllerForItemIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchResultsDataSource items](self, "items"));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    v8 = 0LL;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
        unsigned int v13 = [v12 isEqual:v4];

        if (v13)
        {
          uint64_t v14 = objc_claimAutoreleasedReturnValue([v11 shelfViewController]);

          v8 = (void *)v14;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v7);
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

- (id)mediaEntitiesShelfViewControllerAtIndexPath:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchResultsDataSource _itemForIndexPath:](self, "_itemForIndexPath:", a3));
  v5 = v4;
  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 shelfViewController]);
    if (!v6)
    {
      id v7 = (uint64_t (**)(void, void, void, void))objc_claimAutoreleasedReturnValue( -[TVHSearchResultsDataSource shelfViewControllerBlock]( self,  "shelfViewControllerBlock"));
      v8 = (void *)objc_claimAutoreleasedReturnValue([v5 dataSource]);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 title]);
      v10 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaEntityTypes]);
      uint64_t v11 = ((uint64_t (**)(void, void *, void *, void *))v7)[2](v7, v8, v9, v10);
      id v6 = (void *)objc_claimAutoreleasedReturnValue(v11);

      [v5 setShelfViewController:v6];
    }
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (void)mediaEntitiesDataSource:(id)a3 mediaEntitiesDidChange:(id)a4
{
}

- (NSOrderedSet)sectionIdentifiers
{
  return +[NSOrderedSet orderedSetWithObject:]( &OBJC_CLASS___NSOrderedSet,  "orderedSetWithObject:",  @"SearchResultsSection");
}

- (id)sectionTitleAIndex:(unint64_t)a3
{
  return 0LL;
}

- (id)itemIdentifiersInSectionWithIdentifier:(id)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchResultsDataSource _displayableItems](self, "_displayableItems", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v12 + 1) + 8 * (void)v9) identifier]);
        -[NSMutableOrderedSet addObject:](v4, "addObject:", v10);

        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }

  return v4;
}

- (id)itemIdentifierForIndexPath:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchResultsDataSource _itemForIndexPath:](self, "_itemForIndexPath:", a3));
  id v4 = v3;
  if (v3) {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  }
  else {
    v5 = 0LL;
  }

  return v5;
}

- (NSArray)indexTitles
{
  return (NSArray *)&__NSArray0__struct;
}

- (id)indexPathForIndexTitle:(id)a3 atIndex:(int64_t)a4
{
  return 0LL;
}

- (void)_enumerateItemsWithSearchControllerResult:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void *, void *))a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 response]);
  v20 = v6;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 responseChanges]);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[TVHSearchResultsDataSource items](self, "items"));
  id v10 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      __int128 v13 = 0LL;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(obj);
        }
        __int128 v14 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)v13);
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
        if ([v15 isEqualToString:@"Audiobooks"])
        {
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v8 audiobooks]);
          uint64_t v17 = objc_claimAutoreleasedReturnValue([v9 audiobooksChangeSet]);
LABEL_36:
          __int128 v18 = (void *)v17;
          goto LABEL_37;
        }

        if ([v15 isEqualToString:@"AudiobookChapters"])
        {
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v8 audiobookChapters]);
          uint64_t v17 = objc_claimAutoreleasedReturnValue([v9 audiobookChaptersChangeSet]);
          goto LABEL_36;
        }

        if ([v15 isEqualToString:@"HomeVideos"])
        {
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v8 homeVideos]);
          uint64_t v17 = objc_claimAutoreleasedReturnValue([v9 homeVideosChangeSet]);
          goto LABEL_36;
        }

        if ([v15 isEqualToString:@"iTunesUEpisodes"])
        {
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v8 iTunesUEpisodes]);
          uint64_t v17 = objc_claimAutoreleasedReturnValue([v9 iTunesUEpisodesChangeSet]);
          goto LABEL_36;
        }

        if ([v15 isEqualToString:@"iTunesUCourses"])
        {
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v8 iTunesUCourses]);
          uint64_t v17 = objc_claimAutoreleasedReturnValue([v9 iTunesUCoursesChangeSet]);
          goto LABEL_36;
        }

        if ([v15 isEqualToString:@"MovieRentals"])
        {
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v8 movieRentals]);
          uint64_t v17 = objc_claimAutoreleasedReturnValue([v9 movieRentalsChangeSet]);
          goto LABEL_36;
        }

        if ([v15 isEqualToString:@"Movies"])
        {
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v8 movies]);
          uint64_t v17 = objc_claimAutoreleasedReturnValue([v9 moviesChangeSet]);
          goto LABEL_36;
        }

        if ([v15 isEqualToString:@"MusicAlbums"])
        {
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v8 musicAlbums]);
          uint64_t v17 = objc_claimAutoreleasedReturnValue([v9 musicAlbumsChangeSet]);
          goto LABEL_36;
        }

        if ([v15 isEqualToString:@"MusicAlbumArtists"])
        {
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v8 musicAlbumArtists]);
          uint64_t v17 = objc_claimAutoreleasedReturnValue([v9 musicAlbumArtistsChangeSet]);
          goto LABEL_36;
        }

        if ([v15 isEqualToString:@"MusicSongs"])
        {
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v8 musicSongs]);
          uint64_t v17 = objc_claimAutoreleasedReturnValue([v9 musicSongsChangeSet]);
          goto LABEL_36;
        }

        if ([v15 isEqualToString:@"MusicVideos"])
        {
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v8 musicVideos]);
          uint64_t v17 = objc_claimAutoreleasedReturnValue([v9 musicVideosChangeSet]);
          goto LABEL_36;
        }

        if ([v15 isEqualToString:@"PodcastEpisodes"])
        {
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v8 podcastEpisodes]);
          uint64_t v17 = objc_claimAutoreleasedReturnValue([v9 podcastEpisodesChangeSet]);
          goto LABEL_36;
        }

        if ([v15 isEqualToString:@"Podcasts"])
        {
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v8 podcasts]);
          uint64_t v17 = objc_claimAutoreleasedReturnValue([v9 podcastsChangeSet]);
          goto LABEL_36;
        }

        if ([v15 isEqualToString:@"ShowEpisodes"])
        {
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v8 showEpisodes]);
          uint64_t v17 = objc_claimAutoreleasedReturnValue([v9 showEpisodesChangeSet]);
          goto LABEL_36;
        }

        if ([v15 isEqualToString:@"Shows"])
        {
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v8 shows]);
          uint64_t v17 = objc_claimAutoreleasedReturnValue([v9 showsChangeSet]);
          goto LABEL_36;
        }

        __int128 v18 = 0LL;
        __int128 v16 = 0LL;
LABEL_37:
        v7[2](v7, v14, v16, v18);

        __int128 v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v19 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      id v11 = v19;
    }

    while (v19);
  }
}

- (id)_displayableItems
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchResultsDataSource items](self, "items", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        [(id)objc_opt_class(self) _addDisplayableItem:*(void *)(*((void *)&v11 + 1) + 8 * (void)v8) toArray:v3];
        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

  id v9 = -[NSMutableArray copy](v3, "copy");
  return v9;
}

- (void)_notfiyDiffableDataSourceContentProviderDelegateMediaEntitiesDidChangeWithAnimateChanges:(BOOL)a3 itemIdentifiersOfAmendedItems:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue( -[TVHSearchResultsDataSource diffableDataSourceContentProviderDelegate]( self,  "diffableDataSourceContentProviderDelegate"));
  [v7 diffableDataSourceContentProvider:self contentDidChangeWithAnimateChanges:v4 itemIdentifiersOfAmendedItems:v6];
}

- (id)_itemForIndexPath:(id)a3
{
  id v4 = a3;
  if ([v4 section])
  {
    id v5 = 0LL;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchResultsDataSource _displayableItems](self, "_displayableItems"));
    id v7 = [v4 item];
    if (v7 >= [v6 count]) {
      id v5 = 0LL;
    }
    else {
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndex:v7]);
    }
  }

  return v5;
}

- (void)_updateDataSource:(id)a3 withMediaEntities:(id)a4 andChangeSet:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 itemCollectionDescriptors]);
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 fetchResultIdentifier]);

  __int128 v13 = -[TVHMediaEntitiesDataSourceFetchResult initWithIdentifier:mediaEntities:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSourceFetchResult),  "initWithIdentifier:mediaEntities:",  v12,  v8);
  -[TVHMediaEntitiesDataSourceFetchResult setChangeSet:](v13, "setChangeSet:", v7);

  __int128 v15 = v13;
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
  [v9 updateWithMediaEntitiesDataSourceFetchResults:v14];
}

+ (void)_addDisplayableItem:(id)a3 toArray:(id)a4
{
  id v6 = a3;
  id v5 = a4;
}

- (TVHDiffableDataSourceContentProviderDelegate)diffableDataSourceContentProviderDelegate
{
  return (TVHDiffableDataSourceContentProviderDelegate *)objc_loadWeakRetained((id *)&self->_diffableDataSourceContentProviderDelegate);
}

- (void)setDiffableDataSourceContentProviderDelegate:(id)a3
{
}

- (id)shelfViewControllerBlock
{
  return self->_shelfViewControllerBlock;
}

- (TVHSearchResultsDataSourceItem)audiobooksItem
{
  return self->_audiobooksItem;
}

- (void)setAudiobooksItem:(id)a3
{
}

- (TVHSearchResultsDataSourceItem)audiobookChaptersItem
{
  return self->_audiobookChaptersItem;
}

- (void)setAudiobookChaptersItem:(id)a3
{
}

- (TVHSearchResultsDataSourceItem)homeVideosItem
{
  return self->_homeVideosItem;
}

- (void)setHomeVideosItem:(id)a3
{
}

- (TVHSearchResultsDataSourceItem)iTunesUEpisodesItem
{
  return self->_iTunesUEpisodesItem;
}

- (void)setITunesUEpisodesItem:(id)a3
{
}

- (TVHSearchResultsDataSourceItem)iTunesUCoursesItem
{
  return self->_iTunesUCoursesItem;
}

- (void)setITunesUCoursesItem:(id)a3
{
}

- (TVHSearchResultsDataSourceItem)movieRentalsItem
{
  return self->_movieRentalsItem;
}

- (void)setMovieRentalsItem:(id)a3
{
}

- (TVHSearchResultsDataSourceItem)moviesItem
{
  return self->_moviesItem;
}

- (void)setMoviesItem:(id)a3
{
}

- (TVHSearchResultsDataSourceItem)musicAlbumsItem
{
  return self->_musicAlbumsItem;
}

- (void)setMusicAlbumsItem:(id)a3
{
}

- (TVHSearchResultsDataSourceItem)musicAlbumArtistsItem
{
  return self->_musicAlbumArtistsItem;
}

- (void)setMusicAlbumArtistsItem:(id)a3
{
}

- (TVHSearchResultsDataSourceItem)musicSongsItem
{
  return self->_musicSongsItem;
}

- (void)setMusicSongsItem:(id)a3
{
}

- (TVHSearchResultsDataSourceItem)musicVideosItem
{
  return self->_musicVideosItem;
}

- (void)setMusicVideosItem:(id)a3
{
}

- (TVHSearchResultsDataSourceItem)podcastEpisodesItem
{
  return self->_podcastEpisodesItem;
}

- (void)setPodcastEpisodesItem:(id)a3
{
}

- (TVHSearchResultsDataSourceItem)podcastsItem
{
  return self->_podcastsItem;
}

- (void)setPodcastsItem:(id)a3
{
}

- (TVHSearchResultsDataSourceItem)showEpisodesItem
{
  return self->_showEpisodesItem;
}

- (void)setShowEpisodesItem:(id)a3
{
}

- (TVHSearchResultsDataSourceItem)showsItem
{
  return self->_showsItem;
}

- (void)setShowsItem:(id)a3
{
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (void).cxx_destruct
{
}

@end