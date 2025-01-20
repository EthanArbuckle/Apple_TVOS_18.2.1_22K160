@interface IDSDServiceController
+ (BOOL)shouldLoadService:(id)a3;
+ (IDSDServiceController)sharedInstance;
- (BOOL)_anyDeviceUsingSubService:(id)a3 superService:(id)a4;
- (IDSDServiceController)init;
- (IDSServiceProperties)gameCenterService;
- (IDSServiceProperties)iCloudService;
- (IDSServiceProperties)iTunesService;
- (NSArray)allFamilyServices;
- (NSArray)allPinningEnforcedServices;
- (NSArray)allServices;
- (NSArray)allServicesStrings;
- (NSArray)allTinkerServices;
- (NSDictionary)serviceNameToControlCategoryMap;
- (NSSet)allAdHocServices;
- (NSSet)allPrimaryServices;
- (OS_dispatch_queue)queue;
- (id)_combinedServicesForAllDevices;
- (id)_currentSubServicesForDevice:(id)a3 superService:(id)a4;
- (id)adHocServicesForIdentifier:(id)a3;
- (id)allServicesWithAdHocServiceType:(unsigned int)a3;
- (id)linkedServicesForService:(id)a3;
- (id)primaryServiceForAdhocServiceType:(unsigned int)a3;
- (id)serviceLoader;
- (id)serviceWithIdentifier:(id)a3;
- (id)serviceWithName:(id)a3;
- (id)serviceWithPushTopic:(id)a3;
- (id)userDefaults;
- (void)_loadService:(id)a3;
- (void)_loadServices;
- (void)_loadSubServiceWithName:(id)a3 usingService:(id)a4 completionBlock:(id)a5;
- (void)_loadSubServices;
- (void)_saveSubServices;
- (void)_unloadServiceWithName:(id)a3;
- (void)_updateSubServicesForDevice:(id)a3 superService:(id)a4 newSubservices:(id)a5;
- (void)setQueue:(id)a3;
- (void)updateSubServices:(id)a3 forService:(id)a4 deviceUniqueID:(id)a5;
@end

@implementation IDSDServiceController

- (IDSDServiceController)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___IDSDServiceController;
  v2 = -[IDSDServiceController init](&v14, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToStrongObjectsMapTable"));
    services = v2->_services;
    v2->_services = (NSMapTable *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToStrongObjectsMapTable"));
    servicesToTopicMap = v2->_servicesToTopicMap;
    v2->_servicesToTopicMap = (NSMapTable *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToStrongObjectsMapTable"));
    servicesToNameMap = v2->_servicesToNameMap;
    v2->_servicesToNameMap = (NSMapTable *)v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    deviceIDToSubServicesMap = v2->_deviceIDToSubServicesMap;
    v2->_deviceIDToSubServicesMap = v9;

    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    serviceNameToControlCategoryMap = v2->_serviceNameToControlCategoryMap;
    v2->_serviceNameToControlCategoryMap = v11;

    -[IDSDServiceController _loadServices](v2, "_loadServices");
    -[IDSDServiceController _loadSubServices](v2, "_loadSubServices");
  }

  return v2;
}

- (id)serviceLoader
{
  return +[IDSDependencyProvider serviceLoader](&OBJC_CLASS___IDSDependencyProvider, "serviceLoader");
}

- (id)userDefaults
{
  return +[IDSDependencyProvider userDefaults](&OBJC_CLASS___IDSDependencyProvider, "userDefaults");
}

- (IDSServiceProperties)iTunesService
{
  return (IDSServiceProperties *)-[IDSDServiceController serviceWithIdentifier:]( self,  "serviceWithIdentifier:",  @"com.apple.private.alloy.itunes");
}

- (IDSServiceProperties)iCloudService
{
  return (IDSServiceProperties *)-[IDSDServiceController serviceWithIdentifier:]( self,  "serviceWithIdentifier:",  @"com.apple.private.alloy.multiplex1");
}

- (IDSServiceProperties)gameCenterService
{
  return (IDSServiceProperties *)-[IDSDServiceController serviceWithIdentifier:]( self,  "serviceWithIdentifier:",  @"com.apple.private.alloy.arcade");
}

+ (IDSDServiceController)sharedInstance
{
  if (qword_1009C0C60 != -1) {
    dispatch_once(&qword_1009C0C60, &stru_100902D10);
  }
  return (IDSDServiceController *)(id)qword_1009C0C68;
}

+ (BOOL)shouldLoadService:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  if ([v4 lowRAMDevice])
  {
    unsigned __int8 v5 = [v3 disableOnLowRAMDevice];

    if ((v5 & 1) == 0)
    {
LABEL_8:
      if ([v3 prototypingOnly])
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
        if (![v9 isInternalInstall])
        {
          BOOL v8 = 0;
LABEL_17:

          goto LABEL_18;
        }

        unsigned __int8 v10 = _os_feature_enabled_impl("IDS", "PrototypeMode");
      }

      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
        unsigned int v12 = [v11 isEqualToString:@"com.apple.private.alloy.keysharing"];

        if (v12)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
          unsigned __int8 v10 = [v9 supportsKeySharing];
        }

        else
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
          unsigned int v14 = [v13 isEqualToString:@"com.apple.private.alloy.harmony.pushprovisioning"];

          if (!v14)
          {
            BOOL v8 = 1;
            goto LABEL_18;
          }

          v9 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
          unsigned __int8 v10 = [v9 supportsHarmony];
        }
      }

      BOOL v8 = v10;
      goto LABEL_17;
    }
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
    if ([v6 deviceType] != (id)4)
    {

      goto LABEL_8;
    }

    unsigned __int8 v7 = [v3 disableOnLowRAMDevice];

    if ((v7 & 1) == 0) {
      goto LABEL_8;
    }
  }

  BOOL v8 = 0;
