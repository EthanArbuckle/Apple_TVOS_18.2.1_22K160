@interface CLClientAuthorizationCache
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)isInitialCache;
- (CLClientAuthorizationCache)init;
- (CLLocation)currentLocation;
- (NSDictionary)clientKeyToAuthContextMap;
- (NSMutableArray)cachePopulationReplyBlocks;
- (NSMutableDictionary)clientKeyToClientInfoMap;
- (id)syncgetAuthorizationContextForClient:(id)a3 at:(id)a4;
- (id)syncgetAuthorizationContextIfClientIsNonZonal:(id)a3;
- (int)syncgetAuthorizationOfClient:(id)a3 forServiceMask:(unint64_t)a4;
- (void)beginService;
- (void)endService;
- (void)getAuthorizationContextOfNonZonalClient:(id)a3 withReply:(id)a4;
- (void)notifyWhenCacheIsPopulatedWithReply:(id)a3;
- (void)setCachePopulationReplyBlocks:(id)a3;
- (void)setClientKeyToAuthContextMap:(id)a3;
- (void)setClientKeyToClientInfoMap:(id)a3;
- (void)setClientsAuthorizationMap:(id)a3;
- (void)setCurrentLocation:(id)a3;
- (void)setIsInitialCache:(BOOL)a3;
- (void)setPersistentStoreDictionary:(id)a3 forClient:(id)a4;
- (void)updateCurrentLocation:(id)a3;
@end

@implementation CLClientAuthorizationCache

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10199FC28 != -1) {
    dispatch_once(&qword_10199FC28, &stru_101892BD0);
  }
  return (id)qword_10199FC20;
}

- (CLClientAuthorizationCache)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLClientAuthorizationCache;
  return -[CLClientAuthorizationCache initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLClientAuthorizationCacheProtocol,  &OBJC_PROTOCOL___CLClientAuthorizationCacheClientProtocol);
}

- (void)beginService
{
  self->_cachePopulationReplyBlocks = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
}

- (void)endService
{
  self->_cachePopulationReplyBlocks = 0LL;
  -[CLClientAuthorizationCache setClientKeyToClientInfoMap:](self, "setClientKeyToClientInfoMap:", 0LL);
}

- (int)syncgetAuthorizationOfClient:(id)a3 forServiceMask:(unint64_t)a4
{
  id v6 = -[NSDictionary objectForKeyedSubscript:]( -[CLClientAuthorizationCache clientKeyToAuthContextMap](self, "clientKeyToAuthContextMap"),  "objectForKeyedSubscript:",  a3);
  if (v6)
  {
    unsigned int v7 = [v6 transientAwareRegistrationResult];
    if ((a4 & 0xFFFFFFFFFFFF7380LL) != 0) {
      int v8 = 2;
    }
    else {
      int v8 = v7;
    }
  }

  else
  {
    int v8 = 4;
  }

  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_101892BF0);
  }
  v9 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    id v21 = [a3 UTF8String];
    __int16 v22 = 2048;
    unint64_t v23 = a4;
    __int16 v24 = 1024;
    int v25 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "syncgetAuthorizationOfClient, %s, forServiceMask, %lx, authorized, %d",  buf,  0x1Cu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101892BF0);
    }
    uint64_t v11 = qword_101934988;
    int v14 = 136315650;
    id v15 = [a3 UTF8String];
    __int16 v16 = 2048;
    unint64_t v17 = a4;
    __int16 v18 = 1024;
    int v19 = v8;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v11,  2LL,  "syncgetAuthorizationOfClient, %s, forServiceMask, %lx, authorized, %d",  (const char *)&v14,  28);
    v13 = (uint8_t *)v12;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLClientAuthorizationCache syncgetAuthorizationOfClient:forServiceMask:]",  "%s\n",  v12);
    if (v13 != buf) {
      free(v13);
    }
  }

  return v8;
}

