@interface TVSSFaceTimeMenuModeStateContributor
- (NSString)cachedPlatterState;
- (TVSSFaceTimeMenuModeStateContributor)init;
- (TVSSFaceTimePlatterBackingStore)backingStore;
- (TVSSMenuModeStateContributingDelegate)contributorDelegate;
- (void)faceTimePlatterBackingStoreDidChange:(id)a3;
- (void)setCachedPlatterState:(id)a3;
- (void)setContributorDelegate:(id)a3;
- (void)updateMenuModeState:(id)a3;
@end

@implementation TVSSFaceTimeMenuModeStateContributor

- (TVSSFaceTimeMenuModeStateContributor)init
{
  SEL v9 = a2;
  v10 = 0LL;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVSSFaceTimeMenuModeStateContributor;
  v10 = -[TVSSFaceTimeMenuModeStateContributor init](&v8, "init");
  objc_storeStrong((id *)&v10, v10);
  if (v10)
  {
    v2 = objc_alloc_init(&OBJC_CLASS___TVSSFaceTimePlatterBackingStore);
    backingStore = v10->_backingStore;
    v10->_backingStore = v2;

    -[TVSSFaceTimePlatterBackingStore setDelegate:](v10->_backingStore, "setDelegate:", v10);
    v4 = (NSString *)-[TVSSFaceTimePlatterBackingStore platterState](v10->_backingStore, "platterState");
    cachedPlatterState = v10->_cachedPlatterState;
    v10->_cachedPlatterState = v4;
  }

  v7 = v10;
  objc_storeStrong((id *)&v10, 0LL);
  return v7;
}

- (void)setCachedPlatterState:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if ((BSEqualObjects(v7->_cachedPlatterState, location[0]) & 1) == 0)
  {
    v3 = (NSString *)[location[0] copy];
    cachedPlatterState = v7->_cachedPlatterState;
    v7->_cachedPlatterState = v3;

    v5 = -[TVSSFaceTimeMenuModeStateContributor contributorDelegate](v7, "contributorDelegate");
    -[TVSSMenuModeStateContributingDelegate stateContributorHasUpdate:](v5, "stateContributorHasUpdate:", v7);
  }

  objc_storeStrong(location, 0LL);
}

- (void)updateMenuModeState:(id)a3
{
  objc_super v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = -[TVSSFaceTimeMenuModeStateContributor cachedPlatterState](v8, "cachedPlatterState");
  unsigned int v4 = !-[NSString isEqualToString:](v3, "isEqualToString:", @"NoConversations");

  [location[0] setFaceTimeActive:v4 & 1];
  id v5 = location[0];
  id v6 = -[NSString copy](v8->_cachedPlatterState, "copy");
  objc_msgSend(v5, "setFaceTimePlatterState:");

  objc_storeStrong(location, 0LL);
}

- (void)faceTimePlatterBackingStoreDidChange:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = [location[0] platterState];
  -[TVSSFaceTimeMenuModeStateContributor setCachedPlatterState:](v5, "setCachedPlatterState:");

  objc_storeStrong(location, 0LL);
}

- (TVSSMenuModeStateContributingDelegate)contributorDelegate
{
  return (TVSSMenuModeStateContributingDelegate *)objc_loadWeakRetained((id *)&self->contributorDelegate);
}

- (void)setContributorDelegate:(id)a3
{
}

- (TVSSFaceTimePlatterBackingStore)backingStore
{
  return self->_backingStore;
}

- (NSString)cachedPlatterState
{
  return self->_cachedPlatterState;
}

- (void).cxx_destruct
{
}

@end