LABEL_18:

  return v8;
}

- (void)_loadServices
{
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1006AAD10();
  }

  v25 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  context = objc_autoreleasePoolPush();
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDServiceController serviceLoader](self, "serviceLoader"));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 loadServiceDictionaries]);

  id v6 = [v5 countByEnumeratingWithState:&v32 objects:v39 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v33;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned __int8 v10 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)v9);
        v11 = objc_autoreleasePoolPush();
        if ([v10 count])
        {
          unsigned int v12 = -[IDSServiceProperties initWithServiceDictionary:]( objc_alloc(&OBJC_CLASS___IDSServiceProperties),  "initWithServiceDictionary:",  v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSServiceProperties identifier](v12, "identifier"));
          id v14 = [v13 length];

          if (v14)
          {
            if (+[IDSDServiceController shouldLoadService:]( &OBJC_CLASS___IDSDServiceController,  "shouldLoadService:",  v12))
            {
              -[NSMutableArray addObject:](v25, "addObject:", v12);
              goto LABEL_19;
            }

            v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v38 = v10;
              _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Not loading service %@",  buf,  0xCu);
            }
          }

          else
          {
            v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
            if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v38 = v10;
              _os_log_fault_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_FAULT,  "Not loading service, invalid dictionary %@ missing identifier",  buf,  0xCu);
            }
          }
        }

        else
        {
          unsigned int v12 = (IDSServiceProperties *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
          if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
            sub_1006AACDC(&v30, v31, v12);
          }
        }

- (void)_loadService:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1006AAD3C();
  }

  services = self->_services;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  -[NSMapTable setObject:forKey:](services, "setObject:forKey:", v4, v7);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 serviceName]);
  unsigned __int8 v10 = [v8 isEqualToString:v9];

  if ((v10 & 1) == 0)
  {
    servicesToNameMap = self->_servicesToNameMap;
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v4 serviceName]);
    -[NSMapTable setObject:forKey:](servicesToNameMap, "setObject:forKey:", v4, v12);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 pushTopic]);
  unsigned __int8 v15 = [v13 isEqualToString:v14];

  if ((v15 & 1) == 0)
  {
    servicesToTopicMap = self->_servicesToTopicMap;
    v17 = (void *)objc_claimAutoreleasedReturnValue([v4 pushTopic]);
    -[NSMapTable setObject:forKey:](servicesToTopicMap, "setObject:forKey:", v4, v17);
  }

  if ([v4 controlCategory])
  {
    serviceNameToControlCategoryMap = self->_serviceNameToControlCategoryMap;
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v4 controlCategory]));
    id v20 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( serviceNameToControlCategoryMap,  "objectForKey:",  v19));

    if (!v20)
    {
      id v20 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      uint64_t v21 = self->_serviceNameToControlCategoryMap;
      v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v4 controlCategory]));
      -[NSMutableDictionary setObject:forKey:](v21, "setObject:forKey:", v20, v22);
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    -[NSMutableArray addObject:](v20, "addObject:", v23);
  }
}

- (void)_unloadServiceWithName:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    -[NSMapTable removeObjectForKey:](self->_services, "removeObjectForKey:", v4);
    -[NSMapTable removeObjectForKey:](self->_servicesToNameMap, "removeObjectForKey:", v4);
    -[NSMapTable removeObjectForKey:](self->_servicesToTopicMap, "removeObjectForKey:", v4);
  }

  else
  {
    unsigned __int8 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_1006AADA8();
    }
  }
}