- (id)syncgetAuthorizationContextIfClientIsNonZonal:(id)a3
{
  if (-[NSMutableDictionary objectForKeyedSubscript:]( -[CLClientAuthorizationCache clientKeyToClientInfoMap](self, "clientKeyToClientInfoMap"),  "objectForKeyedSubscript:",  a3))
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101892BF0);
    }
    unint64_t v5 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
    {
      int v9 = 68289282;
      int v10 = 0;
      __int16 v11 = 2082;
      v12 = "";
      __int16 v13 = 2082;
      id v14 = [a3 UTF8String];
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:Zonal client trying to access auth-context via Non-Zonal CLCAC api, Client:%{public , location:escape_only}s}",  (uint8_t *)&v9,  0x1Cu);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101892BF0);
      }
    }

    id v6 = (os_log_s *)qword_101934988;
    if (os_signpost_enabled((os_log_t)qword_101934988))
    {
      id v7 = [a3 UTF8String];
      int v9 = 68289282;
      int v10 = 0;
      __int16 v11 = 2082;
      v12 = "";
      __int16 v13 = 2082;
      id v14 = v7;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v6,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "Zonal client trying to access auth-context via Non-Zonal CLCAC api",  "{msg%{public}.0s:Zonal client trying to access auth-context via Non-Zonal CLCAC api, Client:%{public , location:escape_only}s}",  (uint8_t *)&v9,  0x1Cu);
    }
  }

  return -[NSDictionary objectForKeyedSubscript:]( -[CLClientAuthorizationCache clientKeyToAuthContextMap](self, "clientKeyToAuthContextMap"),  "objectForKeyedSubscript:",  a3);
}

- (void)getAuthorizationContextOfNonZonalClient:(id)a3 withReply:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100FC7CF8;
  v4[3] = &unk_1018653A8;
  v4[4] = self;
  v4[5] = a3;
  v4[6] = a4;
  -[CLClientAuthorizationCache notifyWhenCacheIsPopulatedWithReply:](self, "notifyWhenCacheIsPopulatedWithReply:", v4);
}

