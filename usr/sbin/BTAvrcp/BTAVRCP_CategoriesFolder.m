@interface BTAVRCP_CategoriesFolder
- (BTAVRCP_CategoriesFolder)initWithName:(id)a3 uid:(unint64_t)a4;
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

@implementation BTAVRCP_CategoriesFolder

- (BTAVRCP_CategoriesFolder)initWithName:(id)a3 uid:(unint64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___BTAVRCP_CategoriesFolder;
  v4 = -[BTAVRCP_VFSFolder initWithName:uid:](&v9, "initWithName:uid:", a3, a4);
  if (v4)
  {
    v5 = [NSNotificationCenter defaultCenter];
    [v5 addObserver:v4 selector:"refreshActiveCategories" name:MPMediaLibraryDidChangeNotification object:0];

    v6 = [NSNotificationCenter defaultCenter];
    [v6 addObserver:v4 selector:"refreshActiveCategories" name:MPRadioLibraryStationsDidChangeNotification object:0];

    v7 = [+[MPMediaLibrary defaultMediaLibrary](&OBJC_CLASS___MPMediaLibrary, "defaultMediaLibrary") autorelease];
    [v7 beginGeneratingLibraryChangeNotifications];

    -[BTAVRCP_CategoriesFolder refreshActiveCategories](v4, "refreshActiveCategories");
  }

  return v4;
}

- (void)dealloc
{
  v3 = [+[MPMediaLibrary defaultMediaLibrary](&OBJC_CLASS___MPMediaLibrary, "defaultMediaLibrary") autorelease];
  [v3 endGeneratingLibraryChangeNotifications];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___BTAVRCP_CategoriesFolder;
  -[BTAVRCP_CategoriesFolder dealloc](&v4, "dealloc");
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
        unsigned int v5 = [v4 hasMedia];

        if (v5) {
          goto LABEL_11;
        }
        goto LABEL_12;
      case 2LL:
        v6 = [+[MPMediaLibrary defaultMediaLibrary](&OBJC_CLASS___MPMediaLibrary, "defaultMediaLibrary") autorelease];
        unsigned __int8 v7 = [v6 hasPlaylists];
        goto LABEL_8;
      case 3LL:
        v6 = [+[MPRadioLibrary defaultRadioLibrary](&OBJC_CLASS___MPRadioLibrary, "defaultRadioLibrary") autorelease];
        unsigned __int8 v7 = [v6 isEnabled];
        goto LABEL_8;
      case 4LL:
        v6 = [+[MPMediaLibrary defaultMediaLibrary](&OBJC_CLASS___MPMediaLibrary, "defaultMediaLibrary") autorelease];
        unsigned __int8 v7 = [v6 hasPodcasts];
LABEL_8:
        unsigned __int8 v8 = v7;

        if ((v8 & 1) == 0) {
          goto LABEL_12;
        }
        goto LABEL_11;
      case 5LL:
        objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](&OBJC_CLASS___MPMediaLibrary, "defaultMediaLibrary"));
        unsigned __int8 v10 = [v9 hasAudiobooks];

        if ((v10 & 1) == 0) {
          goto LABEL_13;
        }
LABEL_11:
        v11 = [NSNumber numberWithUnsignedLongLong:v3];
        -[NSMutableArray addObject:](v12, "addObject:", v11);

LABEL_12:
        if (++v3 != 6) {
          continue;
        }
LABEL_13:
        -[BTAVRCP_CategoriesFolder setActiveCategories:](self, "setActiveCategories:", v12);

        return;
      default:
        goto LABEL_12;
    }
  }

- (id)folderNameForUid:(unint64_t)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mobileBluetoothBundle](&OBJC_CLASS___NSBundle, "mobileBluetoothBundle"));
  unsigned int v5 = v4;
  switch(a3)
  {
    case 1uLL:
      v6 = @"MY_MUSIC";
      unsigned __int8 v7 = @"My Music";
      goto LABEL_8;
    case 2uLL:
      v6 = @"PLAYLISTS";
      unsigned __int8 v7 = @"Playlists";
      goto LABEL_8;
    case 3uLL:
      v6 = @"RADIO";
      unsigned __int8 v7 = @"Radio";
      goto LABEL_8;
    case 4uLL:
      v6 = @"PODCASTS";
      unsigned __int8 v7 = @"Podcasts";
      goto LABEL_8;
    case 5uLL:
      v6 = @"AUDIOBOOKS";
      unsigned __int8 v7 = @"Audiobooks";
LABEL_8:
      unsigned __int8 v8 = (void *)[v4 localizedStringForKey:v6 value:v7 table:0];
      break;
    default:
      unsigned __int8 v8 = 0LL;
      break;
  }

  return v8;
}

