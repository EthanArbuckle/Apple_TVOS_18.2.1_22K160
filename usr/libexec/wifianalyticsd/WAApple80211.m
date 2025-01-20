@interface WAApple80211
- (BOOL)currentChannelInfo:(apple80211_channel *)a3;
- (BOOL)everAssociated;
- (BOOL)grabAndSubmitFWTrapInfo;
- (BOOL)grabAndSubmitLqmMetrics;
- (BOOL)hasAWDLInterfaceListed;
- (BOOL)hasIRInterfaceListed;
- (BOOL)hasNANInterfaceListed;
- (BOOL)hasSoftAPInterfaceListed;
- (BOOL)isAXAssociatoin;
- (BOOL)isAssociated;
- (BOOL)triggerDpsReset:(id)a3;
- (BOOL)triggerFastDpsReset;
- (BOOL)triggerReassociation:(id)a3;
- (NSDate)lastDateBSSIDQueried;
- (NSDate)lastDateChannelQueried;
- (NSString)ifName;
- (WAApple80211)init;
- (WAApple80211)initWithInterfaceName:(id)a3;
- (WADeviceDBDelegate)dbDelegate;
- (WAMessage)dummyWAMessage;
- (_Apple80211)apple80211Ref;
- (id)currentBSSIDandSSID;
- (id)getChipSet;
- (id)getIOReportLegendItemsMatching:(id *)a3 retErr:(char *)a4;
- (id)getIOReportingClassPath;
- (id)getIOReportingDriverName;
- (id)initByFindingInterfaceName;
- (int)currentPHYMode;
- (int64_t)getDriverType;
- (unint64_t)getIOReportingDriverID;
- (unint64_t)getPhyMode;
- (unsigned)getIOReportingService;
- (void)_storeAttemptedRecovery:(id)a3 reason:(id)a4 fromSSID:(id)a5 fromBSSID:(id)a6 commandResult:(int)a7;
- (void)dealloc;
- (void)setApple80211Ref:(_Apple80211 *)a3;
- (void)setDbDelegate:(id)a3;
- (void)setDummyWAMessage:(id)a3;
- (void)setIfName:(id)a3;
- (void)setLastDateBSSIDQueried:(id)a3;
- (void)setLastDateChannelQueried:(id)a3;
- (void)submitLqmMetrics:(id)a3;
@end

@implementation WAApple80211

- (WAApple80211)init
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  @"Please use the init defined in the header for this class",  0LL));
  objc_exception_throw(v2);
  __break(1u);
  return result;
}

- (id)initByFindingInterfaceName
{
  id obj = 0LL;
  CFArrayRef theArray = 0LL;
  v38.receiver = self;
  v38.super_class = (Class)&OBJC_CLASS___WAApple80211;
  id v2 = -[WAApple80211 init](&v38, "init");
  v3 = v2;
  if (!v2)
  {
    LODWORD(v5) = 0;
LABEL_30:
    id v34 = WALogCategoryDefaultHandle();
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)v42 = "-[WAApple80211 initByFindingInterfaceName]";
      *(_WORD *)&v42[8] = 1024;
      *(_DWORD *)&v42[10] = 124;
      __int16 v43 = 1024;
      LODWORD(v44) = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Failed to init WAApple80211 err is: %d",  buf,  0x18u);
    }

    id v36 = WALogCategoryDefaultHandle();
    v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v42 = v5;
      *(_WORD *)&v42[4] = 2112;
      *(void *)&v42[6] = obj;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_FAULT,  "Failed to init WAApple80211 err is: %d, interface %@",  buf,  0x12u);
    }

    v17 = 0LL;
    if (obj) {
      CFRelease(obj);
    }
    dummyWAMessage = v3;
    v3 = 0LL;
    goto LABEL_11;
  }

  p_apple80211Ref = &v2->_apple80211Ref;
  LODWORD(v5) = Apple80211Open(&v2->_apple80211Ref);
  if ((_DWORD)v5)
  {
    id v23 = WALogCategoryDefaultHandle();
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    *(_DWORD *)buf = 136446722;
    *(void *)v42 = "-[WAApple80211 initByFindingInterfaceName]";
    *(_WORD *)&v42[8] = 1024;
    *(_DWORD *)&v42[10] = 78;
    __int16 v43 = 1024;
    LODWORD(v44) = v5;
    v25 = "%{public}s::%d:Apple80211Open failed with: %d";
    goto LABEL_20;
  }

  LODWORD(v5) = Apple80211GetIfListCopy(*p_apple80211Ref, &theArray);
  if ((_DWORD)v5)
  {
    id v26 = WALogCategoryDefaultHandle();
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    *(_DWORD *)buf = 136446722;
    *(void *)v42 = "-[WAApple80211 initByFindingInterfaceName]";
    *(_WORD *)&v42[8] = 1024;
    *(_DWORD *)&v42[10] = 81;
    __int16 v43 = 1024;
    LODWORD(v44) = v5;
    v25 = "%{public}s::%d:Apple80211GetIfListCopy failed with: %d";
LABEL_20:
    v27 = v24;
    uint32_t v28 = 24;
    goto LABEL_28;
  }

  if (!CFArrayGetCount(theArray))
  {
    id v29 = WALogCategoryDefaultHandle();
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)v42 = "-[WAApple80211 initByFindingInterfaceName]";
      *(_WORD *)&v42[8] = 1024;
      *(_DWORD *)&v42[10] = 83;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Apple80211GetIfListCopy returned 0 interfaces",  buf,  0x12u);
    }

    LODWORD(v5) = 0;
    goto LABEL_29;
  }

  ValueAtIndex = (NSString *)CFArrayGetValueAtIndex(theArray, 0LL);
  id v7 = WALogCategoryDefaultHandle();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446722;
    *(void *)v42 = "-[WAApple80211 initByFindingInterfaceName]";
    *(_WORD *)&v42[8] = 1024;
    *(_DWORD *)&v42[10] = 87;
    __int16 v43 = 2112;
    v44 = ValueAtIndex;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:Found WiFi interface %@\n",  buf,  0x1Cu);
  }

  p_ifName = &v3->_ifName;
  objc_storeStrong((id *)&v3->_ifName, ValueAtIndex);
  uint64_t v5 = Apple80211BindToInterface(v3->_apple80211Ref, v3->_ifName);
  if ((_DWORD)v5)
  {
    id v30 = WALogCategoryDefaultHandle();
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    v31 = *p_ifName;
    uint64_t v32 = Apple80211ErrToStr(v5);
    *(_DWORD *)buf = 136447234;
    *(void *)v42 = "-[WAApple80211 initByFindingInterfaceName]";
    *(_WORD *)&v42[8] = 1024;
    *(_DWORD *)&v42[10] = 93;
    __int16 v43 = 2112;
    v44 = v31;
    __int16 v45 = 1024;
    int v46 = v5;
    __int16 v47 = 2080;
    uint64_t v48 = v32;
    v25 = "%{public}s::%d:Apple80211BindToInterface (for interface with name: %@) failed with: %d - %s";
    v27 = v24;
    uint32_t v28 = 44;
LABEL_28:
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, v25, buf, v28);
    goto LABEL_29;
  }

  LODWORD(v5) = Apple80211GetInterfaceNameCopy(*p_apple80211Ref, &obj);
  objc_storeStrong((id *)&v3->_ifName, obj);
  if (!*p_ifName)
  {
    id v33 = WALogCategoryDefaultHandle();
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)v42 = "-[WAApple80211 initByFindingInterfaceName]";
      *(_WORD *)&v42[8] = 1024;
      *(_DWORD *)&v42[10] = 100;
      v25 = "%{public}s::%d:No interface name to use with Apple80211";
      v27 = v24;
      uint32_t v28 = 18;
      goto LABEL_28;
    }

