@interface RDXPCHandler
- (RDCachedData)dataCache;
- (RDXPCHandler)init;
- (void)createCacheDirAtPath:(id)a3;
- (void)createNewDataCache;
- (void)ping;
- (void)setCacheLockState:(BOOL)a3;
- (void)setDataCache:(id)a3;
- (void)shareStatusWithPeers;
- (void)triggerUpdateToEligibilityEngine;
- (void)update:(int64_t)a3 withCountryCode:(id)a4;
- (void)update:(int64_t)a3 withDict:(id)a4;
- (void)update:(int64_t)a3 withListOfCountryCodes:(id)a4;
- (void)updatePeer:(id)a3 withCountryCode:(id)a4 priority:(int)a5 andTimestamp:(id)a6;
- (void)updatePeer:(id)a3 withEstimate:(id)a4;
- (void)updatePeer:(id)a3 withInfo:(id)a4;
@end

@implementation RDXPCHandler

- (void)createNewDataCache
{
  dataCache = self->_dataCache;
  self->_dataCache = 0LL;

  v4 = objc_alloc_init(&OBJC_CLASS___RDCachedData);
  v5 = self->_dataCache;
  self->_dataCache = v4;

  -[RDCachedData saveCache](self->_dataCache, "saveCache");
}

- (RDXPCHandler)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___RDXPCHandler;
  v2 = -[RDXPCHandler init](&v7, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[RDCachedData loadCache](&OBJC_CLASS___RDCachedData, "loadCache"));
    dataCache = v2->_dataCache;
    v2->_dataCache = (RDCachedData *)v3;

    if (!v3)
    {
      if (qword_100019350 != -1) {
        dispatch_once(&qword_100019350, &stru_100014A08);
      }
      v5 = (os_log_s *)qword_100019358;
      if (os_log_type_enabled((os_log_t)qword_100019358, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        int v9 = 0;
        __int16 v10 = 2082;
        v11 = "";
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:Cache load failed, perhaps because it was never set before. Starting a new one}",  buf,  0x12u);
      }

      -[RDXPCHandler createNewDataCache](v2, "createNewDataCache");
    }
  }

  return v2;
}

