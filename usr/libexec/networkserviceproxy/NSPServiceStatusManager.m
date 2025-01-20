@interface NSPServiceStatusManager
+ (BOOL)supportsSecureCoding;
+ (void)removeFromPreferences;
- (BOOL)changePausedState:(BOOL)a3 forApp:(id)a4 path:(id)a5;
- (BOOL)hasPausedApps;
- (BOOL)isNetworkOutage;
- (BOOL)isServiceActive;
- (BOOL)isServiceOutage;
- (NSMutableArray)appStatuses;
- (NSMutableArray)serviceStatusTimeline;
- (NSPServiceStatusManager)initWithCoder:(id)a3;
- (NSPServiceStatusManager)initWithUserTier:(unint64_t)a3 effectiveUserTier:(unint64_t)a4 delegate:(id)a5;
- (PrivacyProxyServiceStatus)serviceStatus;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)diagnostics;
- (id)initFromPreferencesWithUserTier:(unint64_t)a3 effectiveUserTier:(unint64_t)a4 delegate:(id)a5;
- (id)pausedBundleIDs;
- (id)pausedProcessPaths;
- (void)clearAllPausedApps;
- (void)clearNetworkStatusForType:(int)a3;
- (void)encodeWithCoder:(id)a3;
- (void)handleEffectiveUserTierChange:(unint64_t)a3;
- (void)publishDailyNetworkStatus;
- (void)publishDailyServiceStatus;
- (void)reportActiveOnCellularName:(id)a3;
- (void)reportActiveOnInterfaceName:(id)a3 displayName:(id)a4 type:(int)a5;
- (void)reportActiveOnWiFiName:(id)a3;
- (void)reportActivityForApp:(id)a3 path:(id)a4;
- (void)reportBlockedOnCellularName:(id)a3;
- (void)reportBlockedOnInterfaceName:(id)a3 displayName:(id)a4 type:(int)a5;
- (void)reportBlockedOnWiFiName:(id)a3;
- (void)reportDisabledOnCellularName:(id)a3;
- (void)reportDisabledOnInterfaceName:(id)a3 displayName:(id)a4 type:(int)a5;
- (void)reportDisabledOnWiFiName:(id)a3;
- (void)reportFraudAlert;
- (void)reportServiceActiveShouldReport:(BOOL)a3;
- (void)reportServiceDisabledShouldReport:(BOOL)a3;
- (void)reportServiceOutageWithType:(unint64_t)a3 outageReasonStats:(id)a4;
- (void)reportSubscriberUnsupportedRegion:(id)a3;
- (void)reportUnsupportedRegion:(id)a3;
@end

@implementation NSPServiceStatusManager

- (id)diagnostics
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatusTimeline](self, "serviceStatusTimeline"));
  id v6 = [v5 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v36;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v36 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v35 + 1) + 8 * (void)i) diagnostics]);
        if (v10) {
          -[NSMutableArray addObject:](v4, "addObject:", v10);
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }

    while (v7);
  }

  if (-[NSMutableArray count](v4, "count")) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"ServiceStatus");
  }
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  v27 = v4;
  v30 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (self) {
    id Property = objc_getProperty(self, v11, 64LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id obj = Property;
  id v13 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v32;
    do
    {
      v16 = 0LL;
      do
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v31 + 1) + 8LL * (void)v16);
        if (v17)
        {
          v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v17 + 8), "networkStatusString", v27));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v18,  "setObject:forKeyedSubscript:",  v19,  @"PrivacyProxyNetworkStatusTimeNetworkStatus");

          v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v17 + 8) networkTypeString]);
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v18,  "setObject:forKeyedSubscript:",  v20,  @"PrivacyProxyNetworkStatusTimeNetworkInterfaceType");

          v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:]( &OBJC_CLASS___NSDateFormatter,  "localizedStringFromDate:dateStyle:timeStyle:",  *(void *)(v17 + 16),  1LL,  2LL));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v18,  "setObject:forKeyedSubscript:",  v21,  @"PrivacyProxyNetworkStatusTimeNetworkStartTime");

          v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:]( &OBJC_CLASS___NSDateFormatter,  "localizedStringFromDate:dateStyle:timeStyle:",  *(void *)(v17 + 24),  1LL,  2LL));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v18,  "setObject:forKeyedSubscript:",  v22,  @"PrivacyProxyNetworkStatusTimeNetworkEndTime");

          if (v18) {
            -[NSMutableArray addObject:](v30, "addObject:", v18);
          }
        }

        else
        {
          v18 = 0LL;
        }

        v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v23 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
      id v14 = v23;
    }

    while (v23);
  }

  if (-[NSMutableArray count](v30, "count")) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v30, @"NetworkStatus");
  }
  if (-[NSMutableDictionary count](v3, "count", v27)) {
    v24 = v3;
  }
  else {
    v24 = 0LL;
  }
  v25 = v24;

  return v25;
}

