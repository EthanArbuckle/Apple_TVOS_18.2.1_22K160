@interface CLAppTileDataProvider
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)fIsRegisteredForTileDownload;
- (CLAppTileDataProvider)init;
- (CLTimer)activeRequestCleanupTimer;
- (NSMutableArray)activeRequests;
- (id).cxx_construct;
- (id)getAppsForAreaAtLatitude:(double)a3 longitude:(double)a4 radius:(float)a5 includeRegionalApps:(BOOL)a6 marqueeAppsOnly:(BOOL)a7;
- (void)beginService;
- (void)endService;
- (void)fetchAppsForAreaAtLatitude:(double)a3 longitude:(double)a4 radius:(float)a5 includeRegionalApps:(BOOL)a6 marqueeAppsOnly:(BOOL)a7 withReply:(id)a8;
- (void)onTileWasDownloadedNotification:(int)a3 data:(uint64_t)a4;
- (void)setActiveRequestCleanupTimer:(id)a3;
- (void)setActiveRequests:(id)a3;
- (void)setFIsRegisteredForTileDownload:(BOOL)a3;
@end

@implementation CLAppTileDataProvider

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10199ED40 != -1) {
    dispatch_once(&qword_10199ED40, &stru_1018884D0);
  }
  return (id)qword_10199ED38;
}

- (CLAppTileDataProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLAppTileDataProvider;
  return -[CLAppTileDataProvider initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLAppTileDataProviderProtocol,  &OBJC_PROTOCOL___CLAppTileDataProviderClientProtocol);
}

- (void)beginService
{
  if (qword_101934A70 != -1) {
    dispatch_once(&qword_101934A70, &stru_1018884F0);
  }
  objc_super v3 = (os_log_s *)qword_101934A78;
  if (os_log_type_enabled((os_log_t)qword_101934A78, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "TILE_APP: begin", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934A70 != -1) {
      dispatch_once(&qword_101934A70, &stru_1018884F0);
    }
    v7[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A78,  2LL,  "TILE_APP: begin",  v7,  2);
    unint64_t v5 = (uint8_t *)v4;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLAppTileDataProvider beginService]", "%s\n", v4);
    if (v5 != buf) {
      free(v5);
    }
  }

  -[CLAppTileDataProvider setActiveRequests:](self, "setActiveRequests:", objc_alloc_init(&OBJC_CLASS___NSMutableArray));
  -[CLAppTileDataProvider setActiveRequestCleanupTimer:]( self,  "setActiveRequestCleanupTimer:",  objc_msgSend(objc_msgSend(-[CLAppTileDataProvider universe](self, "universe"), "silo"), "newTimer"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100E5F288;
  v6[3] = &unk_10181A288;
  v6[4] = self;
  -[CLTimer setHandler:]( -[CLAppTileDataProvider activeRequestCleanupTimer](self, "activeRequestCleanupTimer"),  "setHandler:",  v6);
}

- (void)endService
{
  if (qword_101934A70 != -1) {
    dispatch_once(&qword_101934A70, &stru_1018884F0);
  }
  objc_super v3 = (os_log_s *)qword_101934A78;
  if (os_log_type_enabled((os_log_t)qword_101934A78, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "TILE_APP: shutdown", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934A70 != -1) {
      dispatch_once(&qword_101934A70, &stru_1018884F0);
    }
    v7[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A78,  2LL,  "TILE_APP: shutdown",  v7,  2);
    v6 = (uint8_t *)v5;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLAppTileDataProvider endService]", "%s\n", v5);
    if (v6 != buf) {
      free(v6);
    }
  }

  -[CLAppTileDataProvider setActiveRequests:](self, "setActiveRequests:", 0LL);
  -[CLTimer invalidate]( -[CLAppTileDataProvider activeRequestCleanupTimer](self, "activeRequestCleanupTimer"),  "invalidate");

  -[CLAppTileDataProvider setActiveRequestCleanupTimer:](self, "setActiveRequestCleanupTimer:", 0LL);
  value = self->_tilesManagerClient.__ptr_.__value_;
  self->_tilesManagerClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
  }
}