- (void)update:(int64_t)a3 withDict:(id)a4
{
  id v6 = a4;
  if (sub_10000C0EC())
  {
    if (sub_10000C320())
    {
      if (qword_100019350 != -1) {
        dispatch_once(&qword_100019350, &stru_100014A08);
      }
      objc_super v7 = (os_log_s *)qword_100019358;
      if (os_log_type_enabled((os_log_t)qword_100019358, OS_LOG_TYPE_DEFAULT))
      {
        int v25 = 68289026;
        int v26 = 0;
        __int16 v27 = 2082;
        v28 = "";
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:updates are currently disabled, ignoring}",  (uint8_t *)&v25,  0x12u);
      }
    }

    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kRDUpdateKeyCountryCodes]);
      int v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kRDUpdateKeyInDisputedArea]);
      id v10 = [v9 BOOLValueSafe];

      if (v8 && (uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSArray), (objc_opt_isKindOfClass(v8, v11) & 1) == 0))
      {
        if (qword_100019350 != -1) {
          dispatch_once(&qword_100019350, &stru_100014A08);
        }
        v15 = (void *)qword_100019358;
        if (os_log_type_enabled((os_log_t)qword_100019358, OS_LOG_TYPE_FAULT))
        {
          v16 = v15;
          int v25 = 68289538;
          int v26 = 0;
          __int16 v27 = 2082;
          v28 = "";
          __int16 v29 = 2114;
          id v30 = v8;
          __int16 v31 = 2114;
          id v32 = (id)objc_opt_class(v8);
          id v17 = v32;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:update from peer had malformed country codes entry, countryCodes:%{public, loca tion:escape_only}@, class:%{public, location:escape_only}@}",  (uint8_t *)&v25,  0x26u);

          if (qword_100019350 != -1) {
            dispatch_once(&qword_100019350, &stru_100014A08);
          }
        }

        v18 = (void *)qword_100019358;
        if (os_signpost_enabled((os_log_t)qword_100019358))
        {
          v19 = v18;
          v20 = (void *)objc_opt_class(v8);
          int v25 = 68289538;
          int v26 = 0;
          __int16 v27 = 2082;
          v28 = "";
          __int16 v29 = 2114;
          id v30 = v8;
          __int16 v31 = 2114;
          id v32 = v20;
          id v21 = v20;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v19,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "update from peer had malformed country codes entry",  "{msg%{public}.0s:update from peer had malformed country codes entry, countryCodes:%{public, loca tion:escape_only}@, class:%{public, location:escape_only}@}",  (uint8_t *)&v25,  0x26u);
        }
      }

      else
      {
        id v12 = v8;
        switch(a3)
        {
          case 0LL:
            if (qword_100019350 != -1) {
              dispatch_once(&qword_100019350, &stru_100014A08);
            }
            v13 = (os_log_s *)qword_100019358;
            if (os_log_type_enabled((os_log_t)qword_100019358, OS_LOG_TYPE_DEFAULT))
            {
              int v25 = 68289538;
              int v26 = 0;
              __int16 v27 = 2082;
              v28 = "";
              __int16 v29 = 2114;
              id v30 = v12;
              __int16 v31 = 1026;
              LODWORD(v32) = (_DWORD)v10;
              _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:Location info update, countryCodes:%{public, location:escape_only}@, isDi sputed:%{public}hhd}",  (uint8_t *)&v25,  0x22u);
            }

            v14 = (void *)objc_claimAutoreleasedReturnValue(-[RDXPCHandler dataCache](self, "dataCache"));
            [v14 setCountriesFromLocation:v12 isInDisputedArea:v10];
            goto LABEL_37;
          case 1LL:
            if (qword_100019350 != -1) {
              dispatch_once(&qword_100019350, &stru_100014A08);
            }
            v22 = (os_log_s *)qword_100019358;
            if (os_log_type_enabled((os_log_t)qword_100019358, OS_LOG_TYPE_DEFAULT))
            {
              int v25 = 68289282;
              int v26 = 0;
              __int16 v27 = 2082;
              v28 = "";
              __int16 v29 = 2114;
              id v30 = v12;
              _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:NearbyCell info update, countryCodes:%{public, location:escape_only}@}",  (uint8_t *)&v25,  0x1Cu);
            }

            v14 = (void *)objc_claimAutoreleasedReturnValue(-[RDXPCHandler dataCache](self, "dataCache"));
            [v14 setCountriesFromNearbyCells:v12];
            goto LABEL_37;
          case 2LL:
            if (qword_100019350 != -1) {
              dispatch_once(&qword_100019350, &stru_100014A08);
            }
            v23 = (os_log_s *)qword_100019358;
            if (os_log_type_enabled((os_log_t)qword_100019358, OS_LOG_TYPE_DEFAULT))
            {
              int v25 = 68289282;
              int v26 = 0;
              __int16 v27 = 2082;
              v28 = "";
              __int16 v29 = 2114;
              id v30 = v12;
              _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:ServingCell info update, countryCodes:%{public, location:escape_only}@}",  (uint8_t *)&v25,  0x1Cu);
            }

            v14 = (void *)objc_claimAutoreleasedReturnValue(-[RDXPCHandler dataCache](self, "dataCache"));
            [v14 setCountriesFromServingCell:v12];
            goto LABEL_37;
          case 3LL:
            if (qword_100019350 != -1) {
              dispatch_once(&qword_100019350, &stru_100014A08);
            }
            v24 = (os_log_s *)qword_100019358;
            if (os_log_type_enabled((os_log_t)qword_100019358, OS_LOG_TYPE_DEFAULT))
            {
              int v25 = 68289282;
              int v26 = 0;
              __int16 v27 = 2082;
              v28 = "";
              __int16 v29 = 2114;
              id v30 = v12;
              _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:WiFi AP info update, countryCodes:%{public, location:escape_only}@}",  (uint8_t *)&v25,  0x1Cu);
            }

            v14 = (void *)objc_claimAutoreleasedReturnValue(-[RDXPCHandler dataCache](self, "dataCache"));
            [v14 setCountriesFromWiFiAPs:v12];
LABEL_37:

            break;
          default:
            break;
        }
      }
    }
  }
}

