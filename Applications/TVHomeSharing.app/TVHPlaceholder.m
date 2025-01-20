@interface TVHPlaceholder
+ (NSCache)placeholderCache;
+ (NSDictionary)placeholderDescriptionMap;
+ (NSDictionary)symbolConfigurationMap;
+ (id)_audiobookPlaceholderDescription;
+ (id)_contributorPlaceholderDescription;
+ (id)_geniusPlaylistPlaceholderDescription;
+ (id)_homeVideoPlaceholderDescription;
+ (id)_iTunesUPlaceholderDescription;
+ (id)_moviePlaceholderDescription;
+ (id)_musicAlbumArtistPlaceholderDescription;
+ (id)_musicAlbumPlaceholderDescription;
+ (id)_musicSongPlaceholderDescription;
+ (id)_musicVideoPlaceholderDescription;
+ (id)_photoPlaceholderDescription;
+ (id)_placeholderTypeDescription:(int64_t)a3;
+ (id)_playlistFolderPlaceholderDescription;
+ (id)_playlistPlaceholderDescription;
+ (id)_podcastPlaceholderDescription;
+ (id)_showEpisodePlaceholderDescription;
+ (id)_showPlaceholderDescription;
+ (id)_smartPlaylistPlaceholderDescription;
+ (id)_symbolConfigurationForPlaceholderType:(int64_t)a3 placeholderDescription:(id)a4 size:(CGSize)a5;
+ (id)_symbolConfiguration_148x222;
+ (id)_symbolConfiguration_273x273;
+ (id)_symbolConfiguration_350x350;
+ (id)_symbolConfiguration_400x600;
+ (id)_symbolConfiguration_550x309;
+ (id)_symbolConfiguration_622x350;
+ (id)_symbolConfiguration_640x640;
+ (id)_symbolConfiguration_666x666;
+ (id)placeholderForMediaEntity:(id)a3 containerSize:(CGSize)a4;
+ (id)placeholderForType:(int64_t)a3 containerSize:(CGSize)a4;
+ (int64_t)_audiobookPlaceholderTypeForMediaEntity:(id)a3;
+ (int64_t)_iTunesUPlaceholderTypeForMediaEntity:(id)a3;
+ (int64_t)_musicPlaceholderTypeForMediaEntity:(id)a3;
+ (int64_t)_photosPlaceholderTypeForMediaEntity:(id)a3;
+ (int64_t)_playlistPlaceholderTypeForPlaylist:(id)a3;
+ (int64_t)_podcastsPlaceholderTypeForMediaEntity:(id)a3;
+ (int64_t)_showsPlaceholderTypeForMediaEntity:(id)a3;
- (TVHPlaceholder)initWithType:(int64_t)a3 image:(id)a4;
- (UIColor)tintColor;
- (UIImage)image;
- (int64_t)type;
- (void)setTintColor:(id)a3;
@end

@implementation TVHPlaceholder

- (TVHPlaceholder)initWithType:(int64_t)a3 image:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVHPlaceholder;
  v8 = -[TVHPlaceholder init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_image, a4);
  }

  return v9;
}

+ (id)placeholderForType:(int64_t)a3 containerSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](&OBJC_CLASS___NSValue, "valueWithCGSize:"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 placeholderCache]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  objc_super v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v10]);

  if (v11)
  {
    v12 = (TVHPlaceholder *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v11, "objectForKey:", v8));
    if (v12) {
      goto LABEL_12;
    }
  }

  else
  {
    objc_super v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
    [v9 setObject:v11 forKey:v13];
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([a1 placeholderDescriptionMap]);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v15]);

  v17 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "_symbolConfigurationForPlaceholderType:placeholderDescription:size:",  a3,  v16,  width,  height));
  id v18 = sub_10007A1C8();
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = [(id)objc_opt_class(a1) _placeholderTypeDescription:a3];
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue([v16 symbolName]);
    int v29 = 138413314;
    v30 = v21;
    __int16 v31 = 2048;
    double v32 = width;
    __int16 v33 = 2048;
    double v34 = height;
    __int16 v35 = 2112;
    v36 = v22;
    __int16 v37 = 2112;
    v38 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Creating placeholder for %@@%.1fx%.1f. Symbol=%@, Config=%@",  (uint8_t *)&v29,  0x34u);
  }

  if (v17
    && ([v17 pointSize],
        v24 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:]( UIImageSymbolConfiguration,  "configurationWithPointSize:weight:scale:",  [v17 weight],  objc_msgSend(v17, "scale"),  v23)),  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "symbolName")),  v26 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage _systemImageNamed:withConfiguration:]( UIImage,  "_systemImageNamed:withConfiguration:",  v25,  v24)),  v25,  v24,  v26))
  {
    v12 = -[TVHPlaceholder initWithType:image:]( objc_alloc(&OBJC_CLASS___TVHPlaceholder),  "initWithType:image:",  a3,  v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue([v16 tintColor]);
    -[TVHPlaceholder setTintColor:](v12, "setTintColor:", v27);

    -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v12, v8);
  }

  else
  {
    v12 = 0LL;
  }

