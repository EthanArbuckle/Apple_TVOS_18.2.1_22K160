@interface CSTrialAssetManager
+ (id)sharedInstance;
- (CSTrialAssetManager)init;
- (void)_getSiriAttAssetsForType:(unint64_t)a3 forLocale:(id)a4 completion:(id)a5;
- (void)getInstalledAssetofType:(unint64_t)a3 forLocale:(id)a4 completion:(id)a5;
@end

@implementation CSTrialAssetManager

- (CSTrialAssetManager)init
{
  if ((+[CSUtils isDarwinOS](&OBJC_CLASS___CSUtils, "isDarwinOS") & 1) != 0)
  {
    v3 = 0LL;
  }

  else
  {
    v21.receiver = self;
    v21.super_class = (Class)&OBJC_CLASS___CSTrialAssetManager;
    v4 = -[CSTrialAssetManager init](&v21, "init");
    if (v4)
    {
      v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      if (+[CSUtils supportTrialMitigationAssets](&OBJC_CLASS___CSUtils, "supportTrialMitigationAssets")) {
        v6 = +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  &off_100238E20,  &off_100238E38,  0LL);
      }
      else {
        v6 = +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  &off_100238E50,  &off_100238E68,  0LL);
      }
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      id v7 = (id)objc_claimAutoreleasedReturnValue(v6);
      id v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v18;
        do
        {
          for (i = 0LL; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v18 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = [*(id *)(*((void *)&v17 + 1) + 8 * (void)i) unsignedIntegerValue];
            v15[0] = _NSConcreteStackBlock;
            v15[1] = 3221225472LL;
            v15[2] = sub_10012EF34;
            v15[3] = &unk_10022E180;
            v16 = v5;
            +[CSUtils getTrialIdsForAssetType:withCompletion:]( &OBJC_CLASS___CSUtils,  "getTrialIdsForAssetType:withCompletion:",  v12,  v15);
          }

          id v9 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
        }

        while (v9);
      }

      trialClientDict = v4->_trialClientDict;
      v4->_trialClientDict = v5;
    }

    self = v4;
    v3 = self;
  }

  return v3;
}

- (void)_getSiriAttAssetsForType:(unint64_t)a3 forLocale:(id)a4 completion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10012E9E8;
  v9[3] = &unk_10022E1D0;
  v9[4] = self;
  id v10 = a4;
  id v11 = a5;
  unint64_t v12 = a3;
  id v7 = v11;
  id v8 = v10;
  +[CSUtils getTrialIdsForAssetType:withCompletion:]( &OBJC_CLASS___CSUtils,  "getTrialIdsForAssetType:withCompletion:",  a3,  v9);
}

- (void)getInstalledAssetofType:(unint64_t)a3 forLocale:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (a3 != 6 && a3)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10012E594;
    v11[3] = &unk_10022E1F8;
    v11[4] = self;
    id v12 = v9;
    unint64_t v13 = a3;
    +[CSUtils getTrialIdsForAssetType:withCompletion:]( &OBJC_CLASS___CSUtils,  "getTrialIdsForAssetType:withCompletion:",  a3,  v11);
  }

  else
  {
    -[CSTrialAssetManager _getSiriAttAssetsForType:forLocale:completion:]( self,  "_getSiriAttAssetsForType:forLocale:completion:",  a3,  v8,  v9);
  }
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_100280190 != -1) {
    dispatch_once(&qword_100280190, &stru_10022E158);
  }
  return (id)qword_100280188;
}

@end