- (id)description
{
  if (self)
  {
    v3 = -[NSMutableString initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableString), "initWithCapacity:", 0LL);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatus](self, "serviceStatus"));
    sub_100043E90(v3, v4, @"Service Status", 0, 14LL);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatusTimeline](self, "serviceStatusTimeline"));
    sub_100043E90(v3, v5, @"Service Status Timeline", 0, 14LL);

    id Property = objc_getProperty(self, v6, 64LL, 1);
    sub_100043E90(v3, Property, @"Network Status Timeline", 0, 14LL);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager appStatuses](self, "appStatuses"));
    sub_100043E90(v3, v8, @"App Statuses", 0, 14LL);
  }

  else
  {
    v3 = 0LL;
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = -[NSPServiceStatusManager init]( +[NSPServiceStatusManager allocWithZone:](&OBJC_CLASS___NSPServiceStatusManager, "allocWithZone:", a3),  "init");
  v5 = v4;
  if (self)
  {
    unint64_t generation = self->_generation;
    v4->_diskVersion = self->_diskVersion;
    v4->_unint64_t generation = generation;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatus](self, "serviceStatus"));
    objc_setProperty_atomic(v5, v8, v7, 8LL);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatusTimeline](self, "serviceStatusTimeline"));
    objc_setProperty_atomic(v5, v10, v9, 16LL);

    id Property = objc_getProperty(self, v11, 64LL, 1);
  }

  else
  {
    v4->_diskVersion = 0LL;
    v4->_unint64_t generation = 0LL;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([0 serviceStatus]);
    objc_setProperty_atomic(v5, v18, v17, 8LL);

    v19 = (void *)objc_claimAutoreleasedReturnValue([0 serviceStatusTimeline]);
    objc_setProperty_atomic(v5, v20, v19, 16LL);

    id Property = 0LL;
  }

  objc_setProperty_atomic(v5, v12, Property, 64LL);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager appStatuses](self, "appStatuses"));
  objc_setProperty_atomic(v5, v15, v14, 24LL);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPServiceStatusManager)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___NSPServiceStatusManager;
  id v7 = -[NSPServiceStatusManager init](&v27, "init");
  if (v7)
  {
    v7->_diskVersion = (int64_t)[v4 decodeIntegerForKey:@"DiskVersion"];
    v7->_unint64_t generation = (unint64_t)[v4 decodeInt64ForKey:@"Generation"];
    id v8 = [v4 decodeObjectOfClass:objc_opt_class(PrivacyProxyServiceStatus) forKey:@"ServiceStatus"];
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    serviceStatus = v7->_serviceStatus;
    v7->_serviceStatus = (PrivacyProxyServiceStatus *)v9;

    id v11 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class(PrivacyProxyServiceStatusTime) forKey:@"ServiceStatusTimeline"];
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (v12)
    {
      uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v12));
      serviceStatusTimeline = v7->_serviceStatusTimeline;
      v7->_serviceStatusTimeline = (NSMutableArray *)v13;
    }

    id v15 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class(PrivacyProxyNetworkStatusTime) forKey:@"NetworkStatusTimeline"];
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if (v16)
    {
      uint64_t v17 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v16));
      networkStatusTimeline = v7->_networkStatusTimeline;
      v7->_networkStatusTimeline = (NSMutableArray *)v17;
    }

    id v19 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class(PrivacyProxyAppStatus) forKey:@"AppStatuses"];
    SEL v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    if (v20)
    {
      uint64_t v21 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v20));
      appStatuses = v7->_appStatuses;
      v7->_appStatuses = (NSMutableArray *)v21;
    }

    id v23 = v7;
  }

  else
  {
    uint64_t v25 = nplog_obj(0LL, v5, v6);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v26 = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "[super init] failed", v26, 2u);
    }
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  [v11 encodeInteger:2 forKey:@"DiskVersion"];
  if (self)
  {
    [v11 encodeInt64:self->_generation forKey:@"Generation"];
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatus](self, "serviceStatus"));
    [v11 encodeObject:v4 forKey:@"ServiceStatus"];

    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatusTimeline](self, "serviceStatusTimeline"));
    [v11 encodeObject:v5 forKey:@"ServiceStatusTimeline"];

    id Property = objc_getProperty(self, v6, 64LL, 1);
  }

  else
  {
    [v11 encodeInt64:0 forKey:@"Generation"];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([0 serviceStatus]);
    [v11 encodeObject:v9 forKey:@"ServiceStatus"];

    SEL v10 = (void *)objc_claimAutoreleasedReturnValue([0 serviceStatusTimeline]);
    [v11 encodeObject:v10 forKey:@"ServiceStatusTimeline"];

    id Property = 0LL;
  }

  [v11 encodeObject:Property forKey:@"NetworkStatusTimeline"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager appStatuses](self, "appStatuses"));
  [v11 encodeObject:v8 forKey:@"AppStatuses"];
}

- (NSPServiceStatusManager)initWithUserTier:(unint64_t)a3 effectiveUserTier:(unint64_t)a4 delegate:(id)a5
{
  id v8 = a5;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___NSPServiceStatusManager;
  id v11 = -[NSPServiceStatusManager init](&v25, "init");
  if (v11)
  {
    v12 = objc_alloc_init(&OBJC_CLASS___PrivacyProxyServiceStatus);
    serviceStatus = v11->_serviceStatus;
    v11->_serviceStatus = v12;

    -[PrivacyProxyServiceStatus setServiceStatus:](v11->_serviceStatus, "setServiceStatus:", 0LL);
    -[PrivacyProxyServiceStatus setNetworkStatuses:](v11->_serviceStatus, "setNetworkStatuses:", 0LL);
    -[PrivacyProxyServiceStatus setDetails:](v11->_serviceStatus, "setDetails:", 0LL);
    id v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    serviceStatusTimeline = v11->_serviceStatusTimeline;
    v11->_serviceStatusTimeline = v14;

    sub_100099170(v11, 0LL);
    v11->_userTier = a3;
    v11->_effectiveTier = a4;
    objc_storeWeak((id *)&v11->_delegate, v8);
    v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    networkStatusTimeline = v11->_networkStatusTimeline;
    v11->_networkStatusTimeline = v16;

    SEL v18 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    appStatuses = v11->_appStatuses;
    v11->_appStatuses = v18;

    v11->_unint64_t generation = 1LL;
    SEL v20 = v11;
  }

  else
  {
    uint64_t v22 = nplog_obj(0LL, v9, v10);
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v24 = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "[super init] failed", v24, 2u);
    }
  }

  return v11;
}