- (id)syncgetAuthorizationContextForClient:(id)a3 at:(id)a4
{
  id v7 = -[NSDictionary objectForKeyedSubscript:]( -[CLClientAuthorizationCache clientKeyToAuthContextMap](self, "clientKeyToAuthContextMap"),  "objectForKeyedSubscript:",  a3);
  if (v7)
  {
    int v8 = v7;
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101892BF0);
    }
    uint64_t v9 = qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289282;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(void *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = [a3 UTF8String];
      int v10 = "{msg%{public}.0s:#clcac fetching auth-context from non-zonal cache, Client:%{public, location:escape_only}s}";
      __int16 v11 = buf;
      v12 = (os_log_s *)v9;
      uint32_t v13 = 28;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, v10, v11, v13);
    }
  }

  else if (-[NSMutableDictionary objectForKeyedSubscript:]( -[CLClientAuthorizationCache clientKeyToClientInfoMap](self, "clientKeyToClientInfoMap"),  "objectForKeyedSubscript:",  a3))
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101892BF0);
    }
    id v14 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289282;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(void *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = [a3 UTF8String];
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:#clcac computing auth-context from clientInfo in zonal cache, Client:%{public, loca tion:escape_only}s}",  buf,  0x1Cu);
    }

    id v15 = (NSMutableDictionary *)-[NSMutableDictionary objectForKeyedSubscript:]( -[CLClientAuthorizationCache clientKeyToClientInfoMap]( self,  "clientKeyToClientInfoMap"),  "objectForKeyedSubscript:",  a3);
    id v16 = -[NSMutableDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", @"BigSwitchState");
    unint64_t v17 = sub_100AE0E60(v15, 0, v16 != 0LL, 0);
    unsigned int v18 = objc_msgSend( -[NSArray objectAtIndexedSubscript:](v17, "objectAtIndexedSubscript:", 1),  "intValue");
    unsigned int v19 = objc_msgSend( -[NSArray objectAtIndexedSubscript:](v17, "objectAtIndexedSubscript:", 2),  "intValue");
    if (a4)
    {
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101892BF0);
      }
      v20 = (os_log_s *)qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEBUG))
      {
        id v21 = [a3 UTF8String];
        *(_DWORD *)buf = 68289282;
        *(_DWORD *)&uint8_t buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(void *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2082;
        *(void *)&buf[20] = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:#clcac location specified by zonal-client. Skip showing location-arrow, Client:%{ public, location:escape_only}s}",  buf,  0x1Cu);
      }

      [a4 clientLocation];
      return sub_100AE1A9C(v15, v18, v19, v16 != 0LL, (uint64_t)v52);
    }

    else
    {
      v51[6] = xmmword_1012E49E8;
      v51[7] = unk_1012E49F8;
      memset(&v51[8], 0, 28);
      v51[2] = xmmword_1012E49A8;
      v51[3] = unk_1012E49B8;
      v51[4] = xmmword_1012E49C8;
      v51[5] = unk_1012E49D8;
      v51[0] = xmmword_1012E4988;
      v51[1] = unk_1012E4998;
      v26 = sub_100AE1A9C(v15, v18, v19, v16 != 0LL, (uint64_t)v51);
      v27 = -[CLClientAuthorizationCache currentLocation](self, "currentLocation");
      if (v27)
      {
        -[CLLocation clientLocation](v27, "clientLocation");
      }

      else
      {
        __int128 v72 = 0u;
        memset(v73, 0, 28);
        __int128 v70 = 0u;
        __int128 v71 = 0u;
        __int128 v68 = 0u;
        __int128 v69 = 0u;
        __int128 v67 = 0u;
        memset(buf, 0, sizeof(buf));
      }

      v49[6] = v71;
      v49[7] = v72;
      v50[0] = v73[0];
      *(_OWORD *)((char *)v50 + 12) = *(_OWORD *)((char *)v73 + 12);
      v49[2] = v67;
      v49[3] = v68;
      v49[4] = v69;
      v49[5] = v70;
      v49[0] = *(_OWORD *)buf;
      v49[1] = *(_OWORD *)&buf[16];
      int v8 = sub_100AE1A9C(v15, v18, v19, v16 != 0LL, (uint64_t)v49);
      if (-[CLClientManagerAuthorizationContext isEqual:](v26, "isEqual:", v8))
      {
        if (qword_101934980 != -1) {
          dispatch_once(&qword_101934980, &stru_101892BF0);
        }
        uint64_t v28 = qword_101934988;
        if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEBUG))
        {
          id v29 = [a3 UTF8String];
          *(_DWORD *)v53 = 68289795;
          *(_DWORD *)&v53[4] = 0;
          __int16 v54 = 2082;
          v55 = "";
          __int16 v56 = 2082;
          id v57 = v29;
          __int16 v58 = 1040;
          int v59 = 156;
          __int16 v60 = 2097;
          v61 = buf;
          int v10 = "{msg%{public}.0s:#clcac location not specified. NonZonal-AC is same as Zonal-AC at current-locatio"
                "n. Skip showing location-arrow\", \"Client\":%{public, location:escape_only}s, \"CLCAC-currentLocation\""
                ":%{private, location:CLClientLocation}.*P}";
          __int16 v11 = v53;
          v12 = (os_log_s *)v28;
          uint32_t v13 = 44;
          goto LABEL_6;
        }
      }

      else
      {
        if (qword_101934980 != -1) {
          dispatch_once(&qword_101934980, &stru_101892BF0);
        }
        v30 = (os_log_s *)qword_101934988;
        if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEBUG))
        {
          id v31 = [a3 UTF8String];
          *(_DWORD *)v53 = 68290307;
          *(_DWORD *)&v53[4] = 0;
          __int16 v54 = 2082;
          v55 = "";
          __int16 v56 = 2082;
          id v57 = v31;
          __int16 v58 = 1040;
          int v59 = 156;
          __int16 v60 = 2097;
          v61 = buf;
          __int16 v62 = 2114;
          v63 = v26;
          __int16 v64 = 2114;
          v65 = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:#clcac location not specified. NonZonal-AC differs from Zonal-AC at current-location. Showing location-arrow, Client:%{public, location:escape_only}s, CLCAC-currentLocation:%{private, location:CLClientLocation}.*P, NonZonalAC:%{public, location:escape_only}@, ZonalAC:%{public, locat ion:escape_only}@}",  v53,  0x40u);
        }

        id v32 = objc_msgSend( -[CLClientAuthorizationCache vendor](self, "vendor"),  "proxyForService:forClient:",  @"CLClientManager",  @"CLClientAuthorizationCache");
        if (qword_101934980 != -1) {
          dispatch_once(&qword_101934980, &stru_101892BF0);
        }
        v33 = (os_log_s *)qword_101934988;
        if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_INFO))
        {
          id v34 = [a3 UTF8String];
          *(_DWORD *)v53 = 68289282;
          *(_DWORD *)&v53[4] = 0;
          __int16 v54 = 2082;
          v55 = "";
          __int16 v56 = 2082;
          id v57 = v34;
          _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:markReceivingLocationInformation, Client:%{public, location:escape_only}s}",  v53,  0x1Cu);
        }

        sub_1010DDBC0(v53, (char *)[a3 UTF8String]);
        sub_100FE3188((std::string *)v53, (uint64_t)v35);
        [v32 markReceivingLocationInformation:sub_1011DBFBC((__int128 *)v35)];
        if (v48 < 0) {
          operator delete(__p);
        }
        if (v46 < 0) {
          operator delete(v45);
        }
        if (v44 < 0) {
          operator delete(v43);
        }
        if (v42 < 0) {
          operator delete(v41);
        }
        if (v40 < 0) {
          operator delete(v39);
        }
        if (v38 < 0) {
          operator delete(v37);
        }
        if (v36 < 0) {
          operator delete(v35[0]);
        }
        if (SBYTE3(v57) < 0) {
          operator delete(*(void **)v53);
        }
      }
    }
  }

  else
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101892BF0);
    }
    __int16 v22 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289282;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(void *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = [a3 UTF8String];
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:Unable to find client in both non-zonal and zonal cache #clcac, Client:%{public, lo cation:escape_only}s}",  buf,  0x1Cu);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101892BF0);
      }
    }

    unint64_t v23 = (os_log_s *)qword_101934988;
    if (os_signpost_enabled((os_log_t)qword_101934988))
    {
      id v24 = [a3 UTF8String];
      *(_DWORD *)buf = 68289282;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(void *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = v24;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v23,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "Unable to find client in both non-zonal and zonal cache #clcac",  "{msg%{public}.0s:Unable to find client in both non-zonal and zonal cache #clcac, Client:%{public, lo cation:escape_only}s}",  buf,  0x1Cu);
    }

    return 0LL;
  }

  return v8;
}