- (WAApple80211)initWithInterfaceName:(id)a3
{
  id v5 = a3;
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___WAApple80211;
  v6 = -[WAApple80211 init](&v36, "init");
  id v7 = v6;
  if (!v6)
  {
    LODWORD(v9) = 0;
LABEL_19:
    id v32 = WALogCategoryDefaultHandle();
    id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)objc_super v38 = "-[WAApple80211 initWithInterfaceName:]";
      *(_WORD *)&v38[8] = 1024;
      *(_DWORD *)&v38[10] = 182;
      __int16 v39 = 1024;
      LODWORD(v40) = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Failed to init WAApple80211 err is: %d",  buf,  0x18u);
    }

    id v34 = WALogCategoryDefaultHandle();
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)objc_super v38 = v9;
      *(_WORD *)&v38[4] = 2112;
      *(void *)&v38[6] = v5;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_FAULT,  "Failed to init WAApple80211 err is: %d, interface %@",  buf,  0x12u);
    }

    v17 = 0LL;
    dummyWAMessage = v7;
    id v7 = 0LL;
    goto LABEL_7;
  }

  p_ifName = &v6->_ifName;
  objc_storeStrong((id *)&v6->_ifName, a3);
  if (!*p_ifName)
  {
    id v23 = WALogCategoryDefaultHandle();
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)objc_super v38 = "-[WAApple80211 initWithInterfaceName:]";
      *(_WORD *)&v38[8] = 1024;
      *(_DWORD *)&v38[10] = 151;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:No interface name to use with Apple80211",  buf,  0x12u);
    }

    LODWORD(v9) = 0;
    goto LABEL_18;
  }

  LODWORD(v9) = Apple80211Open(&v7->_apple80211Ref);
  if ((_DWORD)v9)
  {
    id v25 = WALogCategoryDefaultHandle();
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)objc_super v38 = "-[WAApple80211 initWithInterfaceName:]";
      *(_WORD *)&v38[8] = 1024;
      *(_DWORD *)&v38[10] = 154;
      __int16 v39 = 1024;
      LODWORD(v40) = v9;
      id v26 = "%{public}s::%d:Apple80211Open failed with: %d";
      v27 = v24;
      uint32_t v28 = 24;
LABEL_17:
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, v26, buf, v28);
    }

- (void)dealloc
{
  if (-[WAApple80211 apple80211Ref](self, "apple80211Ref")) {
    Apple80211Close(self->_apple80211Ref);
  }
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___WAApple80211;
  -[WAApple80211 dealloc](&v3, "dealloc");
}

- (BOOL)hasSoftAPInterfaceListed
{
  CFTypeRef cf = 0LL;
  int VirtualIfListCopy = Apple80211GetVirtualIfListCopy(self->_apple80211Ref, &cf, 0LL);
  if (VirtualIfListCopy)
  {
    id v9 = WALogCategoryDefaultHandle();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      dispatch_queue_t v18 = "-[WAApple80211 hasSoftAPInterfaceListed]";
      __int16 v19 = 1024;
      int v20 = 204;
      __int16 v21 = 1024;
      int v22 = VirtualIfListCopy;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Apple80211GetVirtualIfListCopy failed with: %d",  buf,  0x18u);
    }

    if (cf) {
      CFRelease(cf);
    }
    LOBYTE(v4) = 0;
  }

  else
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    objc_super v3 = (id)cf;
    int v4 = 0;
    id v5 = [v3 countByEnumeratingWithState:&v13 objects:v12 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(v3);
          }
          v4 |= [*(id *)(*((void *)&v13 + 1) + 8 * (void)i) containsString:@"ap"];
        }

        id v5 = [v3 countByEnumeratingWithState:&v13 objects:v12 count:16];
      }

      while (v5);
    }
  }

  return v4 & 1;
}

- (BOOL)hasNANInterfaceListed
{
  CFTypeRef cf = 0LL;
  int VirtualIfListCopy = Apple80211GetVirtualIfListCopy(self->_apple80211Ref, &cf, 0LL);
  if (VirtualIfListCopy)
  {
    id v9 = WALogCategoryDefaultHandle();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      dispatch_queue_t v18 = "-[WAApple80211 hasNANInterfaceListed]";
      __int16 v19 = 1024;
      int v20 = 229;
      __int16 v21 = 1024;
      int v22 = VirtualIfListCopy;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Apple80211GetVirtualIfListCopy failed with: %d",  buf,  0x18u);
    }

    if (cf) {
      CFRelease(cf);
    }
    LOBYTE(v4) = 0;
  }

  else
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    objc_super v3 = (id)cf;
    int v4 = 0;
    id v5 = [v3 countByEnumeratingWithState:&v13 objects:v12 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(v3);
          }
          v4 |= [*(id *)(*((void *)&v13 + 1) + 8 * (void)i) containsString:@"nan"];
        }

        id v5 = [v3 countByEnumeratingWithState:&v13 objects:v12 count:16];
      }

      while (v5);
    }
  }

  return v4 & 1;
}

- (BOOL)hasIRInterfaceListed
{
  CFTypeRef cf = 0LL;
  int VirtualIfListCopy = Apple80211GetVirtualIfListCopy(self->_apple80211Ref, &cf, 0LL);
  if (VirtualIfListCopy)
  {
    id v9 = WALogCategoryDefaultHandle();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      dispatch_queue_t v18 = "-[WAApple80211 hasIRInterfaceListed]";
      __int16 v19 = 1024;
      int v20 = 254;
      __int16 v21 = 1024;
      int v22 = VirtualIfListCopy;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Apple80211GetVirtualIfListCopy failed with: %d",  buf,  0x18u);
    }

    if (cf) {
      CFRelease(cf);
    }
    LOBYTE(v4) = 0;
  }

  else
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    objc_super v3 = (id)cf;
    int v4 = 0;
    id v5 = [v3 countByEnumeratingWithState:&v13 objects:v12 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(v3);
          }
          v4 |= [*(id *)(*((void *)&v13 + 1) + 8 * (void)i) containsString:@"ir"];
        }

        id v5 = [v3 countByEnumeratingWithState:&v13 objects:v12 count:16];
      }

      while (v5);
    }
  }

  return v4 & 1;
}

- (BOOL)hasAWDLInterfaceListed
{
  CFTypeRef cf = 0LL;
  int VirtualIfListCopy = Apple80211GetVirtualIfListCopy(self->_apple80211Ref, &cf, 0LL);
  if (VirtualIfListCopy)
  {
    id v9 = WALogCategoryDefaultHandle();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      dispatch_queue_t v18 = "-[WAApple80211 hasAWDLInterfaceListed]";
      __int16 v19 = 1024;
      int v20 = 279;
      __int16 v21 = 1024;
      int v22 = VirtualIfListCopy;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Apple80211GetVirtualIfListCopy failed with: %d",  buf,  0x18u);
    }

    if (cf) {
      CFRelease(cf);
    }
    LOBYTE(v4) = 0;
  }

  else
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    objc_super v3 = (id)cf;
    int v4 = 0;
    id v5 = [v3 countByEnumeratingWithState:&v13 objects:v12 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(v3);
          }
          v4 |= [*(id *)(*((void *)&v13 + 1) + 8 * (void)i) containsString:@"awdl"];
        }

        id v5 = [v3 countByEnumeratingWithState:&v13 objects:v12 count:16];
      }

      while (v5);
    }
  }

  return v4 & 1;
}

