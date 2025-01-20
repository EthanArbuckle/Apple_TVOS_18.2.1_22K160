@interface TVHMediaEntitiesDataSourceItemCollectionDescriptor
+ (id)new;
- (NSString)fetchResultIdentifier;
- (NSString)title;
- (TVHMediaEntitiesDataSourceItemCollectionDescriptor)init;
- (TVHMediaEntitiesDataSourceItemCollectionDescriptor)initWithFetchResultIdentifier:(id)a3;
- (id)description;
- (void)setTitle:(id)a3;
@end

@implementation TVHMediaEntitiesDataSourceItemCollectionDescriptor

+ (id)new
{
  return 0LL;
}

- (TVHMediaEntitiesDataSourceItemCollectionDescriptor)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHMediaEntitiesDataSourceItemCollectionDescriptor)initWithFetchResultIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVHMediaEntitiesDataSourceItemCollectionDescriptor;
  v5 = -[TVHMediaEntitiesDataSourceItemCollectionDescriptor init](&v9, "init");
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    fetchResultIdentifier = v5->_fetchResultIdentifier;
    v5->_fetchResultIdentifier = v6;
  }

  return v5;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesDataSourceItemCollectionDescriptor fetchResultIdentifier]( self,  "fetchResultIdentifier"));
  [v3 appendString:v4 withName:@"fetchResultIdentifier"];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesDataSourceItemCollectionDescriptor title](self, "title"));
  [v3 appendString:v5 withName:@"title"];

  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);
  return v6;
}

- (NSString)fetchResultIdentifier
{
  return self->_fetchResultIdentifier;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end