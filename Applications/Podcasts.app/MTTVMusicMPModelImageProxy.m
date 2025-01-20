@interface MTTVMusicMPModelImageProxy
- (BOOL)isEqual:(id)a3;
- (CGSize)expectedSize;
- (MTTVMusicMPModelImageProxy)initWithMPObject:(id)a3;
@end

@implementation MTTVMusicMPModelImageProxy

- (MTTVMusicMPModelImageProxy)initWithMPObject:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[MTTVMusicMPArtworkCatalogLoader sharedInstance]( &OBJC_CLASS___MTTVMusicMPArtworkCatalogLoader,  "sharedInstance"));
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTTVMusicMPModelImageProxy;
  v6 = -[MTTVMusicMPModelImageProxy initWithObject:imageLoader:groupType:]( &v8,  "initWithObject:imageLoader:groupType:",  v4,  v5,  0LL);

  if (v6) {
    -[MTTVMusicMPModelImageProxy setWriteToAssetLibrary:](v6, "setWriteToAssetLibrary:", 0LL);
  }
  return v6;
}

- (CGSize)expectedSize
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MTTVMusicMPModelImageProxy;
  -[MTTVMusicMPModelImageProxy expectedSize](&v13, "expectedSize");
  double v5 = v4;
  double v6 = v3;
  if (v4 == CGSizeZero.width && v3 == CGSizeZero.height)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicMPModelImageProxy imageLoader](self, "imageLoader"));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[MTTVMusicMPArtworkCatalogLoader sharedInstance]( &OBJC_CLASS___MTTVMusicMPArtworkCatalogLoader,  "sharedInstance"));
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
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVImageProxy);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___MPModelObject);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    {
      objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicMPModelImageProxy object](self, "object"));
      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifiers]);
      BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v6 identifiers]);
      unsigned __int8 v11 = [v9 isEqual:v10];
    }

    else
    {
      char v12 = objc_opt_respondsToSelector(v6, "isEqual:");
      uint64_t v13 = objc_claimAutoreleasedReturnValue(-[MTTVMusicMPModelImageProxy object](self, "object"));
      objc_super v8 = (void *)v13;
      if ((v12 & 1) != 0) {
        unsigned __int8 v11 = [v6 isEqual:v13];
      }
      else {
        unsigned __int8 v11 = v6 == (void *)v13;
      }
    }
  }

  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

@end