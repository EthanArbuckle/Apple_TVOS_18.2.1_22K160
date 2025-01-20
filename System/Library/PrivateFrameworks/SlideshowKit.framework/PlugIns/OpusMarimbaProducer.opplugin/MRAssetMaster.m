@interface MRAssetMaster
- (BOOL)isEmbeddedAsset;
- (BOOL)isSupportedMovie;
- (BOOL)isValid;
- (BOOL)purgeResources;
- (CGSize)originalSize;
- (MRAssetMaster)initWithPath:(id)a3 originalSize:(CGSize)a4 isEmbeddedAsset:(BOOL)a5 isSupportedMovie:(BOOL)a6 andImageManager:(id)a7;
- (MRImage)thumbnail;
- (MRImageManager)imageManager;
- (NSDictionary)players;
- (NSString)path;
- (double)timestamp;
- (id)retainedByUserPlayerForSize:(CGSize)a3 andOptions:(id)a4;
- (id)thumbnailForFlagsMonochromatic:(BOOL)a3 mipmap:(BOOL)a4 powerOfTwo:(BOOL)a5;
- (void)dealloc;
- (void)invalidate;
- (void)relinquishPlayer:(id)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation MRAssetMaster

- (MRAssetMaster)initWithPath:(id)a3 originalSize:(CGSize)a4 isEmbeddedAsset:(BOOL)a5 isSupportedMovie:(BOOL)a6 andImageManager:(id)a7
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MRAssetMaster;
  v13 = -[MRAssetMaster init](&v16, "init");
  if (v13)
  {
    v13->_path = (NSString *)[a3 copy];
    v13->_originalSize.CGFloat width = width;
    v13->_originalSize.CGFloat height = height;
    v13->_imageManager = (MRImageManager *)a7;
    BOOL v14 = v13->_originalSize.width > 0.0 && v13->_originalSize.height > 0.0;
    v13->_isValid = v14;
    v13->_isEmbeddedAsset = a5;
    v13->_isSupportedMovie = a6;
    v13->_players = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v13->_unusedPlayers = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  }

  return v13;
}

- (void)dealloc
{
  self->_path = 0LL;
  -[MRImage releaseByUser](self->_thumbnail, "releaseByUser");
  self->_thumbnail = 0LL;
  self->_originalSize = CGSizeZero;
  self->_isValid = 0;

  self->_players = 0LL;
  self->_unusedPlayers = 0LL;

  self->_imageManager = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRAssetMaster;
  -[MRAssetMaster dealloc](&v3, "dealloc");
}

- (void)invalidate
{
  self->_path = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"invalid %p", self);
  objc_sync_exit(self);
}

- (NSString)path
{
  objc_super v3 = self->_path;
  objc_sync_exit(self);
  return v3;
}

