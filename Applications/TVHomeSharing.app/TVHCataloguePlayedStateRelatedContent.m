@interface TVHCataloguePlayedStateRelatedContent
+ (TVHCataloguePlayedStateRelatedContent)new;
- (BOOL)hasDisplayableContent;
- (TVHCataloguePlayedStateRelatedContent)init;
- (TVHCataloguePlayedStateRelatedContent)initWithUnplayedMediaEntitiesDataSource:(id)a3 partiallyPlayedMediaEntitiesDataSource:(id)a4;
- (TVHMediaEntitiesDataSource)partiallyPlayedMediaEntitiesDataSource;
- (TVHMediaEntitiesDataSource)unplayedMediaEntitiesDataSource;
- (unint64_t)displayType;
- (unint64_t)mediaEntitiesCount;
@end

@implementation TVHCataloguePlayedStateRelatedContent

+ (TVHCataloguePlayedStateRelatedContent)new
{
  return 0LL;
}

- (TVHCataloguePlayedStateRelatedContent)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHCataloguePlayedStateRelatedContent)initWithUnplayedMediaEntitiesDataSource:(id)a3 partiallyPlayedMediaEntitiesDataSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVHCataloguePlayedStateRelatedContent;
  v9 = -[TVHCataloguePlayedStateRelatedContent init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_unplayedMediaEntitiesDataSource, a3);
    objc_storeStrong((id *)&v10->_partiallyPlayedMediaEntitiesDataSource, a4);
    v10->_displayType = 1LL;
  }

  return v10;
}

- (BOOL)hasDisplayableContent
{
  return -[TVHCataloguePlayedStateRelatedContent mediaEntitiesCount](self, "mediaEntitiesCount") != 0;
}

- (unint64_t)mediaEntitiesCount
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVHCataloguePlayedStateRelatedContent unplayedMediaEntitiesDataSource]( self,  "unplayedMediaEntitiesDataSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mediaEntities]);
  v5 = (char *)[v4 count];

  v6 = (void *)objc_claimAutoreleasedReturnValue( -[TVHCataloguePlayedStateRelatedContent partiallyPlayedMediaEntitiesDataSource]( self,  "partiallyPlayedMediaEntitiesDataSource"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 mediaEntities]);
  id v8 = &v5[(void)[v7 count]];

  return (unint64_t)v8;
}

- (unint64_t)displayType
{
  return self->_displayType;
}

- (TVHMediaEntitiesDataSource)unplayedMediaEntitiesDataSource
{
  return self->_unplayedMediaEntitiesDataSource;
}

- (TVHMediaEntitiesDataSource)partiallyPlayedMediaEntitiesDataSource
{
  return self->_partiallyPlayedMediaEntitiesDataSource;
}

- (void).cxx_destruct
{
}

@end