@interface WiFiColocatedNetworkManager
- (CWFScanResult)joinedNetwork;
- (NSArray)colocatedNetworks;
- (WiFiColocatedNetworkManager)init;
- (WiFiColocatedNetworkManager)initWithNetwork:(id)a3 colocatedNetworks:(id)a4;
- (id)_reduceNumberOfCandidatesTo:(unint64_t)a3 on:(unsigned int)a4;
- (id)retrieveNextCandidate;
- (unint64_t)numberOfCandidates;
- (void)_reduceNetworks;
- (void)setColocatedNetworks:(id)a3;
- (void)setJoinedNetwork:(id)a3;
@end

@implementation WiFiColocatedNetworkManager

- (WiFiColocatedNetworkManager)init
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  @"-[WiFiColocatedNetworkManager init] unavailable",  0LL));
  objc_exception_throw(v2);
  return -[WiFiColocatedNetworkManager initWithNetwork:colocatedNetworks:](v3, v4, v5, v6);
}

- (WiFiColocatedNetworkManager)initWithNetwork:(id)a3 colocatedNetworks:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_autoreleasePoolPush();
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___WiFiColocatedNetworkManager;
  v9 = -[WiFiColocatedNetworkManager init](&v13, "init");
  v10 = v9;
  if (v9)
  {
    -[WiFiColocatedNetworkManager setColocatedNetworks:](v9, "setColocatedNetworks:", v7);
    -[WiFiColocatedNetworkManager setJoinedNetwork:](v10, "setJoinedNetwork:", v6);
    -[WiFiColocatedNetworkManager _reduceNetworks](v10, "_reduceNetworks");
  }

  v11 = v10;
  objc_autoreleasePoolPop(v8);

  return v11;
}

- (unint64_t)numberOfCandidates
{
  return -[NSArray count](self->_colocatedNetworks, "count");
}

- (id)retrieveNextCandidate
{
  v3 = -[NSMutableArray initWithArray:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithArray:",  self->_colocatedNetworks);
  SEL v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](v3, "lastObject"));
  -[NSMutableArray removeLastObject](v3, "removeLastObject");
  colocatedNetworks = self->_colocatedNetworks;
  self->_colocatedNetworks = &v3->super;

  return v4;
}

- (id)_reduceNumberOfCandidatesTo:(unint64_t)a3 on:(unsigned int)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CWFScanResult channel](self->_joinedNetwork, "channel"));
  unsigned int v7 = [v6 band];

  if (v7 == 3 || (uint64_t v8 = _os_feature_enabled_impl("CoreWiFi", "LegacySSIDTransitionUI"), (v8 & 1) != 0))
  {
    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CWFScanResult channel](self->_joinedNetwork, "channel"));
    unsigned int v11 = [v10 band];

    if (v11 != a4)
    {
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      v12 = self->_colocatedNetworks;
      id v13 = -[NSArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v30,  v35,  16LL);
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v31;
        while (2)
        {
          for (i = 0LL; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v31 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
            v18 = objc_autoreleasePoolPush();
            v19 = (void *)objc_claimAutoreleasedReturnValue([v17 channel]);
            unsigned int v20 = [v19 band];

            if (v20 == a4)
            {
              -[NSMutableArray addObject:](v9, "addObject:", v17);
              if (-[NSMutableArray count](v9, "count") == (id)a3)
              {
                objc_autoreleasePoolPop(v18);
                goto LABEL_15;
              }
            }

            objc_autoreleasePoolPop(v18);
          }

          id v14 = -[NSArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v30,  v35,  16LL);
          if (v14) {
            continue;
          }
          break;
        }
      }

- (void)_reduceNetworks
{
  id v15 = (id)objc_claimAutoreleasedReturnValue( -[WiFiColocatedNetworkManager _reduceNumberOfCandidatesTo:on:]( self,  "_reduceNumberOfCandidatesTo:on:",  1LL,  1LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[WiFiColocatedNetworkManager _reduceNumberOfCandidatesTo:on:]( self,  "_reduceNumberOfCandidatesTo:on:",  1LL,  2LL));
  SEL v4 = (void *)objc_claimAutoreleasedReturnValue( -[WiFiColocatedNetworkManager _reduceNumberOfCandidatesTo:on:]( self,  "_reduceNumberOfCandidatesTo:on:",  1LL,  3LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CWFScanResult channel](self->_joinedNetwork, "channel"));
  unsigned int v6 = [v5 is2GHz];

  if (v6)
  {
    if (v3)
    {
      unsigned int v7 = v3;
      goto LABEL_6;
    }
  }

  else
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CWFScanResult channel](self->_joinedNetwork, "channel"));
    unsigned int v9 = [v8 is5GHz];

    if (!v9)
    {
      unsigned int v7 = v15;
      if (!v15)
      {
        id v11 = v3;
        goto LABEL_11;
      }

      v10 = v3;
      goto LABEL_10;
    }

    unsigned int v7 = v15;
    if (v15)
    {
LABEL_6:
      v10 = v4;
LABEL_10:
      id v11 = (id)objc_claimAutoreleasedReturnValue([v7 arrayByAddingObjectsFromArray:v10]);
      goto LABEL_11;
    }
  }

  id v11 = v4;
LABEL_11:
  v12 = v11;
  id v13 = (NSArray *)[v11 copy];
  colocatedNetworks = self->_colocatedNetworks;
  self->_colocatedNetworks = v13;
}

- (CWFScanResult)joinedNetwork
{
  return (CWFScanResult *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setJoinedNetwork:(id)a3
{
}

- (NSArray)colocatedNetworks
{
  return (NSArray *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setColocatedNetworks:(id)a3
{
}

- (void).cxx_destruct
{
}

@end