- (void)_loadSubServiceWithName:(id)a3 usingService:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned __int8 v10 = (void (**)(id, BOOL))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDServiceController serviceWithPushTopic:](self, "serviceWithPushTopic:", v9));
  if (v11)
  {
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDServiceController serviceWithPushTopic:](self, "serviceWithPushTopic:", v8));

    if (!v12)
    {
      id v13 = [v11 copy];
      [v13 setServiceName:v8];
      [v13 setDisplayName:v8];
      [v13 setIdentifier:v8];
      [v13 setPushTopic:v8];
      [v13 setSuperService:v9];
      -[IDSDServiceController _loadService:](self, "_loadService:", v13);
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412290;
        id v17 = v8;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "   %@", (uint8_t *)&v16, 0xCu);
      }
    }

    if (v10) {
      v10[2](v10, v12 == 0LL);
    }
  }

  else
  {
    unsigned __int8 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      sub_1006AAE08();
    }
  }
}

- (void)updateSubServices:(id)a3 forService:(id)a4 deviceUniqueID:(id)a5
{
  id v50 = a3;
  id v8 = a4;
  id v52 = a5;
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDServiceController serviceWithPushTopic:](self, "serviceWithPushTopic:", v8));
  if (v51)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
    v49 = (void *)objc_claimAutoreleasedReturnValue([v9 allTraditionallyPairedUniqueIDs]);

    if ([v49 containsObject:v52])
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDServiceController _currentSubServicesForDevice:superService:]( self,  "_currentSubServicesForDevice:superService:",  v52,  v8));
      unsigned __int8 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sub_services](&OBJC_CLASS___IMRGLog, "sub_services"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v52;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v48;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Current sub-services for device %@: %@",  buf,  0x16u);
      }

      if (v48 && [v48 isEqualToArray:v50])
      {
        v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sub_services](&OBJC_CLASS___IMRGLog, "sub_services"));
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "New set of subservices are the same, ignoring update",  buf,  2u);
        }
      }

      else
      {
        -[IDSDServiceController _updateSubServicesForDevice:superService:newSubservices:]( self,  "_updateSubServicesForDevice:superService:newSubservices:",  v52,  v8,  v50);
        int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sub_services](&OBJC_CLASS___IMRGLog, "sub_services"));
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          deviceIDToSubServicesMap = self->_deviceIDToSubServicesMap;
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = deviceIDToSubServicesMap;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Updated sub-services map %@", buf, 0xCu);
        }

        -[IDSDServiceController _saveSubServices](self, "_saveSubServices");
        v18 = -[NSMutableSet initWithArray:](objc_alloc(&OBJC_CLASS___NSMutableSet), "initWithArray:", v48);
        id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v50));
        -[NSMutableSet minusSet:](v18, "minusSet:", v19);

        id v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v18, "allObjects"));
        id v21 = [v20 _copyForEnumerating];

        __int128 v69 = 0u;
        __int128 v70 = 0u;
        __int128 v67 = 0u;
        __int128 v68 = 0u;
        id v22 = v21;
        id v23 = [v22 countByEnumeratingWithState:&v67 objects:v78 count:16];
        if (v23)
        {
          uint64_t v24 = *(void *)v68;
          do
          {
            for (i = 0LL; i != v23; i = (char *)i + 1)
            {
              if (*(void *)v68 != v24) {
                objc_enumerationMutation(v22);
              }
              uint64_t v26 = *(void *)(*((void *)&v67 + 1) + 8LL * (void)i);
              if (-[IDSDServiceController _anyDeviceUsingSubService:superService:]( self,  "_anyDeviceUsingSubService:superService:",  v26,  v8))
              {
                __int128 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sub_services](&OBJC_CLASS___IMRGLog, "sub_services"));
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v26;
                  _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Told to remove %@ but another device still needs it",  buf,  0xCu);
                }

                -[NSMutableSet removeObject:](v18, "removeObject:", v26);
              }
            }

            id v23 = [v22 countByEnumeratingWithState:&v67 objects:v78 count:16];
          }

          while (v23);
        }

        if (-[NSMutableSet count](v18, "count"))
        {
          __int128 v28 = -[NSDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjectsAndKeys:",  v18,  @"RemovedServices",  0LL);
          __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sub_services](&OBJC_CLASS___IMRGLog, "sub_services"));
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v28;
            _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Posting notification with userInfo %@",  buf,  0xCu);
          }

          uint8_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
          [v30 postNotificationName:@"_kIDSDServiceControllerServicesRemovedNotification" object:self userInfo:v28];
        }

        *(void *)buf = 0LL;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000LL;
        char v77 = 0;
        __int128 v63 = 0u;
        __int128 v64 = 0u;
        __int128 v65 = 0u;
        __int128 v66 = 0u;
        obj = v18;
        id v31 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v63,  v75,  16LL);
        if (v31)
        {
          uint64_t v32 = *(void *)v64;
          do
          {
            for (j = 0LL; j != v31; j = (char *)j + 1)
            {
              if (*(void *)v64 != v32) {
                objc_enumerationMutation(obj);
              }
              uint64_t v34 = *(void *)(*((void *)&v63 + 1) + 8LL * (void)j);
              __int128 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sub_services](&OBJC_CLASS___IMRGLog, "sub_services"));
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v73 = 138412290;
                uint64_t v74 = v34;
                _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Unloading   %@", v73, 0xCu);
              }

              -[IDSDServiceController _unloadServiceWithName:](self, "_unloadServiceWithName:", v34);
            }

            id v31 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v63,  v75,  16LL);
          }

          while (v31);
        }

        v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sub_services](&OBJC_CLASS___IMRGLog, "sub_services"));
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v73 = 0;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Loaded sub-services:", v73, 2u);
        }

        __int128 v61 = 0u;
        __int128 v62 = 0u;
        __int128 v59 = 0u;
        __int128 v60 = 0u;
        id v37 = v50;
        id v38 = [v37 countByEnumeratingWithState:&v59 objects:v72 count:16];
        if (v38)
        {
          uint64_t v39 = *(void *)v60;
          do
          {
            for (k = 0LL; k != v38; k = (char *)k + 1)
            {
              if (*(void *)v60 != v39) {
                objc_enumerationMutation(v37);
              }
              uint64_t v41 = *(void *)(*((void *)&v59 + 1) + 8LL * (void)k);
              v58[0] = _NSConcreteStackBlock;
              v58[1] = 3221225472LL;
              v58[2] = sub_1003A95CC;
              v58[3] = &unk_100902D38;
              v58[4] = buf;
              -[IDSDServiceController _loadSubServiceWithName:usingService:completionBlock:]( self,  "_loadSubServiceWithName:usingService:completionBlock:",  v41,  v8,  v58);
            }

            id v38 = [v37 countByEnumeratingWithState:&v59 objects:v72 count:16];
          }

          while (v38);
        }

        if (-[NSMutableSet count](obj, "count") || *(_BYTE *)(*(void *)&buf[8] + 24LL))
        {
          __int128 v56 = 0u;
          __int128 v57 = 0u;
          __int128 v54 = 0u;
          __int128 v55 = 0u;
          v42 = NSAllMapTableValues(self->_services);
          v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
          id v44 = [v43 countByEnumeratingWithState:&v54 objects:v71 count:16];
          if (v44)
          {
            uint64_t v45 = *(void *)v55;
            do
            {
              for (m = 0LL; m != v44; m = (char *)m + 1)
              {
                if (*(void *)v55 != v45) {
                  objc_enumerationMutation(v43);
                }
                [*(id *)(*((void *)&v54 + 1) + 8 * (void)m) reloadAdHocServices];
              }

              id v44 = [v43 countByEnumeratingWithState:&v54 objects:v71 count:16];
            }

            while (v44);
          }

          if (*(_BYTE *)(*(void *)&buf[8] + 24LL))
          {
            v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
            [v47 postNotificationName:@"_kIDSDServiceControllerServicesChangedNotification" object:self userInfo:0];
          }
        }

        _Block_object_dispose(buf, 8);
        v11 = (os_log_s *)obj;
      }

      unsigned __int8 v15 = (os_log_s *)v48;
    }

    else
    {
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      unsigned __int8 v15 = v14;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        sub_1006AAEE4();
        unsigned __int8 v15 = v14;
      }
    }

    id v13 = (os_log_s *)v49;
  }

  else
  {
    unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    id v13 = v12;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      sub_1006AAE84();
      id v13 = v12;
    }
  }
}