- (void)setClientsAuthorizationMap:(id)a3
{
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_101892BF0);
  }
  unint64_t v5 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEBUG))
  {
    uint64_t buf = 68289282LL;
    __int16 v18 = 2082;
    unsigned int v19 = "";
    __int16 v20 = 2114;
    id v21 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:setClientsAuthorizationMap, clientToAuthorizationMap:%{public, location:escape_only}@}",  (uint8_t *)&buf,  0x1Cu);
  }

  if (-[CLClientAuthorizationCache clientKeyToAuthContextMap](self, "clientKeyToAuthContextMap")) {
    BOOL v6 = 0LL;
  }
  else {
    BOOL v6 = -[CLClientAuthorizationCache clientKeyToClientInfoMap](self, "clientKeyToClientInfoMap") == 0LL;
  }
  -[CLClientAuthorizationCache setIsInitialCache:](self, "setIsInitialCache:", v6);
  -[CLClientAuthorizationCache setClientKeyToAuthContextMap:](self, "setClientKeyToAuthContextMap:", a3);
  if (-[CLClientAuthorizationCache isInitialCache](self, "isInitialCache"))
  {
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    cachePopulationReplyBlocks = self->_cachePopulationReplyBlocks;
    id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cachePopulationReplyBlocks,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(cachePopulationReplyBlocks);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8LL * (void)i) + 16LL))();
        }

        id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( cachePopulationReplyBlocks,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      }

      while (v9);
    }

    self->_cachePopulationReplyBlocks = 0LL;
  }