- (id)initFromPreferencesWithUserTier:(unint64_t)a3 effectiveUserTier:(unint64_t)a4 delegate:(id)a5
{
  id v8 = a5;
  uint64_t v9 = -[NSPServiceStatusManager initWithUserTier:effectiveUserTier:delegate:]( self,  "initWithUserTier:effectiveUserTier:delegate:",  a3,  a4,  v8);
  if (v9)
  {
    CFPropertyListRef v10 = CFPreferencesCopyAppValue(@"NSPServiceStatusManagerInfo", kCFPreferencesCurrentApplication);
    if (v10)
    {
      uint64_t v13 = v10;
      id v34 = 0LL;
      id v14 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v10,  &v34);
      id v15 = v34;
      SEL v18 = v15;
      if (v14) {
        BOOL v19 = v15 == 0LL;
      }
      else {
        BOOL v19 = 0;
      }
      if (!v19)
      {
        uint64_t v20 = nplog_obj(v15, v16, v17);
        uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          int64_t v36 = (int64_t)v18;
          _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Failed to create a decoder for the NSP status manager info: %@",  buf,  0xCu);
        }

        CFRelease(v13);
        uint64_t v22 = v9;
LABEL_22:
        objc_super v27 = v22;
LABEL_23:

        goto LABEL_24;
      }

      CFRelease(v13);
      v24 = -[NSPServiceStatusManager initWithCoder:](v9, "initWithCoder:", v14);
      if (!v24)
      {
        uint64_t v28 = nplog_obj(0LL, v25, v26);
        v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "Failed to decode NSP status manager info",  buf,  2u);
        }

        objc_super v27 = 0LL;
        goto LABEL_23;
      }

      uint64_t v9 = v24;
      if (v24->_diskVersion != 2)
      {
        uint64_t v30 = nplog_obj(v24, v25, v26);
        __int128 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          int64_t diskVersion = v9->_diskVersion;
          *(_DWORD *)buf = 134218240;
          int64_t v36 = diskVersion;
          __int16 v37 = 2048;
          uint64_t v38 = 2LL;
          _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_INFO,  "Saved disk version of status manager info (%ld) does not match latest supported version (%ld)",  buf,  0x16u);
        }

        uint64_t v22 =  -[NSPServiceStatusManager initWithUserTier:effectiveUserTier:delegate:]( v9,  "initWithUserTier:effectiveUserTier:delegate:",  a3,  a4,  v8);
        goto LABEL_22;
      }
    }

    else
    {
      uint64_t v23 = nplog_obj(0LL, v11, v12);
      id v14 = (NSKeyedUnarchiver *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v14,  OS_LOG_TYPE_INFO,  "no saved status manager info",  buf,  2u);
      }
    }
  }

  objc_super v27 = v9;
LABEL_24:

  return v27;
}

+ (void)removeFromPreferences
{
  uint64_t v2 = CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication);
  int v3 = v2;
  uint64_t v6 = nplog_obj(v2, v4, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Removed status manager info from preference file",  v9,  2u);
    }
  }

  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Failed to remove status manager info from preference file",  buf,  2u);
  }
}

- (void)publishDailyServiceStatus
{
  int v3 = objc_alloc_init(&OBJC_CLASS___NSPServiceStatusStats);
  if (self)
  {
    unint64_t effectiveTier = self->_effectiveTier;
    if (effectiveTier >= 3) {
      uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_effectiveTier));
    }
    else {
      uint64_t v5 = *(&off_1000FAAA8 + (int)effectiveTier);
    }
  }

  else
  {
    uint64_t v5 = @"UNKNOWN";
  }

  -[NSPServiceStatusStats setTierType:](v3, "setTierType:", v5);

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatusTimeline](self, "serviceStatusTimeline"));
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      CFPropertyListRef v10 = 0LL;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)v10);
        uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 serviceStatusEndTime]);
        if (!v12) {
          goto LABEL_14;
        }
        uint64_t v13 = (void *)v12;
        id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 serviceStatusEndTime]);
        [v14 timeIntervalSinceDate:v15];
        double v17 = v16;

        if (v17 <= 86400.0)
        {
LABEL_14:
          switch((unint64_t)[v11 serviceStatus])
          {
            case 0uLL:
              -[NSPServiceStatusStats setServiceStatusDisabledCount:]( v3,  "setServiceStatusDisabledCount:",  (char *)-[NSPServiceStatusStats serviceStatusDisabledCount](v3, "serviceStatusDisabledCount") + 1);
              break;
            case 1uLL:
              -[NSPServiceStatusStats setServiceStatusActiveCount:]( v3,  "setServiceStatusActiveCount:",  (char *)-[NSPServiceStatusStats serviceStatusActiveCount](v3, "serviceStatusActiveCount") + 1);
              break;
            case 2uLL:
              -[NSPServiceStatusStats setServiceStatusOutageCount:]( v3,  "setServiceStatusOutageCount:",  (char *)-[NSPServiceStatusStats serviceStatusOutageCount](v3, "serviceStatusOutageCount") + 1);
              break;
            case 3uLL:
              -[NSPServiceStatusStats setServiceStatusFraudAlertCount:]( v3,  "setServiceStatusFraudAlertCount:",  (char *)-[NSPServiceStatusStats serviceStatusFraudAlertCount](v3, "serviceStatusFraudAlertCount") + 1);
              break;
            case 4uLL:
              -[NSPServiceStatusStats setServiceStatusUnsupportedRegionCount:]( v3,  "setServiceStatusUnsupportedRegionCount:",  (char *)-[NSPServiceStatusStats serviceStatusUnsupportedRegionCount]( v3,  "serviceStatusUnsupportedRegionCount")
              + 1);
              break;
            case 5uLL:
              -[NSPServiceStatusStats setServiceStatusSystemIncompatibleCount:]( v3,  "setServiceStatusSystemIncompatibleCount:",  (char *)-[NSPServiceStatusStats serviceStatusSystemIncompatibleCount]( v3,  "serviceStatusSystemIncompatibleCount")
              + 1);
              break;
            case 6uLL:
              -[NSPServiceStatusStats setServiceStatusSubscriberUnsupportedRegionCount:]( v3,  "setServiceStatusSubscriberUnsupportedRegionCount:",  (char *)-[NSPServiceStatusStats serviceStatusSubscriberUnsupportedRegionCount]( v3,  "serviceStatusSubscriberUnsupportedRegionCount")
              + 1);
              break;
            case 7uLL:
              -[NSPServiceStatusStats setServiceStatusNetworkOutageCount:]( v3,  "setServiceStatusNetworkOutageCount:",  (char *)-[NSPServiceStatusStats serviceStatusNetworkOutageCount](v3, "serviceStatusNetworkOutageCount")
              + 1);
              break;
            default:
              break;
          }
        }

        CFPropertyListRef v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v18 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      id v8 = v18;
    }

    while (v18);
  }

  -[NSPProxyAnalytics sendAnalytics](v3, "sendAnalytics");
}

