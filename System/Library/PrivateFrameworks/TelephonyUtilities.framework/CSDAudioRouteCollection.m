@interface CSDAudioRouteCollection
- (BOOL)_anyRoutePassesTest:(id)a3;
- (BOOL)_setRoutesFromRouteDictionaries:(id)a3;
- (BOOL)hasInEarRouteInTipiWithAndSmartRoutedToCompanionWatch;
- (BOOL)hasInEarRouteInTipiWithCompanionWatch;
- (BOOL)isAirTunesRouteAvailable;
- (BOOL)isAnyPreferredRouteAvailableAndActive;
- (BOOL)isAnyRouteAvailableWithBluetoothEndpointType:(int64_t)a3;
- (BOOL)isAnyRouteAvailableWithUniqueIdentifier:(id)a3;
- (BOOL)isBluetoothRouteAvailable;
- (BOOL)isCarAudioRouteAvailable;
- (BOOL)isInEarAudioRouteAvailable;
- (BOOL)isReceiverRouteAvailable;
- (BOOL)isSpeakerRouteAvailable;
- (BOOL)isWirelessHeadsetRouteAvailable;
- (BOOL)updatePickableRoutes;
- (CSDAudioRouteCollection)initWithCategory:(id)a3 mode:(id)a4;
- (CSDAudioRouteCollection)initWithCategory:(id)a3 mode:(id)a4 routeManager:(id)a5;
- (CSDRouteManager)routeManager;
- (NSArray)routes;
- (NSString)category;
- (NSString)mode;
- (TURoute)preferredAndActiveRoute;
- (TURoute)preferredRoute;
- (id)_routePassingTest:(id)a3;
- (id)description;
- (id)systemController;
- (void)enumerateRoutesInvokingBlock:(id)a3 forRoutesPassingTest:(id)a4;
- (void)setCategory:(id)a3;
- (void)setMode:(id)a3;
- (void)setRoutes:(id)a3;
@end

@implementation CSDAudioRouteCollection

- (CSDAudioRouteCollection)initWithCategory:(id)a3 mode:(id)a4 routeManager:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CSDAudioRouteCollection;
  v11 = -[CSDAudioRouteCollection init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    -[CSDAudioRouteCollection setCategory:](v11, "setCategory:", v8);
    -[CSDAudioRouteCollection setMode:](v12, "setMode:", v9);
    objc_storeWeak((id *)&v12->_routeManager, v10);
  }

  return v12;
}

- (CSDAudioRouteCollection)initWithCategory:(id)a3 mode:(id)a4
{
  return -[CSDAudioRouteCollection initWithCategory:mode:routeManager:]( self,  "initWithCategory:mode:routeManager:",  a3,  a4,  0LL);
}

- (id)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAudioRouteCollection category](self, "category"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAudioRouteCollection mode](self, "mode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p category=%@ mode=%@>",  v3,  self,  v4,  v5));

  return v6;
}

- (TURoute)preferredRoute
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[TURoute predicateForPreferredRoute](&OBJC_CLASS___TURoute, "predicateForPreferredRoute"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAudioRouteCollection _routePassingTest:](self, "_routePassingTest:", v3));

  return (TURoute *)v4;
}

- (TURoute)preferredAndActiveRoute
{
  return (TURoute *)-[CSDAudioRouteCollection _routePassingTest:](self, "_routePassingTest:", &stru_1003DA5B0);
}

- (BOOL)isReceiverRouteAvailable
{
  return -[CSDAudioRouteCollection _anyRoutePassesTest:](self, "_anyRoutePassesTest:", &stru_1003DA5D0);
}

- (BOOL)isSpeakerRouteAvailable
{
  return -[CSDAudioRouteCollection _anyRoutePassesTest:](self, "_anyRoutePassesTest:", &stru_1003DA5F0);
}

- (BOOL)isWirelessHeadsetRouteAvailable
{
  return -[CSDAudioRouteCollection _anyRoutePassesTest:](self, "_anyRoutePassesTest:", &stru_1003DA610);
}

- (BOOL)isAirTunesRouteAvailable
{
  return -[CSDAudioRouteCollection _anyRoutePassesTest:](self, "_anyRoutePassesTest:", &stru_1003DA630);
}

- (BOOL)isCarAudioRouteAvailable
{
  return -[CSDAudioRouteCollection _anyRoutePassesTest:](self, "_anyRoutePassesTest:", &stru_1003DA650);
}

- (BOOL)isBluetoothRouteAvailable
{
  return -[CSDAudioRouteCollection _anyRoutePassesTest:](self, "_anyRoutePassesTest:", &stru_1003DA670);
}

- (BOOL)isAnyRouteAvailableWithBluetoothEndpointType:(int64_t)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10010F570;
  v4[3] = &unk_1003DA690;
  v4[4] = a3;
  return -[CSDAudioRouteCollection _anyRoutePassesTest:](self, "_anyRoutePassesTest:", v4);
}