- (id)getAppsForAreaAtLatitude:(double)a3 longitude:(double)a4 radius:(float)a5 includeRegionalApps:(BOOL)a6 marqueeAppsOnly:(BOOL)a7
{
  BOOL v8 = a6;
  sub_100A3180C((uint64_t)v73);
  uint64_t v70 = (uint64_t)&v70;
  v71 = (double *)&v70;
  double v72 = 0.0;
  double v68 = a3;
  double v69 = a4;
  id v13 = objc_msgSend( objc_msgSend(-[CLAppTileDataProvider universe](self, "universe"), "vendor"),  "proxyForService:",  @"CLTilesManager");
  *(float *)&double v14 = a5;
  [v13 syncgetAppAvailabilityForLocation:v67 radius:v73 searchContext:&v70 availabilityList:v8 includeRegionalApps:v14];
  v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  sub_100D2D9A4((uint64_t)v66);
  if (qword_101934A70 != -1) {
    dispatch_once(&qword_101934A70, &stru_1018884F0);
  }
  v16 = (os_log_s *)qword_101934A78;
  if (os_log_type_enabled((os_log_t)qword_101934A78, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    double v85 = v72;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "TILE_APP: getAppsForArea, examining %zu candidate grids.",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934A70 != -1) {
      dispatch_once(&qword_101934A70, &stru_1018884F0);
    }
    int v76 = 134217984;
    double v77 = v72;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A78,  2LL,  "TILE_APP: getAppsForArea, examining %zu candidate grids.",  (size_t)&v76);
    v59 = (uint8_t *)v58;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLAppTileDataProvider getAppsForAreaAtLatitude:longitude:radius:includeRegionalApps:marqueeAppsOnly:]",  "%s\n",  v58);
    if (v59 != buf) {
      free(v59);
    }
  }

  v18 = v71;
  if (v71 != (double *)&v70)
  {
    *(void *)&__int128 v17 = 134218496LL;
    __int128 v61 = v17;
    do
    {
      if (a5 <= 0.0)
      {
        if (qword_101934A70 != -1) {
          dispatch_once(&qword_101934A70, &stru_1018884F0);
        }
        v19 = (os_log_s *)qword_101934A78;
        if (os_log_type_enabled((os_log_t)qword_101934A78, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v20 = *((void *)v18 + 5);
          uint64_t v21 = *((void *)v18 + 6);
          *(_DWORD *)buf = 134218752;
          double v85 = a3;
          __int16 v86 = 2048;
          double v87 = a4;
          __int16 v88 = 2048;
          uint64_t v89 = v20;
          __int16 v90 = 2048;
          uint64_t v91 = v21;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "TILE_APP: getAppsForArea, query for exact grid containing lat = %f, lon = %f, gridLat = %f, gridLon = %f",  buf,  0x2Au);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_101934A70 != -1) {
            dispatch_once(&qword_101934A70, &stru_1018884F0);
          }
          uint64_t v52 = *((void *)v18 + 5);
          uint64_t v53 = *((void *)v18 + 6);
          int v76 = 134218752;
          double v77 = a3;
          __int16 v78 = 2048;
          double v79 = a4;
          __int16 v80 = 2048;
          uint64_t v81 = v52;
          __int16 v82 = 2048;
          uint64_t v83 = v53;
          LODWORD(v60) = 42;
          _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A78,  2LL,  "TILE_APP: getAppsForArea, query for exact grid containing lat = %f, lon = %f, gridLat = %f, gridLon = %f",  COERCE_DOUBLE(&v76),  v60,  *(double *)&v61,  *((double *)&v61 + 1));
          v55 = (uint8_t *)v54;
          sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLAppTileDataProvider getAppsForAreaAtLatitude:longitude:radius:includeRegionalApps:marqueeAppsOnly:]",  "%s\n",  v54);
          if (v55 != buf) {
            free(v55);
          }
        }

        double v22 = v18[5];
        double v23 = v18[7] * 0.5;
        double v24 = v22 - v23;
        double v25 = v22 + v23;
        if (v24 > a3 || v25 < a3) {
          goto LABEL_57;
        }
        double v27 = v18[6];
        double v28 = v18[8] * 0.5;
        double v29 = v27 - v28;
        double v30 = v27 + v28;
        if (v29 > a4 || v30 < a4) {
          goto LABEL_57;
        }
      }

      else if (sub_100D2DBDC(v66, v18[5], v18[6], a3, a4, 0.0) - a5 + -25.0 > 0.0)
      {
        goto LABEL_57;
      }

      if (a7)
      {
        if (((*((_DWORD *)v18 + 4) >> 5) & 1) == 0) {
          goto LABEL_57;
        }
      }

      else
      {
        __int128 v64 = 0u;
        __int128 v65 = 0u;
        __int128 v62 = 0u;
        __int128 v63 = 0u;
        id v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v62,  v75,  16LL);
        if (v32)
        {
          uint64_t v33 = *(void *)v63;
          while (2)
          {
            for (i = 0LL; i != v32; i = (char *)i + 1)
            {
              if (*(void *)v63 != v33) {
                objc_enumerationMutation(v15);
              }
              v35 = *(void **)(*((void *)&v62 + 1) + 8LL * (void)i);
              if ([v35 adamId] == *((_DWORD *)v18 + 5)
                && [v35 touristApp] != (((_BYTE)v18[2] & 0x10) == 0))
              {
                double v47 = sub_100D2DBDC(v66, v18[5], v18[6], a3, a4, 0.0);
                [v35 latitude];
                double v49 = v48;
                [v35 longitude];
                if (v47 < sub_100D2DBDC(v66, v49, v50, a3, a4, 0.0))
                {
                  [v35 setLatitude:v18[5]];
                  [v35 setLongitude:v18[6]];
                  [v35 setEffectiveRadiusMetersIfInstalled:*((unsigned int *)v18 + 6)];
                  [v35 setHeroAppRankInstalled:*((unsigned int *)v18 + 7)];
                  [v35 setHeroAppRankUnInstalled:*((unsigned int *)v18 + 8)];
                }

                goto LABEL_57;
              }
            }

            id v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v62,  v75,  16LL);
            if (v32) {
              continue;
            }
            break;
          }
        }
      }

      v36 = objc_alloc_init(&OBJC_CLASS___CLAppTileDataProviderResult);
      -[CLAppTileDataProviderResult setAdamId:](v36, "setAdamId:", *((unsigned int *)v18 + 5));
      int v37 = *((_DWORD *)v18 + 4);
      if ((v37 & 1) != 0)
      {
        uint64_t v51 = 100LL;
      }

      else if ((v37 & 2) != 0)
      {
        uint64_t v51 = 200LL;
      }

      else if ((v37 & 4) != 0)
      {
        uint64_t v51 = 300LL;
      }

      else
      {
        if ((v37 & 8) == 0)
        {
          if (qword_101934A70 != -1) {
            dispatch_once(&qword_101934A70, &stru_1018884F0);
          }
          v38 = (os_log_s *)qword_101934A78;
          if (os_log_type_enabled((os_log_t)qword_101934A78, OS_LOG_TYPE_DEFAULT))
          {
            double v39 = v18[5];
            double v40 = v18[6];
            int v41 = *((_DWORD *)v18 + 5);
            *(_DWORD *)buf = v61;
            double v85 = v39;
            __int16 v86 = 2048;
            double v87 = v40;
            __int16 v88 = 1024;
            LODWORD(v89) = v41;
            _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "#Warning TILE_APP: getAppsForArea, invalid age rating, lat, %f, lon, %f, adamId, %d",  buf,  0x1Cu);
          }

          if (sub_1002921D0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_101934A70 != -1) {
              dispatch_once(&qword_101934A70, &stru_1018884F0);
            }
            double v42 = v18[5];
            double v43 = v18[6];
            int v44 = *((_DWORD *)v18 + 5);
            int v76 = v61;
            double v77 = v42;
            __int16 v78 = 2048;
            double v79 = v43;
            __int16 v80 = 1024;
            LODWORD(v81) = v44;
            LODWORD(v60) = 28;
            _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A78,  0LL,  "#Warning TILE_APP: getAppsForArea, invalid age rating, lat, %f, lon, %f, adamId, %d",  COERCE_DOUBLE(&v76),  v60,  (_DWORD)v61);
            v46 = (uint8_t *)v45;
            sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLAppTileDataProvider getAppsForAreaAtLatitude:longitude:radius:includeRegionalApps:marqueeAppsOnly:]",  "%s\n",  v45);
            if (v46 != buf) {
              free(v46);
            }
          }

          goto LABEL_56;
        }

        uint64_t v51 = 600LL;
      }

      -[CLAppTileDataProviderResult setAgeRating:](v36, "setAgeRating:", v51);
      -[CLAppTileDataProviderResult setTouristApp:](v36, "setTouristApp:", (*((_DWORD *)v18 + 4) >> 4) & 1);
      -[CLAppTileDataProviderResult setEffectiveRadiusMetersIfInstalled:]( v36,  "setEffectiveRadiusMetersIfInstalled:",  *((unsigned int *)v18 + 6));
      -[CLAppTileDataProviderResult setHeroAppRankInstalled:]( v36,  "setHeroAppRankInstalled:",  *((unsigned int *)v18 + 7));
      -[CLAppTileDataProviderResult setHeroAppRankUnInstalled:]( v36,  "setHeroAppRankUnInstalled:",  *((unsigned int *)v18 + 8));
      -[CLAppTileDataProviderResult setLatitude:](v36, "setLatitude:", v18[5]);
      -[CLAppTileDataProviderResult setLongitude:](v36, "setLongitude:", v18[6]);
      -[CLAppTileDataProviderResult setSpanLat:](v36, "setSpanLat:", v18[7]);
      -[CLAppTileDataProviderResult setSpanLon:](v36, "setSpanLon:", v18[8]);
      -[NSMutableArray addObject:](v15, "addObject:", v36);