LABEL_12:
  return v12;
}

+ (id)placeholderForMediaEntity:(id)a3 containerSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 type]);
  switch((unint64_t)[v8 mediaCategoryType])
  {
    case 0uLL:
      uint64_t v10 = objc_opt_class(&OBJC_CLASS___TVHKMediaEntityCollection);
      if ((objc_opt_isKindOfClass(v7, v10) & 1) == 0) {
        goto LABEL_6;
      }
      objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v7 type]);
      id v12 = [v11 mediaEntityCollectionType];

      if (v12 != (id)5) {
        goto LABEL_6;
      }
      id v13 = [a1 _playlistPlaceholderTypeForPlaylist:v7];
      goto LABEL_14;
    case 1uLL:
      id v13 = [a1 _musicPlaceholderTypeForMediaEntity:v7];
      goto LABEL_14;
    case 2uLL:
    case 3uLL:
      uint64_t v9 = 3LL;
      break;
    case 4uLL:
      id v13 = [a1 _showsPlaceholderTypeForMediaEntity:v7];
      goto LABEL_14;
    case 5uLL:
      uint64_t v9 = 2LL;
      break;
    case 6uLL:
      id v13 = [a1 _podcastsPlaceholderTypeForMediaEntity:v7];
      goto LABEL_14;
    case 7uLL:
      id v13 = [a1 _iTunesUPlaceholderTypeForMediaEntity:v7];
      goto LABEL_14;
    case 8uLL:
      id v13 = [a1 _audiobookPlaceholderTypeForMediaEntity:v7];
      goto LABEL_14;
    case 9uLL:
      id v13 = [a1 _photosPlaceholderTypeForMediaEntity:v7];
LABEL_14:
      uint64_t v9 = (uint64_t)v13;
      break;
    default:
LABEL_6:
      uint64_t v9 = 7LL;
      break;
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "placeholderForType:containerSize:", v9, width, height));

  return v14;
}

+ (NSCache)placeholderCache
{
  if (qword_1001573C8 != -1) {
    dispatch_once(&qword_1001573C8, &stru_1000FEE38);
  }
  return (NSCache *)(id)qword_1001573C0;
}

+ (NSDictionary)placeholderDescriptionMap
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006ECB0;
  block[3] = &unk_1000FD0E8;
  block[4] = a1;
  if (qword_1001573D8 != -1) {
    dispatch_once(&qword_1001573D8, block);
  }
  return (NSDictionary *)(id)qword_1001573D0;
}

+ (NSDictionary)symbolConfigurationMap
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006F0F4;
  block[3] = &unk_1000FD0E8;
  block[4] = a1;
  if (qword_1001573E8 != -1) {
    dispatch_once(&qword_1001573E8, block);
  }
  return (NSDictionary *)(id)qword_1001573E0;
}

+ (id)_symbolConfigurationForPlaceholderType:(int64_t)a3 placeholderDescription:(id)a4 size:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "symbolConfigurationMap", a3, a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](&OBJC_CLASS___NSValue, "valueWithCGSize:", width, height));
  uint64_t v9 = (_TVHSymbolConfiguration *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v8]);

  if (!v9)
  {
    uint64_t v9 = objc_alloc_init(&OBJC_CLASS____TVHSymbolConfiguration);
    -[_TVHSymbolConfiguration setPointSize:](v9, "setPointSize:", round(height * 0.375));
  }

  return v9;
}

+ (id)_symbolConfiguration_666x666
{
  v2 = objc_alloc_init(&OBJC_CLASS____TVHSymbolConfiguration);
  -[_TVHSymbolConfiguration setPointSize:](v2, "setPointSize:", 251.0);
  return v2;
}

+ (id)_symbolConfiguration_640x640
{
  v2 = objc_alloc_init(&OBJC_CLASS____TVHSymbolConfiguration);
  -[_TVHSymbolConfiguration setPointSize:](v2, "setPointSize:", 241.0);
  return v2;
}

+ (id)_symbolConfiguration_400x600
{
  v2 = objc_alloc_init(&OBJC_CLASS____TVHSymbolConfiguration);
  -[_TVHSymbolConfiguration setPointSize:](v2, "setPointSize:", 226.0);
  return v2;
}

+ (id)_symbolConfiguration_622x350
{
  v2 = objc_alloc_init(&OBJC_CLASS____TVHSymbolConfiguration);
  -[_TVHSymbolConfiguration setPointSize:](v2, "setPointSize:", 132.0);
  return v2;
}

