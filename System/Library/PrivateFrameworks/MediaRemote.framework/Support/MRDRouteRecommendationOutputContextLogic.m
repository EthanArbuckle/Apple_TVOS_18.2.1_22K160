@interface MRDRouteRecommendationOutputContextLogic
- (BOOL)localOutputContextHasDeviceOfType:(unsigned int)a3;
- (NSDictionary)localOutputContextDeviceTypesCount;
- (id)_localOutputContextDeviceTypesCount;
- (void)reloadOutputContextData;
- (void)setLocalOutputContextDeviceTypesCount:(id)a3;
@end

@implementation MRDRouteRecommendationOutputContextLogic

- (BOOL)localOutputContextHasDeviceOfType:(unsigned int)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MRAVLocalEndpoint sharedLocalEndpoint](&OBJC_CLASS___MRAVLocalEndpoint, "sharedLocalEndpoint"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 outputDevices]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000F1D04;
  v8[3] = &unk_1003A0748;
  unsigned int v9 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "msv_firstWhere:", v8));
  LOBYTE(a3) = v6 != 0LL;

  return a3;
}

- (void)reloadOutputContextData
{
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MRAVLocalEndpoint sharedLocalEndpoint](&OBJC_CLASS___MRAVLocalEndpoint, "sharedLocalEndpoint", 0LL));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 outputDevices]);

  id v5 = [v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v5)
  {
    id v6 = v5;
    LODWORD(v7) = 0;
    LODWORD(v8) = 0;
    LODWORD(v9) = 0;
    LODWORD(v10) = 0;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v4);
        }
        v13 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        else {
          uint64_t v10 = v10;
        }
        else {
          uint64_t v7 = v7;
        }
        else {
          uint64_t v8 = v8;
        }
        else {
          uint64_t v9 = v9;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }

    while (v6);
  }

  else
  {
    uint64_t v7 = 0LL;
    uint64_t v8 = 0LL;
    uint64_t v9 = 0LL;
    uint64_t v10 = 0LL;
  }

  v24[0] = &off_1003BB6D8;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v10));
  v25[0] = v14;
  v24[1] = &off_1003BB6F0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v7));
  v25[1] = v15;
  v24[2] = &off_1003BB708;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v8));
  v25[2] = v16;
  v24[3] = &off_1003BB720;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v9));
  v25[3] = v17;
  v18 = (NSDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v25,  v24,  4LL));
  localOutputContextDeviceTypesCount = self->_localOutputContextDeviceTypesCount;
  self->_localOutputContextDeviceTypesCount = v18;
}

- (id)_localOutputContextDeviceTypesCount
{
  localOutputContextDeviceTypesCount = self->_localOutputContextDeviceTypesCount;
  if (!localOutputContextDeviceTypesCount)
  {
    -[MRDRouteRecommendationOutputContextLogic reloadOutputContextData](self, "reloadOutputContextData");
    localOutputContextDeviceTypesCount = self->_localOutputContextDeviceTypesCount;
  }

  return localOutputContextDeviceTypesCount;
}

- (NSDictionary)localOutputContextDeviceTypesCount
{
  return self->_localOutputContextDeviceTypesCount;
}

- (void)setLocalOutputContextDeviceTypesCount:(id)a3
{
}

- (void).cxx_destruct
{
}

@end