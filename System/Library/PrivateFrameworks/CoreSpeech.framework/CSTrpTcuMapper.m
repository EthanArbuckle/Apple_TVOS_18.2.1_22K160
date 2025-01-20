@interface CSTrpTcuMapper
- (CSAttSiriCachedEndpointInfo)relaxedEndpointerCache;
- (CSEndpointerProxy)proxy;
- (CSTrpTcuMapper)initWithQueue:(id)a3;
- (NSMutableArray)hardEndpointerCache;
- (NSMutableDictionary)trpIdToRCMap;
- (OS_dispatch_queue)queue;
- (id)getMatchingRelaxedEPMetricsForTrp:(id)a3;
- (id)getSelectedTrpIdForEndpointEvent:(double)a3 withMetrics:(id)a4 OfType:(int64_t)a5;
- (id)processTRPWithId:(id)a3 withSpeechPackage:(id)a4 enforceTrpSelection:(BOOL)a5;
- (void)_cacheHardEndPointerMetric:(double)a3 withMetrics:(id)a4;
- (void)_cacheRelaxedEndPointerMetric:(double)a3 withMetrics:(id)a4;
- (void)_resetEndpointCaches;
- (void)processTCUFinalizedForTrpId:(id)a3 withCompletion:(id)a4;
- (void)registerEndpointerProxy:(id)a3;
- (void)setHardEndpointerCache:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRelaxedEndpointerCache:(id)a3;
- (void)setTrpIdToRCMap:(id)a3;
@end

@implementation CSTrpTcuMapper

- (CSTrpTcuMapper)initWithQueue:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CSTrpTcuMapper;
  v6 = -[CSTrpTcuMapper init](&v14, "init");
  if (v6)
  {
    v7 = (os_log_s *)CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[CSTrpTcuMapper initWithQueue:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
    }

    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    trpIdToRCMap = v6->_trpIdToRCMap;
    v6->_trpIdToRCMap = (NSMutableDictionary *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    hardEndpointerCache = v6->_hardEndpointerCache;
    v6->_hardEndpointerCache = (NSMutableArray *)v10;

    relaxedEndpointerCache = v6->_relaxedEndpointerCache;
    v6->_relaxedEndpointerCache = 0LL;

    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v6;
}

- (void)registerEndpointerProxy:(id)a3
{
}

- (id)getSelectedTrpIdForEndpointEvent:(double)a3 withMetrics:(id)a4 OfType:(int64_t)a5
{
  id v8 = a4;
  v9 = (void *)CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = v9;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_proxy);
    int v31 = 136315906;
    v32 = "-[CSTrpTcuMapper getSelectedTrpIdForEndpointEvent:withMetrics:OfType:]";
    __int16 v33 = 2048;
    int64_t v34 = a5;
    __int16 v35 = 2048;
    double v36 = a3;
    __int16 v37 = 2112;
    double v38 = *(double *)&WeakRetained;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s Received EP of type %ld at time %f _proxy:%@",  (uint8_t *)&v31,  0x2Au);
  }

  if (a5 != 1)
  {
    if (a5 == 2) {
      -[CSTrpTcuMapper _cacheRelaxedEndPointerMetric:withMetrics:]( self,  "_cacheRelaxedEndPointerMetric:withMetrics:",  v8,  a3);
    }
LABEL_6:
    id v12 = 0LL;
    goto LABEL_20;
  }

  -[CSTrpTcuMapper _cacheHardEndPointerMetric:withMetrics:](self, "_cacheHardEndPointerMetric:withMetrics:", v8, a3);
  if (!-[NSMutableDictionary count](self->_trpIdToRCMap, "count"))
  {
    v28 = (os_log_s *)CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
    {
      int v31 = 136315138;
      v32 = "-[CSTrpTcuMapper getSelectedTrpIdForEndpointEvent:withMetrics:OfType:]";
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%s No TCUs yet", (uint8_t *)&v31, 0xCu);
    }

    goto LABEL_6;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary keysSortedByValueUsingComparator:]( self->_trpIdToRCMap,  "keysSortedByValueUsingComparator:",  &stru_10022BD10));
  double v14 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue([v13 firstObject]));
  v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_trpIdToRCMap,  "objectForKeyedSubscript:",  *(void *)&v14));
  +[CSAttSiriSpeechPackageHelper getLastTokenEndTimeFromSpeechPackage:]( &OBJC_CLASS___CSAttSiriSpeechPackageHelper,  "getLastTokenEndTimeFromSpeechPackage:",  v15);
  double v17 = v16 * 1000.0;

  v18 = (void *)CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    trpIdToRCMap = self->_trpIdToRCMap;
    v20 = v18;
    id v21 = objc_loadWeakRetained((id *)&self->_proxy);
    int v31 = 136315906;
    v32 = "-[CSTrpTcuMapper getSelectedTrpIdForEndpointEvent:withMetrics:OfType:]";
    __int16 v33 = 2112;
    int64_t v34 = *(void *)&v14;
    __int16 v35 = 2112;
    double v36 = *(double *)&trpIdToRCMap;
    __int16 v37 = 2112;
    double v38 = *(double *)&v21;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%s Trying RC acceptance for trpId %@ map %@ with _proxy:%@",  (uint8_t *)&v31,  0x2Au);
  }

  id v22 = objc_loadWeakRetained((id *)&self->_proxy);
  unsigned __int8 v23 = [v22 shouldAcceptEagerResultForDurationSync:v8 withEndpointerMetrics:v17];

  if ((v23 & 1) != 0)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_hardEndpointerCache, "lastObject"));
    [v24 setTrpID:*(void *)&v14];
    v25 = (void *)CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
    {
      v26 = v25;
      [v24 endpointTime];
      int v31 = 136315906;
      v32 = "-[CSTrpTcuMapper getSelectedTrpIdForEndpointEvent:withMetrics:OfType:]";
      __int16 v33 = 2048;
      int64_t v34 = v27;
      __int16 v35 = 2112;
      double v36 = v14;
      __int16 v37 = 2048;
      double v38 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%s Associating EP at time: %f with trpId: %@ with RCTime: %f",  (uint8_t *)&v31,  0x2Au);
    }

    id v12 = *(id *)&v14;
  }

  else
  {
    v29 = (os_log_s *)CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
    {
      int v31 = 136315650;
      v32 = "-[CSTrpTcuMapper getSelectedTrpIdForEndpointEvent:withMetrics:OfType:]";
      __int16 v33 = 2112;
      int64_t v34 = *(void *)&v14;
      __int16 v35 = 2048;
      double v36 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "%s TRPId %@ with duration %f not accepted !",  (uint8_t *)&v31,  0x20u);
    }

    id v12 = 0LL;
  }