- (void)update:(int64_t)a3 withListOfCountryCodes:(id)a4
{
  id v6 = a4;
  if (sub_10000C0EC())
  {
    if (!sub_10000C320())
    {
      switch(a3)
      {
        case 0LL:
          if (qword_100019350 != -1) {
            dispatch_once(&qword_100019350, &stru_100014A08);
          }
          int v9 = (os_log_s *)qword_100019358;
          if (os_log_type_enabled((os_log_t)qword_100019358, OS_LOG_TYPE_DEFAULT))
          {
            int v15 = 68289282;
            int v16 = 0;
            __int16 v17 = 2082;
            v18 = "";
            __int16 v19 = 2114;
            id v20 = v6;
            _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:Location update, countryCodes:%{public, location:escape_only}@}",  (uint8_t *)&v15,  0x1Cu);
          }

          id v10 = (void *)objc_claimAutoreleasedReturnValue(-[RDXPCHandler dataCache](self, "dataCache"));
          [v10 setCountriesFromLocation:v6];
          goto LABEL_38;
        case 1LL:
          if (qword_100019350 != -1) {
            dispatch_once(&qword_100019350, &stru_100014A08);
          }
          uint64_t v11 = (os_log_s *)qword_100019358;
          if (os_log_type_enabled((os_log_t)qword_100019358, OS_LOG_TYPE_DEFAULT))
          {
            int v15 = 68289282;
            int v16 = 0;
            __int16 v17 = 2082;
            v18 = "";
            __int16 v19 = 2114;
            id v20 = v6;
            _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:NearbyCell update, countryCodes:%{public, location:escape_only}@}",  (uint8_t *)&v15,  0x1Cu);
          }

          id v10 = (void *)objc_claimAutoreleasedReturnValue(-[RDXPCHandler dataCache](self, "dataCache"));
          [v10 setCountriesFromNearbyCells:v6];
          goto LABEL_38;
        case 2LL:
          if (qword_100019350 != -1) {
            dispatch_once(&qword_100019350, &stru_100014A08);
          }
          id v12 = (os_log_s *)qword_100019358;
          if (os_log_type_enabled((os_log_t)qword_100019358, OS_LOG_TYPE_DEFAULT))
          {
            int v15 = 68289282;
            int v16 = 0;
            __int16 v17 = 2082;
            v18 = "";
            __int16 v19 = 2114;
            id v20 = v6;
            _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:ServingCell update, countryCodes:%{public, location:escape_only}@}",  (uint8_t *)&v15,  0x1Cu);
          }

          id v10 = (void *)objc_claimAutoreleasedReturnValue(-[RDXPCHandler dataCache](self, "dataCache"));
          [v10 setCountriesFromServingCell:v6];
          goto LABEL_38;
        case 3LL:
          if (qword_100019350 != -1) {
            dispatch_once(&qword_100019350, &stru_100014A08);
          }
          v13 = (os_log_s *)qword_100019358;
          if (os_log_type_enabled((os_log_t)qword_100019358, OS_LOG_TYPE_DEFAULT))
          {
            int v15 = 68289282;
            int v16 = 0;
            __int16 v17 = 2082;
            v18 = "";
            __int16 v19 = 2114;
            id v20 = v6;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:WiFi AP update, countryCodes:%{public, location:escape_only}@}",  (uint8_t *)&v15,  0x1Cu);
          }

          id v10 = (void *)objc_claimAutoreleasedReturnValue(-[RDXPCHandler dataCache](self, "dataCache"));
          [v10 setCountriesFromWiFiAPs:v6];
          goto LABEL_38;
        case 4LL:
          if (qword_100019350 != -1) {
            dispatch_once(&qword_100019350, &stru_100014A08);
          }
          objc_super v7 = (os_log_s *)qword_100019358;
          if (!os_log_type_enabled((os_log_t)qword_100019358, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_39;
          }
          int v15 = 68289026;
          int v16 = 0;
          __int16 v17 = 2082;
          v18 = "";
          v8 = "{msg%{public}.0s:clearing state}";
          goto LABEL_7;
        case 5LL:
          if (qword_100019350 != -1) {
            dispatch_once(&qword_100019350, &stru_100014A08);
          }
          v14 = (os_log_s *)qword_100019358;
          if (os_log_type_enabled((os_log_t)qword_100019358, OS_LOG_TYPE_DEFAULT))
          {
            int v15 = 68289026;
            int v16 = 0;
            __int16 v17 = 2082;
            v18 = "";
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:forcing a recompute}",  (uint8_t *)&v15,  0x12u);
          }

          id v10 = (void *)objc_claimAutoreleasedReturnValue(-[RDXPCHandler dataCache](self, "dataCache"));
          [v10 recompute];
