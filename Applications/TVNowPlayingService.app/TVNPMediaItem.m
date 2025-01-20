@interface TVNPMediaItem
- (TVNPDataImageLoader)imageLoader;
- (id)mediaItemMetadataForProperty:(id)a3;
- (void)replaceMediaItemMetadata:(id)a3 forProperty:(id)a4;
- (void)setImageLoader:(id)a3;
@end

@implementation TVNPMediaItem

- (void)replaceMediaItemMetadata:(id)a3 forProperty:(id)a4
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  objc_storeStrong(&v5, a4);
  if (location[0]) {
    -[TVNPMediaItem setMediaItemMetadata:forProperty:](v7, "setMediaItemMetadata:forProperty:", location[0], v5);
  }
  else {
    -[TVNPMediaItem removeMediaItemMetadataForProperty:](v7, "removeMediaItemMetadataForProperty:", v5);
  }
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)mediaItemMetadataForProperty:(id)a3
{
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v10.receiver = v13;
  v10.super_class = (Class)&OBJC_CLASS___TVNPMediaItem;
  id v11 = -[TVNPMediaItem mediaItemMetadataForProperty:](&v10, "mediaItemMetadataForProperty:", location[0]);
  if (!v11)
  {
    if ([location[0] isEqualToString:TVPMediaItemMetadataMediaType])
    {
      objc_storeStrong(&v11, TVPMediaTypeMusic);
    }

    else if ([location[0] isEqualToString:TVPMediaItemMetadataArtworkImageProxy])
    {
      id v5 = objc_alloc(&OBJC_CLASS___TVImageProxy);
      v8 = -[TVNPMediaItem imageLoader](v13, "imageLoader");
      v7 = -[TVNPDataImageLoader imageIdentifier](v8, "imageIdentifier");
      v6 = -[TVNPMediaItem imageLoader](v13, "imageLoader");
      id v9 = objc_msgSend(v5, "initWithObject:imageLoader:groupType:", v7);

      [v9 setCacheOnLoad:0];
      [v9 setWriteToAssetLibrary:0];
      objc_storeStrong(&v11, v9);
      objc_storeStrong(&v9, 0LL);
    }
  }

  id v4 = v11;
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(location, 0LL);
  return v4;
}

- (TVNPDataImageLoader)imageLoader
{
  return self->_imageLoader;
}

- (void)setImageLoader:(id)a3
{
}

- (void).cxx_destruct
{
}

@end