- (void)publishDailyNetworkStatus
{
  int v3 = objc_alloc_init(&OBJC_CLASS___NSPNetworkStatusStats);
  uint64_t v4 = v3;
  if (self)
  {
    unint64_t effectiveTier = self->_effectiveTier;
    if (effectiveTier >= 3) {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_effectiveTier));
    }
    else {
      uint64_t v6 = *(&off_1000FAAA8 + (int)effectiveTier);
    }
    -[NSPNetworkStatusStats setTierType:](v4, "setTierType:", v6);

    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id Property = objc_getProperty(self, v7, 64LL, 1);
  }

  else
  {
    -[NSPNetworkStatusStats setTierType:](v3, "setTierType:", @"UNKNOWN");

    id Property = 0LL;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
  }

  id v9 = Property;
  id v10 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v33;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)v13);
        if (v14)
        {
          id v15 = *(id *)(v14 + 24);
          if (v15)
          {
            double v16 = v15;
            double v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
            [v17 timeIntervalSinceDate:*(void *)(v14 + 24)];
            double v19 = v18;

            if (v19 > 86400.0) {
              goto LABEL_54;
            }
          }

          __int128 v20 = *(void **)(v14 + 8);
        }

        else
        {
          __int128 v20 = 0LL;
        }

        id v21 = [v20 networkStatus];
        if (v21 == (id)2)
        {
          if (v14) {
            v24 = *(void **)(v14 + 8);
          }
          else {
            v24 = 0LL;
          }
          if ([v24 networkType] == 1)
          {
            -[NSPNetworkStatusStats setWifiStatusBlockedCount:]( v4,  "setWifiStatusBlockedCount:",  (char *)-[NSPNetworkStatusStats wifiStatusBlockedCount](v4, "wifiStatusBlockedCount") + 1);
          }

          else
          {
            if (v14) {
              objc_super v27 = *(void **)(v14 + 8);
            }
            else {
              objc_super v27 = 0LL;
            }
            if ([v27 networkType] == 2)
            {
              -[NSPNetworkStatusStats setCellStatusBlockedCount:]( v4,  "setCellStatusBlockedCount:",  (char *)-[NSPNetworkStatusStats cellStatusBlockedCount](v4, "cellStatusBlockedCount") + 1);
            }

            else
            {
              if (v14) {
                uint64_t v30 = *(void **)(v14 + 8);
              }
              else {
                uint64_t v30 = 0LL;
              }
              if ([v30 networkType] == 3) {
                -[NSPNetworkStatusStats setWiredStatusBlockedCount:]( v4,  "setWiredStatusBlockedCount:",  (char *)-[NSPNetworkStatusStats wiredStatusBlockedCount](v4, "wiredStatusBlockedCount") + 1);
              }
            }
          }
        }

        else if (v21 == (id)1)
        {
          if (v14) {
            uint64_t v23 = *(void **)(v14 + 8);
          }
          else {
            uint64_t v23 = 0LL;
          }
          if ([v23 networkType] == 1)
          {
            -[NSPNetworkStatusStats setWifiStatusActiveCount:]( v4,  "setWifiStatusActiveCount:",  (char *)-[NSPNetworkStatusStats wifiStatusActiveCount](v4, "wifiStatusActiveCount") + 1);
          }

          else
          {
            if (v14) {
              uint64_t v25 = *(void **)(v14 + 8);
            }
            else {
              uint64_t v25 = 0LL;
            }
            if ([v25 networkType] == 2)
            {
              -[NSPNetworkStatusStats setCellStatusActiveCount:]( v4,  "setCellStatusActiveCount:",  (char *)-[NSPNetworkStatusStats cellStatusActiveCount](v4, "cellStatusActiveCount") + 1);
            }

            else
            {
              if (v14) {
                uint64_t v28 = *(void **)(v14 + 8);
              }
              else {
                uint64_t v28 = 0LL;
              }
              if ([v28 networkType] == 3) {
                -[NSPNetworkStatusStats setWiredStatusActiveCount:]( v4,  "setWiredStatusActiveCount:",  (char *)-[NSPNetworkStatusStats wiredStatusActiveCount](v4, "wiredStatusActiveCount") + 1);
              }
            }
          }
        }

        else if (!v21)
        {
          if (v14) {
            __int128 v22 = *(void **)(v14 + 8);
          }
          else {
            __int128 v22 = 0LL;
          }
          if ([v22 networkType] == 1)
          {
            -[NSPNetworkStatusStats setWifiStatusDisabledCount:]( v4,  "setWifiStatusDisabledCount:",  (char *)-[NSPNetworkStatusStats wifiStatusDisabledCount](v4, "wifiStatusDisabledCount") + 1);
          }

          else
          {
            if (v14) {
              uint64_t v26 = *(void **)(v14 + 8);
            }
            else {
              uint64_t v26 = 0LL;
            }
            if ([v26 networkType] == 2)
            {
              -[NSPNetworkStatusStats setCellStatusDisabledCount:]( v4,  "setCellStatusDisabledCount:",  (char *)-[NSPNetworkStatusStats cellStatusDisabledCount](v4, "cellStatusDisabledCount") + 1);
            }

            else
            {
              if (v14) {
                v29 = *(void **)(v14 + 8);
              }
              else {
                v29 = 0LL;
              }
              if ([v29 networkType] == 3) {
                -[NSPNetworkStatusStats setWiredStatusDisabledCount:]( v4,  "setWiredStatusDisabledCount:",  (char *)-[NSPNetworkStatusStats wiredStatusDisabledCount](v4, "wiredStatusDisabledCount") + 1);
              }
            }
          }
        }