- (void)_saveSubServices
{
  if (-[NSMutableDictionary count](self->_deviceIDToSubServicesMap, "count"))
  {
    id v3 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
    id v4 = -[NSMutableDictionary initWithObjectsAndKeys:]( v3,  "initWithObjectsAndKeys:",  self->_deviceIDToSubServicesMap,  off_1009B8A28,  &off_100947FB0,  off_1009B8A30,  0LL);
    unsigned __int8 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sub_services](&OBJC_CLASS___IMRGLog, "sub_services"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Top level map %@", buf, 0xCu);
    }

    id v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[IDSDServiceController userDefaults](self, "userDefaults"));
    id v7 = v6;
    id v8 = off_1009B8A38;
    id v9 = v4;
    unsigned __int8 v10 = 0LL;
  }

  else
  {
    id v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[IDSDServiceController userDefaults](self, "userDefaults"));
    id v14 = off_1009B8A28;
    id v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v14,  1LL));
    id v8 = off_1009B8A38;
    id v6 = v4;
    id v9 = 0LL;
    unsigned __int8 v10 = v7;
  }

  -[NSMutableDictionary setMultiple:remove:appID:](v6, "setMultiple:remove:appID:", v9, v10, v8);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDServiceController userDefaults](self, "userDefaults"));
  [v11 synchronizeAppID:off_1009B8A38];
}

