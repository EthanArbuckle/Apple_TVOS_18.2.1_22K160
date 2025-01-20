@interface MSDServicesUpdated
+ (id)servicesUpdated:(id)a3 cachedData:(id)a4;
- (MSDServicesUpdated)initWithUpdatedData:(id)a3 cachedData:(id)a4;
- (NSArray)cachedData;
- (NSArray)updatedData;
- (void)_handleDefaultServiceChanged:(id)a3;
- (void)_handleServiceAdded:(id)a3 cachedDataIDS:(id)a4;
- (void)_handleServiceRemoved:(id)a3 cachedDataIDS:(id)a4;
- (void)processChangesInServices;
- (void)setCachedData:(id)a3;
- (void)setUpdatedData:(id)a3;
@end

@implementation MSDServicesUpdated

- (MSDServicesUpdated)initWithUpdatedData:(id)a3 cachedData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MSDServicesUpdated;
  v9 = -[MSDServicesUpdated init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cachedData, a4);
    objc_storeStrong((id *)&v10->_updatedData, a3);
  }

  return v10;
}

+ (id)servicesUpdated:(id)a3 cachedData:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithUpdatedData:v7 cachedData:v6];

  return v8;
}

- (void)processChangesInServices
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray na_map:](self->_cachedData, "na_map:", &stru_100060DF8));
  id v4 = [v3 mutableCopy];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray na_map:](self->_updatedData, "na_map:", &stru_100060E18));
  id v6 = [v5 mutableCopy];

  id v7 = [v6 count];
  if (v7 != [v4 count])
  {
    id v8 = [v6 count];
    id v9 = [v4 count];
    id v10 = sub_10003E9DC();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
    if (v8 <= v9)
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "A service was deleted on device", buf, 2u);
      }

      id v13 = [v6 copy];
      id v14 = [v4 copy];
      -[MSDServicesUpdated _handleServiceRemoved:cachedDataIDS:](self, "_handleServiceRemoved:cachedDataIDS:", v13, v14);
    }

    else
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "A service was added on device", buf, 2u);
      }

      id v13 = [v6 copy];
      id v14 = [v4 copy];
      -[MSDServicesUpdated _handleServiceAdded:cachedDataIDS:](self, "_handleServiceAdded:cachedDataIDS:", v13, v14);
    }
  }

  v29 = v6;
  v30 = v4;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  v15 = self->_updatedData;
  id v16 = -[NSArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v33,  v38,  16LL);
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v34;
    uint64_t v19 = MSDefaultServiceRecordType;
    do
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v34 != v18) {
          objc_enumerationMutation(v15);
        }
        v21 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "recordType", v29, v30));
        unsigned int v23 = [v22 isEqualToString:v19];

        if (v23)
        {
          -[MSDServicesUpdated _handleDefaultServiceChanged:](self, "_handleDefaultServiceChanged:", v21);
        }

        else
        {
          cachedData = self->_cachedData;
          v32[0] = _NSConcreteStackBlock;
          v32[1] = 3221225472LL;
          v32[2] = sub_10000E044;
          v32[3] = &unk_100060D00;
          v32[4] = v21;
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray na_firstObjectPassingTest:](cachedData, "na_firstObjectPassingTest:", v32));
          if (v25)
          {
            id v26 = sub_10003E9DC();
            v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "A service was updated on device",  buf,  2u);
            }

            dispatch_time_t v28 = dispatch_time(0LL, 500000000LL);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_10000E154;
            block[3] = &unk_100060E40;
            block[4] = v21;
            dispatch_after(v28, &_dispatch_main_q, block);
          }
        }
      }

      id v17 = -[NSArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v33,  v38,  16LL);
    }

    while (v17);
  }
}

- (void)_handleServiceAdded:(id)a3 cachedDataIDS:(id)a4
{
  id v6 = a4;
  id v7 = [a3 mutableCopy];
  [v7 removeObjectsInArray:v6];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000E304;
  v8[3] = &unk_100060E68;
  v8[4] = self;
  [v7 enumerateObjectsUsingBlock:v8];
}

- (void)_handleServiceRemoved:(id)a3 cachedDataIDS:(id)a4
{
  id v6 = a3;
  id v7 = [a4 mutableCopy];
  [v7 removeObjectsInArray:v6];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000E640;
  v8[3] = &unk_100060E68;
  v8[4] = self;
  [v7 enumerateObjectsUsingBlock:v8];
}

- (void)_handleDefaultServiceChanged:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 service]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 serviceID]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 homeUserID]);
  cachedData = self->_cachedData;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10000EAF0;
  v25[3] = &unk_100060D00;
  id v9 = v7;
  id v26 = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray na_firstObjectPassingTest:](cachedData, "na_firstObjectPassingTest:", v25));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 service]);
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v11 serviceID]);
  unsigned __int8 v13 = [v12 isEqual:v6];

  if ((v13 & 1) == 0)
  {
    updatedData = self->_updatedData;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10000EB70;
    v22[3] = &unk_100060D28;
    id v23 = v9;
    id v24 = v6;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray na_firstObjectPassingTest:](updatedData, "na_firstObjectPassingTest:", v22));
    if (v15)
    {
      id v16 = sub_10003E9DC();
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "DefaultService was updated on device",  buf,  2u);
      }

      dispatch_time_t v18 = dispatch_time(0LL, 500000000LL);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10000EC30;
      block[3] = &unk_100060E40;
      id v20 = v15;
      dispatch_after(v18, &_dispatch_main_q, block);
    }
  }
}

- (NSArray)updatedData
{
  return self->_updatedData;
}

- (void)setUpdatedData:(id)a3
{
}

- (NSArray)cachedData
{
  return self->_cachedData;
}

- (void)setCachedData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end