- (void)handleEffectiveUserTierChange:(unint64_t)a3
{
  if (self)
  {
    if (self->_effectiveTier != a3) {
      self->_unint64_t effectiveTier = a3;
    }
  }

- (void)reportServiceActiveShouldReport:(BOOL)a3
{
  if (self && self->_effectiveTier == 2)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatus](self, "serviceStatus"));
    id v6 = [v5 serviceStatus];

    if (!v6)
    {
      uint64_t v11 = nplog_obj(v7, v8, v9);
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[PrivacyProxyServiceStatus serviceStatusString:]( &OBJC_CLASS___PrivacyProxyServiceStatus,  "serviceStatusString:",  1LL));
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatus](self, "serviceStatus"));
        id v15 = (void *)objc_claimAutoreleasedReturnValue( +[PrivacyProxyServiceStatus serviceStatusString:]( PrivacyProxyServiceStatus,  "serviceStatusString:",  [v14 serviceStatus]));
        int v28 = 138412546;
        v29 = v13;
        __int16 v30 = 2112;
        id v31 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Setting service status %@, previous service status %@",  (uint8_t *)&v28,  0x16u);
      }

      if (!a3)
      {
        double v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatus](self, "serviceStatus"));
        [v16 setServiceStatus:1];

        sub_100099170(self, (id)1);
        ++self->_generation;
        +[NPUtilities postNotification:value:]( &OBJC_CLASS___NPUtilities,  "postNotification:value:",  @"com.apple.networkserviceproxy.privacy-proxy-service-status-changed");
        return;
      }

      goto LABEL_13;
    }

    if (self->_lastOutageType)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatus](self, "serviceStatus"));
      if ([v10 serviceStatus] == (id)2)
      {

LABEL_12:
        double v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatusTimeline](self, "serviceStatusTimeline"));
        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 lastObject]);

        id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 serviceStatusStartTime]);
        __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
        [v22 timeIntervalSinceDate:v21];
        double v24 = v23;

        uint64_t v25 = objc_alloc_init(&OBJC_CLASS___NSPOutageDurationStats);
        -[NSPOutageDurationStats setOutageType:](v25, "setOutageType:", self->_lastOutageType);
        -[NSPOutageDurationStats setOutageDurationSec:](v25, "setOutageDurationSec:", (unint64_t)v24);
        -[NSPProxyAnalytics sendAnalytics](v25, "sendAnalytics");

        goto LABEL_13;
      }

      double v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatus](self, "serviceStatus"));
      id v18 = [v17 serviceStatus];

      if (v18 == (id)7) {
        goto LABEL_12;
      }
    }

- (void)reportServiceDisabledShouldReport:(BOOL)a3
{
  if (self && self->_effectiveTier == 2 || a3)
  {
    if (a3)
    {
      id v16 = (id)sub_10003D9A0(@"UNAVAILABLE_TITLE", @"UNAVAILABLE_TITLE");
      uint64_t v4 = (void *)sub_10003D9A0(@"UNAVAILABLE", @"UNAVAILABLE");
      sub_100099F9C(self, 0LL, v16, v4, 0LL);
    }

    else
    {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatus](self, "serviceStatus"));
      id v6 = [v5 serviceStatus];

      if (v6)
      {
        uint64_t v10 = nplog_obj(v7, v8, v9);
        uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[PrivacyProxyServiceStatus serviceStatusString:]( &OBJC_CLASS___PrivacyProxyServiceStatus,  "serviceStatusString:",  0LL));
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatus](self, "serviceStatus"));
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[PrivacyProxyServiceStatus serviceStatusString:]( PrivacyProxyServiceStatus,  "serviceStatusString:",  [v13 serviceStatus]));
          *(_DWORD *)buf = 138412546;
          id v18 = v12;
          __int16 v19 = 2112;
          __int128 v20 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Setting service status %@, previous service status %@",  buf,  0x16u);
        }

        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatus](self, "serviceStatus"));
        [v15 setServiceStatus:0];

        sub_100099170(self, 0LL);
        if (self)
        {
          ++self->_generation;
          +[NPUtilities postNotification:value:]( &OBJC_CLASS___NPUtilities,  "postNotification:value:",  @"com.apple.networkserviceproxy.privacy-proxy-service-status-changed");
        }
      }
    }
  }

