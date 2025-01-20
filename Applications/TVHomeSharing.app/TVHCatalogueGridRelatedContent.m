@interface TVHCatalogueGridRelatedContent
+ (TVHCatalogueGridRelatedContent)new;
- (BOOL)hasDisplayableContent;
- (TVHCatalogueGridRelatedContent)init;
- (TVHCatalogueGridRelatedContent)initWithMediaEntitiesDataSource:(id)a3;
- (TVHMediaEntitiesDataSource)mediaEntitiesDataSource;
- (unint64_t)displayType;
- (unint64_t)mediaEntitiesCount;
@end

@implementation TVHCatalogueGridRelatedContent

+ (TVHCatalogueGridRelatedContent)new
{
  return 0LL;
}

- (TVHCatalogueGridRelatedContent)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHCatalogueGridRelatedContent)initWithMediaEntitiesDataSource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVHCatalogueGridRelatedContent;
  v6 = -[TVHCatalogueGridRelatedContent init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mediaEntitiesDataSource, a3);
    v7->_displayType = 0LL;
  }

  return v7;
}

- (BOOL)hasDisplayableContent
{
  return -[TVHCatalogueGridRelatedContent mediaEntitiesCount](self, "mediaEntitiesCount") != 0;
}

- (unint64_t)mediaEntitiesCount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueGridRelatedContent mediaEntitiesDataSource](self, "mediaEntitiesDataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 mediaEntities]);
  id v4 = [v3 count];

  return (unint64_t)v4;
}

- (unint64_t)displayType
{
  return self->_displayType;
}

- (TVHMediaEntitiesDataSource)mediaEntitiesDataSource
{
  return self->_mediaEntitiesDataSource;
}

- (void).cxx_destruct
{
}

@end