LABEL_56:

LABEL_57:
      v18 = (double *)*((void *)v18 + 1);
    }

    while (v18 != (double *)&v70);
  }

  v56 = v15;
  sub_1001B4C40(&v70);
  sub_100603B94((uint64_t)v74, v74[1]);
  return v56;
}

- (void)fetchAppsForAreaAtLatitude:(double)a3 longitude:(double)a4 radius:(float)a5 includeRegionalApps:(BOOL)a6 marqueeAppsOnly:(BOOL)a7 withReply:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  objc_msgSend(-[CLAppTileDataProvider universe](self, "universe"), "silo");
  if (!a8) {
    sub_101274720();
  }
  __int16 v46 = 0;
  if (objc_msgSend( objc_msgSend( objc_msgSend(-[CLAppTileDataProvider universe](self, "universe"), "vendor"),  "proxyForService:",  @"CLTilesManager"),  "syncgetTileFilePath:latitude:longitude:isFileAccessible:isTileNotExistingOnServer:",  9,  (char *)&v46 + 1,  &v46,  a3,  a4))
  {
    if (qword_101934A70 != -1) {
      dispatch_once(&qword_101934A70, &stru_1018884F0);
    }
    v15 = (os_log_s *)qword_101934A78;
    if (os_log_type_enabled((os_log_t)qword_101934A78, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      *(double *)&uint8_t buf[4] = a3;
      __int16 v52 = 2048;
      double v53 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "TILE_APP: fetchAppsForArea, tile is available for lat = %f, lon = %f.",  buf,  0x16u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934A70 != -1) {
        dispatch_once(&qword_101934A70, &stru_1018884F0);
      }
      int v47 = 134218240;
      double v48 = a3;
      __int16 v49 = 2048;
      double v50 = a4;
      LODWORD(v39) = 22;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A78,  2LL,  "TILE_APP: fetchAppsForArea, tile is available for lat = %f, lon = %f.",  COERCE_DOUBLE(&v47),  v39);
      double v30 = (char *)v29;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLAppTileDataProvider fetchAppsForAreaAtLatitude:longitude:radius:includeRegionalApps:marqueeAppsOnly:withReply:]",  "%s\n",  v29);
      if (v30 != buf) {
        free(v30);
      }
    }

    *(float *)&double v16 = a5;
    id v17 = -[CLAppTileDataProvider getAppsForAreaAtLatitude:longitude:radius:includeRegionalApps:marqueeAppsOnly:]( self,  "getAppsForAreaAtLatitude:longitude:radius:includeRegionalApps:marqueeAppsOnly:",  v10,  v9,  a3,  a4,  v16);
    if (qword_101934A70 != -1) {
      dispatch_once(&qword_101934A70, &stru_1018884F0);
    }
    v18 = (os_log_s *)qword_101934A78;
    if (os_log_type_enabled((os_log_t)qword_101934A78, OS_LOG_TYPE_DEBUG))
    {
      id v19 = [v17 count];
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "TILE_APP: fetchAppsForArea, found %lu apps.",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934A70 != -1) {
        dispatch_once(&qword_101934A70, &stru_1018884F0);
      }
      uint64_t v31 = qword_101934A78;
      id v32 = [v17 count];
      int v47 = 134217984;
      double v48 = *(double *)&v32;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v31,  2LL,  "TILE_APP: fetchAppsForArea, found %lu apps.",  &v47);
      v34 = (char *)v33;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLAppTileDataProvider fetchAppsForAreaAtLatitude:longitude:radius:includeRegionalApps:marqueeAppsOnly:withReply:]",  "%s\n",  v33);
      if (v34 != buf) {
        free(v34);
      }
    }

    (*((void (**)(id, id, void))a8 + 2))(a8, v17, 0LL);
  }

  else if ((_BYTE)v46)
  {
    if (qword_101934A70 != -1) {
      dispatch_once(&qword_101934A70, &stru_1018884F0);
    }
    uint64_t v20 = (os_log_s *)qword_101934A78;
    if (os_log_type_enabled((os_log_t)qword_101934A78, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      *(double *)&uint8_t buf[4] = a3;
      __int16 v52 = 2048;
      double v53 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "TILE_APP: fetchAppsForArea, tile does not exist on the server for lat = %f, lon = %f.",  buf,  0x16u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934A70 != -1) {
        dispatch_once(&qword_101934A70, &stru_1018884F0);
      }
      int v47 = 134218240;
      double v48 = a3;
      __int16 v49 = 2048;
      double v50 = a4;
      LODWORD(v39) = 22;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A78,  2LL,  "TILE_APP: fetchAppsForArea, tile does not exist on the server for lat = %f, lon = %f.",  COERCE_DOUBLE(&v47),  v39);
      v36 = (char *)v35;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLAppTileDataProvider fetchAppsForAreaAtLatitude:longitude:radius:includeRegionalApps:marqueeAppsOnly:withReply:]",  "%s\n",  v35);
      if (v36 != buf) {
        free(v36);
      }
    }

    uint64_t v21 = objc_alloc_init(&OBJC_CLASS___NSArray);
    (*((void (**)(id, NSArray *, void))a8 + 2))(a8, v21, 0LL);
  }

  else
  {
    if (qword_101934A70 != -1) {
      dispatch_once(&qword_101934A70, &stru_1018884F0);
    }
    double v22 = (os_log_s *)qword_101934A78;
    if (os_log_type_enabled((os_log_t)qword_101934A78, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      *(double *)&uint8_t buf[4] = a3;
      __int16 v52 = 2048;
      double v53 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "TILE_APP: fetchAppsForArea, tile is not available for lat = %f, lon = %f. Request for download.",  buf,  0x16u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934A70 != -1) {
        dispatch_once(&qword_101934A70, &stru_1018884F0);
      }
      int v47 = 134218240;
      double v48 = a3;
      __int16 v49 = 2048;
      double v50 = a4;
      LODWORD(v39) = 22;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A78,  2LL,  "TILE_APP: fetchAppsForArea, tile is not available for lat = %f, lon = %f. Request for download.",  COERCE_DOUBLE(&v47),  v39);
      v38 = (char *)v37;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLAppTileDataProvider fetchAppsForAreaAtLatitude:longitude:radius:includeRegionalApps:marqueeAppsOnly:withReply:]",  "%s\n",  v37);
      if (v38 != buf) {
        free(v38);
      }
    }

    if (!-[CLAppTileDataProvider fIsRegisteredForTileDownload](self, "fIsRegisteredForTileDownload"))
    {
      sub_100C35248((uint64_t)sub_100E60908, (uint64_t)self, -[CLAppTileDataProvider universe](self, "universe"), buf);
      double v23 = *(Client **)buf;
      *(void *)buf = 0LL;
      value = self->_tilesManagerClient.__ptr_.__value_;
      self->_tilesManagerClient.__ptr_.__value_ = v23;
      if (value)
      {
        (*(void (**)(Client *))(*(void *)value + 8LL))(value);
        uint64_t v25 = *(void *)buf;
        *(void *)buf = 0LL;
        if (v25) {
          (*(void (**)(uint64_t))(*(void *)v25 + 8LL))(v25);
        }
      }

      [*((id *)self->_tilesManagerClient.__ptr_.__value_ + 2) register:*((void *)self->_tilesManagerClient.__ptr_.__value_ + 1) forNotification:0 registrationInfo:0];
      -[CLAppTileDataProvider setFIsRegisteredForTileDownload:](self, "setFIsRegisteredForTileDownload:", 1LL);
    }

    v26 = objc_alloc_init(&OBJC_CLASS___CLAppTileDataProviderRequest);
    -[CLAppTileDataProviderRequest setLat:](v26, "setLat:", a3);
    -[CLAppTileDataProviderRequest setLon:](v26, "setLon:", a4);
    *(float *)&double v27 = a5;
    -[CLAppTileDataProviderRequest setRadiusMeters:](v26, "setRadiusMeters:", v27);
    -[CLAppTileDataProviderRequest setIncludeRegionalApps:](v26, "setIncludeRegionalApps:", v10);
    -[CLAppTileDataProviderRequest setMarqueeAppsOnly:](v26, "setMarqueeAppsOnly:", v9);
    -[CLAppTileDataProviderRequest setHandler:](v26, "setHandler:", a8);
    -[CLAppTileDataProviderRequest setTimestamp:](v26, "setTimestamp:", CFAbsoluteTimeGetCurrent());
    -[NSMutableArray addObject:](-[CLAppTileDataProvider activeRequests](self, "activeRequests"), "addObject:", v26);

    __int16 v40 = 0;
    char v41 = 0;
    unint64_t v42 = 0xBFF0000000000000LL;
    int v43 = 0;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    __int16 v45 = 1;
    objc_msgSend( objc_msgSend( objc_msgSend(-[CLAppTileDataProvider universe](self, "universe"), "vendor"),  "proxyForService:",  @"CLTilesManager"),  "requestTileDownloadByType:lat:lon:seckey:details:",  9,  -1,  &v40,  a3,  a4);
    -[CLTimer nextFireDelay]( -[CLAppTileDataProvider activeRequestCleanupTimer](self, "activeRequestCleanupTimer"),  "nextFireDelay");
    if (v28 == 1.79769313e308) {
      -[CLTimer setNextFireDelay:]( -[CLAppTileDataProvider activeRequestCleanupTimer](self, "activeRequestCleanupTimer"),  "setNextFireDelay:",  5.0);
    }
  }