- (int)currentPHYMode
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  int v4 = 7;
  while (1)
  {
    int v5 = Apple80211Get(-[WAApple80211 apple80211Ref](self, "apple80211Ref"), 14LL, 0LL, v3, 8LL);
    int v6 = v5;
    if (v5 <= 15)
    {
      if (v5 != -3905) {
        break;
      }
    }

    else if (v5 != 61 && v5 != 16)
    {
      goto LABEL_12;
    }

    if (!--v4) {
      break;
    }
    usleep(0x7A120u);
  }

  if (!v5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"PHYMODE_ACTIVE"]);
    int v8 = [v7 intValue];
    goto LABEL_11;
  }

- (BOOL)grabAndSubmitFWTrapInfo
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (-[WAApple80211 apple80211Ref](self, "apple80211Ref"))
  {
    int v4 = 7;
    while (1)
    {
      int v5 = Apple80211Get(-[WAApple80211 apple80211Ref](self, "apple80211Ref"), 339LL, 0LL, v3, 8LL);
      int v6 = v5;
      if (v5 <= 15)
      {
        if (v5 != -3905) {
          break;
        }
      }

      else if (v5 != 61 && v5 != 16)
      {
        goto LABEL_22;
      }

      if (!--v4) {
        break;
      }
      usleep(0x7A120u);
    }

    if (v5)
    {
LABEL_22:
      id v28 = WALogCategoryDefaultHandle();
      int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_30;
      }
      int v32 = 136446722;
      id v33 = "-[WAApple80211 grabAndSubmitFWTrapInfo]";
      __int16 v34 = 1024;
      int v35 = 322;
      __int16 v36 = 1024;
      LODWORD(v37) = v6;
      id v25 = "%{public}s::%d:Apple80211Get(APPLE80211_IOC_TRAP_CRASHTRACER_MINI_DUMP) failed: %d";
      id v26 = v17;
      uint32_t v27 = 24;
      goto LABEL_24;
    }

    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:&off_1000DFFE8]);
    int v8 = v7;
    if (v7)
    {
      id v9 = v7;
      CCSubmitLogToCrashTracer((const char *)-[os_log_s bytes](v9, "bytes"), (int)-[os_log_s length](v9, "length"));
      id v10 = WALogCategoryDefaultHandle();
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      if (!os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEBUG))
      {
LABEL_15:

        __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:&off_1000E0000]);
        int v17 = v16;
        if (v8)
        {
          dispatch_queue_t v18 = v16;
          CCSubmitBinaryToCrashTracer((uint64_t)-[os_log_s bytes](v18, "bytes"), (int)-[os_log_s length](v18, "length"));
          id v19 = WALogCategoryDefaultHandle();
          int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            id v21 = -[os_log_s length](v18, "length");
            int v32 = 136446978;
            id v33 = "-[WAApple80211 grabAndSubmitFWTrapInfo]";
            __int16 v34 = 1024;
            int v35 = 334;
            __int16 v36 = 2048;
            id v37 = v21;
            __int16 v38 = 2112;
            __int16 v39 = v18;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:Did pass binary readable to CCSubmitBinaryToCrashTracer() of length(%ld): %@",  (uint8_t *)&v32,  0x26u);
          }

          BOOL v22 = 1;
          int v17 = v8;
          goto LABEL_19;
        }

        id v30 = WALogCategoryDefaultHandle();
        uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          int v32 = 136446466;
          id v33 = "-[WAApple80211 grabAndSubmitFWTrapInfo]";
          __int16 v34 = 1024;
          int v35 = 332;
          _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:No bainry tag represented in dictionary, skipping.",  (uint8_t *)&v32,  0x12u);
        }

        goto LABEL_30;
      }

      int v32 = 136446978;
      id v33 = "-[WAApple80211 grabAndSubmitFWTrapInfo]";
      __int16 v34 = 1024;
      int v35 = 328;
      __int16 v36 = 2048;
      id v37 = -[os_log_s length](v9, "length");
      __int16 v38 = 2112;
      __int16 v39 = v9;
      int v12 = "%{public}s::%d:Did pass human readable to CCSubmitLogToCrashTracer() of length(%ld): %@";
      __int128 v13 = (os_log_s *)v11;
      os_log_type_t v14 = OS_LOG_TYPE_DEBUG;
      uint32_t v15 = 38;
    }

    else
    {
      id v29 = WALogCategoryDefaultHandle();
      v11 = (void *)objc_claimAutoreleasedReturnValue(v29);
      if (!os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_15;
      }
      int v32 = 136446466;
      id v33 = "-[WAApple80211 grabAndSubmitFWTrapInfo]";
      __int16 v34 = 1024;
      int v35 = 326;
      int v12 = "%{public}s::%d:No human readable tag represented in dictionary, skipping.";
      __int128 v13 = (os_log_s *)v11;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      uint32_t v15 = 18;
    }

    _os_log_impl((void *)&_mh_execute_header, v13, v14, v12, (uint8_t *)&v32, v15);
    goto LABEL_15;
  }

  id v24 = WALogCategoryDefaultHandle();
  int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    int v32 = 136446466;
    id v33 = "-[WAApple80211 grabAndSubmitFWTrapInfo]";
    __int16 v34 = 1024;
    int v35 = 319;
    id v25 = "%{public}s::%d:Failure as Apple80211Ref is NULL";
    id v26 = v17;
    uint32_t v27 = 18;
LABEL_24:
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, v25, (uint8_t *)&v32, v27);
  }

- (BOOL)grabAndSubmitLqmMetrics
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (-[WAApple80211 apple80211Ref](self, "apple80211Ref"))
  {
    int v4 = 7;
    while (1)
    {
      int v5 = Apple80211Get(-[WAApple80211 apple80211Ref](self, "apple80211Ref"), 384LL, 0LL, v3, 8LL);
      int v6 = v5;
      if (v5 <= 15)
      {
        if (v5 != -3905) {
          break;
        }
      }

      else if (v5 != 61 && v5 != 16)
      {
        goto LABEL_18;
      }

      if (!--v4) {
        break;
      }
      usleep(0x7A120u);
    }

    if (v5)
    {
LABEL_18:
      id v15 = WALogCategoryDefaultHandle();
      int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      int v19 = 136446722;
      int v20 = "-[WAApple80211 grabAndSubmitLqmMetrics]";
      __int16 v21 = 1024;
      int v22 = 350;
      __int16 v23 = 1024;
      LODWORD(v24) = v6;
      os_log_type_t v14 = "%{public}s::%d:Apple80211Get(APPLE80211_IOC_LQM_METRICS_CRASHTRACER_DATA) failed: %d";
      __int16 v16 = v8;
      uint32_t v17 = 24;
      goto LABEL_23;
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:&off_1000E0018]);
    if (v7)
    {
      int v8 = v7;
      CCSubmitLqmMetricsTLVBlockToCrashTracer( (uint64_t)-[os_log_s bytes](v8, "bytes"),  (int)-[os_log_s length](v8, "length"));
      id v9 = WALogCategoryDefaultHandle();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 136446978;
        int v20 = "-[WAApple80211 grabAndSubmitLqmMetrics]";
        __int16 v21 = 1024;
        int v22 = 355;
        __int16 v23 = 2048;
        id v24 = -[os_log_s length](v8, "length");
        __int16 v25 = 2112;
        id v26 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:CCSubmitLqmMetricsTLVBlockToCrashTracer() length(%ld): %@",  (uint8_t *)&v19,  0x26u);
      }

      BOOL v11 = 1;
      goto LABEL_15;
    }

    id v18 = WALogCategoryDefaultHandle();
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    int v19 = 136446466;
    int v20 = "-[WAApple80211 grabAndSubmitLqmMetrics]";
    __int16 v21 = 1024;
    int v22 = 353;
    os_log_type_t v14 = "%{public}s::%d:No LQM bainry tag represented in dictionary, skipping.";
  }

  else
  {
    id v13 = WALogCategoryDefaultHandle();
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    int v19 = 136446466;
    int v20 = "-[WAApple80211 grabAndSubmitLqmMetrics]";
    __int16 v21 = 1024;
    int v22 = 347;
    os_log_type_t v14 = "%{public}s::%d:Failure as Apple80211Ref is NULL";
  }

  __int16 v16 = v8;
  uint32_t v17 = 18;