- (id)retainedByUserPlayerForSize:(CGSize)a3 andOptions:(id)a4
{
  if (!self->_isValid) {
    return 0LL;
  }
  double height = a3.height;
  double width = a3.width;
  v8 = @"liveCamera";
  unsigned __int8 v9 = -[NSString isEqualToString:](self->_path, "isEqualToString:", @"liveCamera");
  if ((v9 & 1) != 0) {
    goto LABEL_26;
  }
  BOOL v10 = width == CGSizeZero.width;
  BOOL v11 = height == CGSizeZero.height;
  double v12 = self->_originalSize.width;
  if (v10 && v11) {
    double v13 = self->_originalSize.width;
  }
  else {
    double v13 = width;
  }
  if (v10 && v11) {
    double v14 = self->_originalSize.height;
  }
  else {
    double v14 = height;
  }
  float v15 = v12 / self->_originalSize.height;
  if (v13 == 0.0)
  {
    double v13 = v14 * v15;
  }

  else
  {
    double v17 = v15;
    if (v14 == 0.0 || (float v18 = v13 / v14, v18 > v15)) {
      double v14 = v13 / v17;
    }
    else {
      double v13 = v14 * v17;
    }
  }

  if (v13 <= v12) {
    double width = v13;
  }
  else {
    double width = self->_originalSize.width;
  }
  if (v13 <= v12) {
    double height = v14;
  }
  else {
    double height = self->_originalSize.height;
  }
  unsigned int v19 = [a4 isStill];
  char v20 = v19;
  if (v19)
  {
    if (self->_isSupportedMovie)
    {
      unsigned int v21 = [a4 wantsMonochromatic];
      unsigned int v22 = [a4 wantsMipmap];
      unsigned int v23 = [a4 wantsPowerOfTwo];
      [a4 stillTime];
      v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d-%d%d%d%f",  (int)width,  v21,  v22,  v23,  v24);
      char v20 = 1;
      goto LABEL_28;
    }

    goto LABEL_27;
  }

  if (self->_isSupportedMovie)
  {
    v8 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%d%d%d",  [a4 wantsMonochromatic],  objc_msgSend(a4, "wantsMipmap"),  objc_msgSend(a4, "wantsPowerOfTwo"));
LABEL_26:
    char v20 = 0;
    goto LABEL_28;
  }

- (void)relinquishPlayer:(id)a3
{
  players = self->_players;
  objc_sync_enter(players);
  -[NSMutableSet addObject:](self->_unusedPlayers, "addObject:", a3);
  objc_sync_exit(players);
}

- (MRImage)thumbnail
{
  thumbnail = self->_thumbnail;
  if (!thumbnail)
  {
    double width = self->_originalSize.width;
    double height = self->_originalSize.height;
    BOOL v6 = width < height;
    double v7 = height / width * 256.0;
    double v8 = width / height;
    double v9 = 256.0;
    double v10 = v8 * 256.0;
    if (v6)
    {
      double v9 = v7;
      double v10 = 256.0;
    }

    thumbnail = -[MRImage retainByUser](_GetImage(self, 0LL, 0, 0, 1LL, 1LL, v10, v9, 0.0), "retainByUser");
    self->_thumbnail = thumbnail;
  }

  BOOL v11 = thumbnail;
  objc_sync_exit(self);
  return v11;
}

- (id)thumbnailForFlagsMonochromatic:(BOOL)a3 mipmap:(BOOL)a4 powerOfTwo:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  if (!a3 && !a4 && !a5) {
    return -[MRAssetMaster thumbnail](self, "thumbnail");
  }
  objc_sync_enter(self);
  double width = self->_originalSize.width;
  double height = self->_originalSize.height;
  BOOL v12 = width < height;
  double v13 = height / width * 256.0;
  double v14 = width / height;
  double v15 = 256.0;
  double v16 = v14 * 256.0;
  if (v12)
  {
    double v16 = 256.0;
    double v15 = v13;
  }

  double v17 = _GetImage(self, v7, v6, v5, 1LL, 1LL, v16, v15, 0.0);
  objc_sync_exit(self);
  return v17;
}

- (BOOL)purgeResources
{
  if (!-[NSMutableSet count](self->_unusedPlayers, "count")) {
    return 0;
  }
  players = self->_players;
  objc_sync_enter(players);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  unusedPlayers = self->_unusedPlayers;
  id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( unusedPlayers,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(unusedPlayers);
        }
        id v8 = objc_msgSend( -[NSMutableDictionary allKeysForObject:]( self->_players,  "allKeysForObject:",  *(void *)(*((void *)&v11 + 1) + 8 * (void)i)),  "lastObject");
        if (v8) {
          -[NSMutableDictionary removeObjectForKey:](self->_players, "removeObjectForKey:", v8);
        }
      }

      id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( unusedPlayers,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v5);
  }

  -[NSMutableSet removeAllObjects](self->_unusedPlayers, "removeAllObjects");
  BOOL v9 = -[NSMutableDictionary count](self->_players, "count") == 0LL;
  objc_sync_exit(players);
  return v9;
}

- (MRImageManager)imageManager
{
  return self->_imageManager;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (CGSize)originalSize
{
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (BOOL)isEmbeddedAsset
{
  return self->_isEmbeddedAsset;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (BOOL)isSupportedMovie
{
  return self->_isSupportedMovie;
}

- (NSDictionary)players
{
  return &self->_players->super;
}

@end