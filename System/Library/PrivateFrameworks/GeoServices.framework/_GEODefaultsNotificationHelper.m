@interface _GEODefaultsNotificationHelper
- (void)_notifyPeerOfChangedKeys:(id)a3 options:(unint64_t)a4;
- (void)geoXPCConnectionIsReadyToSend:(id)a3;
@end

@implementation _GEODefaultsNotificationHelper

- (void)_notifyPeerOfChangedKeys:(id)a3 options:(unint64_t)a4
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_peer);
  if (WeakRetained)
  {
    isolater = self->_isolater;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100022008;
    v9[3] = &unk_100059F10;
    unint64_t v13 = a4;
    id v10 = v8;
    v11 = self;
    id v12 = WeakRetained;
    geo_isolate_sync(isolater, v9);
  }
}

- (void)geoXPCConnectionIsReadyToSend:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_peer);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue([WeakRetained connection]);

    if (v7 == v4)
    {
      uint64_t v31 = 0LL;
      v32 = &v31;
      uint64_t v33 = 0x2020000000LL;
      uint64_t v34 = 0LL;
      uint64_t v25 = 0LL;
      v26 = &v25;
      uint64_t v27 = 0x3032000000LL;
      v28 = sub_10002056C;
      v29 = sub_10002057C;
      id v30 = 0LL;
      v23[0] = 0LL;
      v23[1] = v23;
      v23[2] = 0x2020000000LL;
      char v24 = 0;
      isolater = self->_isolater;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_100022440;
      v18[3] = &unk_100059F38;
      v18[4] = self;
      v20 = &v31;
      v21 = &v25;
      v22 = v23;
      id v9 = v6;
      id v19 = v9;
      geo_isolate_sync(isolater, v18);
      id v10 = [(id)v26[5] count];
      if (v10 && v32[3])
      {
        uint64_t v11 = GEOGetUserDefaultsLog(v10);
        id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([(id)v26[5] allObjects]);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "componentsJoinedByString:", @", "));
          *(_DWORD *)buf = 138412546;
          id v36 = v9;
          __int16 v37 = 2114;
          v38 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "Notifying peer %@ of changed keys: %{public}@",  buf,  0x16u);
        }

        id v15 = [[GEOConfigKeyChangeNotification alloc] initWithTraits:0 auditToken:0 throttleToken:0];
        v16 = (void *)objc_claimAutoreleasedReturnValue([(id)v26[5] allObjects]);
        [v15 setKeyStrings:v16];

        [v15 setKeyOptions:v32[3]];
        v17 = (void *)objc_claimAutoreleasedReturnValue([v9 connection]);
        [v15 send:v17];
      }

      _Block_object_dispose(v23, 8);
      _Block_object_dispose(&v25, 8);

      _Block_object_dispose(&v31, 8);
    }
  }
}

- (void).cxx_destruct
{
}

  ;
}

@end