+ (id)_symbolConfiguration_350x350
{
  v2 = objc_alloc_init(&OBJC_CLASS____TVHSymbolConfiguration);
  -[_TVHSymbolConfiguration setPointSize:](v2, "setPointSize:", 132.0);
  return v2;
}

+ (id)_symbolConfiguration_550x309
{
  v2 = objc_alloc_init(&OBJC_CLASS____TVHSymbolConfiguration);
  -[_TVHSymbolConfiguration setPointSize:](v2, "setPointSize:", 117.0);
  return v2;
}

+ (id)_symbolConfiguration_273x273
{
  v2 = objc_alloc_init(&OBJC_CLASS____TVHSymbolConfiguration);
  -[_TVHSymbolConfiguration setPointSize:](v2, "setPointSize:", 75.0);
  return v2;
}

+ (id)_symbolConfiguration_148x222
{
  v2 = objc_alloc_init(&OBJC_CLASS____TVHSymbolConfiguration);
  -[_TVHSymbolConfiguration setPointSize:](v2, "setPointSize:", 84.0);
  return v2;
}

+ (id)_audiobookPlaceholderDescription
{
  return  -[_TVHPlaceholderDescription initWithSymbolName:]( objc_alloc(&OBJC_CLASS____TVHPlaceholderDescription),  "initWithSymbolName:",  @"book.fill");
}

+ (id)_contributorPlaceholderDescription
{
  return  -[_TVHPlaceholderDescription initWithSymbolName:]( objc_alloc(&OBJC_CLASS____TVHPlaceholderDescription),  "initWithSymbolName:",  @"person.fill");
}

+ (id)_homeVideoPlaceholderDescription
{
  return  -[_TVHPlaceholderDescription initWithSymbolName:]( objc_alloc(&OBJC_CLASS____TVHPlaceholderDescription),  "initWithSymbolName:",  @"film.fill");
}

+ (id)_iTunesUPlaceholderDescription
{
  return  -[_TVHPlaceholderDescription initWithSymbolName:]( objc_alloc(&OBJC_CLASS____TVHPlaceholderDescription),  "initWithSymbolName:",  @"podcasts");
}

+ (id)_moviePlaceholderDescription
{
  return  -[_TVHPlaceholderDescription initWithSymbolName:]( objc_alloc(&OBJC_CLASS____TVHPlaceholderDescription),  "initWithSymbolName:",  @"film.fill");
}

+ (id)_musicAlbumPlaceholderDescription
{
  return  -[_TVHPlaceholderDescription initWithSymbolName:]( objc_alloc(&OBJC_CLASS____TVHPlaceholderDescription),  "initWithSymbolName:",  @"music");
}

+ (id)_musicAlbumArtistPlaceholderDescription
{
  return  -[_TVHPlaceholderDescription initWithSymbolName:]( objc_alloc(&OBJC_CLASS____TVHPlaceholderDescription),  "initWithSymbolName:",  @"music.mic");
}

+ (id)_musicSongPlaceholderDescription
{
  return  -[_TVHPlaceholderDescription initWithSymbolName:]( objc_alloc(&OBJC_CLASS____TVHPlaceholderDescription),  "initWithSymbolName:",  @"music");
}

+ (id)_musicVideoPlaceholderDescription
{
  return  -[_TVHPlaceholderDescription initWithSymbolName:]( objc_alloc(&OBJC_CLASS____TVHPlaceholderDescription),  "initWithSymbolName:",  @"tv");
}

+ (id)_photoPlaceholderDescription
{
  return  -[_TVHPlaceholderDescription initWithSymbolName:]( objc_alloc(&OBJC_CLASS____TVHPlaceholderDescription),  "initWithSymbolName:",  @"photos");
}

+ (id)_playlistPlaceholderDescription
{
  return  -[_TVHPlaceholderDescription initWithSymbolName:]( objc_alloc(&OBJC_CLASS____TVHPlaceholderDescription),  "initWithSymbolName:",  @"music.note.list");
}

+ (id)_playlistFolderPlaceholderDescription
{
  return  -[_TVHPlaceholderDescription initWithSymbolName:]( objc_alloc(&OBJC_CLASS____TVHPlaceholderDescription),  "initWithSymbolName:",  @"folder");
}

+ (id)_geniusPlaylistPlaceholderDescription
{
  return  -[_TVHPlaceholderDescription initWithSymbolName:]( objc_alloc(&OBJC_CLASS____TVHPlaceholderDescription),  "initWithSymbolName:",  @"genius");
}

+ (id)_smartPlaylistPlaceholderDescription
{
  return  -[_TVHPlaceholderDescription initWithSymbolName:]( objc_alloc(&OBJC_CLASS____TVHPlaceholderDescription),  "initWithSymbolName:",  @"gearshape");
}