LABEL_23:
  _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v19, v17);
LABEL_24:
  BOOL v11 = 0;
LABEL_15:

  return v11;
}

- (void)submitLqmMetrics:(id)a3
{
  id v3 = a3;
  CCSubmitLqmMetricsTLVBlockToCrashTracer((uint64_t)[v3 bytes], (int)objc_msgSend(v3, "length"));
  id v4 = WALogCategoryDefaultHandle();
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446978;
    id v7 = "-[WAApple80211 submitLqmMetrics:]";
    __int16 v8 = 1024;
    int v9 = 365;
    __int16 v10 = 2048;
    id v11 = [v3 length];
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:CCSubmitLqmMetricsTLVBlockToCrashTracer() length(%ld): %@",  (uint8_t *)&v6,  0x26u);
  }
}

- (void)_storeAttemptedRecovery:(id)a3 reason:(id)a4 fromSSID:(id)a5 fromBSSID:(id)a6 commandResult:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  id v22 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v28 = *((void *)&WADeviceAnalyticsRecoveryInfo + 1);
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  __int128 v29 = *((_OWORD *)&WADeviceAnalyticsRecoveryInfo + 2);
  v31[0] = v16;
  v31[1] = v22;
  v31[2] = v12;
  uint64_t v30 = *((void *)&WADeviceAnalyticsRecoveryInfo + 6);
  uint32_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v7));
  v31[3] = v17;
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v31,  &v28,  4LL));
  -[NSMutableDictionary addEntriesFromDictionary:](v15, "addEntriesFromDictionary:", v18);

  if (v14)
  {
    uint64_t v26 = *((void *)&WADeviceAnalyticsRecoveryInfo + 2);
    id v27 = v14;
    int v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v27,  &v26,  1LL));
    -[NSMutableDictionary addEntriesFromDictionary:](v15, "addEntriesFromDictionary:", v19);
  }

  if (v13)
  {
    uint64_t v24 = *((void *)&WADeviceAnalyticsRecoveryInfo + 3);
    id v25 = v13;
    int v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));
    -[NSMutableDictionary addEntriesFromDictionary:](v15, "addEntriesFromDictionary:", v20);
  }

  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(-[WAApple80211 dbDelegate](self, "dbDelegate", v22));
  [v21 processMetricDictOffEngine:WADeviceAnalyticsRecoveryInfo data:v15];
}

- (BOOL)triggerFastDpsReset
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v32 = 0LL;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000LL;
  int v35 = sub_10002E3E8;
  __int16 v36 = sub_10002E3F8;
  id v37 = 0LL;
  uint64_t v26 = 0LL;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  __int128 v29 = sub_10002E3E8;
  uint64_t v30 = sub_10002E3F8;
  id v31 = 0LL;
  if (-[WAApple80211 isAssociated](self, "isAssociated"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[WAApple80211 currentBSSIDandSSID](self, "currentBSSIDandSSID"));
    int v5 = v4;
    if (v4)
    {
      int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"bssid"]);
      BOOL v7 = v6 == 0LL;

      if (!v7)
      {
        uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"bssid"]);
        int v9 = (void *)v33[5];
        v33[5] = v8;
      }

      __int16 v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"ssid"]);
      BOOL v11 = v10 == 0LL;

      if (!v11)
      {
        uint64_t v12 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"ssid"]);
        id v13 = (void *)v27[5];
        v27[5] = v12;
      }
    }
  }

  else
  {
    id v14 = WALogCategoryDefaultHandle();
    int v5 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      __int16 v39 = "-[WAApple80211 triggerFastDpsReset]";
      __int16 v40 = 1024;
      int v41 = 396;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v5,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Error Apple80211Set(APPLE80211_IOC_RESET_CHIP) for triggerFastDpsReset when not associated",  buf,  0x12u);
    }
  }

  [v3 setValue:@"DPSQuickTriggeredChipReset" forKeyPath:@"CHIP_RESET_TRIGGER"];
  int v15 = 7;
  while (1)
  {
    int v16 = Apple80211Set(-[WAApple80211 apple80211Ref](self, "apple80211Ref"), 239LL, 0LL, v3, 8LL);
    int v17 = v16;
    if (v16 != -3905 && v16 != 61 && v16 != 16) {
      break;
    }
    if (!--v15) {
      break;
    }
    usleep(0x7A120u);
  }

  if (v16)
  {
    id v20 = WALogCategoryDefaultHandle();
    __int16 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v39 = "-[WAApple80211 triggerFastDpsReset]";
      __int16 v40 = 1024;
      int v41 = 411;
      __int16 v42 = 1024;
      int v43 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Apple80211Set(APPLE80211_IOC_RESET_CHIP) failed: %d",  buf,  0x18u);
    }

    id v22 = WALogCategoryDefaultHandle();
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v39) = v17;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_FAULT,  "Failed to triggerFastDpsReset err %d",  buf,  8u);
    }
  }

  analyticsMOCQueue = (dispatch_queue_s *)self->analyticsMOCQueue;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10002E400;
  v24[3] = &unk_1000CCE90;
  v24[4] = self;
  v24[5] = &v26;
  v24[6] = &v32;
  int v25 = v17;
  dispatch_async(analyticsMOCQueue, v24);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v17 == 0;
}

