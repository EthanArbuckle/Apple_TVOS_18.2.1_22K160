@interface MTMLPlaylist
+ (id)playlistWithMPPlaylist:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isFolder;
- (BOOL)isGenius;
- (BOOL)isHidden;
- (BOOL)isOnTheGo;
- (BOOL)isSmart;
- (MPMediaPlaylist)playlist;
- (NSNumber)mediaLibraryId;
- (NSNumber)parentMediaLibraryId;
- (NSString)name;
- (id)children;
- (id)description;
- (void)addChild:(id)a3;
- (void)setIsFolder:(BOOL)a3;
- (void)setIsGenius:(BOOL)a3;
- (void)setIsHidden:(BOOL)a3;
- (void)setIsOnTheGo:(BOOL)a3;
- (void)setIsSmart:(BOOL)a3;
- (void)setMediaLibraryId:(id)a3;
- (void)setName:(id)a3;
- (void)setParentMediaLibraryId:(id)a3;
- (void)setPlaylist:(id)a3;
@end

@implementation MTMLPlaylist

+ (id)playlistWithMPPlaylist:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_opt_new(a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  MPMediaPlaylistPropertyName,  MPMediaEntityPropertyPersistentID,  MPMediaPlaylistPropertyParentPersistentID,  MPMediaPlaylistPropertyIsFolder,  MPMediaPlaylistPropertyPlaylistAttributes,  MPMediaPlaylistPropertyIsHidden,  0LL));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10006F580;
  v9[3] = &unk_100241268;
  id v7 = v5;
  id v10 = v7;
  [v4 enumerateValuesForProperties:v6 usingBlock:v9];

  [v7 setPlaylist:v4];
  return v7;
}

- (void)addChild:(id)a3
{
  id v4 = a3;
  children = self->_children;
  id v8 = v4;
  if (!children)
  {
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    id v7 = self->_children;
    self->_children = v6;

    id v4 = v8;
    children = self->_children;
  }

  -[NSMutableArray addObject:](children, "addObject:", v4);
}

- (id)children
{
  return self->_children;
}

- (BOOL)isEmpty
{
  if (!self->_cachedEmpty)
  {
    if (-[MTMLPlaylist isFolder](self, "isFolder") && !-[NSMutableArray count](self->_children, "count"))
    {
      BOOL v3 = 1;
    }

    else
    {
      if (!-[MTMLPlaylist isFolder](self, "isFolder"))
      {
        BOOL v3 = 0;
        self->_empty = 0;
LABEL_20:
        self->_cachedEmpty = 1;
        return v3;
      }

      __int128 v12 = 0u;
      __int128 v13 = 0u;
      __int128 v10 = 0u;
      __int128 v11 = 0u;
      id v4 = self->_children;
      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
      if (v5)
      {
        id v6 = v5;
        uint64_t v7 = *(void *)v11;
        while (2)
        {
          for (i = 0LL; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v11 != v7) {
              objc_enumerationMutation(v4);
            }
            if (!objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)i), "isEmpty", (void)v10))
            {
              BOOL v3 = 0;
              goto LABEL_17;
            }
          }

          id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
          if (v6) {
            continue;
          }
          break;
        }
      }

      BOOL v3 = 1;
LABEL_17:
    }

    self->_empty = v3;
    goto LABEL_20;
  }

  return self->_empty;
}

- (id)description
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTMLPlaylist mediaLibraryId](self, "mediaLibraryId"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTMLPlaylist name](self, "name"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[MTMLPlaylist isFolder](self, "isFolder")));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[%@] %@ %@",  v3,  v4,  v5));

  return v6;
}

- (MPMediaPlaylist)playlist
{
  return (MPMediaPlaylist *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setPlaylist:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSNumber)mediaLibraryId
{
  return self->_mediaLibraryId;
}

- (void)setMediaLibraryId:(id)a3
{
}

- (NSNumber)parentMediaLibraryId
{
  return self->_parentMediaLibraryId;
}

- (void)setParentMediaLibraryId:(id)a3
{
}

- (BOOL)isFolder
{
  return self->_isFolder;
}

- (void)setIsFolder:(BOOL)a3
{
  self->_isFolder = a3;
}

- (BOOL)isGenius
{
  return self->_isGenius;
}

- (void)setIsGenius:(BOOL)a3
{
  self->_isGenius = a3;
}

- (BOOL)isOnTheGo
{
  return self->_isOnTheGo;
}

- (void)setIsOnTheGo:(BOOL)a3
{
  self->_isOnTheGo = a3;
}

- (BOOL)isSmart
{
  return self->_isSmart;
}

- (void)setIsSmart:(BOOL)a3
{
  self->_isSmart = a3;
}

- (BOOL)isHidden
{
  return self->_isHidden;
}

- (void)setIsHidden:(BOOL)a3
{
  self->_isHidden = a3;
}

- (void).cxx_destruct
{
}

@end