LABEL_20:
  return v12;
}

- (void)processTCUFinalizedForTrpId:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, uint64_t, id, double))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriCachedEndpointInfo trpID](self->_relaxedEndpointerCache, "trpID"));
  unsigned int v9 = [v8 isEqualToString:v6];

  if (v9)
  {
    -[CSAttSiriCachedEndpointInfo endpointTime](self->_relaxedEndpointerCache, "endpointTime");
    double v11 = v10;
    id v12 = (id)objc_claimAutoreleasedReturnValue(-[CSAttSiriCachedEndpointInfo endpointerMetrics](self->_relaxedEndpointerCache, "endpointerMetrics"));
    uint64_t v13 = 1LL;
  }

  else
  {
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    double v14 = self->_hardEndpointerCache;
    id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v23,  v31,  16LL);
    double v11 = 0.0;
    if (v12)
    {
      uint64_t v15 = *(void *)v24;
      while (2)
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v14);
          }
          double v17 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trpID", (void)v23));
          unsigned int v19 = [v18 isEqualToString:v6];

          if (v19)
          {
            [v17 endpointTime];
            double v11 = v20;
            id v12 = (id)objc_claimAutoreleasedReturnValue([v17 endpointerMetrics]);
            uint64_t v13 = 1LL;
            goto LABEL_13;
          }
        }

        id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v23,  v31,  16LL);
        if (v12) {
          continue;
        }
        break;
      }
    }

    uint64_t v13 = 0LL;
LABEL_13:
  }

  -[CSTrpTcuMapper _resetEndpointCaches](self, "_resetEndpointCaches", (void)v23);
  id v21 = (os_log_s *)CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "-[CSTrpTcuMapper processTCUFinalizedForTrpId:withCompletion:]";
    __int16 v29 = 2112;
    id v30 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "%s Clear EP caches for finalized TRPId: %@",  buf,  0x16u);
  }

  if ((v13 & 1) == 0)
  {
    id v22 = (os_log_s *)CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[CSTrpTcuMapper processTCUFinalizedForTrpId:withCompletion:]";
      __int16 v29 = 2112;
      id v30 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%s Unable to find EP for finalized TRPId: %@",  buf,  0x16u);
      if (!v7) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
  }

  if (v7) {
LABEL_19:
  }
    v7[2](v7, v13, v12, v11);
LABEL_20:
}