- (void)reportServiceOutageWithType:(unint64_t)a3 outageReasonStats:(id)a4
{
  id v6 = a4;
  if (self && self->_effectiveTier == 2)
  {
    if (a3 == 2) {
      unint64_t effectiveTier = 7LL;
    }
    else {
      unint64_t effectiveTier = self->_effectiveTier;
    }
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatus](self, "serviceStatus"));
    id v9 = [v8 serviceStatus];

    if (v9 != (id)effectiveTier)
    {
      self->_lastOutageType = a3;
      [v6 sendAnalytics];
    }

    if (a3 == 2)
    {
      uint64_t v10 = (void *)sub_10003D9A0(@"CAPTIVE_WARNING_NO_NETWORK", @"CAPTIVE_WARNING_NO_NETWORK");
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatus](self, "serviceStatus"));
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 networkStatuses]);

      id v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v28;
        while (2)
        {
          for (i = 0LL; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v28 != v15) {
              objc_enumerationMutation(v12);
            }
            double v17 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
            if ([v17 networkType] == 1)
            {
              id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 networkName]);

              if (v18)
              {
                double v24 = (void *)sub_10003D9A0(@"CAPTIVE_WARNING", @"CAPTIVE_WARNING");
                uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v17 networkName]);
                uint64_t v26 = objc_claimAutoreleasedReturnValue( +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v24,  @"%@",  0LL,  v25));

                uint64_t v10 = (void *)v26;
                goto LABEL_21;
              }
            }
          }

          id v14 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }

- (BOOL)isServiceActive
{
  if (!self || self->_effectiveTier != 2) {
    return 0;
  }
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatus](self, "serviceStatus"));
  BOOL v3 = [v2 serviceStatus] == (id)1;

  return v3;
}

- (BOOL)isServiceOutage
{
  if (!self || self->_effectiveTier != 2) {
    return 0;
  }
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatus](self, "serviceStatus"));
  BOOL v3 = [v2 serviceStatus] == (id)2;

  return v3;
}

- (BOOL)isNetworkOutage
{
  if (!self || self->_effectiveTier != 2) {
    return 0;
  }
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatus](self, "serviceStatus"));
  BOOL v3 = [v2 serviceStatus] == (id)7;

  return v3;
}

- (void)reportFraudAlert
{
  if (self)
  {
    if (self->_effectiveTier == 2)
    {
      id v6 = (id)sub_10003D9A0(@"FRAUD_WARNING_TITLE", @"FRAUD_WARNING_TITLE");
      BOOL v3 = (void *)sub_10003DB38(@"FRAUD_WARNING");
      uint64_t v4 = (void *)sub_10003DB38(@"FRAUD_WARNING");
      uint64_t v5 = (void *)sub_10003D9A0(v3, v4);
      sub_100099F9C(self, (id)3, v6, v5, 0LL);
    }
  }

- (void)reportUnsupportedRegion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self && self->_userTier == 2)
  {
    if (v4)
    {
      uint64_t v9 = kPrivacyProxyServiceStatusDetailsRegionIDKey;
      id v10 = v4;
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
    }

    else
    {
      id v6 = 0LL;
    }

    uint64_t v7 = (void *)sub_10003D9A0(@"REGION_WARNING_TITLE", @"REGION_WARNING_TITLE");
    uint64_t v8 = (void *)sub_10003D9A0(@"REGION_WARNING", @"REGION_WARNING");
    sub_100099F9C(self, (id)4, v7, v8, v6);
  }
}

- (void)reportSubscriberUnsupportedRegion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self && self->_userTier == 2)
  {
    if (v4)
    {
      uint64_t v9 = kPrivacyProxyServiceStatusDetailsRegionIDKey;
      id v10 = v4;
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
    }

    else
    {
      id v6 = 0LL;
    }

    uint64_t v7 = (void *)sub_10003D9A0(@"REGION_WARNING_TITLE", @"REGION_WARNING_TITLE");
    uint64_t v8 = (void *)sub_10003D9A0(@"REGION_WARNING", @"REGION_WARNING");
    sub_100099F9C(self, (id)6, v7, v8, v6);
  }
}

- (void)clearNetworkStatusForType:(int)a3
{
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatus](self, "serviceStatus", 0LL));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 networkStatuses]);

  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    char v10 = 0;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        else {
          -[NSMutableArray addObject:](v5, "addObject:", v13);
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v9);

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatus](self, "serviceStatus"));
    [v14 setNetworkStatuses:v5];

    if (self != 0LL && (v10 & 1) != 0)
    {
      ++self->_generation;
      +[NPUtilities postNotification:value:]( &OBJC_CLASS___NPUtilities,  "postNotification:value:",  @"com.apple.networkserviceproxy.privacy-proxy-service-status-changed");
    }
  }

  else
  {

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatus](self, "serviceStatus"));
    [v15 setNetworkStatuses:v5];
  }
}

- (void)reportActiveOnWiFiName:(id)a3
{
  id v4 = a3;
  uint64_t v7 = nplog_obj(v4, v5, v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Wi-Fi network %@ is active", (uint8_t *)&v9, 0xCu);
  }

  sub_10009AE8C(self, (id)1, 1LL, v4);
}

- (void)reportDisabledOnWiFiName:(id)a3
{
  id v4 = a3;
  uint64_t v7 = nplog_obj(v4, v5, v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Wi-Fi network %@ is disabled",  (uint8_t *)&v9,  0xCu);
  }

  sub_10009AE8C(self, 0LL, 1LL, v4);
}