- (void)onTileWasDownloadedNotification:(int)a3 data:(uint64_t)a4
{
  if (a3)
  {
    if (qword_101934A70 != -1) {
      dispatch_once(&qword_101934A70, &stru_1018884F0);
    }
    v7 = (os_log_s *)qword_101934A78;
    if (os_log_type_enabled((os_log_t)qword_101934A78, OS_LOG_TYPE_DEFAULT))
    {
      int buf = 67109120;
      LODWORD(v67) = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "#Warning TILE_APP: Got unexpected notification, %d",  (uint8_t *)&buf,  8u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_101934A70 != -1) {
        dispatch_once(&qword_101934A70, &stru_1018884F0);
      }
      int v61 = 67109120;
      LODWORD(v62) = a3;
      _os_log_send_and_compose_impl( 2LL,  0LL,  &buf,  1628LL,  &_mh_execute_header,  qword_101934A78,  0LL,  "#Warning TILE_APP: Got unexpected notification, %d",  &v61);
      BOOL v9 = (int *)v8;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLAppTileDataProvider onTileWasDownloadedNotification:data:]",  "%s\n",  v8);
      if (v9 != &buf) {
        free(v9);
      }
    }
  }

  else if (*(_DWORD *)(a4 + 4) == 9)
  {
    if (qword_101934A70 != -1) {
      dispatch_once(&qword_101934A70, &stru_1018884F0);
    }
    BOOL v10 = (os_log_s *)qword_101934A78;
    if (os_log_type_enabled((os_log_t)qword_101934A78, OS_LOG_TYPE_DEBUG))
    {
      int buf = 134217984;
      id v67 = objc_msgSend(objc_msgSend(a1, "activeRequests"), "count");
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "TILE_APP: onTileWasDownloadedNotification, activeRequests.count = %lu",  (uint8_t *)&buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_101934A70 != -1) {
        dispatch_once(&qword_101934A70, &stru_1018884F0);
      }
      uint64_t v51 = qword_101934A78;
      int v61 = 134217984;
      id v62 = objc_msgSend(objc_msgSend(a1, "activeRequests"), "count");
      _os_log_send_and_compose_impl( 2LL,  0LL,  &buf,  1628LL,  &_mh_execute_header,  v51,  2LL,  "TILE_APP: onTileWasDownloadedNotification, activeRequests.count = %lu",  &v61);
      double v53 = (int *)v52;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLAppTileDataProvider onTileWasDownloadedNotification:data:]",  "%s\n",  v52);
      if (v53 != &buf) {
        free(v53);
      }
    }

    id v55 = +[NSMutableIndexSet indexSet](&OBJC_CLASS___NSMutableIndexSet, "indexSet");
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    id v11 = [a1 activeRequests];
    id v12 = [v11 countByEnumeratingWithState:&v57 objects:v65 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = 0LL;
      uint64_t v15 = *(void *)v58;
      do
      {
        double v16 = 0LL;
        do
        {
          if (*(void *)v58 != v15) {
            objc_enumerationMutation(v11);
          }
          id v17 = *(void **)(*((void *)&v57 + 1) + 8LL * (void)v16);
          __int16 v56 = 0;
          id v18 = objc_msgSend( objc_msgSend(objc_msgSend(a1, "universe"), "vendor"),  "proxyForService:",  @"CLTilesManager");
          [v17 lat];
          double v20 = v19;
          [v17 lon];
          if ([v18 syncgetTileFilePath:9 latitude:(char *)&v56 + 1 longitude:&v56 isFileAccessible:v20 isTileNotExistingOnServer:v21])
          {
            BOOL v22 = 0;
          }

          else
          {
            BOOL v22 = v56 == 0;
          }

          if (!v22)
          {
            if (qword_101934A70 != -1) {
              dispatch_once(&qword_101934A70, &stru_1018884F0);
            }
            double v23 = (os_log_s *)qword_101934A78;
            if (os_log_type_enabled((os_log_t)qword_101934A78, OS_LOG_TYPE_DEBUG))
            {
              [v17 lat];
              uint64_t v25 = v24;
              [v17 lon];
              int buf = 134218240;
              id v67 = v25;
              __int16 v68 = 2048;
              uint64_t v69 = v26;
              _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  "TILE_APP: onTileWasDownloadedNotification, tile is available (or tile is 404) for lat = %f, lon = %f.",  (uint8_t *)&buf,  0x16u);
            }

            if (sub_1002921D0(115, 2))
            {
              bzero(&buf, 0x65CuLL);
              if (qword_101934A70 != -1) {
                dispatch_once(&qword_101934A70, &stru_1018884F0);
              }
              uint64_t v40 = qword_101934A78;
              [v17 lat];
              unint64_t v42 = v41;
              [v17 lon];
              int v61 = 134218240;
              id v62 = v42;
              __int16 v63 = 2048;
              uint64_t v64 = v43;
              LODWORD(v54) = 22;
              _os_log_send_and_compose_impl( 2LL,  0LL,  &buf,  1628LL,  &_mh_execute_header,  v40,  2LL,  "TILE_APP: onTileWasDownloadedNotification, tile is available (or tile is 404) for lat = %f, lon = %f.",  COERCE_DOUBLE(&v61),  v54);
              __int16 v45 = (int *)v44;
              sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLAppTileDataProvider onTileWasDownloadedNotification:data:]",  "%s\n",  v44);
              if (v45 != &buf) {
                free(v45);
              }
            }

            [v17 lat];
            double v28 = v27;
            [v17 lon];
            double v30 = v29;
            [v17 radiusMeters];
            int v32 = v31;
            id v33 = [v17 includeRegionalApps];
            id v34 = [v17 marqueeAppsOnly];
            LODWORD(v35) = v32;
            id v36 = [a1 getAppsForAreaAtLatitude:v33 longitude:v34 radius:v28 includeRegionalApps:v30 marqueeAppsOnly:v35];
            if (qword_101934A70 != -1) {
              dispatch_once(&qword_101934A70, &stru_1018884F0);
            }
            int v37 = (os_log_s *)qword_101934A78;
            if (os_log_type_enabled((os_log_t)qword_101934A78, OS_LOG_TYPE_DEBUG))
            {
              id v38 = [v36 count];
              int buf = 134217984;
              id v67 = v38;
              _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEBUG,  "TILE_APP: onTileWasDownloadedNotification, found %lu apps.",  (uint8_t *)&buf,  0xCu);
            }

            if (sub_1002921D0(115, 2))
            {
              bzero(&buf, 0x65CuLL);
              if (qword_101934A70 != -1) {
                dispatch_once(&qword_101934A70, &stru_1018884F0);
              }
              uint64_t v46 = qword_101934A78;
              id v47 = [v36 count];
              int v61 = 134217984;
              id v62 = v47;
              _os_log_send_and_compose_impl( 2LL,  0LL,  &buf,  1628LL,  &_mh_execute_header,  v46,  2LL,  "TILE_APP: onTileWasDownloadedNotification, found %lu apps.",  &v61);
              __int16 v49 = (int *)v48;
              sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLAppTileDataProvider onTileWasDownloadedNotification:data:]",  "%s\n",  v48);
              if (v49 != &buf) {
                free(v49);
              }
            }

            double v39 = (void (**)(id, id, void))[v17 handler];
            v39[2](v39, v36, 0LL);
            [v55 addIndex:(char *)v16 + v14];
          }

          double v16 = (char *)v16 + 1;
        }

        while (v13 != v16);
        id v50 = [v11 countByEnumeratingWithState:&v57 objects:v65 count:16];
        id v13 = v50;
        v14 += (uint64_t)v16;
      }

      while (v50);
    }

    objc_msgSend(objc_msgSend(a1, "activeRequests"), "removeObjectsAtIndexes:", v55);
  }

- (BOOL)fIsRegisteredForTileDownload
{
  return self->_fIsRegisteredForTileDownload;
}

- (void)setFIsRegisteredForTileDownload:(BOOL)a3
{
  self->_fIsRegisteredForTileDownload = a3;
}

- (NSMutableArray)activeRequests
{
  return self->_activeRequests;
}

- (void)setActiveRequests:(id)a3
{
  self->_activeRequests = (NSMutableArray *)a3;
}

- (CLTimer)activeRequestCleanupTimer
{
  return self->_activeRequestCleanupTimer;
}

- (void)setActiveRequestCleanupTimer:(id)a3
{
  self->_activeRequestCleanupTimer = (CLTimer *)a3;
}

- (void).cxx_destruct
{
  value = self->_tilesManagerClient.__ptr_.__value_;
  self->_tilesManagerClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0LL;
  return self;
}

@end