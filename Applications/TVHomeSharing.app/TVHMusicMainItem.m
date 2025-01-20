@interface TVHMusicMainItem
+ (id)new;
- (NSString)identifier;
- (NSString)title;
- (TVHMediaEntitiesFetchViewController)mediaEntitiesFetchViewController;
- (TVHMusicMainItem)init;
- (TVHMusicMainItem)initWithTitle:(id)a3 mediaEntitiesFetchViewControllerBlock:(id)a4;
- (id)mediaEntitiesFetchViewControllerBlock;
- (void)setMediaEntitiesFetchViewControllerBlock:(id)a3;
@end

@implementation TVHMusicMainItem

+ (id)new
{
  return 0LL;
}

- (TVHMusicMainItem)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHMusicMainItem)initWithTitle:(id)a3 mediaEntitiesFetchViewControllerBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TVHMusicMainItem;
  v8 = -[TVHMusicMainItem init](&v17, "init");
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 UUIDString]);
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v10;

    v12 = (NSString *)[v6 copy];
    title = v8->_title;
    v8->_title = v12;

    id v14 = [v7 copy];
    id mediaEntitiesFetchViewControllerBlock = v8->_mediaEntitiesFetchViewControllerBlock;
    v8->_id mediaEntitiesFetchViewControllerBlock = v14;
  }

  return v8;
}

- (TVHMediaEntitiesFetchViewController)mediaEntitiesFetchViewController
{
  mediaEntitiesFetchViewController = self->_mediaEntitiesFetchViewController;
  if (!mediaEntitiesFetchViewController)
  {
    v4 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue( -[TVHMusicMainItem mediaEntitiesFetchViewControllerBlock]( self,  "mediaEntitiesFetchViewControllerBlock"));
    uint64_t v5 = v4[2]();
    id v6 = (TVHMediaEntitiesFetchViewController *)objc_claimAutoreleasedReturnValue(v5);
    id v7 = self->_mediaEntitiesFetchViewController;
    self->_mediaEntitiesFetchViewController = v6;

    -[TVHMusicMainItem setMediaEntitiesFetchViewControllerBlock:]( self,  "setMediaEntitiesFetchViewControllerBlock:",  0LL);
    mediaEntitiesFetchViewController = self->_mediaEntitiesFetchViewController;
  }

  return mediaEntitiesFetchViewController;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (id)mediaEntitiesFetchViewControllerBlock
{
  return self->_mediaEntitiesFetchViewControllerBlock;
}

- (void)setMediaEntitiesFetchViewControllerBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end