LABEL_38:

          goto LABEL_39;
        default:
          goto LABEL_39;
      }
    }

    if (qword_100019350 != -1) {
      dispatch_once(&qword_100019350, &stru_100014A08);
    }
    objc_super v7 = (os_log_s *)qword_100019358;
    if (os_log_type_enabled((os_log_t)qword_100019358, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 68289026;
      int v16 = 0;
      __int16 v17 = 2082;
      v18 = "";
      v8 = "{msg%{public}.0s:updates are currently disabled, ignoring}";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v15, 0x12u);
    }
  }

- (void)update:(int64_t)a3 withCountryCode:(id)a4
{
  id v6 = a4;
  if (sub_10000C0EC())
  {
    if (!sub_10000C320())
    {
      switch(a3)
      {
        case 0LL:
          if (qword_100019350 != -1) {
            dispatch_once(&qword_100019350, &stru_100014A08);
          }
          int v9 = (void *)qword_100019358;
          if (os_log_type_enabled((os_log_t)qword_100019358, OS_LOG_TYPE_DEFAULT))
          {
            id v10 = v6;
            uint64_t v11 = v9;
            int v20 = 68289282;
            int v21 = 0;
            __int16 v22 = 2082;
            v23 = "";
            __int16 v24 = 2082;
            id v25 = [v10 UTF8String];
            _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:Location update, countryCode:%{public, location:escape_only}s}",  (uint8_t *)&v20,  0x1Cu);
          }

          id v12 = (void *)objc_claimAutoreleasedReturnValue(-[RDXPCHandler dataCache](self, "dataCache"));
          [v12 setCountryFromLocation:v6];
          goto LABEL_33;
        case 2LL:
          if (qword_100019350 != -1) {
            dispatch_once(&qword_100019350, &stru_100014A08);
          }
          v13 = (void *)qword_100019358;
          if (os_log_type_enabled((os_log_t)qword_100019358, OS_LOG_TYPE_DEFAULT))
          {
            id v14 = v6;
            int v15 = v13;
            int v20 = 68289282;
            int v21 = 0;
            __int16 v22 = 2082;
            v23 = "";
            __int16 v24 = 2082;
            id v25 = [v14 UTF8String];
            _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:MCC update, countryCode:%{public, location:escape_only}s}",  (uint8_t *)&v20,  0x1Cu);
          }

          id v12 = (void *)objc_claimAutoreleasedReturnValue(-[RDXPCHandler dataCache](self, "dataCache"));
          [v12 setCountryFromMCC:v6];
          goto LABEL_33;
        case 3LL:
          if (qword_100019350 != -1) {
            dispatch_once(&qword_100019350, &stru_100014A08);
          }
          int v16 = (void *)qword_100019358;
          if (os_log_type_enabled((os_log_t)qword_100019358, OS_LOG_TYPE_DEFAULT))
          {
            id v17 = v6;
            v18 = v16;
            int v20 = 68289282;
            int v21 = 0;
            __int16 v22 = 2082;
            v23 = "";
            __int16 v24 = 2082;
            id v25 = [v17 UTF8String];
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:WiFi AP update, countryCode:%{public, location:escape_only}s}",  (uint8_t *)&v20,  0x1Cu);
          }

          id v12 = (void *)objc_claimAutoreleasedReturnValue(-[RDXPCHandler dataCache](self, "dataCache"));
          [v12 setCountryFromWiFiAPs:v6];
          goto LABEL_33;
        case 4LL:
          if (qword_100019350 != -1) {
            dispatch_once(&qword_100019350, &stru_100014A08);
          }
          objc_super v7 = (os_log_s *)qword_100019358;
          if (!os_log_type_enabled((os_log_t)qword_100019358, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_34;
          }
          int v20 = 68289026;
          int v21 = 0;
          __int16 v22 = 2082;
          v23 = "";
          v8 = "{msg%{public}.0s:clearing state}";
          goto LABEL_7;
        case 5LL:
          if (qword_100019350 != -1) {
            dispatch_once(&qword_100019350, &stru_100014A08);
          }
          __int16 v19 = (os_log_s *)qword_100019358;
          if (os_log_type_enabled((os_log_t)qword_100019358, OS_LOG_TYPE_DEFAULT))
          {
            int v20 = 68289026;
            int v21 = 0;
            __int16 v22 = 2082;
            v23 = "";
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:forcing a recompute}",  (uint8_t *)&v20,  0x12u);
          }

          id v12 = (void *)objc_claimAutoreleasedReturnValue(-[RDXPCHandler dataCache](self, "dataCache"));
          [v12 recompute];
LABEL_33:

          goto LABEL_34;
        default:
          goto LABEL_34;
      }
    }

    if (qword_100019350 != -1) {
      dispatch_once(&qword_100019350, &stru_100014A08);
    }
    objc_super v7 = (os_log_s *)qword_100019358;
    if (os_log_type_enabled((os_log_t)qword_100019358, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 68289026;
      int v21 = 0;
      __int16 v22 = 2082;
      v23 = "";
      v8 = "{msg%{public}.0s:updates are currently disabled, ignoring}";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v20, 0x12u);
    }
  }