- (void)setPersistentStoreDictionary:(id)a3 forClient:(id)a4
{
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_101892BF0);
  }
  id v7 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)uint64_t buf = 68289538;
    int v24 = 0;
    __int16 v25 = 2082;
    v26 = "";
    __int16 v27 = 2082;
    id v28 = [a4 UTF8String];
    __int16 v29 = 2114;
    id v30 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:setPersistentStoreDictionary, Client:%{public, location:escape_only}s, ClientDictio nary:%{public, location:escape_only}@}",  buf,  0x26u);
  }

  if (-[CLClientAuthorizationCache clientKeyToAuthContextMap](self, "clientKeyToAuthContextMap")) {
    BOOL v8 = 0LL;
  }
  else {
    BOOL v8 = -[CLClientAuthorizationCache clientKeyToClientInfoMap](self, "clientKeyToClientInfoMap") == 0LL;
  }
  -[CLClientAuthorizationCache setIsInitialCache:](self, "setIsInitialCache:", v8);
  if (-[CLClientAuthorizationCache clientKeyToClientInfoMap](self, "clientKeyToClientInfoMap"))
  {
    if (!a3) {
      goto LABEL_14;
    }
  }

  else
  {
    -[CLClientAuthorizationCache setClientKeyToClientInfoMap:]( self,  "setClientKeyToClientInfoMap:",  objc_alloc_init(&OBJC_CLASS___NSMutableDictionary));
    if (!a3) {
      goto LABEL_14;
    }
  }

  if (a4)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( -[CLClientAuthorizationCache clientKeyToClientInfoMap](self, "clientKeyToClientInfoMap"),  "setObject:forKeyedSubscript:",  a3,  a4);
    goto LABEL_24;
  }

- (void)notifyWhenCacheIsPopulatedWithReply:(id)a3
{
  if (-[CLClientAuthorizationCache clientKeyToAuthContextMap](self, "clientKeyToAuthContextMap")
    || -[CLClientAuthorizationCache clientKeyToClientInfoMap](self, "clientKeyToClientInfoMap"))
  {
    (*((void (**)(id))a3 + 2))(a3);
  }

  else
  {
    -[NSMutableArray addObject:]( self->_cachePopulationReplyBlocks,  "addObject:",  [a3 copy]);
  }

- (void)updateCurrentLocation:(id)a3
{
}

- (NSDictionary)clientKeyToAuthContextMap
{
  return self->_clientKeyToAuthContextMap;
}

- (void)setClientKeyToAuthContextMap:(id)a3
{
}

- (NSMutableDictionary)clientKeyToClientInfoMap
{
  return self->_clientKeyToClientInfoMap;
}

- (void)setClientKeyToClientInfoMap:(id)a3
{
}

- (CLLocation)currentLocation
{
  return self->_currentLocation;
}

- (void)setCurrentLocation:(id)a3
{
}

- (BOOL)isInitialCache
{
  return self->_isInitialCache;
}

- (void)setIsInitialCache:(BOOL)a3
{
  self->_isInitialCache = a3;
}

- (NSMutableArray)cachePopulationReplyBlocks
{
  return self->_cachePopulationReplyBlocks;
}

- (void)setCachePopulationReplyBlocks:(id)a3
{
}

@end