- (void)_loadSubServices
{
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1006AAF44();
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDServiceController userDefaults](self, "userDefaults"));
  v89[0] = off_1009B8A30;
  v89[1] = off_1009B8A28;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v89, 2LL));
  id v6 = [v4 copyMultipleForCurrentKeys:v5 appID:off_1009B8A38];

  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sub_services](&OBJC_CLASS___IMRGLog, "sub_services"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v88 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Loaded preferences from disk: %@", buf, 0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 pairedDeviceUniqueID]);

  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:off_1009B8A30]);
  unsigned int v11 = [v10 unsignedIntValue];

  __int128 v62 = v9;
  if (v11)
  {
    unsigned int v12 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:off_1009B8A28]);
    id v14 = -[NSMutableDictionary initWithDictionary:](v12, "initWithDictionary:", v13);
    deviceIDToSubServicesMap = self->_deviceIDToSubServicesMap;
    self->_deviceIDToSubServicesMap = v14;
  }

  else
  {
    if ([v9 length])
    {
      int v16 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
      id v17 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v6 objectForKey:off_1009B8A28]);
      v18 = -[NSMutableDictionary initWithObjectsAndKeys:](v16, "initWithObjectsAndKeys:", v17, v9, 0LL);
      id v19 = self->_deviceIDToSubServicesMap;
      self->_deviceIDToSubServicesMap = v18;
    }

    else
    {
      id v17 = self->_deviceIDToSubServicesMap;
      self->_deviceIDToSubServicesMap = 0LL;
    }

    -[IDSDServiceController _saveSubServices](self, "_saveSubServices");
  }

  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sub_services](&OBJC_CLASS___IMRGLog, "sub_services"));
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = self->_deviceIDToSubServicesMap;
    *(_DWORD *)buf = 138412290;
    id v88 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Loaded sub services from disk: %@", buf, 0xCu);
  }

  __int128 v63 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
  __int128 v66 = (void *)objc_claimAutoreleasedReturnValue([v22 allTraditionallyPairedUniqueIDs]);

  __int128 v81 = 0u;
  __int128 v82 = 0u;
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_deviceIDToSubServicesMap, "allKeys"));
  id v24 = [v23 countByEnumeratingWithState:&v79 objects:v86 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v80;
    do
    {
      for (i = 0LL; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v80 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = *(void *)(*((void *)&v79 + 1) + 8LL * (void)i);
      }

      id v25 = [v23 countByEnumeratingWithState:&v79 objects:v86 count:16];
    }

    while (v25);
  }

  __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sub_services](&OBJC_CLASS___IMRGLog, "sub_services"));
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v88 = v63;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Stale entries: %@", buf, 0xCu);
  }

  uint8_t v30 = v62;
  if (-[NSMutableSet count](v63, "count"))
  {
    __int128 v77 = 0u;
    __int128 v78 = 0u;
    __int128 v75 = 0u;
    __int128 v76 = 0u;
    id v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v63, "allObjects"));
    id v32 = [v31 countByEnumeratingWithState:&v75 objects:v85 count:16];
    if (v32)
    {
      id v33 = v32;
      uint64_t v34 = *(void *)v76;
      do
      {
        for (j = 0LL; j != v33; j = (char *)j + 1)
        {
          if (*(void *)v76 != v34) {
            objc_enumerationMutation(v31);
          }
          -[NSMutableDictionary removeObjectForKey:]( self->_deviceIDToSubServicesMap,  "removeObjectForKey:",  *(void *)(*((void *)&v75 + 1) + 8LL * (void)j));
        }

        id v33 = [v31 countByEnumeratingWithState:&v75 objects:v85 count:16];
      }

      while (v33);
    }

    v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sub_services](&OBJC_CLASS___IMRGLog, "sub_services"));
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      id v37 = self->_deviceIDToSubServicesMap;
      *(_DWORD *)buf = 138412290;
      id v88 = v37;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Cleaned up map: %@", buf, 0xCu);
    }

    -[IDSDServiceController _saveSubServices](self, "_saveSubServices");
  }

  if (!-[NSMutableDictionary count](self->_deviceIDToSubServicesMap, "count") && [v62 length])
  {
    id v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v38,  off_1009B8A28));

    v40 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v39 objectForKey:off_1009B8A28]);
    v42 = -[NSMutableDictionary initWithObjectsAndKeys:](v40, "initWithObjectsAndKeys:", v41, v62, 0LL);
    v43 = self->_deviceIDToSubServicesMap;
    self->_deviceIDToSubServicesMap = v42;

    id v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sub_services](&OBJC_CLASS___IMRGLog, "sub_services"));
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v45 = self->_deviceIDToSubServicesMap;
      *(_DWORD *)buf = 138412290;
      id v88 = v45;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Fixed empty map %@", buf, 0xCu);
    }

    -[IDSDServiceController _saveSubServices](self, "_saveSubServices");
  }

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDServiceController _combinedServicesForAllDevices](self, "_combinedServicesForAllDevices"));
  v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sub_services](&OBJC_CLASS___IMRGLog, "sub_services"));
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v88 = v46;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Combined services %@", buf, 0xCu);
  }

  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v46 allKeys]);
  id v48 = [obj countByEnumeratingWithState:&v71 objects:v84 count:16];
  if (v48)
  {
    id v49 = v48;
    id v61 = v6;
    id v50 = 0LL;
    uint64_t v65 = *(void *)v72;
    do
    {
      v51 = 0LL;
      id v52 = v50;
      do
      {
        if (*(void *)v72 != v65) {
          objc_enumerationMutation(obj);
        }
        uint64_t v53 = *(void *)(*((void *)&v71 + 1) + 8LL * (void)v51);
        id v50 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDServiceController serviceWithPushTopic:](self, "serviceWithPushTopic:", v53));

        if (v50)
        {
          __int128 v69 = 0u;
          __int128 v70 = 0u;
          __int128 v67 = 0u;
          __int128 v68 = 0u;
          __int128 v54 = v46;
          __int128 v55 = (void *)objc_claimAutoreleasedReturnValue([v46 objectForKey:v53]);
          id v56 = [v55 countByEnumeratingWithState:&v67 objects:v83 count:16];
          if (v56)
          {
            id v57 = v56;
            uint64_t v58 = *(void *)v68;
            do
            {
              for (k = 0LL; k != v57; k = (char *)k + 1)
              {
                if (*(void *)v68 != v58) {
                  objc_enumerationMutation(v55);
                }
                -[IDSDServiceController _loadSubServiceWithName:usingService:completionBlock:]( self,  "_loadSubServiceWithName:usingService:completionBlock:",  *(void *)(*((void *)&v67 + 1) + 8LL * (void)k),  v53,  0LL);
              }

              id v57 = [v55 countByEnumeratingWithState:&v67 objects:v83 count:16];
            }

            while (v57);
          }

          v46 = v54;
        }

        v51 = (char *)v51 + 1;
        id v52 = v50;
      }

      while (v51 != v49);
      id v49 = [obj countByEnumeratingWithState:&v71 objects:v84 count:16];
    }

    while (v49);

    id v6 = v61;
    uint8_t v30 = v62;
  }

  __int128 v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG)) {
    sub_1006AACB0();
  }
}

