@interface BTAVRCP_MyMusicFolder
- (BTAVRCP_MyMusicFolder)initWithName:(id)a3 uid:(unint64_t)a4;
- (NSArray)activeCategories;
- (id)baseQuery;
- (id)folderNameForUid:(unint64_t)a3;
- (id)replyAttributesForUid:(unint64_t)a3 attributeIDs:(id)a4;
- (id)replyItemAtIndex:(unint64_t)a3 attributeIDs:(id)a4;
- (unint64_t)childrenCount;
- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4;
- (unsigned)folderTypeForUid:(unint64_t)a3;
- (unsigned)playItemWithUid:(unint64_t)a3;
- (void)dealloc;
- (void)refreshActiveCategories;
- (void)setActiveCategories:(id)a3;
@end

@implementation BTAVRCP_MyMusicFolder

- (BTAVRCP_MyMusicFolder)initWithName:(id)a3 uid:(unint64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___BTAVRCP_MyMusicFolder;
  v4 = -[BTAVRCP_VFSFolder initWithName:uid:](&v8, "initWithName:uid:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v5 addObserver:v4 selector:"refreshActiveCategories" name:MPMediaLibraryDidChangeNotification object:0];

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](&OBJC_CLASS___MPMediaLibrary, "defaultMediaLibrary"));
    [v6 beginGeneratingLibraryChangeNotifications];

    -[BTAVRCP_MyMusicFolder refreshActiveCategories](v4, "refreshActiveCategories");
  }

  return v4;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](&OBJC_CLASS___MPMediaLibrary, "defaultMediaLibrary"));
  [v3 endGeneratingLibraryChangeNotifications];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___BTAVRCP_MyMusicFolder;
  -[BTAVRCP_MyMusicFolder dealloc](&v4, "dealloc");
}

- (void)refreshActiveCategories
{
  v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v3 = 1LL;
  while (2)
  {
    switch(v3)
    {
      case 1LL:
        objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](&OBJC_CLASS___MPMediaLibrary, "defaultMediaLibrary"));
        unsigned int v5 = [v4 hasArtists];

        if (v5) {
          goto LABEL_12;
        }
        goto LABEL_13;
      case 2LL:
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](&OBJC_CLASS___MPMediaLibrary, "defaultMediaLibrary"));
        unsigned __int8 v7 = [v6 hasAlbums];
        goto LABEL_9;
      case 3LL:
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](&OBJC_CLASS___MPMediaLibrary, "defaultMediaLibrary"));
        unsigned __int8 v7 = [v6 hasSongs];
        goto LABEL_9;
      case 4LL:
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](&OBJC_CLASS___MPMediaLibrary, "defaultMediaLibrary"));
        unsigned __int8 v7 = [v6 hasGenres];
        goto LABEL_9;
      case 5LL:
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](&OBJC_CLASS___MPMediaLibrary, "defaultMediaLibrary"));
        unsigned __int8 v7 = [v6 hasComposers];
LABEL_9:
        unsigned __int8 v8 = v7;

        if ((v8 & 1) == 0) {
          goto LABEL_13;
        }
        goto LABEL_12;
      case 6LL:
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](&OBJC_CLASS___MPMediaLibrary, "defaultMediaLibrary"));
        unsigned __int8 v10 = [v9 hasCompilations];

        if ((v10 & 1) == 0) {
          goto LABEL_14;
        }
LABEL_12:
        v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v3));
        -[NSMutableArray addObject:](v12, "addObject:", v11);

LABEL_13:
        if (++v3 != 7) {
          continue;
        }
LABEL_14:
        -[BTAVRCP_MyMusicFolder setActiveCategories:](self, "setActiveCategories:", v12);

        return;
      default:
        goto LABEL_13;
    }
  }

- (id)folderNameForUid:(unint64_t)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mobileBluetoothBundle](&OBJC_CLASS___NSBundle, "mobileBluetoothBundle"));
  unsigned int v5 = v4;
  switch(a3)
  {
    case 1uLL:
      v6 = @"ARTISTS";
      unsigned __int8 v7 = @"Artists";
      goto LABEL_9;
    case 2uLL:
      v6 = @"ALBUMS";
      unsigned __int8 v7 = @"Albums";
      goto LABEL_9;
    case 3uLL:
      v6 = @"SONGS";
      unsigned __int8 v7 = @"Songs";
      goto LABEL_9;
    case 4uLL:
      v6 = @"GENRES";
      unsigned __int8 v7 = @"Genres";
      goto LABEL_9;
    case 5uLL:
      v6 = @"COMPOSERS";
      unsigned __int8 v7 = @"Composers";
      goto LABEL_9;
    case 6uLL:
      v6 = @"COMPILATIONS";
      unsigned __int8 v7 = @"Compilations";
LABEL_9:
      unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:v6 value:v7 table:0]);
      break;
    default:
      unsigned __int8 v8 = 0LL;
      break;
  }

  return v8;
}

