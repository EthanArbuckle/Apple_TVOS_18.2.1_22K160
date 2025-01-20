@interface TVHMediaEntitiesDataSourceSectionItemCollection
- (NSArray)mediaEntities;
- (NSString)indexTitle;
- (TVHMediaEntitiesDataSourceSectionItemCollection)initWithMediaEntities:(id)a3;
- (void)setIndexTitle:(id)a3;
- (void)setMediaEntities:(id)a3;
@end

@implementation TVHMediaEntitiesDataSourceSectionItemCollection

- (TVHMediaEntitiesDataSourceSectionItemCollection)initWithMediaEntities:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVHMediaEntitiesDataSourceSectionItemCollection;
  v5 = -[TVHMediaEntitiesDataSourceSectionItemCollection init](&v9, "init");
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    mediaEntities = v5->_mediaEntities;
    v5->_mediaEntities = v6;
  }

  return v5;
}

- (NSArray)mediaEntities
{
  return self->_mediaEntities;
}

- (void)setMediaEntities:(id)a3
{
}

- (NSString)indexTitle
{
  return self->_indexTitle;
}

- (void)setIndexTitle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end