- (id)_combinedServicesForAllDevices
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v19 = self;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_deviceIDToSubServicesMap, "allKeys"));
  id v20 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v20)
  {
    uint64_t v18 = *(void *)v28;
    do
    {
      uint64_t v4 = 0LL;
      do
      {
        if (*(void *)v28 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = v4;
        unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary _dictionaryForKey:]( v19->_deviceIDToSubServicesMap,  "_dictionaryForKey:",  *(void *)(*((void *)&v27 + 1) + 8 * v4)));
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        id v22 = (id)objc_claimAutoreleasedReturnValue([v5 allKeys]);
        id v6 = [v22 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v6)
        {
          id v7 = v6;
          uint64_t v8 = *(void *)v24;
          do
          {
            for (i = 0LL; i != v7; i = (char *)i + 1)
            {
              if (*(void *)v24 != v8) {
                objc_enumerationMutation(v22);
              }
              uint64_t v10 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)i);
              unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary _arrayForKey:](v3, "_arrayForKey:", v10));
              unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v5 _arrayForKey:v10]);
              id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
              id v14 = v13;
              if (v11) {
                -[NSMutableSet addObjectsFromArray:](v13, "addObjectsFromArray:", v11);
              }
              if (v12) {
                -[NSMutableSet addObjectsFromArray:](v14, "addObjectsFromArray:", v12);
              }
              unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v14, "allObjects"));
              -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v15, v10);
            }

            id v7 = [v22 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }

          while (v7);
        }

        uint64_t v4 = v21 + 1;
      }

      while ((id)(v21 + 1) != v20);
      id v20 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }

    while (v20);
  }

  return v3;
}