- (id)getMatchingRelaxedEPMetricsForTrp:(id)a3
{
  id v4 = a3;
  relaxedEndpointerCache = self->_relaxedEndpointerCache;
  id v6 = (os_log_s *)CSLogCategoryRequest;
  if (relaxedEndpointerCache)
  {
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315394;
      double v11 = "-[CSTrpTcuMapper getMatchingRelaxedEPMetricsForTrp:]";
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s Associating RelaxEP with trpId: %@",  (uint8_t *)&v10,  0x16u);
      relaxedEndpointerCache = self->_relaxedEndpointerCache;
    }

    -[CSAttSiriCachedEndpointInfo setTrpID:](relaxedEndpointerCache, "setTrpID:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriCachedEndpointInfo endpointerMetrics](self->_relaxedEndpointerCache, "endpointerMetrics"));
  }

  else
  {
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      double v11 = "-[CSTrpTcuMapper getMatchingRelaxedEPMetricsForTrp:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s Got final TCU package before relaxEP fire !",  (uint8_t *)&v10,  0xCu);
    }

    v7 = 0LL;
  }

  id v8 = (os_log_s *)CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    double v11 = "-[CSTrpTcuMapper getMatchingRelaxedEPMetricsForTrp:]";
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s matchingEndpointerMetrics:%@",  (uint8_t *)&v10,  0x16u);
  }

  return v7;
}

- (id)processTRPWithId:(id)a3 withSpeechPackage:(id)a4 enforceTrpSelection:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  +[CSAttSiriSpeechPackageHelper getLastTokenEndTimeFromSpeechPackage:]( &OBJC_CLASS___CSAttSiriSpeechPackageHelper,  "getLastTokenEndTimeFromSpeechPackage:",  v9);
  double v11 = v10;
  v50 = v8;
  -[NSMutableDictionary setObject:forKey:](self->_trpIdToRCMap, "setObject:forKey:", v9, v8);
  __int16 v12 = (os_log_t *)&CSLogCategoryRequest;
  if (([v9 isFinal] & 1) == 0 && !v5)
  {
    if (-[NSMutableArray count](self->_hardEndpointerCache, "count") == (id)1)
    {
      p_proxy = &self->_proxy;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_proxy);

      if (WeakRetained)
      {
        id v45 = v9;
        __int128 v53 = 0u;
        __int128 v54 = 0u;
        __int128 v51 = 0u;
        __int128 v52 = 0u;
        obj = self->_hardEndpointerCache;
        id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v51,  v61,  16LL);
        if (v15)
        {
          id v16 = v15;
          v48 = 0LL;
          char v49 = 0;
          double v17 = v11 * 1000.0;
          uint64_t v47 = *(void *)v52;
          do
          {
            for (i = 0LL; i != v16; i = (char *)i + 1)
            {
              if (*(void *)v52 != v47) {
                objc_enumerationMutation(obj);
              }
              unsigned int v19 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)i);
              double v20 = v12;
              os_log_t v21 = *v12;
              if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
              {
                trpIdToRCMap = self->_trpIdToRCMap;
                __int128 v23 = v21;
                id v24 = objc_loadWeakRetained((id *)p_proxy);
                *(_DWORD *)buf = 136315906;
                v56 = "-[CSTrpTcuMapper processTRPWithId:withSpeechPackage:enforceTrpSelection:]";
                __int16 v57 = 2112;
                *(void *)v58 = v50;
                *(_WORD *)&v58[8] = 2112;
                *(void *)&v58[10] = trpIdToRCMap;
                __int16 v59 = 2112;
                double v60 = *(double *)&v24;
                _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%s Trying RC acceptance for trpId %@ map %@ with _proxy:%@",  buf,  0x2Au);
              }

              id v25 = objc_loadWeakRetained((id *)p_proxy);
              __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v19 endpointerMetrics]);
              unsigned __int8 v27 = [v25 shouldAcceptEagerResultForDurationSync:v26 withEndpointerMetrics:v17];

              if ((v27 & 1) != 0)
              {
                v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_hardEndpointerCache, "lastObject"));
                [v19 setTrpID:v50];
                __int16 v12 = v20;
                os_log_t v29 = *v20;
                if (os_log_type_enabled(*v20, OS_LOG_TYPE_DEFAULT))
                {
                  id v30 = v29;
                  [v28 endpointTime];
                  *(_DWORD *)buf = 136315906;
                  v56 = "-[CSTrpTcuMapper processTRPWithId:withSpeechPackage:enforceTrpSelection:]";
                  __int16 v57 = 2048;
                  *(void *)v58 = v31;
                  *(_WORD *)&v58[8] = 2112;
                  *(void *)&v58[10] = v50;
                  __int16 v59 = 2048;
                  double v60 = v17;
                  _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "%s Associating EP at time: %f with trpId: %@ with RCTime: %f",  buf,  0x2Au);
                }

                uint64_t v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "endpointerMetrics", v45));

                char v49 = 1;
                v48 = (void *)v32;
              }

              else
              {
                __int16 v12 = v20;
                __int16 v33 = *v20;
                if (os_log_type_enabled(*v20, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315650;
                  v56 = "-[CSTrpTcuMapper processTRPWithId:withSpeechPackage:enforceTrpSelection:]";
                  __int16 v57 = 2112;
                  *(void *)v58 = v50;
                  *(_WORD *)&v58[8] = 2048;
                  *(double *)&v58[10] = v17;
                  _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "%s TRPId %@ with duration %f not accepted !",  buf,  0x20u);
                }
              }

              int64_t v34 = *v12;
              if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                v56 = "-[CSTrpTcuMapper processTRPWithId:withSpeechPackage:enforceTrpSelection:]";
                __int16 v57 = 1024;
                *(_DWORD *)v58 = v49 & 1;
                *(_WORD *)&v58[4] = 2048;
                *(double *)&v58[6] = v17;
                _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "%s EP found: %d for RC at time: %f",  buf,  0x1Cu);
              }
            }

            id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v51,  v61,  16LL);
          }

          while (v16);
        }

        else
        {
          v48 = 0LL;
          char v49 = 0;
        }

        id v9 = v45;
        __int16 v37 = v48;
        goto LABEL_34;
      }
    }

    double v38 = (void *)CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
    {
      hardEndpointerCache = self->_hardEndpointerCache;
      v40 = v38;
      id v41 = -[NSMutableArray count](hardEndpointerCache, "count");
      id v42 = objc_loadWeakRetained((id *)&self->_proxy);
      *(_DWORD *)buf = 136315650;
      v56 = "-[CSTrpTcuMapper processTRPWithId:withSpeechPackage:enforceTrpSelection:]";
      __int16 v57 = 2048;
      *(void *)v58 = v41;
      *(_WORD *)&v58[8] = 2112;
      *(void *)&v58[10] = v42;
      _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "%s Not running EP selection logic, num EPs: %lu EP-Proxy %@",  buf,  0x20u);
    }