+ (id)_podcastPlaceholderDescription
{
  return  -[_TVHPlaceholderDescription initWithSymbolName:]( objc_alloc(&OBJC_CLASS____TVHPlaceholderDescription),  "initWithSymbolName:",  @"podcasts");
}

+ (id)_showPlaceholderDescription
{
  return  -[_TVHPlaceholderDescription initWithSymbolName:]( objc_alloc(&OBJC_CLASS____TVHPlaceholderDescription),  "initWithSymbolName:",  @"tv");
}

+ (id)_showEpisodePlaceholderDescription
{
  return  -[_TVHPlaceholderDescription initWithSymbolName:]( objc_alloc(&OBJC_CLASS____TVHPlaceholderDescription),  "initWithSymbolName:",  @"tv");
}

+ (int64_t)_audiobookPlaceholderTypeForMediaEntity:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 type]);
  id v4 = [v3 subtype];

  return v4 == (id)1;
}

+ (int64_t)_musicPlaceholderTypeForMediaEntity:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 type]);
  id v4 = [v3 subtype];
  if (v4 == (id)1)
  {
    id v6 = [v3 mediaEntityCollectionType];
    uint64_t v7 = 7LL;
    if (v6 == (id)2) {
      uint64_t v7 = 5LL;
    }
    if (v6 == (id)1) {
      int64_t v5 = 4LL;
    }
    else {
      int64_t v5 = v7;
    }
  }

  else if (v4)
  {
    int64_t v5 = 7LL;
  }

  else if ([v3 mediaItemType] == (id)2)
  {
    int64_t v5 = 6LL;
  }

  else
  {
    int64_t v5 = 7LL;
  }

  return v5;
}

+ (int64_t)_showsPlaceholderTypeForMediaEntity:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 type]);
  id v4 = [v3 subtype];
  if (v4 == (id)1)
  {
    if ([v3 mediaEntityCollectionType] == (id)1) {
      int64_t v5 = 9LL;
    }
    else {
      int64_t v5 = 10LL;
    }
  }

  else if (v4)
  {
    int64_t v5 = 10LL;
  }

  else if ([v3 mediaItemType] == (id)2)
  {
    int64_t v5 = 8LL;
  }

  else
  {
    int64_t v5 = 10LL;
  }

  return v5;
}

+ (int64_t)_podcastsPlaceholderTypeForMediaEntity:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 type]);
  id v4 = [v3 subtype];
  if (v4 == (id)1)
  {
    [v3 mediaEntityCollectionType];
    goto LABEL_7;
  }

  if (v4)
  {
LABEL_7:
    int64_t v5 = 11LL;
    goto LABEL_8;
  }

  else {
    int64_t v5 = 12LL;
  }
LABEL_8:

  return v5;
}

+ (int64_t)_iTunesUPlaceholderTypeForMediaEntity:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 type]);
  id v4 = [v3 subtype];
  if (v4 == (id)1)
  {
    [v3 mediaEntityCollectionType];
    goto LABEL_7;
  }

  if (v4)
  {
LABEL_7:
    int64_t v5 = 13LL;
    goto LABEL_8;
  }

  else {
    int64_t v5 = 14LL;
  }
LABEL_8:

  return v5;
}

+ (int64_t)_photosPlaceholderTypeForMediaEntity:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 type]);
  if ([v3 subtype]) {
    int64_t v4 = 16LL;
  }
  else {
    int64_t v4 = 15LL;
  }

  return v4;
}

+ (int64_t)_playlistPlaceholderTypeForPlaylist:(id)a3
{
  id v3 = a3;
  switch((unint64_t)[v3 playlistType])
  {
    case 1uLL:
      int64_t v4 = 18LL;
      break;
    case 2uLL:
      int64_t v4 = 19LL;
      break;
    case 3uLL:
      int64_t v4 = 20LL;
      break;
    case 4uLL:
      int64_t v4 = 21LL;
      break;
    case 5uLL:
      int64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
      id v6 = [v5 protocol];

      if (v6 == (id)1) {
        int64_t v4 = 16LL;
      }
      else {
        int64_t v4 = 17LL;
      }
      break;
    case 6uLL:
      int64_t v4 = 22LL;
      break;
    case 7uLL:
    case 8uLL:
      int64_t v4 = 16LL;
      break;
    default:
      int64_t v4 = 17LL;
      break;
  }

  return v4;
}

+ (id)_placeholderTypeDescription:(int64_t)a3
{
  else {
    return off_1000FEE58[a3 - 1];
  }
}

- (int64_t)type
{
  return self->_type;
}

- (UIImage)image
{
  return self->_image;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end