- (void)reportBlockedOnWiFiName:(id)a3
{
  id v4 = a3;
  uint64_t v7 = nplog_obj(v4, v5, v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Wi-Fi network %@ is blocked", buf, 0xCu);
  }

  if (sub_10009AE8C(self, (id)2, 1LL, v4))
  {
    if (self) {
      id Property = objc_getProperty(self, v9, 56LL, 1);
    }
    else {
      id Property = 0LL;
    }
    sub_1000A7110((uint64_t)Property);
    uint64_t v11 = (void *)sub_10003D9A0(@"WARNING_TITLE", @"WARNING_TITLE");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v11,  @"%@",  0LL,  v4));

    id v13 = objc_alloc(&OBJC_CLASS___NSPUserNotification);
    id v14 = (void *)sub_10003D9A0(@"WIFI_WARNING", @"WIFI_WARNING");
    uint64_t v15 = (void *)sub_10003D9A0(@"USE_WITHOUT_PROXY", @"USE_WITHOUT_PROXY");
    __int128 v16 = (void *)sub_10003D9A0(@"USE_OTHER_NETWORK", @"USE_OTHER_NETWORK");
    id v17 = sub_1000572E4(self);
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10009BABC;
    v21[3] = &unk_1000FA238;
    v21[4] = self;
    id v22 = v4;
    id v20 = sub_1000A6BF0(v13, v12, v14, v15, v16, 0LL, 0, v18, v21);
    if (self) {
      objc_setProperty_atomic(self, v19, v20, 56LL);
    }
  }
}

- (void)reportActiveOnCellularName:(id)a3
{
  id v4 = a3;
  uint64_t v7 = nplog_obj(v4, v5, v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Cellular network %@ is active",  (uint8_t *)&v9,  0xCu);
  }

  sub_10009AE8C(self, (id)1, 2LL, v4);
}

- (void)reportDisabledOnCellularName:(id)a3
{
  id v4 = a3;
  uint64_t v7 = nplog_obj(v4, v5, v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Cellular network %@ is disabled",  (uint8_t *)&v9,  0xCu);
  }

  sub_10009AE8C(self, 0LL, 2LL, v4);
}

- (void)reportBlockedOnCellularName:(id)a3
{
  id v4 = a3;
  uint64_t v7 = nplog_obj(v4, v5, v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Cellular network %@ is blocked", buf, 0xCu);
  }

  if (sub_10009AE8C(self, (id)2, 2LL, v4))
  {
    if (self) {
      id Property = objc_getProperty(self, v9, 56LL, 1);
    }
    else {
      id Property = 0LL;
    }
    sub_1000A7110((uint64_t)Property);
    uint64_t v11 = objc_alloc(&OBJC_CLASS___NSPUserNotification);
    uint64_t v12 = (void *)sub_10003D9A0(@"CELLULAR_WARNING_TITLE", @"CELLULAR_WARNING_TITLE");
    id v13 = (void *)sub_10003D9A0(@"CELLULAR_WARNING", @"CELLULAR_WARNING");
    id v14 = (void *)sub_10003D9A0(@"USE_WITHOUT_PROXY", @"USE_WITHOUT_PROXY");
    uint64_t v15 = (void *)sub_10003D9A0(@"CELLULAR_SETTINGS", @"CELLULAR_SETTINGS");
    id v16 = sub_1000572E4(self);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10009BFA4;
    v20[3] = &unk_1000FA238;
    v20[4] = self;
    id v21 = v4;
    id v19 = sub_1000A6BF0(v11, v12, v13, v14, v15, 0LL, 0, v17, v20);
    if (self) {
      objc_setProperty_atomic(self, v18, v19, 56LL);
    }
  }
}

- (void)reportActiveOnInterfaceName:(id)a3 displayName:(id)a4 type:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v12 = nplog_obj(v9, v10, v11);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    id v15 = v9;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Interface %@ (%@) is active",  (uint8_t *)&v14,  0x16u);
  }

  sub_10009AE8C(self, (id)1, v5, v8);
}

- (void)reportDisabledOnInterfaceName:(id)a3 displayName:(id)a4 type:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v12 = nplog_obj(v9, v10, v11);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    id v15 = v9;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Interface %@ (%@) is disabled",  (uint8_t *)&v14,  0x16u);
  }

  sub_10009AE8C(self, 0LL, v5, v8);
}

- (void)reportBlockedOnInterfaceName:(id)a3 displayName:(id)a4 type:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v12 = nplog_obj(v9, v10, v11);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v31 = v9;
    __int16 v32 = 2112;
    id v33 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Interface %@ (%@) is blocked", buf, 0x16u);
  }

  if (sub_10009AE8C(self, (id)2, v5, v8))
  {
    if (self) {
      id Property = objc_getProperty(self, v14, 56LL, 1);
    }
    else {
      id Property = 0LL;
    }
    sub_1000A7110((uint64_t)Property);
    __int16 v16 = (void *)sub_10003D9A0(@"WARNING_TITLE", @"WARNING_TITLE");
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v16,  @"%@",  0LL,  v9));

    __int128 v18 = objc_alloc(&OBJC_CLASS___NSPUserNotification);
    id v19 = (void *)sub_10003D9A0(@"WIFI_WARNING", @"WIFI_WARNING");
    id v20 = (void *)sub_10003D9A0(@"USE_WITHOUT_PROXY", @"USE_WITHOUT_PROXY");
    id v21 = (void *)sub_10003D9A0(@"USE_OTHER_NETWORK", @"USE_OTHER_NETWORK");
    id v22 = sub_1000572E4(self);
    id v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_10009C548;
    v26[3] = &unk_1000FAA48;
    v26[4] = self;
    id v27 = v8;
    id v28 = v9;
    int v29 = v5;
    id v25 = sub_1000A6BF0(v18, v17, v19, v20, v21, 0LL, 0, v23, v26);
    if (self) {
      objc_setProperty_atomic(self, v24, v25, 56LL);
    }
  }
}

