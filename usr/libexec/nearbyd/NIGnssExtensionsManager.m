@interface NIGnssExtensionsManager
+ (vector<nearby::algorithms::finding::GnssSatelliteData,)getGnssSatelliteDataVecFromDict:(id)a2;
- (GnssExtensionsCallbackDelegate)delegate;
- (NIGnssExtensionsManager)initWithQueue:(id)a3 bundle:(id)a4 reason:(id)a5;
- (NIGnssExtensionsManager)initWithQueue:(id)a3 bundleId:(id)a4 reason:(id)a5;
- (void)invalidate;
- (void)setDelegate:(id)a3;
@end

@implementation NIGnssExtensionsManager

- (NIGnssExtensionsManager)initWithQueue:(id)a3 bundleId:(id)a4 reason:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___NIGnssExtensionsManager;
  v12 = -[NIGnssExtensionsManager init](&v22, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->fQueue, a3);
    fQueue = v13->fQueue;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10028F9BC;
    v20[3] = &unk_1007B9EA8;
    v15 = v13;
    v21 = v15;
    v16 = (CLGnssExtensionsClient *)+[CLGnssExtensionsClient newAssertionForBundleIdentifier:withReason:withCallbackQueue:andBlock:]( &OBJC_CLASS___CLGnssExtensionsClient,  "newAssertionForBundleIdentifier:withReason:withCallbackQueue:andBlock:",  v10,  v11,  fQueue,  v20);
    fAssertion = v15->fAssertion;
    v15->fAssertion = v16;

    v18 = v15;
  }

  return v13;
}

- (NIGnssExtensionsManager)initWithQueue:(id)a3 bundle:(id)a4 reason:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___NIGnssExtensionsManager;
  v12 = -[NIGnssExtensionsManager init](&v22, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->fQueue, a3);
    fQueue = v13->fQueue;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10028FC18;
    v20[3] = &unk_1007B9EA8;
    v15 = v13;
    v21 = v15;
    v16 = (CLGnssExtensionsClient *)+[CLGnssExtensionsClient newAssertionForBundle:withReason:withCallbackQueue:andBlock:]( &OBJC_CLASS___CLGnssExtensionsClient,  "newAssertionForBundle:withReason:withCallbackQueue:andBlock:",  v10,  v11,  fQueue,  v20);
    fAssertion = v15->fAssertion;
    v15->fAssertion = v16;

    v18 = v15;
  }

  return v13;
}

+ (vector<nearby::algorithms::finding::GnssSatelliteData,)getGnssSatelliteDataVecFromDict:(id)a2
{
  id v48 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v48 objectForKey:@"data"]);
  unint64_t v6 = 0LL;
  retstr->var2.var0 = 0LL;
  retstr->var0 = 0LL;
  retstr->var1 = 0LL;
  while ((unint64_t)[v5 count] > v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:v6]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"satSystem"]);
    unsigned int v9 = [v8 intValue];

    if (v9 - 1 >= 6) {
      unsigned int v10 = 0;
    }
    else {
      unsigned int v10 = v9;
    }
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"satId"]);
    unsigned int v12 = [v11 intValue];

    v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"elevationDeg"]);
    [v13 floatValue];
    float v15 = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"azimuthDeg"]);
    [v16 floatValue];
    float v18 = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"l1Cn0"]);
    [v19 floatValue];
    float v21 = v20;

    objc_super v22 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"l5Cn0"]);
    [v22 floatValue];
    float v24 = v23;

    v25 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"isPhaseTracked"]);
    BOOL v26 = [v25 intValue] == 1;

    v27 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"isTracked"]);
    double v28 = v15;
    double v29 = v18;
    double v30 = v21;
    double v31 = v24;
    BOOL v32 = [v27 intValue] == 1;

    var1 = retstr->var1;
    var0 = retstr->var2.var0;
    if (var1 >= var0)
    {
      unint64_t v36 = 0xAAAAAAAAAAAAAAABLL * ((var1 - retstr->var0) >> 4);
      unint64_t v37 = v36 + 1;
      if (v36 + 1 > 0x555555555555555LL) {
        sub_10001E11C();
      }
      unint64_t v38 = 0xAAAAAAAAAAAAAAABLL * ((var0 - retstr->var0) >> 4);
      if (2 * v38 > v37) {
        unint64_t v37 = 2 * v38;
      }
      if (v38 >= 0x2AAAAAAAAAAAAAALL) {
        unint64_t v39 = 0x555555555555555LL;
      }
      else {
        unint64_t v39 = v37;
      }
      if (v39) {
        v40 = (char *)sub_100290108((uint64_t)&retstr->var2, v39);
      }
      else {
        v40 = 0LL;
      }
      v41 = &v40[48 * v36];
      *(_DWORD *)v41 = v10;
      *((_DWORD *)v41 + 1) = v12;
      *((double *)v41 + 1) = v28;
      *((double *)v41 + 2) = v29;
      *((double *)v41 + 3) = v30;
      *((double *)v41 + 4) = v31;
      v41[40] = v26;
      v41[41] = v32;
      v43 = retstr->var0;
      v42 = retstr->var1;
      v44 = (GnssSatelliteData *)v41;
      if (v42 != retstr->var0)
      {
        do
        {
          __int128 v45 = *((_OWORD *)v42 - 3);
          __int128 v46 = *((_OWORD *)v42 - 1);
          *((_OWORD *)v44 - 2) = *((_OWORD *)v42 - 2);
          *((_OWORD *)v44 - 1) = v46;
          *((_OWORD *)v44 - 3) = v45;
          v44 = (GnssSatelliteData *)((char *)v44 - 48);
          v42 = (GnssSatelliteData *)((char *)v42 - 48);
        }

        while (v42 != v43);
        v42 = v43;
      }

      v35 = (GnssSatelliteData *)(v41 + 48);
      retstr->var0 = v44;
      retstr->var1 = (GnssSatelliteData *)(v41 + 48);
      retstr->var2.var0 = (GnssSatelliteData *)&v40[48 * v39];
      if (v42) {
        operator delete(v42);
      }
    }

    else
    {
      *(_DWORD *)var1 = v10;
      *((_DWORD *)var1 + 1) = v12;
      *((double *)var1 + 1) = v28;
      *((double *)var1 + 2) = v29;
      *((double *)var1 + 3) = v30;
      *((double *)var1 + 4) = v31;
      *((_BYTE *)var1 + 40) = v26;
      v35 = (GnssSatelliteData *)((char *)var1 + 48);
      *((_BYTE *)var1 + 41) = v32;
    }

    retstr->var1 = v35;

    ++v6;
  }

  return result;
}

- (void)invalidate
{
}

- (GnssExtensionsCallbackDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (GnssExtensionsCallbackDelegate *)a3;
}

- (void).cxx_destruct
{
}

@end