- (BOOL)_anyDeviceUsingSubService:(id)a3 superService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_deviceIDToSubServicesMap, "allKeys"));
  id v24 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v24)
  {
    uint64_t v9 = *(void *)v31;
    uint64_t v22 = *(void *)v31;
    __int128 v23 = self;
    __int128 v25 = v8;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v8);
        }
        unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary _dictionaryForKey:]( self->_deviceIDToSubServicesMap,  "_dictionaryForKey:",  *(void *)(*((void *)&v30 + 1) + 8LL * (void)v10),  v22,  v23));
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 allKeys]);
        id v13 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v27;
          while (2)
          {
            for (i = 0LL; i != v14; i = (char *)i + 1)
            {
              if (*(void *)v27 != v15) {
                objc_enumerationMutation(v12);
              }
              id v17 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
              if ([v17 isEqualToIgnoringCase:v7])
              {
                uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v11 _arrayForKey:v17]);
                unsigned __int8 v19 = [v18 containsObject:v6];

                if ((v19 & 1) != 0)
                {

                  BOOL v20 = 1;
                  uint64_t v8 = v25;
                  goto LABEL_20;
                }
              }
            }

            id v14 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }

        uint64_t v10 = (char *)v10 + 1;
        self = v23;
        uint64_t v8 = v25;
        uint64_t v9 = v22;
      }

      while (v10 != v24);
      BOOL v20 = 0;
      id v24 = [v25 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }

    while (v24);
  }

  else
  {
    BOOL v20 = 0;
  }

- (void)_updateSubServicesForDevice:(id)a3 superService:(id)a4 newSubservices:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 length])
  {
    unsigned int v11 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_deviceIDToSubServicesMap, "objectForKey:", v8));
    id v13 = -[NSMutableDictionary initWithDictionary:](v11, "initWithDictionary:", v12);

    if ([v10 count]) {
      -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v10, v9);
    }
    else {
      -[NSMutableDictionary removeObjectForKey:](v13, "removeObjectForKey:", v9);
    }
    -[NSMutableDictionary setObject:forKey:](self->_deviceIDToSubServicesMap, "setObject:forKey:", v13, v8);
  }

  else
  {
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      sub_1006AAF70();
    }
  }
}

- (id)_currentSubServicesForDevice:(id)a3 superService:(id)a4
{
  deviceIDToSubServicesMap = self->_deviceIDToSubServicesMap;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary _dictionaryForKey:](deviceIDToSubServicesMap, "_dictionaryForKey:", a3));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 _arrayForKey:v6]);

  return v8;
}

- (id)allServicesWithAdHocServiceType:(unsigned int)a3
{
  unsigned __int8 v5 = objc_autoreleasePoolPush();
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v7 = NSAllMapTableValues(self->_services);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
      }

      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v10);
  }

  objc_autoreleasePoolPop(v5);
  return v6;
}

- (NSSet)allPrimaryServices
{
  return (NSSet *)-[IDSDServiceController allServicesWithAdHocServiceType:]( self,  "allServicesWithAdHocServiceType:",  0LL);
}

- (NSArray)allServices
{
  return NSAllMapTableValues(self->_services);
}

- (NSArray)allTinkerServices
{
  v2 = NSAllMapTableValues(self->_services);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "__imArrayByFilteringWithBlock:", &stru_100902D58));

  return (NSArray *)v4;
}

- (NSArray)allFamilyServices
{
  v2 = NSAllMapTableValues(self->_services);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "__imArrayByFilteringWithBlock:", &stru_100902D78));

  return (NSArray *)v4;
}

- (NSArray)allPinningEnforcedServices
{
  v2 = NSAllMapTableValues(self->_services);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "__imArrayByFilteringWithBlock:", &stru_100902D98));

  return (NSArray *)v4;
}

- (NSArray)allServicesStrings
{
  return NSAllMapTableKeys(self->_services);
}

- (NSDictionary)serviceNameToControlCategoryMap
{
  return (NSDictionary *)-[NSMutableDictionary copy](self->_serviceNameToControlCategoryMap, "copy");
}