- (BOOL)isAnyRouteAvailableWithUniqueIdentifier:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10010F620;
  v6[3] = &unk_1003DA6B8;
  id v7 = a3;
  id v4 = v7;
  LOBYTE(self) = -[CSDAudioRouteCollection _anyRoutePassesTest:](self, "_anyRoutePassesTest:", v6);

  return (char)self;
}

- (BOOL)isAnyPreferredRouteAvailableAndActive
{
  return -[CSDAudioRouteCollection _anyRoutePassesTest:](self, "_anyRoutePassesTest:", &stru_1003DA5B0);
}

- (BOOL)isInEarAudioRouteAvailable
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[TURoute predicateForInEarAudioRoute](&OBJC_CLASS___TURoute, "predicateForInEarAudioRoute"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAudioRouteCollection _routePassingTest:](self, "_routePassingTest:", v3));
  LOBYTE(self) = v4 != 0LL;

  return (char)self;
}

- (BOOL)hasInEarRouteInTipiWithCompanionWatch
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[TURoute predicateForInEarRouteInTipiWithCompanionWatch]( &OBJC_CLASS___TURoute,  "predicateForInEarRouteInTipiWithCompanionWatch"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAudioRouteCollection _routePassingTest:](self, "_routePassingTest:", v3));
  LOBYTE(self) = v4 != 0LL;

  return (char)self;
}

- (BOOL)hasInEarRouteInTipiWithAndSmartRoutedToCompanionWatch
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[TURoute predicateForInEarRouteInTipiWithAndSmartRoutedToCompanionWatch]( &OBJC_CLASS___TURoute,  "predicateForInEarRouteInTipiWithAndSmartRoutedToCompanionWatch"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAudioRouteCollection _routePassingTest:](self, "_routePassingTest:", v3));
  LOBYTE(self) = v4 != 0LL;

  return (char)self;
}

- (void)enumerateRoutesInvokingBlock:(id)a3 forRoutesPassingTest:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v8 && v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAudioRouteCollection routes](self, "routes"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10010F824;
    v9[3] = &unk_1003DA6E0;
    id v10 = v6;
    id v11 = v8;
    [v7 enumerateObjectsUsingBlock:v9];
  }
}

- (id)_routePassingTest:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  id v11 = sub_10010F95C;
  v12 = sub_10010F96C;
  id v13 = 0LL;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10010F974;
  v7[3] = &unk_1003DA708;
  v7[4] = &v8;
  -[CSDAudioRouteCollection enumerateRoutesInvokingBlock:forRoutesPassingTest:]( self,  "enumerateRoutesInvokingBlock:forRoutesPassingTest:",  v7,  v4);
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (BOOL)_anyRoutePassesTest:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10010FA60;
  v6[3] = &unk_1003DA708;
  void v6[4] = &v7;
  -[CSDAudioRouteCollection enumerateRoutesInvokingBlock:forRoutesPassingTest:]( self,  "enumerateRoutesInvokingBlock:forRoutesPassingTest:",  v6,  v4);
  LOBYTE(self) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)self;
}

- (BOOL)updatePickableRoutes
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAudioRouteCollection mode](self, "mode"));

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAudioRouteCollection systemController](self, "systemController"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAudioRouteCollection category](self, "category"));
  if (v3)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAudioRouteCollection mode](self, "mode"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 pickableRoutesForCategory:v5 andMode:v6]);
  }

  else
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 pickableRoutesForCategory:v5]);
  }

  BOOL v8 = -[CSDAudioRouteCollection _setRoutesFromRouteDictionaries:](self, "_setRoutesFromRouteDictionaries:", v7);
  return v8;
}

- (BOOL)_setRoutesFromRouteDictionaries:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = *(const char **)(*((void *)&v20 + 1) + 8LL * (void)i);
        id v11 = [[TUAudioRoute alloc] initWithDictionary:v10];
        if (v11)
        {
          [v4 addObject:v11];
        }

        else
        {
          id v12 = sub_1001704C4();
          id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v25 = v10;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[WARN] Unable to create audio route from route dictionary: %@",  buf,  0xCu);
          }
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }

    while (v7);
  }

  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAudioRouteCollection routes](self, "routes"));
  unsigned __int8 v15 = [v4 isEqual:v14];

  if ((v15 & 1) == 0)
  {
    id v16 = sub_1001704C4();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[CSDAudioRouteCollection _setRoutesFromRouteDictionaries:]";
      __int16 v26 = 2112;
      v27 = v4;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
    }

    -[CSDAudioRouteCollection setRoutes:](self, "setRoutes:", v4);
  }

  return v15 ^ 1;
}

- (id)systemController
{
  return +[AVSystemController sharedAVSystemController](&OBJC_CLASS___AVSystemController, "sharedAVSystemController");
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (NSString)mode
{
  return self->_mode;
}

- (void)setMode:(id)a3
{
}

- (NSArray)routes
{
  return self->_routes;
}

- (void)setRoutes:(id)a3
{
}

- (CSDRouteManager)routeManager
{
  return (CSDRouteManager *)objc_loadWeakRetained((id *)&self->_routeManager);
}

- (void).cxx_destruct
{
}

@end