@interface TVMusicMPModelImageProxy
- (BOOL)isEqual:(id)a3;
- (CGSize)expectedSize;
- (TVMusicMPModelImageProxy)initWithMPObject:(id)a3;
@end

@implementation TVMusicMPModelImageProxy

- (TVMusicMPModelImageProxy)initWithMPObject:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPArtworkCatalogLoader sharedInstance]( &OBJC_CLASS___TVMusicMPArtworkCatalogLoader,  "sharedInstance"));
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVMusicMPModelImageProxy;
  v6 = -[TVMusicMPModelImageProxy initWithObject:imageLoader:groupType:]( &v8,  "initWithObject:imageLoader:groupType:",  v4,  v5,  0LL);

  if (v6) {
    -[TVMusicMPModelImageProxy setWriteToAssetLibrary:](v6, "setWriteToAssetLibrary:", 0LL);
  }
  return v6;
}

- (CGSize)expectedSize
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVMusicMPModelImageProxy;
  -[TVMusicMPModelImageProxy expectedSize](&v13, "expectedSize");
  double v5 = v4;
  double v6 = v3;
  if (v4 == CGSizeZero.width && v3 == CGSizeZero.height)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPModelImageProxy imageLoader](self, "imageLoader"));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPArtworkCatalogLoader sharedInstance]( &OBJC_CLASS___TVMusicMPArtworkCatalogLoader,  "sharedInstance"));
    BOOL v10 = v8 == v9;

    if (v10)
    {
      double v5 = 600.0;
      double v6 = 600.0;
    }
  }

  double v11 = v5;
  double v12 = v6;
  result.height = v12;
  result.width = v11;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___TVImageProxy, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___MPModelObject, v8);
    if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
    {
      BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPModelImageProxy object](self, "object"));
      double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifiers]);
      double v12 = (void *)objc_claimAutoreleasedReturnValue([v7 identifiers]);
      unsigned __int8 v13 = [v11 isEqual:v12];
    }

    else
    {
      char v14 = objc_opt_respondsToSelector(v7, "isEqual:");
      uint64_t v15 = objc_claimAutoreleasedReturnValue(-[TVMusicMPModelImageProxy object](self, "object"));
      BOOL v10 = (void *)v15;
      if ((v14 & 1) != 0) {
        unsigned __int8 v13 = [v7 isEqual:v15];
      }
      else {
        unsigned __int8 v13 = v7 == (void *)v15;
      }
    }
  }

  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

@end