- (void)reportActivityForApp:(id)a3 path:(id)a4
{
  id v6 = a3;
  id v26 = a4;
  id v27 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager appStatuses](self, "appStatuses"));
  id v8 = [v7 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (!v8)
  {

    if (!v6) {
      goto LABEL_20;
    }
    goto LABEL_18;
  }

  id v9 = v8;
  id v25 = self;
  uint64_t v10 = *(void *)v29;
  char v11 = 1;
  do
  {
    for (i = 0LL; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v29 != v10) {
        objc_enumerationMutation(v7);
      }
      id v13 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
      int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleIdentifier]);
      if ([v14 isEqualToString:v6])
      {
      }

      else
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 path]);
        unsigned int v16 = [v15 isEqualToString:v26];

        if (!v16) {
          goto LABEL_11;
        }
      }

      if ([v13 appStatus] != (id)2) {
        continue;
      }
      char v11 = 0;
LABEL_11:
      -[NSMutableArray addObject:](v27, "addObject:", v13);
    }

    id v9 = [v7 countByEnumeratingWithState:&v28 objects:v34 count:16];
  }

  while (v9);

  self = v25;
  if ((v11 & 1) != 0)
  {
    if (!v6) {
      goto LABEL_20;
    }
LABEL_18:
    if (v26
      || (id v17 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationWorkspace defaultWorkspace]( LSApplicationWorkspace,  "defaultWorkspace")),  v18 = [v17 applicationIsInstalled:v6],  v17,  (v18 & 1) != 0))
    {
LABEL_20:
      id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      id v23 = [[PrivacyProxyAppStatus alloc] initWithStatus:1 bundleID:v6 path:v26 activeDate:v22];
      -[NSMutableArray addObject:](v27, "addObject:", v23);
      sub_10009C5A0(self, v27, v22);
      if (self)
      {
        ++self->_generation;
        +[NPUtilities postNotification:value:]( &OBJC_CLASS___NPUtilities,  "postNotification:value:",  @"com.apple.networkserviceproxy.privacy-proxy-service-status-changed");
      }
    }

    else
    {
      uint64_t v24 = nplog_obj(v19, v20, v21);
      id v22 = (void *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v33 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v22,  OS_LOG_TYPE_INFO,  "Bundle ID %@ not known to launch services, ignoring",  buf,  0xCu);
      }
    }
  }
}

- (BOOL)changePausedState:(BOOL)a3 forApp:(id)a4 path:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v35 = a5;
  if (v6) {
    uint64_t v9 = 2LL;
  }
  else {
    uint64_t v9 = 1LL;
  }
  uint64_t v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  char v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager appStatuses](self, "appStatuses"));
  id v12 = [v11 countByEnumeratingWithState:&v38 objects:v42 count:16];
  id v13 = &AnalyticsSendEventLazy_ptr;
  if (!v12)
  {

    goto LABEL_22;
  }

  id v14 = v12;
  id v33 = self;
  char v34 = 0;
  uint64_t v15 = *(void *)v39;
  int v16 = 1;
  do
  {
    id v17 = 0LL;
    id v36 = v14;
    do
    {
      if (*(void *)v39 != v15) {
        objc_enumerationMutation(v11);
      }
      unsigned __int8 v18 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)v17);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 bundleIdentifier]);
      if ([v19 isEqualToString:v8])
      {
      }

      else
      {
        int v37 = v16;
        uint64_t v20 = v15;
        uint64_t v21 = v11;
        uint64_t v22 = v9;
        id v23 = v10;
        id v24 = v8;
        id v25 = (void *)objc_claimAutoreleasedReturnValue([v18 path]);
        unsigned int v26 = [v25 isEqualToString:v35];

        id v8 = v24;
        uint64_t v10 = v23;
        uint64_t v9 = v22;
        char v11 = v21;
        uint64_t v15 = v20;
        id v14 = v36;

        if (!v26)
        {
          int v16 = v37;
          goto LABEL_16;
        }
      }

      if ([v18 appStatus] == (id)v9)
      {
        int v16 = 0;
      }

      else
      {
        [v18 setAppStatus:v9];
        int v16 = 0;
        char v34 = 1;
      }

- (void)clearAllPausedApps
{
  BOOL v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager appStatuses](self, "appStatuses", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if ([v9 appStatus] == (id)2) {
          [v9 setAppStatus:1];
        }
        -[NSMutableArray addObject:](v3, "addObject:", v9);
      }

      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  sub_10009C5A0(self, v3, v10);

  if (self)
  {
    ++self->_generation;
    +[NPUtilities postNotification:value:]( &OBJC_CLASS___NPUtilities,  "postNotification:value:",  @"com.apple.networkserviceproxy.privacy-proxy-service-status-changed");
  }
}

- (BOOL)hasPausedApps
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager appStatuses](self, "appStatuses", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * (void)i) appStatus] == (id)2)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }

      id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

- (id)pausedBundleIDs
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager appStatuses](self, "appStatuses", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    id v4 = v3;
    id v5 = 0LL;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        __int128 v8 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if ([v8 appStatus] == (id)2)
        {
          __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);

          if (v9)
          {
            if (!v5) {
              id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
            }
            __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);
            -[NSMutableArray addObject:](v5, "addObject:", v10);
          }
        }
      }

      id v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v4);
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (id)pausedProcessPaths
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager appStatuses](self, "appStatuses", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    id v4 = v3;
    id v5 = 0LL;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        __int128 v8 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if ([v8 appStatus] == (id)2)
        {
          __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);

          if (v9)
          {
            if (!v5) {
              id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
            }
            __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
            -[NSMutableArray addObject:](v5, "addObject:", v10);
          }
        }
      }

      id v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v4);
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (PrivacyProxyServiceStatus)serviceStatus
{
  return (PrivacyProxyServiceStatus *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSMutableArray)serviceStatusTimeline
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSMutableArray)appStatuses
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24LL, 1);
}

- (void).cxx_destruct
{
}

@end