- (void)_cacheHardEndPointerMetric:(double)a3 withMetrics:(id)a4
{
  id v6 = a4;
  v7 = (os_log_s *)CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315650;
    double v10 = "-[CSTrpTcuMapper _cacheHardEndPointerMetric:withMetrics:]";
    __int16 v11 = 2048;
    double v12 = a3;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Caching Hard EndpointInfo at time:%f hardendpointerMetrics:%@",  (uint8_t *)&v9,  0x20u);
  }

  id v8 = objc_alloc_init(&OBJC_CLASS___CSAttSiriCachedEndpointInfo);
  -[CSAttSiriCachedEndpointInfo setEndpointTime:](v8, "setEndpointTime:", a3);
  -[CSAttSiriCachedEndpointInfo setEndpointerMetrics:](v8, "setEndpointerMetrics:", v6);
  -[NSMutableArray addObject:](self->_hardEndpointerCache, "addObject:", v8);
}

- (void)_cacheRelaxedEndPointerMetric:(double)a3 withMetrics:(id)a4
{
  id v6 = a4;
  v7 = (os_log_s *)CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315650;
    __int16 v11 = "-[CSTrpTcuMapper _cacheRelaxedEndPointerMetric:withMetrics:]";
    __int16 v12 = 2048;
    double v13 = a3;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Caching Relaxed EndpointInfo at time:%f relaxedendpointerMetrics:%@",  (uint8_t *)&v10,  0x20u);
  }

  id v8 = objc_alloc_init(&OBJC_CLASS___CSAttSiriCachedEndpointInfo);
  -[CSAttSiriCachedEndpointInfo setEndpointTime:](v8, "setEndpointTime:", a3);
  -[CSAttSiriCachedEndpointInfo setEndpointerMetrics:](v8, "setEndpointerMetrics:", v6);
  relaxedEndpointerCache = self->_relaxedEndpointerCache;
  self->_relaxedEndpointerCache = v8;
}

- (void)_resetEndpointCaches
{
  v3 = (os_log_s *)CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    id v6 = "-[CSTrpTcuMapper _resetEndpointCaches]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }

  relaxedEndpointerCache = self->_relaxedEndpointerCache;
  self->_relaxedEndpointerCache = 0LL;

  -[NSMutableArray removeAllObjects](self->_hardEndpointerCache, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_trpIdToRCMap, "removeAllObjects");
}

- (CSEndpointerProxy)proxy
{
  return (CSEndpointerProxy *)objc_loadWeakRetained((id *)&self->_proxy);
}

- (NSMutableArray)hardEndpointerCache
{
  return self->_hardEndpointerCache;
}

- (void)setHardEndpointerCache:(id)a3
{
}

- (CSAttSiriCachedEndpointInfo)relaxedEndpointerCache
{
  return self->_relaxedEndpointerCache;
}

- (void)setRelaxedEndpointerCache:(id)a3
{
}

- (NSMutableDictionary)trpIdToRCMap
{
  return self->_trpIdToRCMap;
}

- (void)setTrpIdToRCMap:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end