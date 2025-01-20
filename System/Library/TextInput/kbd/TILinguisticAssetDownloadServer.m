@interface TILinguisticAssetDownloadServer
+ (id)_dispatchQueue;
+ (id)sharedServer;
+ (int64_t)serverResultForAssetManagerResult:(int64_t)a3;
- (BOOL)isStarted;
- (void)addLinguisticAssetsAssertionForLanguage:(id)a3 assertionID:(id)a4 region:(id)a5 clientID:(id)a6 withHandler:(id)a7;
- (void)fetchAssetUpdateStatusForInputModeIdentifier:(id)a3 callback:(id)a4;
- (void)removeLinguisticAssetsAssertionWithIdentifier:(id)a3 forClientID:(id)a4 withHandler:(id)a5;
- (void)requestLinguisticAssetsForLanguage:(id)a3 completion:(id)a4;
- (void)start;
- (void)stop;
- (void)updateAssetForInputModeIdentifier:(id)a3 callback:(id)a4;
@end

@implementation TILinguisticAssetDownloadServer

+ (id)sharedServer
{
  if (qword_10001E280 != -1) {
    dispatch_once(&qword_10001E280, &stru_1000149D8);
  }
  return (id)qword_10001E278;
}

+ (id)_dispatchQueue
{
  if (qword_10001E290 != -1) {
    dispatch_once(&qword_10001E290, &stru_1000149F8);
  }
  return (id)qword_10001E288;
}

- (void)start
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TILinguisticAssetDownloadServer _dispatchQueue]( &OBJC_CLASS___TILinguisticAssetDownloadServer,  "_dispatchQueue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100008488;
  v4[3] = &unk_1000148D0;
  v4[4] = self;
  TIDispatchAsync(v3, v4);
}

- (void)stop
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TILinguisticAssetDownloadServer _dispatchQueue]( &OBJC_CLASS___TILinguisticAssetDownloadServer,  "_dispatchQueue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10000850C;
  v4[3] = &unk_1000148D0;
  v4[4] = self;
  TIDispatchAsync(v3, v4);
}

+ (int64_t)serverResultForAssetManagerResult:(int64_t)a3
{
  else {
    return a3;
  }
}

- (void)requestLinguisticAssetsForLanguage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[TILinguisticAssetDownloadServer _dispatchQueue]( &OBJC_CLASS___TILinguisticAssetDownloadServer,  "_dispatchQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000085E8;
  v11[3] = &unk_100014A48;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  TIDispatchAsync(v8, v11);
}

- (void)addLinguisticAssetsAssertionForLanguage:(id)a3 assertionID:(id)a4 region:(id)a5 clientID:(id)a6 withHandler:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = (id)objc_claimAutoreleasedReturnValue(+[TIAssetManager sharedAssetManager](&OBJC_CLASS___TIAssetManager, "sharedAssetManager"));
  [v16 addLinguisticAssetsAssertionForLanguage:v15 assertionID:v14 region:v13 clientID:v12 withHandler:v11];
}

- (void)removeLinguisticAssetsAssertionWithIdentifier:(id)a3 forClientID:(id)a4 withHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[TIAssetManager sharedAssetManager](&OBJC_CLASS___TIAssetManager, "sharedAssetManager"));
  [v10 removeLinguisticAssetsAssertionWithIdentifier:v9 forClientID:v8 withHandler:v7];
}

- (void)fetchAssetUpdateStatusForInputModeIdentifier:(id)a3 callback:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[TIAssetManager sharedAssetManager](&OBJC_CLASS___TIAssetManager, "sharedAssetManager"));
  [v7 fetchAssetUpdateStatusForInputModeIdentifier:v6 callback:v5];
}

- (void)updateAssetForInputModeIdentifier:(id)a3 callback:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[TIAssetManager sharedAssetManager](&OBJC_CLASS___TIAssetManager, "sharedAssetManager"));
  [v7 updateAssetForInputModeIdentifier:v6 callback:v5];
}

- (BOOL)isStarted
{
  return self->_isStarted;
}

@end