- (void)updatePeer:(id)a3 withCountryCode:(id)a4 priority:(int)a5 andTimestamp:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (sub_10000C320())
  {
    if (qword_100019350 != -1) {
      dispatch_once(&qword_100019350, &stru_100014A08);
    }
    v13 = (os_log_s *)qword_100019358;
    if (os_log_type_enabled((os_log_t)qword_100019358, OS_LOG_TYPE_DEFAULT))
    {
      v17[0] = 68289026;
      v17[1] = 0;
      __int16 v18 = 2082;
      __int16 v19 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:updates are currently disabled, ignoring}",  (uint8_t *)v17,  0x12u);
    }
  }

  else
  {
    else {
      unsigned int v14 = a5;
    }
    if (a5 >= 0) {
      uint64_t v15 = v14;
    }
    else {
      uint64_t v15 = 0LL;
    }
    int v16 = -[RDEstimate initWithCountryCode:priority:timestamp:inDisputedArea:]( objc_alloc(&OBJC_CLASS___RDEstimate),  "initWithCountryCode:priority:timestamp:inDisputedArea:",  v11,  v15,  v12,  0LL);
    -[RDXPCHandler updatePeer:withEstimate:](self, "updatePeer:withEstimate:", v10, v16);
  }
}

- (void)updatePeer:(id)a3 withInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (sub_10000C320())
  {
    if (qword_100019350 != -1) {
      dispatch_once(&qword_100019350, &stru_100014A08);
    }
    v8 = (os_log_s *)qword_100019358;
    if (os_log_type_enabled((os_log_t)qword_100019358, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v32 = 0;
      __int16 v33 = 2082;
      v34 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:updates are currently disabled, ignoring}",  buf,  0x12u);
    }
  }

  else if (v6)
  {
    if (sub_10000C0EC())
    {
      int v9 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue( [v9 objectForKeyedSubscript:@"com.apple.RegulatoryDomain.peer_status.priority"]);
      id v11 = [v10 integerValue];

      else {
        unsigned int v12 = v11;
      }
      else {
        uint64_t v13 = 0LL;
      }
      if (qword_100019350 != -1) {
        dispatch_once(&qword_100019350, &stru_100014A08);
      }
      unsigned int v14 = (void *)qword_100019358;
      if (os_log_type_enabled((os_log_t)qword_100019358, OS_LOG_TYPE_DEFAULT))
      {
        log = v14;
        __int16 v27 = (void *)objc_claimAutoreleasedReturnValue( [v9 objectForKeyedSubscript:@"com.apple.RegulatoryDomain.peer_status.priority"]);
        __int16 v29 = (void *)objc_claimAutoreleasedReturnValue( [v9 objectForKeyedSubscript:@"com.apple.RegulatoryDomain.peer_status.priority"]);
        id v15 = [v29 integerValue];
        unsigned int v30 = v13;
        int v16 = (void *)objc_claimAutoreleasedReturnValue( [v9 objectForKeyedSubscript:@"com.apple.RegulatoryDomain.peer_status.isDisputed"]);
        unsigned int v17 = [v16 BOOLValue];
        __int16 v18 = (void *)objc_claimAutoreleasedReturnValue( [v9 objectForKeyedSubscript:@"com.apple.RegulatoryDomain.peer_status.countryCode"]);
        __int16 v19 = (void *)objc_claimAutoreleasedReturnValue( [v9 objectForKeyedSubscript:@"com.apple.RegulatoryDomain.peer_status.timestamp"]);
        *(_DWORD *)buf = 68290562;
        int v32 = 0;
        __int16 v33 = 2082;
        v34 = "";
        __int16 v35 = 2114;
        v36 = v9;
        __int16 v37 = 2114;
        v38 = v27;
        __int16 v39 = 2050;
        id v40 = v15;
        __int16 v41 = 1026;
        unsigned int v42 = v17;
        __int16 v43 = 2114;
        v44 = v18;
        __int16 v45 = 2114;
        v46 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:peer update received, dict:%{public, location:escape_only}@, prio:%{public, l ocation:escape_only}@, prioVal:%{public}ld, disputed?:%{public}hhd, countryCode:%{public, location :escape_only}@, timestamp:%{public, location:escape_only}@}",  buf,  0x4Au);

        uint64_t v13 = v30;
      }

      int v20 = objc_alloc(&OBJC_CLASS___RDEstimate);
      int v21 = (void *)objc_claimAutoreleasedReturnValue( [v9 objectForKeyedSubscript:@"com.apple.RegulatoryDomain.peer_status.countryCode"]);
      __int16 v22 = (void *)objc_claimAutoreleasedReturnValue( [v9 objectForKeyedSubscript:@"com.apple.RegulatoryDomain.peer_status.timestamp"]);
      v23 = (void *)objc_claimAutoreleasedReturnValue( [v9 objectForKeyedSubscript:@"com.apple.RegulatoryDomain.peer_status.isDisputed"]);
      __int16 v24 = -[RDEstimate initWithCountryCode:priority:timestamp:inDisputedArea:]( v20,  "initWithCountryCode:priority:timestamp:inDisputedArea:",  v21,  v13,  v22,  [v23 BOOLValue]);

      -[RDXPCHandler updatePeer:withEstimate:](self, "updatePeer:withEstimate:", v6, v24);
    }
  }

  else
  {
    if (qword_100019350 != -1) {
      dispatch_once(&qword_100019350, &stru_100014A08);
    }
    id v25 = (os_log_s *)qword_100019358;
    if (os_log_type_enabled((os_log_t)qword_100019358, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v32 = 0;
      __int16 v33 = 2082;
      v34 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:got nil peer UUID!}",  buf,  0x12u);
      if (qword_100019350 != -1) {
        dispatch_once(&qword_100019350, &stru_100014A08);
      }
    }

    int v26 = (os_log_s *)qword_100019358;
    if (os_signpost_enabled((os_log_t)qword_100019358))
    {
      *(_DWORD *)buf = 68289026;
      int v32 = 0;
      __int16 v33 = 2082;
      v34 = "";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v26,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "got nil peer UUID!",  "{msg%{public}.0s:got nil peer UUID!}",  buf,  0x12u);
    }
  }
}