- (BOOL)triggerDpsReset:(id)a3
{
  id v4 = (char *)a3;
  int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v38 = 0LL;
  __int16 v39 = &v38;
  uint64_t v40 = 0x3032000000LL;
  int v41 = sub_10002E3E8;
  __int16 v42 = sub_10002E3F8;
  id v43 = 0LL;
  uint64_t v32 = 0LL;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000LL;
  int v35 = sub_10002E3E8;
  __int16 v36 = sub_10002E3F8;
  id v37 = 0LL;
  if (-[WAApple80211 isAssociated](self, "isAssociated"))
  {
    int v6 = (void *)objc_claimAutoreleasedReturnValue(-[WAApple80211 currentBSSIDandSSID](self, "currentBSSIDandSSID"));
    BOOL v7 = v6;
    if (v6)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"bssid"]);
      BOOL v9 = v8 == 0LL;

      if (!v9)
      {
        uint64_t v10 = objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"bssid"]);
        BOOL v11 = (void *)v39[5];
        v39[5] = v10;
      }

      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"ssid"]);
      BOOL v13 = v12 == 0LL;

      if (!v13)
      {
        uint64_t v14 = objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"ssid"]);
        int v15 = (void *)v33[5];
        v33[5] = v14;
      }
    }
  }

  else
  {
    id v16 = WALogCategoryDefaultHandle();
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      __int16 v45 = "-[WAApple80211 triggerDpsReset:]";
      __int16 v46 = 1024;
      int v47 = 436;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Error Apple80211Set(APPLE80211_IOC_RESET_CHIP) for triggerFastDpsReset when not associated",  buf,  0x12u);
    }
  }

  [v5 setValue:v4 forKeyPath:@"CHIP_RESET_TRIGGER"];
  int v17 = 7;
  while (1)
  {
    int v18 = Apple80211Set(-[WAApple80211 apple80211Ref](self, "apple80211Ref"), 239LL, 0LL, v5, 8LL);
    int v19 = v18;
    if (v18 != -3905 && v18 != 61 && v18 != 16) {
      break;
    }
    if (!--v17) {
      break;
    }
    usleep(0x7A120u);
  }

  if (v18)
  {
    id v23 = WALogCategoryDefaultHandle();
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v45 = "-[WAApple80211 triggerDpsReset:]";
      __int16 v46 = 1024;
      int v47 = 451;
      __int16 v48 = 1024;
      int v49 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Apple80211Set(APPLE80211_IOC_RESET_CHIP) failed: %d",  buf,  0x18u);
    }

    id v25 = WALogCategoryDefaultHandle();
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v45 = v4;
      __int16 v46 = 1024;
      int v47 = v19;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_FAULT,  "Failed to triggerDpsReset: %@, err %d",  buf,  0x12u);
    }
  }

  analyticsMOCQueue = (dispatch_queue_s *)self->analyticsMOCQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002E854;
  block[3] = &unk_1000CCEB8;
  block[4] = self;
  uint64_t v28 = v4;
  __int128 v29 = &v32;
  uint64_t v30 = &v38;
  int v31 = v19;
  __int16 v21 = v4;
  dispatch_async(analyticsMOCQueue, block);

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v19 == 0;
}

- (BOOL)triggerReassociation:(id)a3
{
  id v4 = (char *)a3;
  int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v38 = 0LL;
  __int16 v39 = &v38;
  uint64_t v40 = 0x3032000000LL;
  int v41 = sub_10002E3E8;
  __int16 v42 = sub_10002E3F8;
  id v43 = 0LL;
  uint64_t v32 = 0LL;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000LL;
  int v35 = sub_10002E3E8;
  __int16 v36 = sub_10002E3F8;
  id v37 = 0LL;
  if (-[WAApple80211 isAssociated](self, "isAssociated"))
  {
    int v6 = (void *)objc_claimAutoreleasedReturnValue(-[WAApple80211 currentBSSIDandSSID](self, "currentBSSIDandSSID"));
    BOOL v7 = v6;
    if (v6)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"bssid"]);
      BOOL v9 = v8 == 0LL;

      if (!v9)
      {
        uint64_t v10 = objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"bssid"]);
        BOOL v11 = (void *)v39[5];
        v39[5] = v10;
      }

      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"ssid"]);
      BOOL v13 = v12 == 0LL;

      if (!v13)
      {
        uint64_t v14 = objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"ssid"]);
        int v15 = (void *)v33[5];
        v33[5] = v14;
      }
    }
  }

  else
  {
    id v16 = WALogCategoryDefaultHandle();
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      __int16 v45 = "-[WAApple80211 triggerReassociation:]";
      __int16 v46 = 1024;
      int v47 = 475;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Error Apple80211Set(APPLE80211_IOC_RESET_CHIP) for triggerFastDpsReset when not associated",  buf,  0x12u);
    }
  }

  [v5 setValue:v4 forKeyPath:@"REASSOC_CC_TRIGGER"];
  int v17 = 7;
  while (1)
  {
    int v18 = Apple80211Set(-[WAApple80211 apple80211Ref](self, "apple80211Ref"), 399LL, 0LL, v5, 8LL);
    int v19 = v18;
    if (v18 != -3905 && v18 != 61 && v18 != 16) {
      break;
    }
    if (!--v17) {
      break;
    }
    usleep(0x7A120u);
  }

  if (v18)
  {
    id v23 = WALogCategoryDefaultHandle();
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v45 = "-[WAApple80211 triggerReassociation:]";
      __int16 v46 = 1024;
      int v47 = 490;
      __int16 v48 = 1024;
      int v49 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Apple80211Set(APPLE80211_IOC_REASSOCIATE_WITH_CORECAPTURE) failed: %d",  buf,  0x18u);
    }

    id v25 = WALogCategoryDefaultHandle();
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v45 = v4;
      __int16 v46 = 1024;
      int v47 = v19;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_FAULT,  "Failed to triggerReassociation: %@, err %d",  buf,  0x12u);
    }
  }

  analyticsMOCQueue = (dispatch_queue_s *)self->analyticsMOCQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002ECA0;
  block[3] = &unk_1000CCEB8;
  block[4] = self;
  uint64_t v28 = v4;
  __int128 v29 = &v32;
  uint64_t v30 = &v38;
  int v31 = v19;
  __int16 v21 = v4;
  dispatch_async(analyticsMOCQueue, block);

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v19 == 0;
}

- (BOOL)currentChannelInfo:(apple80211_channel *)a3
{
  int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  0LL));
  int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  BOOL v7 = v6;
  if (self->_lastDateChannelQueried)
  {
    objc_msgSend(v6, "timeIntervalSinceDate:");
    if (v8 <= 2.0)
    {
      id v14 = WALogCategoryDefaultHandle();
      int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        int v23 = 136446466;
        uint64_t v24 = "-[WAApple80211 currentChannelInfo:]";
        __int16 v25 = 1024;
        int v26 = 514;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:Using Cached instead of new query",  (uint8_t *)&v23,  0x12u);
      }

      uint64_t v16 = qword_1000ECF68;
      a3->var2 = dword_1000ECF70;
      *(void *)&a3->var0 = v16;
LABEL_16:
      BOOL v17 = 1;
      goto LABEL_17;
    }
  }

  objc_storeStrong((id *)&self->_lastDateChannelQueried, v7);
  int v9 = 7;
  while (1)
  {
    int v10 = Apple80211Get(-[WAApple80211 apple80211Ref](self, "apple80211Ref"), 4LL, 0LL, v5, 8LL);
    if (v10 > 15) {
      break;
    }
    if (v10 != -3905) {
      goto LABEL_11;
    }
LABEL_9:
    if (!--v9)
    {
LABEL_11:
      if (!v10)
      {
        BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"CHANNEL"]);
        a3->var1 = [v11 unsignedIntValue];

        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"CHANNEL_FLAGS"]);
        a3->var2 = [v12 unsignedIntValue];

        uint64_t v13 = *(void *)&a3->var0;
        dword_1000ECF70 = a3->var2;
        qword_1000ECF68 = v13;
        goto LABEL_16;
      }

      goto LABEL_22;
    }

    usleep(0x7A120u);
  }

  if (v10 == 16 || v10 == 61) {
    goto LABEL_9;
  }
  if (v10 == 82)
  {
    id v19 = WALogCategoryDefaultHandle();
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 136446466;
      uint64_t v24 = "-[WAApple80211 currentChannelInfo:]";
      __int16 v25 = 1024;
      int v26 = 534;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Failed to call APPLE80211_IOC_CHANNEL due to EPWROFF",  (uint8_t *)&v23,  0x12u);
    }

    goto LABEL_24;
  }

