@interface PBBlockSystemOverlayUIProvider
- (PBBlockSystemOverlayUIProvider)initWithBlock:(id)a3;
- (id)providerBlock;
- (void)prepareUIForSystemOverlayPresentationWithCompletion:(id)a3;
@end

@implementation PBBlockSystemOverlayUIProvider

- (PBBlockSystemOverlayUIProvider)initWithBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PBBlockSystemOverlayUIProvider;
  v5 = -[PBBlockSystemOverlayUIProvider init](&v9, "init");
  if (v5)
  {
    id v6 = [v4 copy];
    id providerBlock = v5->_providerBlock;
    v5->_id providerBlock = v6;
  }

  return v5;
}

- (void)prepareUIForSystemOverlayPresentationWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, void *))a3;
  uint64_t v5 = (*((uint64_t (**)(void))self->_providerBlock + 2))();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v6) {
    v7 = 0LL;
  }
  else {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.PineBoard.PBSystemOverlayUIProvider",  100LL,  0LL));
  }
  v4[2](v4, v6, v7);
}

- (id)providerBlock
{
  return self->_providerBlock;
}

- (void).cxx_destruct
{
}

@end