- (void)updatePeer:(id)a3 withEstimate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (sub_10000C320())
  {
    if (qword_100019350 != -1) {
      dispatch_once(&qword_100019350, &stru_100014A08);
    }
    v8 = (os_log_s *)qword_100019358;
    if (os_log_type_enabled((os_log_t)qword_100019358, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v17 = 0;
      __int16 v18 = 2082;
      __int16 v19 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:updates are currently disabled, ignoring}",  buf,  0x12u);
    }
  }

  else if (v6)
  {
    if (sub_10000C0EC())
    {
      if (qword_1000195D8 != -1) {
        dispatch_once(&qword_1000195D8, &stru_100014A28);
      }
      int v9 = (dispatch_queue_s *)qword_1000195D0;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10000D620;
      block[3] = &unk_1000149E8;
      id v13 = v7;
      unsigned int v14 = self;
      id v15 = v6;
      dispatch_async(v9, block);
    }
  }

  else
  {
    if (qword_100019350 != -1) {
      dispatch_once(&qword_100019350, &stru_100014A08);
    }
    id v10 = (os_log_s *)qword_100019358;
    if (os_log_type_enabled((os_log_t)qword_100019358, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v17 = 0;
      __int16 v18 = 2082;
      __int16 v19 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:got nil peer UUID!}",  buf,  0x12u);
      if (qword_100019350 != -1) {
        dispatch_once(&qword_100019350, &stru_100014A08);
      }
    }

    id v11 = (os_log_s *)qword_100019358;
    if (os_signpost_enabled((os_log_t)qword_100019358))
    {
      *(_DWORD *)buf = 68289026;
      int v17 = 0;
      __int16 v18 = 2082;
      __int16 v19 = "";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v11,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "got nil peer UUID!",  "{msg%{public}.0s:got nil peer UUID!}",  buf,  0x12u);
    }
  }
}