- (id)currentBSSIDandSSID
{
  id v3 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", 0LL));
  int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](&OBJC_CLASS___NSMutableData, "dataWithCapacity:", 32LL));
  int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  BOOL v7 = v6;
  p_lastDateBSSIDQueried = &self->_lastDateBSSIDQueried;
  if (!self->_lastDateBSSIDQueried || (objc_msgSend(v6, "timeIntervalSinceDate:"), v9 > 2.0))
  {
    objc_storeStrong((id *)&self->_lastDateBSSIDQueried, v7);
    int v10 = 7;
    while (1)
    {
      int v11 = Apple80211Get(-[WAApple80211 apple80211Ref](self, "apple80211Ref"), 9LL, 0LL, v4, 8LL);
      int v12 = v11;
      if (v11 <= 15)
      {
        if (v11 != -3905) {
          break;
        }
      }

      else if (v11 != 61 && v11 != 16)
      {
        goto LABEL_39;
      }

      if (!--v10) {
        break;
      }
      usleep(0x7A120u);
    }

    if (!v11)
    {
      if (!v4)
      {
        id v26 = WALogCategoryDefaultHandle();
        id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          int v35 = 136446722;
          __int16 v36 = "-[WAApple80211 currentBSSIDandSSID]";
          __int16 v37 = 1024;
          int v38 = 564;
          __int16 v39 = 2112;
          uint64_t v40 = 0LL;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Failed to find APPLE80211KEY_BSSID in currentBSSID curBSSID %@",  (uint8_t *)&v35,  0x1Cu);
        }

        id v28 = WALogCategoryDefaultHandle();
        __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        {
          int v35 = 138412290;
          __int16 v36 = 0LL;
          _os_log_fault_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_FAULT,  "Failed to find APPLE80211KEY_BSSID in currentBSSID curBSSID %@",  (uint8_t *)&v35,  0xCu);
        }

- (id)getChipSet
{
  id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", 0LL));
  int v3 = 7;
  while (1)
  {
    int v4 = Apple80211Get(-[WAApple80211 apple80211Ref](self, "apple80211Ref"), 44LL, 0LL, v26, 8LL);
    int v5 = v4;
    if (v4 <= 15)
    {
      if (v4 != -3905) {
        break;
      }
    }

    else if (v4 != 61 && v4 != 16)
    {
      goto LABEL_10;
    }

    if (!--v3) {
      break;
    }
    usleep(0x7A120u);
  }

  if (v4)
  {
LABEL_10:
    id v6 = WALogCategoryDefaultHandle();
    id obj = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(obj, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v31) = v5;
      _os_log_fault_impl( (void *)&_mh_execute_header,  obj,  OS_LOG_TYPE_FAULT,  "Failed to get APPLE80211_IOC_HARDWARE_VERSION error %d",  buf,  8u);
    }

    BOOL v7 = &stru_1000CF610;
    goto LABEL_32;
  }

  double v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet newlineCharacterSet](&OBJC_CLASS___NSCharacterSet, "newlineCharacterSet"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v26 componentsSeparatedByCharactersInSet:v8]);

  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id obj = v9;
  id v10 = -[os_log_s countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v37,  v36,  16LL);
  if (v10)
  {
    id v28 = &stru_1000CF610;
    uint64_t v11 = *(void *)v38;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v38 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
        id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet"));
        int v15 = (void *)objc_claimAutoreleasedReturnValue([v13 componentsSeparatedByCharactersInSet:v14]);

        if ([v13 rangeOfString:@"chipnum"] != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndex:1]);
          BOOL v17 = (__CFString *)objc_claimAutoreleasedReturnValue([v16 substringFromIndex:2]);

          int v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"));
          if (-[__CFString rangeOfCharacterFromSet:](v17, "rangeOfCharacterFromSet:", v18) == (id)0x7FFFFFFFFFFFFFFFLL)
          {
            id v19 = WALogCategoryDefaultHandle();
            id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446722;
              int v31 = "-[WAApple80211 getChipSet]";
              __int16 v32 = 1024;
              int v33 = 614;
              __int16 v34 = 2112;
              int v35 = v17;
              _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Chipset number is %@",  buf,  0x1Cu);
            }

            uint64_t v21 = v17;
            uint64_t v22 = v28;
          }

          else
          {
            uint64_t v22 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](&OBJC_CLASS___NSScanner, "scannerWithString:", v17));
            -[__CFString scanHexInt:](v22, "scanHexInt:", &v29);
            uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d",  v29));
            id v23 = WALogCategoryDefaultHandle();
            uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446722;
              int v31 = "-[WAApple80211 getChipSet]";
              __int16 v32 = 1024;
              int v33 = 611;
              __int16 v34 = 2112;
              int v35 = v21;
              _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Chipset number is %@",  buf,  0x1Cu);
            }
          }

          id v28 = v21;
        }
      }

      id v10 = -[os_log_s countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v37,  v36,  16LL);
    }

    while (v10);
  }

  else
  {
    id v28 = &stru_1000CF610;
  }

  BOOL v7 = v28;
LABEL_32:

  return v7;
}

- (BOOL)everAssociated
{
  int v3 = (char *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", 0LL));
  if (!v3)
  {
    id v15 = WALogCategoryDefaultHandle();
    int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136446466;
      id v19 = "-[WAApple80211 everAssociated]";
      __int16 v20 = 1024;
      int v21 = 625;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Failed to make curBSSID",  (uint8_t *)&v18,  0x12u);
    }

    int v7 = 0;
LABEL_26:
    id v17 = WALogCategoryDefaultHandle();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136446722;
      id v19 = "-[WAApple80211 everAssociated]";
      __int16 v20 = 1024;
      int v21 = 646;
      __int16 v22 = 1024;
      LODWORD(v23) = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Failed to currentBSSID error %d",  (uint8_t *)&v18,  0x18u);
    }

- (BOOL)isAssociated
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", 0LL));
  BOOL v4 = v3 != 0LL;
  if (v3)
  {
    int v5 = 7;
    while (1)
    {
      int v6 = Apple80211Get(-[WAApple80211 apple80211Ref](self, "apple80211Ref"), 9LL, 0LL, v3, 8LL);
      if (v6 <= 15)
      {
        if (v6 != -3905) {
          break;
        }
      }

      else if (v6 != 61 && v6 != 16)
      {
        goto LABEL_16;
      }

      if (!--v5) {
        break;
      }
      usleep(0x7A120u);
    }

    if (v6 || ![v3 length])
    {
LABEL_16:
      BOOL v4 = 0;
      goto LABEL_17;
    }

    byte_1000ECF40 = 1;
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v3));
    id v8 = (void *)qword_1000ECF48;
    qword_1000ECF48 = v7;

    id v9 = WALogCategoryDefaultHandle();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_15;
    }
    int v17 = 136446722;
    int v18 = "-[WAApple80211 isAssociated]";
    __int16 v19 = 1024;
    int v20 = 664;
    __int16 v21 = 2112;
    __int16 v22 = v3;
    uint64_t v11 = "%{public}s::%d:everAssociated curBSSID %@";
    id v12 = v10;
    os_log_type_t v13 = OS_LOG_TYPE_DEBUG;
    uint32_t v14 = 28;
  }

  else
  {
    id v16 = WALogCategoryDefaultHandle();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    int v17 = 136446466;
    int v18 = "-[WAApple80211 isAssociated]";
    __int16 v19 = 1024;
    int v20 = 655;
    uint64_t v11 = "%{public}s::%d:Failed to make curBSSID";
    id v12 = v10;
    os_log_type_t v13 = OS_LOG_TYPE_ERROR;
    uint32_t v14 = 18;
  }

  _os_log_impl((void *)&_mh_execute_header, v12, v13, v11, (uint8_t *)&v17, v14);