- (id)serviceWithIdentifier:(id)a3
{
  if (a3) {
    return (id)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_services, "objectForKey:"));
  }
  else {
    return 0LL;
  }
}

- (id)serviceWithName:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_services, "objectForKey:", v4));
    id v6 = v5;
    if (v5) {
      id v7 = v5;
    }
    else {
      id v7 = (id)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_servicesToNameMap, "objectForKey:", v4));
    }
    id v8 = v7;
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (id)serviceWithPushTopic:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_services, "objectForKey:", v4));
    id v6 = v5;
    if (v5) {
      id v7 = v5;
    }
    else {
      id v7 = (id)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_servicesToTopicMap, "objectForKey:", v4));
    }
    id v8 = v7;
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (id)linkedServicesForService:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 linkedServiceNames]);
  if ([v3 count])
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        id v9 = 0LL;
        do
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)v9);
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDServiceController sharedInstance]( &OBJC_CLASS___IDSDServiceController,  "sharedInstance",  (void)v15));
          unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 serviceWithIdentifier:v10]);

          if (v12) {
            -[NSMutableArray addObject:](v4, "addObject:", v12);
          }

          id v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v7);
    }

    if (-[NSMutableArray count](v4, "count")) {
      id v13 = v4;
    }
    else {
      id v13 = 0LL;
    }
  }

  else
  {
    id v13 = 0LL;
  }

  return v13;
}

- (id)primaryServiceForAdhocServiceType:(unsigned int)a3
{
  id v4 = 0LL;
  switch(a3)
  {
    case 1u:
    case 2u:
    case 5u:
      id v5 = (const __CFString *)IDSRegistrationServiceTypeMultiplex1;
      goto LABEL_7;
    case 3u:
      id v5 = @"com.apple.madrid";
      goto LABEL_7;
    case 6u:
      id v5 = @"com.apple.private.ac";
      goto LABEL_7;
    case 7u:
      id v5 = @"com.apple.ess";
      goto LABEL_7;
    case 8u:
      id v5 = @"com.apple.private.alloy.itunes";
LABEL_7:
      id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDServiceController serviceWithIdentifier:](self, "serviceWithIdentifier:", v5));
      break;
    default:
      return v4;
  }

  return v4;
}

- (id)adHocServicesForIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = objc_autoreleasePoolPush();
  if ([v3 isEqualToIgnoringCase:IDSRegistrationServiceTypeMultiplex1])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allServicesWithAdHocServiceType:1]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allObjects]);

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allServicesWithAdHocServiceType:2]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 allObjects]);

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 allServicesWithAdHocServiceType:5]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 allObjects]);

    id v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v15 = v14;
    if (v7) {
      -[NSMutableArray addObjectsFromArray:](v14, "addObjectsFromArray:", v7);
    }
    if (v10) {
      -[NSMutableArray addObjectsFromArray:](v15, "addObjectsFromArray:", v10);
    }
    if (v13) {
      -[NSMutableArray addObjectsFromArray:](v15, "addObjectsFromArray:", v13);
    }

LABEL_19:
    goto LABEL_20;
  }

  if ([v3 isEqualToIgnoringCase:@"com.apple.madrid"])
  {
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
    __int128 v17 = v16;
    uint64_t v18 = 3LL;
    goto LABEL_17;
  }

  if ([v3 isEqualToIgnoringCase:@"com.apple.private.ac"])
  {
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
    __int128 v17 = v16;
    uint64_t v18 = 6LL;
    goto LABEL_17;
  }

  if ([v3 isEqualToIgnoringCase:@"com.apple.ess"])
  {
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
    __int128 v17 = v16;
    uint64_t v18 = 7LL;
    goto LABEL_17;
  }

  if ([v3 isEqualToIgnoringCase:@"com.apple.private.alloy.itunes"])
  {
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
    __int128 v17 = v16;
    uint64_t v18 = 8LL;
LABEL_17:
    unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue([v16 allServicesWithAdHocServiceType:v18]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v19 allObjects]);

    BOOL v20 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v15 = v20;
    if (v7) {
      -[NSMutableArray addObjectsFromArray:](v20, "addObjectsFromArray:", v7);
    }
    goto LABEL_19;
  }

  __int128 v15 = 0LL;
LABEL_20:
  if (!-[NSMutableArray count](v15, "count"))
  {

    __int128 v15 = 0LL;
  }

  objc_autoreleasePoolPop(v4);

  return v15;
}

- (NSSet)allAdHocServices
{
  return self->_allAdHocServices;
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