- (void)shareStatusWithPeers
{
  if (qword_100019340 != -1) {
    dispatch_once(&qword_100019340, &stru_100014A48);
  }
  v2 = (os_log_s *)qword_100019348;
  if (os_log_type_enabled((os_log_t)qword_100019348, OS_LOG_TYPE_ERROR))
  {
    int v4 = 68289026;
    int v5 = 0;
    __int16 v6 = 2082;
    id v7 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:Status sharing from Vision Pro, mac and watch is disabled}",  (uint8_t *)&v4,  0x12u);
    if (qword_100019340 != -1) {
      dispatch_once(&qword_100019340, &stru_100014A48);
    }
  }

  uint64_t v3 = (os_log_s *)qword_100019348;
  if (os_signpost_enabled((os_log_t)qword_100019348))
  {
    int v4 = 68289026;
    int v5 = 0;
    __int16 v6 = 2082;
    id v7 = "";
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v3,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "Status sharing from Vision Pro, mac and watch is disabled",  "{msg%{public}.0s:Status sharing from Vision Pro, mac and watch is disabled}",  (uint8_t *)&v4,  0x12u);
  }

- (void)ping
{
  if (qword_100019340 != -1) {
    dispatch_once(&qword_100019340, &stru_100014A48);
  }
  v2 = (os_log_s *)qword_100019348;
  if (os_log_type_enabled((os_log_t)qword_100019348, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 68289026;
    v3[1] = 0;
    __int16 v4 = 2082;
    int v5 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:pinged!}",  (uint8_t *)v3,  0x12u);
  }

- (void)createCacheDirAtPath:(id)a3
{
  id v3 = a3;
  if (qword_100019350 != -1) {
    dispatch_once(&qword_100019350, &stru_100014A08);
  }
  __int16 v4 = (os_log_s *)qword_100019358;
  if (os_log_type_enabled((os_log_t)qword_100019358, OS_LOG_TYPE_FAULT))
  {
    int v6 = 68289026;
    int v7 = 0;
    __int16 v8 = 2082;
    int v9 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:Nothing should have used createCacheDirAtPath!}",  (uint8_t *)&v6,  0x12u);
    if (qword_100019350 != -1) {
      dispatch_once(&qword_100019350, &stru_100014A08);
    }
  }

  int v5 = (os_log_s *)qword_100019358;
  if (os_signpost_enabled((os_log_t)qword_100019358))
  {
    int v6 = 68289026;
    int v7 = 0;
    __int16 v8 = 2082;
    int v9 = "";
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v5,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "Nothing should have used createCacheDirAtPath!",  "{msg%{public}.0s:Nothing should have used createCacheDirAtPath!}",  (uint8_t *)&v6,  0x12u);
  }
}

- (void)triggerUpdateToEligibilityEngine
{
  if (qword_100019340 != -1) {
    dispatch_once(&qword_100019340, &stru_100014A48);
  }
  id v3 = (os_log_s *)qword_100019348;
  if (os_log_type_enabled((os_log_t)qword_100019348, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    __int16 v6 = 2082;
    int v7 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:triggering update to eligibility engine}",  (uint8_t *)v5,  0x12u);
  }

  __int16 v4 = (void *)objc_claimAutoreleasedReturnValue(-[RDXPCHandler dataCache](self, "dataCache"));
  [v4 postResultsToEligibilityEngine];
}