LABEL_15:

LABEL_17:
  return v4;
}

- (BOOL)isAXAssociatoin
{
  int v3 = (char *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  0LL));
  if (!v3)
  {
    id v22 = WALogCategoryDefaultHandle();
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int v25 = 136446466;
      id v26 = "-[WAApple80211 isAXAssociatoin]";
      __int16 v27 = 1024;
      int v28 = 682;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Failed to make dict",  (uint8_t *)&v25,  0x12u);
    }

    int v6 = 0;
LABEL_29:
    id v24 = WALogCategoryDefaultHandle();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    int v25 = 136446722;
    id v26 = "-[WAApple80211 isAXAssociatoin]";
    __int16 v27 = 1024;
    int v28 = 705;
    __int16 v29 = 1024;
    LODWORD(v30) = v6;
    int v18 = "%{public}s::%d:Failed to isAXAssociatoin error %d";
    __int16 v19 = v11;
    os_log_type_t v20 = OS_LOG_TYPE_ERROR;
    uint32_t v21 = 24;
    goto LABEL_25;
  }

  int v4 = 7;
  while (1)
  {
    int v5 = Apple80211Get(-[WAApple80211 apple80211Ref](self, "apple80211Ref"), 14LL, 0LL, v3, 8LL);
    int v6 = v5;
    if (v5 <= 15)
    {
      if (v5 != -3905) {
        break;
      }
    }

    else if (v5 != 61 && v5 != 16)
    {
      goto LABEL_29;
    }

    if (!--v4) {
      break;
    }
    usleep(0x7A120u);
  }

  if (v5) {
    goto LABEL_29;
  }
  if (![v3 count]
    || (uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"PHYMODE_ACTIVE"]),
        v7,
        !v7))
  {
    id v14 = WALogCategoryDefaultHandle();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v25 = 136446722;
      id v26 = "-[WAApple80211 isAXAssociatoin]";
      __int16 v27 = 1024;
      int v28 = 697;
      __int16 v29 = 2112;
      id v30 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Failed to find APPLE80211KEY_PHYMODE_ACTIVE in APPLE80211_IOC_PHY_MODE dict %@",  (uint8_t *)&v25,  0x1Cu);
    }

    id v16 = WALogCategoryDefaultHandle();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      int v25 = 138412290;
      id v26 = v3;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_FAULT,  "Failed to find APPLE80211KEY_PHYMODE_ACTIVE in APPLE80211_IOC_PHY_MODE dict %@",  (uint8_t *)&v25,  0xCu);
    }

    goto LABEL_21;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"PHYMODE_ACTIVE"]);
  unsigned int v9 = [v8 unsignedIntValue];

  id v10 = WALogCategoryDefaultHandle();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v9 != 256)
  {
    if (!v12)
    {
LABEL_21:
      BOOL v13 = 0;
      goto LABEL_22;
    }

    int v25 = 136446466;
    id v26 = "-[WAApple80211 isAXAssociatoin]";
    __int16 v27 = 1024;
    int v28 = 692;
    int v18 = "%{public}s::%d:PHYMODE is not APPLE80211_MODE_11AX";
    __int16 v19 = v11;
    os_log_type_t v20 = OS_LOG_TYPE_DEBUG;
    uint32_t v21 = 18;
LABEL_25:
    _os_log_impl((void *)&_mh_execute_header, v19, v20, v18, (uint8_t *)&v25, v21);
    goto LABEL_21;
  }

  if (v12)
  {
    int v25 = 136446466;
    id v26 = "-[WAApple80211 isAXAssociatoin]";
    __int16 v27 = 1024;
    int v28 = 689;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:PHYMODE is APPLE80211_MODE_11AX",  (uint8_t *)&v25,  0x12u);
  }

  BOOL v13 = 1;
LABEL_22:

  return v13;
}

- (unint64_t)getPhyMode
{
  int v3 = (char *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  0LL));
  if (!v3)
  {
    id v15 = WALogCategoryDefaultHandle();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136446466;
      __int16 v19 = "-[WAApple80211 getPhyMode]";
      __int16 v20 = 1024;
      int v21 = 715;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Failed to make dict",  (uint8_t *)&v18,  0x12u);
    }

    int v6 = 0;
LABEL_23:
    id v17 = WALogCategoryDefaultHandle();
    BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136446722;
      __int16 v19 = "-[WAApple80211 getPhyMode]";
      __int16 v20 = 1024;
      int v21 = 732;
      __int16 v22 = 1024;
      LODWORD(v23) = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Failed to isAXAssociatoin error %d",  (uint8_t *)&v18,  0x18u);
    }

