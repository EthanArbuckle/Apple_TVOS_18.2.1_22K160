@interface ADSAEAssetsAvailabilityObserver
- (ADSAEAssetsAvailabilityObserver)init;
- (ADSAEAssetsAvailabilityObserver)initWithGMAvailabilityWrapperClass:(Class)a3;
- (BOOL)saeAssetsForCurrentLocaleAvailable;
- (void)assetManager:(id)a3 didChangeLanguageCode:(id)a4;
- (void)assetManagerDidChangeAssetAvailability:(id)a3;
- (void)refreshAssetsAvailabilityWithAssetManager:(id)a3;
- (void)setSaeAssetsForCurrentLocaleAvailable:(BOOL)a3;
@end

@implementation ADSAEAssetsAvailabilityObserver

- (ADSAEAssetsAvailabilityObserver)initWithGMAvailabilityWrapperClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ADSAEAssetsAvailabilityObserver;
  result = -[ADSAEAssetsAvailabilityObserver init](&v5, "init");
  if (result) {
    result->_gmAvailabilityWrapperClass = a3;
  }
  return result;
}

- (ADSAEAssetsAvailabilityObserver)init
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x2050000000LL;
  v3 = (void *)qword_100577FD8;
  uint64_t v10 = qword_100577FD8;
  if (!qword_100577FD8)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10017CE78;
    v6[3] = &unk_1004FDB20;
    v6[4] = &v7;
    sub_10017CE78((uint64_t)v6);
    v3 = (void *)v8[3];
  }

  id v4 = v3;
  _Block_object_dispose(&v7, 8);
  return -[ADSAEAssetsAvailabilityObserver initWithGMAvailabilityWrapperClass:]( self,  "initWithGMAvailabilityWrapperClass:",  v4);
}

- (void)refreshAssetsAvailabilityWithAssetManager:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 languageCode]);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10017CBC4;
  v8[3] = &unk_1004FD4E8;
  id v9 = v6;
  uint64_t v10 = self;
  id v7 = v6;
  [v4 fetchAssetsAvailabilityForLanguage:v7 completion:v8];
}

- (void)assetManagerDidChangeAssetAvailability:(id)a3
{
}

- (void)assetManager:(id)a3 didChangeLanguageCode:(id)a4
{
}

- (BOOL)saeAssetsForCurrentLocaleAvailable
{
  return self->_saeAssetsForCurrentLocaleAvailable;
}

- (void)setSaeAssetsForCurrentLocaleAvailable:(BOOL)a3
{
  self->_saeAssetsForCurrentLocaleAvailable = a3;
}

@end