- (void)setCacheLockState:(BOOL)a3
{
  BOOL v3 = a3;
  __int16 v4 = (NSUserDefaults *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults valueForEntitlement:](v4, "valueForEntitlement:", @"com.apple.countryd.lock"));
  if (!v5
    || (uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v5, v6) & 1) == 0)
    || ([v5 BOOLValue] & 1) == 0)
  {
    if (qword_100019350 != -1) {
      dispatch_once(&qword_100019350, &stru_100014A08);
    }
    int v9 = (void *)qword_100019358;
    if (os_log_type_enabled((os_log_t)qword_100019358, OS_LOG_TYPE_FAULT))
    {
      id v10 = v9;
      int v15 = 68289538;
      int v16 = 0;
      __int16 v17 = 2082;
      __int16 v18 = "";
      __int16 v19 = 2082;
      int v20 = "com.apple.countryd.lock";
      __int16 v21 = 1026;
      unsigned int v22 = -[NSUserDefaults processIdentifier](v4, "processIdentifier");
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:peer process is missing entitlement lock our cache, entitlement:%{public, location: escape_only}s, process:%{public}d}",  (uint8_t *)&v15,  0x22u);

      if (qword_100019350 != -1) {
        dispatch_once(&qword_100019350, &stru_100014A08);
      }
    }

    id v11 = (void *)qword_100019358;
    if (os_signpost_enabled((os_log_t)qword_100019358))
    {
      unsigned int v12 = v11;
      unsigned int v13 = -[NSUserDefaults processIdentifier](v4, "processIdentifier");
      int v15 = 68289538;
      int v16 = 0;
      __int16 v17 = 2082;
      __int16 v18 = "";
      __int16 v19 = 2082;
      int v20 = "com.apple.countryd.lock";
      __int16 v21 = 1026;
      unsigned int v22 = v13;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "peer process is missing entitlement lock our cache",  "{msg%{public}.0s:peer process is missing entitlement lock our cache, entitlement:%{public, location: escape_only}s, process:%{public}d}",  (uint8_t *)&v15,  0x22u);
    }

    goto LABEL_20;
  }

  if (!geteuid())
  {
    if (qword_100019340 != -1) {
      dispatch_once(&qword_100019340, &stru_100014A48);
    }
    unsigned int v14 = (os_log_s *)qword_100019348;
    if (os_log_type_enabled((os_log_t)qword_100019348, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 68289282;
      int v16 = 0;
      __int16 v17 = 2082;
      __int16 v18 = "";
      __int16 v19 = 1026;
      LODWORD(v20) = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:updating lock state, locked:%{public}hhd}",  (uint8_t *)&v15,  0x18u);
    }

    __int16 v4 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.RegulatoryDomain");
    -[NSUserDefaults setBool:forKey:](v4, "setBool:forKey:", v3, @"UpdatesLocked");
LABEL_20:

    return;
  }

  if (qword_100019340 != -1) {
    dispatch_once(&qword_100019340, &stru_100014A48);
  }
  int v7 = (os_log_s *)qword_100019348;
  if (os_log_type_enabled((os_log_t)qword_100019348, OS_LOG_TYPE_FAULT))
  {
    int v15 = 68289026;
    int v16 = 0;
    __int16 v17 = 2082;
    __int16 v18 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:lock state can only be modified by root user}",  (uint8_t *)&v15,  0x12u);
    if (qword_100019340 != -1) {
      dispatch_once(&qword_100019340, &stru_100014A48);
    }
  }

  __int16 v8 = (os_log_s *)qword_100019348;
  if (os_signpost_enabled((os_log_t)qword_100019348))
  {
    int v15 = 68289026;
    int v16 = 0;
    __int16 v17 = 2082;
    __int16 v18 = "";
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "lock state can only be modified by root user",  "{msg%{public}.0s:lock state can only be modified by root user}",  (uint8_t *)&v15,  0x12u);
  }

- (RDCachedData)dataCache
{
  return (RDCachedData *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setDataCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end