- (unsigned)folderTypeForUid:(unint64_t)a3
{
  unint64_t v3 = 0x20205050000uLL >> (8 * a3);
  if (a3 >= 6) {
    LOBYTE(v3) = 0;
  }
  return v3 & 7;
}

- (id)baseQuery
{
  return objc_alloc_init(&OBJC_CLASS___MPMediaQuery);
}

- (unint64_t)childrenCount
{
  v2 = -[BTAVRCP_CategoriesFolder activeCategories];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4
{
  unsigned __int8 v7 = (void *)-[BTAVRCP_CategoriesFolder activeCategories];
  unsigned __int8 v8 = [NSNumber numberWithUnsignedLongLong:a3];
  unsigned int v9 = [v7 containsObject:v8];

  if (!v9) {
    return 9;
  }
  switch(a3)
  {
    case 1uLL:
      unsigned __int8 v10 = objc_alloc(&OBJC_CLASS___BTAVRCP_MyMusicFolder);
      v11 = -[BTAVRCP_CategoriesFolder folderNameForUid:1LL];
      v12 = v10;
      v13 = v11;
      uint64_t v14 = 1LL;
      goto LABEL_9;
    case 2uLL:
      v16 = objc_alloc(&OBJC_CLASS___BTAVRCP_PlaylistsFolder);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_CategoriesFolder folderNameForUid:](self, "folderNameForUid:", 2LL));
      v12 = v16;
      v13 = v11;
      uint64_t v14 = 2LL;
      goto LABEL_9;
    case 3uLL:
      v17 = objc_alloc(&OBJC_CLASS___BTAVRCP_RadioFolder);
      v11 = -[BTAVRCP_CategoriesFolder folderNameForUid:3LL];
      v12 = v17;
      v13 = v11;
      uint64_t v14 = 3LL;
      goto LABEL_9;
    case 4uLL:
      v18 = objc_alloc(&OBJC_CLASS___BTAVRCP_PodcastsFolder);
      v11 = -[BTAVRCP_CategoriesFolder folderNameForUid:4LL];
      v12 = v18;
      v13 = v11;
      uint64_t v14 = 4LL;
      goto LABEL_9;
    case 5uLL:
      v19 = objc_alloc(&OBJC_CLASS___BTAVRCP_AudiobooksFolder);
      v11 = -[BTAVRCP_CategoriesFolder folderNameForUid:5LL];
      v12 = v19;
      v13 = v11;
      uint64_t v14 = 5LL;
LABEL_9:
      *a4 = [v12 initWithName:v13 uid:v14];

      break;
    default:
      return 4;
  }

  return 4;
}

- (id)replyItemAtIndex:(unint64_t)a3 attributeIDs:(id)a4
{
  v6 = -[BTAVRCP_CategoriesFolder activeCategories](self, "activeCategories", a3, a4);
  id v7 = [v6 count];

  if ((unint64_t)v7 <= a3)
  {
    uint64_t v14 = 0LL;
  }

  else
  {
    unsigned __int8 v8 = (void *)-[BTAVRCP_CategoriesFolder activeCategories];
    unsigned int v9 = (void *)[v8 objectAtIndexedSubscript:a3];
    id v10 = [v9 unsignedLongLongValue];

    uint64_t v11 = -[BTAVRCP_CategoriesFolder folderTypeForUid:](self, "folderTypeForUid:", v10);
    v12 = [NSNumber numberWithUnsignedLongLong:v10];
    v13 = -[BTAVRCP_CategoriesFolder folderNameForUid:v10];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[BTAVRCP_VFSFolder replyFolderWithType:uid:name:]( self,  "replyFolderWithType:uid:name:",  v11,  v12,  v13));
  }

  return v14;
}

- (id)replyAttributesForUid:(unint64_t)a3 attributeIDs:(id)a4
{
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_CategoriesFolder activeCategories](self, "activeCategories", a3, a4));
  v6 = [NSNumber numberWithUnsignedLongLong:a3];
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
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_CategoriesFolder activeCategories](self, "activeCategories"));
  unsigned int v5 = [+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3) unsignedLongLongValue];
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