- (id)getIOReportLegendItemsMatching:(id *)a3 retErr:(char *)a4
{
  CFStringRef errorString = 0LL;
  if (qword_1000ECF58 != -1) {
    dispatch_once(&qword_1000ECF58, &stru_1000CCED8);
  }
  uint64_t v7 = qword_1000ECF60;
  bzero((void *)qword_1000ECF60, 0x3988uLL);
  if (a3->var0) {
    snprintf((char *)(v7 + 8), 0x30uLL, "%s", (const char *)[a3->var0 UTF8String]);
  }
  id var1 = a3->var1;
  if (var1) {
    snprintf((char *)(qword_1000ECF60 + 56), 0x30uLL, "%s", (const char *)[var1 UTF8String]);
  }
  id var2 = a3->var2;
  if (var2) {
    snprintf((char *)(qword_1000ECF60 + 104), 0x30uLL, "%s", (const char *)[var2 UTF8String]);
  }
  id var3 = a3->var3;
  if (var3) {
    snprintf((char *)(qword_1000ECF60 + 152), 0x30uLL, "%s", (const char *)[var3 UTF8String]);
  }
  id var4 = a3->var4;
  if (var4) {
    snprintf((char *)(qword_1000ECF60 + 200), 0x30uLL, "%s", (const char *)[var4 UTF8String]);
  }
  id var5 = a3->var5;
  if (var5) {
    snprintf((char *)(qword_1000ECF60 + 248), 0x30uLL, "%s", (const char *)[var5 UTF8String]);
  }
  id var6 = a3->var6;
  if (var6) {
    snprintf((char *)(qword_1000ECF60 + 296), 0x30uLL, "%s", (const char *)[var6 UTF8String]);
  }
  id var7 = a3->var7;
  if (var7) {
    snprintf((char *)(qword_1000ECF60 + 344), 0x30uLL, "%s", (const char *)[var7 UTF8String]);
  }
  for (int i = 6; ; --i)
  {
    id v16 = -[WAApple80211 apple80211Ref](self, "apple80211Ref");
    int v17 = Apple80211Get(v16, 421LL, 0LL, qword_1000ECF60, 14728LL);
    int v18 = v17;
    if (v17 < 0) {
      break;
    }
    if (v17 != 16 && v17 != 61)
    {
LABEL_28:
      if (v17) {
        goto LABEL_49;
      }
      size_t v19 = *(unsigned int *)(qword_1000ECF60 + 4);
      if ((_DWORD)v19)
      {
        __int16 v20 = (void *)IOCFUnserializeWithSize( (const char *)(qword_1000ECF60 + 392),  v19,  kCFAllocatorDefault,  0LL,  &errorString);
        if (v20) {
          BOOL v21 = 1;
        }
        else {
          BOOL v21 = errorString == 0LL;
        }
        if (v21)
        {
          if (v20)
          {
            id v22 = v20;
            *a4 = 0;

            return v22;
          }
        }

        else
        {
          id v43 = WALogCategoryDefaultHandle();
          uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            int v46 = *(_DWORD *)(qword_1000ECF60 + 4);
            *(_DWORD *)buf = 136446978;
            v58 = "-[WAApple80211 getIOReportLegendItemsMatching:retErr:]";
            __int16 v59 = 1024;
            *(_DWORD *)v60 = 811;
            *(_WORD *)&v60[4] = 1024;
            *(_DWORD *)&v60[6] = v46;
            *(_WORD *)&v60[10] = 2112;
            *(void *)&v60[12] = errorString;
            _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:IOCFUnserializeWithSize error len %u, errorString: %@, exiting\n",  buf,  0x22u);
          }
        }

        id v47 = WALogCategoryDefaultHandle();
        __int16 v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          int v48 = *(_DWORD *)(qword_1000ECF60 + 4);
          *(_DWORD *)buf = 136446978;
          v58 = "-[WAApple80211 getIOReportLegendItemsMatching:retErr:]";
          __int16 v59 = 1024;
          *(_DWORD *)v60 = 814;
          *(_WORD *)&v60[4] = 1024;
          *(_DWORD *)&v60[6] = v48;
          *(_WORD *)&v60[10] = 2112;
          *(void *)&v60[12] = errorString;
          int v49 = "%{public}s::%d:IOCFUnserializeWithSize error len %u, errorString: %@, exiting\n";
          v50 = v34;
          uint32_t v51 = 34;
          goto LABEL_46;
        }
      }

      else
      {
        id v55 = WALogCategoryDefaultHandle();
        __int16 v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v58 = "-[WAApple80211 getIOReportLegendItemsMatching:retErr:]";
          __int16 v59 = 1024;
          *(_DWORD *)v60 = 805;
          int v49 = "%{public}s::%d:No APPLE80211KEY_IOR_RESPONSE";
          v50 = v34;
          uint32_t v51 = 18;
LABEL_46:
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, v49, buf, v51);
        }
      }

      int v18 = 0;
      goto LABEL_48;
    }

- (unsigned)getIOReportingService
{
  unsigned int v8 = 0;
  for (int i = 6; ; --i)
  {
    int IOReportingService = Apple80211GetIOReportingService(&v8, a2);
    int v4 = IOReportingService;
    if (IOReportingService <= 15)
    {
      if (IOReportingService != -3905) {
        break;
      }
    }

    else if (IOReportingService != 61 && IOReportingService != 16)
    {
      goto LABEL_11;
    }

    if (!i) {
      break;
    }
    usleep(0x7A120u);
  }

  if (!IOReportingService) {
    return v8;
  }
LABEL_11:
  id v6 = WALogCategoryDefaultHandle();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    id v10 = "-[WAApple80211 getIOReportingService]";
    __int16 v11 = 1024;
    int v12 = 841;
    __int16 v13 = 1024;
    int v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Failed Apple80211GetIOReportingService error %d",  buf,  0x18u);
  }

  return 0;
}

- (id)getIOReportingClassPath
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", path));
  if (!v2)
  {
    id v4 = WALogCategoryDefaultHandle();
    int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446466;
      uint64_t v7 = "-[WAApple80211 getIOReportingClassPath]";
      __int16 v8 = 1024;
      int v9 = 854;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:failed to alloc IORegistryEntryGetPath NSString",  (uint8_t *)&v6,  0x12u);
    }
  }

  return v2;
}

- (id)getIOReportingDriverName
{
  id v2 = (void *)IOReportCopyDriverName(-[WAApple80211 getIOReportingService](self, "getIOReportingService"));
  if (!v2)
  {
    id v4 = WALogCategoryDefaultHandle();
    int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446466;
      uint64_t v7 = "-[WAApple80211 getIOReportingDriverName]";
      __int16 v8 = 1024;
      int v9 = 868;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Failed to driver name through IOReportCopyDriverName",  (uint8_t *)&v6,  0x12u);
    }
  }

  return v2;
}

- (unint64_t)getIOReportingDriverID
{
  uint64_t entryID = 0LL;
  if (!IORegistryEntryGetRegistryEntryID( -[WAApple80211 getIOReportingService](self, "getIOReportingService"),  &entryID)) {
    return entryID;
  }
  id v3 = WALogCategoryDefaultHandle();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    uint64_t v7 = "-[WAApple80211 getIOReportingDriverID]";
    __int16 v8 = 1024;
    int v9 = 878;
    __int16 v10 = 2048;
    uint64_t v11 = entryID;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Failed to convert IORegistryEntryGetRegistryEntryID %llx",  buf,  0x1Cu);
  }

  return 0LL;
}

- (int64_t)getDriverType
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[WAApple80211 getIOReportingDriverName](self, "getIOReportingDriverName"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[WAApple80211 getIOReportingClassPath](self, "getIOReportingClassPath"));
  if ([v3 containsString:@"ACIWiFiDriver"])
  {
    int64_t v5 = 2LL;
  }

  else if (([v3 containsString:@"BCM"] & 1) != 0 {
         || ([v3 containsString:@"IO80211ReporterProxy"] & 1) != 0)
  }
  {
    int64_t v5 = 1LL;
  }

  else
  {
    id v6 = WALogCategoryDefaultHandle();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136446978;
      __int16 v10 = "-[WAApple80211 getDriverType]";
      __int16 v11 = 1024;
      int v12 = 901;
      __int16 v13 = 2112;
      int v14 = v3;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Failed to determine WLAN driver type: drvName %@ drvPath %@",  (uint8_t *)&v9,  0x26u);
    }

    int64_t v5 = 0LL;
  }

  return v5;
}

- (WADeviceDBDelegate)dbDelegate
{
  return (WADeviceDBDelegate *)objc_loadWeakRetained((id *)&self->_dbDelegate);
}

- (void)setDbDelegate:(id)a3
{
}

- (_Apple80211)apple80211Ref
{
  return self->_apple80211Ref;
}

- (void)setApple80211Ref:(_Apple80211 *)a3
{
  self->_apple80211Ref = a3;
}

- (NSString)ifName
{
  return self->_ifName;
}

- (void)setIfName:(id)a3
{
}

- (NSDate)lastDateChannelQueried
{
  return self->_lastDateChannelQueried;
}

- (void)setLastDateChannelQueried:(id)a3
{
}

- (NSDate)lastDateBSSIDQueried
{
  return self->_lastDateBSSIDQueried;
}

- (void)setLastDateBSSIDQueried:(id)a3
{
}

- (WAMessage)dummyWAMessage
{
  return (WAMessage *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setDummyWAMessage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end