- (unsigned)folderTypeForUid:(unint64_t)a3
{
  unint64_t v3 = 0x2030401020300uLL >> (8 * a3);
  if (a3 >= 7) {
    LOBYTE(v3) = 0;
  }
  return v3 & 7;
}

- (id)baseQuery
{
  return +[MPMediaQuery songsQuery](&OBJC_CLASS___MPMediaQuery, "songsQuery");
}

- (unint64_t)childrenCount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_MyMusicFolder activeCategories](self, "activeCategories"));
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4
{
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_MyMusicFolder activeCategories](self, "activeCategories"));
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  unsigned int v9 = [v7 containsObject:v8];

  if (!v9) {
    return 9;
  }
  switch(a3)
  {
    case 1uLL:
      unsigned __int8 v10 = objc_alloc(&OBJC_CLASS___BTAVRCP_ArtistsFolder);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_MyMusicFolder folderNameForUid:](self, "folderNameForUid:", 1LL));
      v12 = v10;
      v13 = v11;
      uint64_t v14 = 1LL;
      goto LABEL_9;
    case 2uLL:
      v16 = objc_alloc(&OBJC_CLASS___BTAVRCP_AlbumsFolder);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_MyMusicFolder folderNameForUid:](self, "folderNameForUid:", 2LL));
      v12 = v16;
      v13 = v11;
      uint64_t v14 = 2LL;
      goto LABEL_9;
    case 3uLL:
      v17 = objc_alloc(&OBJC_CLASS___BTAVRCP_SongsFolder);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_MyMusicFolder folderNameForUid:](self, "folderNameForUid:", 3LL));
      v12 = v17;
      v13 = v11;
      uint64_t v14 = 3LL;
      goto LABEL_9;
    case 4uLL:
      v18 = objc_alloc(&OBJC_CLASS___BTAVRCP_GenresFolder);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_MyMusicFolder folderNameForUid:](self, "folderNameForUid:", 4LL));
      v12 = v18;
      v13 = v11;
      uint64_t v14 = 4LL;
      goto LABEL_9;
    case 5uLL:
      v19 = objc_alloc(&OBJC_CLASS___BTAVRCP_ComposersFolder);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_MyMusicFolder folderNameForUid:](self, "folderNameForUid:", 5LL));
      v12 = v19;
      v13 = v11;
      uint64_t v14 = 5LL;
LABEL_9:
      *a4 = [v12 initWithName:v13 uid:v14];
      goto LABEL_10;
    case 6uLL:
      v20 = objc_alloc(&OBJC_CLASS___BTAVRCP_AlbumsFolder);
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_MyMusicFolder folderNameForUid:](self, "folderNameForUid:", 6LL));
      *a4 = -[BTAVRCP_AlbumsFolder initWithName:uid:](v20, "initWithName:uid:", v21, 6LL);

      id v22 = *a4;
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[MPMediaPropertyPredicate predicateWithValue:forProperty:]( &OBJC_CLASS___MPMediaPropertyPredicate,  "predicateWithValue:forProperty:",  &__kCFBooleanTrue,  MPMediaItemPropertyIsCompilation));
      [v22 storePredicate:v11];
LABEL_10:

      break;
    default:
      return 4;
  }

  return 4;
}

- (id)replyItemAtIndex:(unint64_t)a3 attributeIDs:(id)a4
{
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_MyMusicFolder activeCategories](self, "activeCategories", a3, a4));
  id v7 = [v6 count];

  if ((unint64_t)v7 <= a3)
  {
    uint64_t v14 = 0LL;
  }

  else
  {
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_MyMusicFolder activeCategories](self, "activeCategories"));
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:a3]);
    id v10 = [v9 unsignedLongLongValue];

    uint64_t v11 = -[BTAVRCP_MyMusicFolder folderTypeForUid:](self, "folderTypeForUid:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v10));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_MyMusicFolder folderNameForUid:](self, "folderNameForUid:", v10));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[BTAVRCP_VFSFolder replyFolderWithType:uid:name:]( self,  "replyFolderWithType:uid:name:",  v11,  v12,  v13));
  }

  return v14;
}

- (id)replyAttributesForUid:(unint64_t)a3 attributeIDs:(id)a4
{
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_MyMusicFolder activeCategories](self, "activeCategories", a3, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  unsigned int v7 = [v5 containsObject:v6];

  if (v7) {
    return &__NSDictionary0__struct;
  }
  else {
    return 0LL;
  }
}

- (unsigned)playItemWithUid:(unint64_t)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_MyMusicFolder activeCategories](self, "activeCategories"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  unsigned int v6 = [v4 containsObject:v5];

  if (v6) {
    return 12;
  }
  else {
    return 9;
  }
}

- (NSArray)activeCategories
{
  return self->_activeCategories;
}

- (void)setActiveCategories:(id)a3
{
}

- (void).cxx_destruct
{
}

@end