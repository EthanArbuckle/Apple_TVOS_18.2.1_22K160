@interface SDNodeBrowser
- (BOOL)onlySupportsADisk:(id)a3;
- (NSArray)nodes;
- (NSArray)sidebarNodes;
- (NSDictionary)options;
- (NSString)bundleID;
- (OS_xpc_object)connection;
- (SDNodeBrowser)initWithNode:(__SFNode *)a3 protocol:(id)a4 flags:(unint64_t)a5 kind:(id)a6;
- (SDNodeBrowserDelegate)delegate;
- (SDXPCHelperConnection)helperConnection;
- (id)airDropNodes;
- (id)domainChildren;
- (id)neighborhoodNodes;
- (id)nodesInternal:(BOOL)a3;
- (id)odiskNodes;
- (id)sharePointNodes;
- (id)sidebarNodesFromServerNodes:(id)a3 nonServerCount:(unint64_t)a4 addAllNode:(BOOL *)a5;
- (id)workgroupChildren;
- (int)addNode:(__SFNode *)a3;
- (int)removeNode:(__SFNode *)a3;
- (int64_t)mode;
- (void)addBonjourChildrenFromCache:(id)a3;
- (void)addClassroomChildrenFromCache:(id)a3;
- (void)addConnectedChildrenFromCache:(id)a3;
- (void)addManagedChildrenFromCache:(id)a3;
- (void)addRapportChildrenFromCache:(id)a3;
- (void)addWindowsChildrenFromCache:(id)a3;
- (void)appendAllNode:(id)a3;
- (void)connectedChanged:(id)a3;
- (void)copyOverBonjourInfo:(__SFNode *)a3 source:(__SFNode *)a4;
- (void)dealloc;
- (void)domainsChanged:(id)a3;
- (void)loadAirDrop;
- (void)loadBonjour;
- (void)loadClassroom;
- (void)loadConnected;
- (void)loadDomains;
- (void)loadManaged;
- (void)loadODisk;
- (void)loadRapport;
- (void)loadSidebarPrefsMonitor;
- (void)loadWindows;
- (void)loadWorkgroups;
- (void)managedChanged:(id)a3;
- (void)notifyClient;
- (void)notifyClientAboutWorkgroups;
- (void)serversChanged:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setConnection:(id)a3;
- (void)setConnectionState:(int)a3;
- (void)setDelegate:(id)a3;
- (void)setError:(int)a3;
- (void)setHelperConnection:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setOptions:(id)a3;
- (void)setUserName:(id)a3;
- (void)sharePointBrowser:(id)a3 nodesDidChangeWithError:(int)a4;
- (void)sidebarPrefsChanged:(id)a3;
- (void)start;
- (void)stop;
- (void)takeActionOnServerChanged:(id)a3 neighborhood:(id)a4;
- (void)unloadAirDrop;
- (void)unloadBonjour;
- (void)unloadClassroom;
- (void)unloadConnected;
- (void)unloadDomains;
- (void)unloadManaged;
- (void)unloadODisk;
- (void)unloadRapport;
- (void)unloadSharePoints;
- (void)unloadSidebarPrefsMonitor;
- (void)unloadWindows;
- (void)unloadWorkgroups;
- (void)workgroupsChanged:(id)a3;
@end

@implementation SDNodeBrowser

- (SDNodeBrowser)initWithNode:(__SFNode *)a3 protocol:(id)a4 flags:(unint64_t)a5 kind:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  v38.receiver = self;
  v38.super_class = (Class)&OBJC_CLASS___SDNodeBrowser;
  v12 = -[SDNodeBrowser init](&v38, "init");
  v13 = v12;
  if (v12)
  {
    v12->_mode = 0LL;
    objc_storeStrong((id *)&v12->_kind, a6);
    v14 = objc_alloc_init(&OBJC_CLASS___SDNodeCoalescer);
    nodeCoalescer = v13->_nodeCoalescer;
    v13->_nodeCoalescer = v14;

    airDropDiscoveryLogger = v13->_airDropDiscoveryLogger;
    v13->_airDropDiscoveryLogger = 0LL;

    v13->_startTime = 0.0;
    v13->_shouldCollectNodeCoalescerMetrics = 1;
    coalescer = v13->_coalescer;
    v13->_coalescer = 0LL;

    connection = v13->_connection;
    v13->_connection = 0LL;

    objc_storeStrong((id *)&v13->_protocol, a4);
    odiskDomains = v13->_odiskDomains;
    v13->_odiskDomains = 0LL;

    airDropDomains = v13->_airDropDomains;
    v13->_airDropDomains = 0LL;

    bonjourDomains = v13->_bonjourDomains;
    v13->_bonjourDomains = 0LL;

    domainBrowser = v13->_domainBrowser;
    v13->_domainBrowser = 0LL;

    managedBrowser = v13->_managedBrowser;
    v13->_managedBrowser = 0LL;

    classroomBrowser = v13->_classroomBrowser;
    v13->_classroomBrowser = 0LL;

    workgroupBrowser = v13->_workgroupBrowser;
    v13->_workgroupBrowser = 0LL;

    connectedBrowser = v13->_connectedBrowser;
    v13->_connectedBrowser = 0LL;

    sharePointBrowser = v13->_sharePointBrowser;
    v13->_sharePointBrowser = 0LL;

    managedURLTable = v13->_managedURLTable;
    v13->_managedURLTable = 0LL;

    commentHashTable = v13->_commentHashTable;
    v13->_commentHashTable = 0LL;

    v13->_combineWorkgroups = 0;
    windowsWorkgroups = v13->_windowsWorkgroups;
    v13->_windowsWorkgroups = 0LL;

    originalNodes = v13->_originalNodes;
    v13->_originalNodes = 0LL;

    v13->_error = 0;
    objc_storeStrong((id *)&v13->_queue, &_dispatch_main_q);
    v13->_parent = (__SFNode *)CFRetain(a3);
    uint64_t v32 = objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    monitor = v13->_monitor;
    v13->_monitor = (SDStatusMonitor *)v32;

    uint64_t v34 = SFNodeCopyProtocols(a3);
    protocols = v13->_protocols;
    v13->_protocols = (NSArray *)v34;

    contactIdentifierMap = v13->_contactIdentifierMap;
    v13->_contactIdentifierMap = 0LL;
  }

  return v13;
}

- (void)dealloc
{
  parent = self->_parent;
  if (parent) {
    CFRelease(parent);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SDNodeBrowser;
  -[SDNodeBrowser dealloc](&v4, "dealloc");
}

- (void)notifyClient
{
}

- (void)setError:(int)a3
{
  self->_error = a3;
}

- (void)setUserName:(id)a3
{
}

- (void)setConnectionState:(int)a3
{
}

- (void)notifyClientAboutWorkgroups
{
  if (-[NSString isEqual:](self->_kind, "isEqual:", kSFBrowserKindPrinter))
  {
    -[SDNodeBrowser notifyClient](self, "notifyClient");
    return;
  }

  v3 = (const __CFSet *)SFNodeCopyWorkgroups(self->_parent);
  objc_super v4 = (const __CFSet *)objc_claimAutoreleasedReturnValue(-[SDWorkgroupBrowser workgroups](self->_workgroupBrowser, "workgroups"));
  v5 = v4;
  if (v3)
  {
    CFIndex Count = CFSetGetCount(v3);
    if (v5)
    {
      CFIndex v7 = CFSetGetCount(v5);
      CFIndex v8 = v7;
      p_BOOL combineWorkgroups = &self->_combineWorkgroups;
      BOOL combineWorkgroups = self->_combineWorkgroups;
      if (Count < 1)
      {
        Mutable = 0LL;
      }

      else
      {
        CFIndex v27 = v7;
        __chkstk_darwin(v7);
        v12 = (char *)v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        bzero(v12, v11);
        CFSetGetValues(v3, (const void **)v12);
        Mutable = CFSetCreateMutable(0LL, 0LL, &kCFCopyStringSetCallBacks);
        for (uint64_t i = 0LL; i != Count; ++i)
        {
        }

        CFIndex v8 = v27;
      }

      goto LABEL_15;
    }

    p_BOOL combineWorkgroups = &self->_combineWorkgroups;
    BOOL combineWorkgroups = self->_combineWorkgroups;
    Mutable = CFSetCreateMutableCopy(0LL, 0LL, v3);
  }

  else
  {
    if (v4)
    {
      CFIndex v8 = CFSetGetCount(v4);
      CFIndex Count = 0LL;
      Mutable = 0LL;
      p_BOOL combineWorkgroups = &self->_combineWorkgroups;
      BOOL combineWorkgroups = self->_combineWorkgroups;
LABEL_15:
      SFNodeSetWorkgroups(self->_parent, v5);
      CFRelease(v5);
      goto LABEL_18;
    }

    CFIndex Count = 0LL;
    Mutable = 0LL;
    p_BOOL combineWorkgroups = &self->_combineWorkgroups;
    BOOL combineWorkgroups = self->_combineWorkgroups;
  }

  CFSetRef v15 = CFSetCreate(0LL, 0LL, 0LL, &kCFCopyStringSetCallBacks);
  SFNodeSetWorkgroups(self->_parent, v15);
  CFRelease(v15);
  CFIndex v8 = 0LL;
LABEL_18:
  if (v8 >= -[SDStatusMonitor workgroupThreshold](self->_monitor, "workgroupThreshold"))
  {
    if (v8 <= -[SDStatusMonitor workgroupThreshold](self->_monitor, "workgroupThreshold")) {
      goto LABEL_23;
    }
    char v16 = 0;
  }

  else
  {
    char v16 = 1;
  }

  *p_BOOL combineWorkgroups = v16;
LABEL_23:
  if (combineWorkgroups)
  {
    if (*p_combineWorkgroups)
    {
      v17 = Mutable;
      if (!Mutable) {
        goto LABEL_35;
      }
    }

    else
    {
      v17 = v3;
      if (!v3) {
        goto LABEL_38;
      }
    }

    v18 = (const __CFSet *)CFRetain(v17);
    if (v18)
    {
      v19 = v18;
      CFIndex v20 = CFSetGetCount(v18);
      if (v20)
      {
        uint64_t v21 = v20;
        v26[1] = v26;
        CFIndex v27 = v8;
        __chkstk_darwin(v20);
        v23 = (void *)((char *)v26 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL));
        bzero(v23, v22);
        CFSetGetValues(v19, (const void **)v23);
        if (v21 >= 1)
        {
          do
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](&OBJC_CLASS___SDServerBrowser, "sharedBrowser"));
            uint64_t v25 = *v23++;
            [v24 stopBrowsingWorkgroup:v25];

            --v21;
          }

          while (v21);
        }

        CFIndex v8 = v27;
      }

      CFRelease(v19);
    }
  }

  if (!*p_combineWorkgroups) {
    goto LABEL_38;
  }
LABEL_35:
  if (v8 < 1)
  {
    if (Count < 1) {
      goto LABEL_39;
    }
LABEL_38:
    -[SDNodeBrowser notifyClient](self, "notifyClient");
    goto LABEL_39;
  }

  -[SDNodeBrowser loadWindows](self, "loadWindows");
LABEL_39:
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v3) {
    CFRelease(v3);
  }
}

- (void)takeActionOnServerChanged:(id)a3 neighborhood:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ((![v8 isEqualToString:@"com.apple.sharingd.BonjourChanged"]
     || (bonjourDomains = self->_bonjourDomains) == 0LL)
    && (![v8 isEqualToString:@"com.apple.sharingd.WindowsChanged"]
     || (bonjourDomains = self->_windowsWorkgroups) == 0LL)
    && (![v8 isEqualToString:@"com.apple.sharingd.ODisksChanged"]
     || (bonjourDomains = self->_odiskDomains) == 0LL)
    && (![v8 isEqualToString:@"com.apple.sharingd.AirDropChanged"]
     || (bonjourDomains = self->_airDropDomains) == 0LL))
  {
    goto LABEL_10;
  }

  if ((-[NSMutableSet containsObject:](bonjourDomains, "containsObject:", v6) & 1) != 0)
  {
LABEL_10:
    -[SDNodeBrowser setError:](self, "setError:", 0LL);
    -[SDNodeBrowser notifyClient](self, "notifyClient");
  }

- (void)serversChanged:(id)a3
{
  id v4 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue([v4 name]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"NeighborhoodName"]);
  -[SDNodeBrowser takeActionOnServerChanged:neighborhood:](self, "takeActionOnServerChanged:neighborhood:", v7, v6);
}

- (void)domainsChanged:(id)a3
{
}

- (void)workgroupsChanged:(id)a3
{
}

- (void)sharePointBrowser:(id)a3 nodesDidChangeWithError:(int)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 userName]);
  -[SDNodeBrowser setUserName:](self, "setUserName:", v6);

  id v7 = [v5 connectionState];
  -[SDNodeBrowser setConnectionState:](self, "setConnectionState:", v7);
  -[SDNodeBrowser notifyClient](self, "notifyClient");
}

- (void)connectedChanged:(id)a3
{
}

- (void)managedChanged:(id)a3
{
}

- (void)sidebarPrefsChanged:(id)a3
{
}

- (void)setMode:(int64_t)a3
{
  if (self->_mode != a3)
  {
    if (-[NSString isEqual:](self->_kind, "isEqual:", kSFBrowserKindNetwork))
    {
      self->_mode = a3;
      id v5 = (id)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](&OBJC_CLASS___SDServerBrowser, "sharedBrowser"));
      [v5 setBonjourBrowserMode:a3];
    }
  }

- (int64_t)mode
{
  return self->_mode;
}

- (void)setOptions:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)loadBonjour
{
  v3 = (const __CFSet *)SFNodeCopyKinds(self->_parent);
  if (CFSetContainsValue(v3, kSFNodeKindDomain)
    && -[NSString isEqual:](self->_kind, "isEqual:", kSFBrowserKindNetwork))
  {
    id v4 = (void *)SFNodeCopyDomains(self->_parent);
    if ([v4 count])
    {
      v19 = v4;
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);
      if (!self->_bonjourDomains)
      {
        id v6 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
        bonjourDomains = self->_bonjourDomains;
        self->_bonjourDomains = v6;
      }

      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v8 addObserver:self selector:"serversChanged:" name:@"com.apple.sharingd.BonjourChanged" object:0];

      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      id v9 = v5;
      id v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v21;
        do
        {
          for (uint64_t i = 0LL; i != v11; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v21 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
            -[NSMutableSet addObject:](self->_bonjourDomains, "addObject:", v14);
            CFSetRef v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](&OBJC_CLASS___SDServerBrowser, "sharedBrowser"));
            [v15 startBrowsingDomain:v14];

            if ([v14 isEqual:@"local"])
            {
              char v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](&OBJC_CLASS___SDServerBrowser, "sharedBrowser"));
              [v16 setBonjourBrowserMode:self->_mode];
            }

            v17 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](&OBJC_CLASS___SDServerBrowser, "sharedBrowser"));
            v18 = (void *)objc_claimAutoreleasedReturnValue([v17 bonjourNodesForDomain:v14]);

            if ([v18 count]) {
              -[SDNodeBrowser notifyClient](self, "notifyClient");
            }
          }

          id v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }

        while (v11);
      }

      id v4 = v19;
    }
  }

  CFRelease(v3);
}

- (void)loadWindows
{
  v3 = (const __CFSet *)SFNodeCopyKinds(self->_parent);
  if (CFSetContainsValue(v3, kSFNodeKindWorkgroup))
  {
    id v4 = (void *)SFNodeCopyWorkgroups(self->_parent);
    if ([v4 count])
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);
      if (!self->_windowsWorkgroups)
      {
        id v6 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
        windowsWorkgroups = self->_windowsWorkgroups;
        self->_windowsWorkgroups = v6;
      }

      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v8 addObserver:self selector:"serversChanged:" name:@"com.apple.sharingd.WindowsChanged" object:0];

      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      id v9 = v5;
      id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v19;
        do
        {
          for (uint64_t i = 0LL; i != v11; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v19 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)i);
            -[NSMutableSet addObject:](self->_windowsWorkgroups, "addObject:", v14, (void)v18);
            CFSetRef v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](&OBJC_CLASS___SDServerBrowser, "sharedBrowser"));
            [v15 startBrowsingWorkgroup:v14];

            char v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](&OBJC_CLASS___SDServerBrowser, "sharedBrowser"));
            v17 = (void *)objc_claimAutoreleasedReturnValue([v16 windowsNodesForWorkgroup:v14]);

            if ([v17 count]) {
              -[SDNodeBrowser notifyClient](self, "notifyClient");
            }
          }

          id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }

        while (v11);
      }
    }
  }

  CFRelease(v3);
}

- (void)loadDomains
{
  if (-[NSString isEqual:](self->_kind, "isEqual:", kSFBrowserKindNetwork))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 addObserver:self selector:"domainsChanged:" name:@"com.apple.sharingd.DomainsChanged" object:0];

    id v4 = (SDDomainBrowser *)objc_claimAutoreleasedReturnValue(+[SDDomainBrowser sharedBrowser](&OBJC_CLASS___SDDomainBrowser, "sharedBrowser"));
    domainBrowser = self->_domainBrowser;
    self->_domainBrowser = v4;

    -[SDDomainBrowser start](self->_domainBrowser, "start");
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[SDDomainBrowser childrenForNode:](self->_domainBrowser, "childrenForNode:", self->_parent));
    if ([v6 count]) {
      -[SDNodeBrowser notifyClient](self, "notifyClient");
    }
  }

- (void)loadWorkgroups
{
  if ((-[NSString isEqual:](self->_kind, "isEqual:", kSFBrowserKindNetwork) & 1) != 0
    || -[NSString isEqual:](self->_kind, "isEqual:", kSFBrowserKindPrinter))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 addObserver:self selector:"workgroupsChanged:" name:@"com.apple.sharingd.WorkgroupsChanged" object:0];

    id v4 = (SDWorkgroupBrowser *)objc_claimAutoreleasedReturnValue(+[SDWorkgroupBrowser sharedBrowser](&OBJC_CLASS___SDWorkgroupBrowser, "sharedBrowser"));
    workgroupBrowser = self->_workgroupBrowser;
    self->_workgroupBrowser = v4;

    -[SDWorkgroupBrowser start](self->_workgroupBrowser, "start");
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[SDWorkgroupBrowser nodes](self->_workgroupBrowser, "nodes"));
    if ([v6 count]) {
      -[SDNodeBrowser notifyClientAboutWorkgroups](self, "notifyClientAboutWorkgroups");
    }
  }

- (BOOL)onlySupportsADisk:(id)a3
{
  uint64_t v3 = kSFNodeProtocolAFP;
  id v4 = a3;
  LOBYTE(v3) = [v4 containsObject:v3];
  unsigned __int8 v5 = [v4 containsObject:kSFNodeProtocolSMB];
  unsigned __int8 v6 = [v4 containsObject:kSFNodeProtocolADisk];

  return v6 & ((v3 | v5) ^ 1);
}

- (void)loadConnected
{
  unsigned __int8 v3 = -[NSString isEqual:](self->_kind, "isEqual:", kSFBrowserKindNetwork);
  uint64_t v4 = kSFBrowserKindRemoteDisc;
  if ((v3 & 1) != 0
    || (-[NSString isEqual:](self->_kind, "isEqual:", kSFBrowserKindRemoteDisc) & 1) != 0
    || -[NSString isEqual:](self->_kind, "isEqual:", kSFBrowserKindAirDrop))
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v5 addObserver:self selector:"connectedChanged:" name:@"com.apple.sharingd.ConnectedChanged" object:0];

    unsigned __int8 v6 = (SDConnectedBrowser *)objc_claimAutoreleasedReturnValue(+[SDConnectedBrowser sharedBrowser](&OBJC_CLASS___SDConnectedBrowser, "sharedBrowser"));
    connectedBrowser = self->_connectedBrowser;
    self->_connectedBrowser = v6;

    -[SDConnectedBrowser start](self->_connectedBrowser, "start");
    unsigned __int8 v8 = -[NSString isEqual:](self->_kind, "isEqual:", v4);
    id v9 = self->_connectedBrowser;
    if ((v8 & 1) != 0) {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDConnectedBrowser odiskNodes](v9, "odiskNodes"));
    }
    else {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDConnectedBrowser nodes](v9, "nodes"));
    }
    id v11 = v10;
    if ([v10 count]) {
      -[SDNodeBrowser notifyClient](self, "notifyClient");
    }
  }

- (void)loadManaged
{
  if (-[NSString isEqual:](self->_kind, "isEqual:", kSFBrowserKindNetwork))
  {
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 addObserver:self selector:"managedChanged:" name:@"com.apple.sharingd.ManagedChanged" object:0];

    uint64_t v4 = (SDManagedBrowser *)objc_claimAutoreleasedReturnValue(+[SDManagedBrowser sharedBrowser](&OBJC_CLASS___SDManagedBrowser, "sharedBrowser"));
    managedBrowser = self->_managedBrowser;
    self->_managedBrowser = v4;

    -[SDManagedBrowser start](self->_managedBrowser, "start");
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[SDManagedBrowser nodes](self->_managedBrowser, "nodes"));
    if ([v6 count]) {
      -[SDNodeBrowser notifyClient](self, "notifyClient");
    }
  }

- (void)loadODisk
{
  unsigned __int8 v3 = (const __CFSet *)SFNodeCopyKinds(self->_parent);
  if (CFSetContainsValue(v3, kSFNodeKindDomain)
    && -[NSString isEqual:](self->_kind, "isEqual:", kSFBrowserKindRemoteDisc))
  {
    uint64_t v4 = (void *)SFNodeCopyDomains(self->_parent);
    if ([v4 count])
    {
      unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);
      if (!self->_odiskDomains)
      {
        id v6 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
        odiskDomains = self->_odiskDomains;
        self->_odiskDomains = v6;
      }

      unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v8 addObserver:self selector:"serversChanged:" name:@"com.apple.sharingd.ODisksChanged" object:0];

      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      id v9 = v5;
      id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v19;
        do
        {
          for (uint64_t i = 0LL; i != v11; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v19 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)i);
            -[NSMutableSet addObject:](self->_odiskDomains, "addObject:", v14, (void)v18);
            CFSetRef v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](&OBJC_CLASS___SDServerBrowser, "sharedBrowser"));
            [v15 startODiskBrowsing:v14];

            char v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](&OBJC_CLASS___SDServerBrowser, "sharedBrowser"));
            v17 = (void *)objc_claimAutoreleasedReturnValue([v16 odiskNodesForDomain:v14]);

            if ([v17 count]) {
              -[SDNodeBrowser notifyClient](self, "notifyClient");
            }
          }

          id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }

        while (v11);
      }
    }
  }

  CFRelease(v3);
}

- (void)loadClassroom
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  unsigned int v4 = [v3 isClassroomEnabled];

  if (v4)
  {
    unsigned __int8 v5 = (const __CFSet *)SFNodeCopyKinds(self->_parent);
    if (CFSetContainsValue(v5, kSFNodeKindDomain)
      && -[NSString isEqual:](self->_kind, "isEqual:", kSFBrowserKindAirDrop))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v6 addObserver:self selector:"classroomChanged:" name:@"com.apple.sharingd.ClassroomChanged" object:0];

      id v7 = (SDClassroomBrowser *)objc_claimAutoreleasedReturnValue( +[SDClassroomBrowser sharedBrowser]( &OBJC_CLASS___SDClassroomBrowser,  "sharedBrowser"));
      classroomBrowser = self->_classroomBrowser;
      self->_classroomBrowser = v7;

      connection = self->_connection;
      if (connection)
      {
        id v10 = sub_1001167C0(connection);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        -[SDClassroomBrowser setClientBundleID:](self->_classroomBrowser, "setClientBundleID:", v11);
      }

      -[SDClassroomBrowser start](self->_classroomBrowser, "start");
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDClassroomBrowser nodes](self->_classroomBrowser, "nodes"));
      if ([v12 count]) {
        -[SDNodeBrowser notifyClient](self, "notifyClient");
      }
    }

    if (v5) {
      CFRelease(v5);
    }
  }

- (void)loadAirDrop
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  unsigned int v4 = [v3 isAirDropAllowed];

  if (v4)
  {
    unsigned __int8 v5 = (const __CFSet *)SFNodeCopyKinds(self->_parent);
    if (CFSetContainsValue(v5, kSFNodeKindDomain)
      && -[NSString isEqual:](self->_kind, "isEqual:", kSFBrowserKindAirDrop))
    {
      id v6 = (void *)SFNodeCopyDomains(self->_parent);
      if ([v6 count])
      {
        __int128 v23 = v6;
        v24 = v5;
        id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allObjects]);
        if (!self->_airDropDomains)
        {
          unsigned __int8 v8 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
          airDropDomains = self->_airDropDomains;
          self->_airDropDomains = v8;
        }

        id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
        [v10 addObserver:self selector:"serversChanged:" name:@"com.apple.sharingd.AirDropChanged" object:0];

        __int128 v30 = 0u;
        __int128 v31 = 0u;
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        id obj = v7;
        id v11 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v27 = *(void *)v29;
          uint64_t v26 = kSFBrowserOptionsDelayBonjourUntilTransferKey;
          do
          {
            for (uint64_t i = 0LL; i != v12; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v29 != v27) {
                objc_enumerationMutation(obj);
              }
              uint64_t v14 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)i);
              -[NSMutableSet addObject:](self->_airDropDomains, "addObject:", v14);
              if (self->_bundleID)
              {
                CFSetRef v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDNodeBrowser options](self, "options"));
                BOOL v16 = CFDictionaryGetInt64(v15, v26, 0LL) != 0;

                v17 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](&OBJC_CLASS___SDServerBrowser, "sharedBrowser"));
                bundleID = self->_bundleID;
                protocol = self->_protocol;
                __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDNodeBrowser helperConnection](self, "helperConnection"));
                [v17 startAirDropBrowsing:v14 bundleID:bundleID sessionID:protocol helperConnection:v20 delayBonjour:v16];
              }

              else
              {
                v17 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](&OBJC_CLASS___SDServerBrowser, "sharedBrowser"));
                [v17 startAirDropBrowsing:v14 connection:self->_connection sessionID:self->_protocol];
              }

              __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](&OBJC_CLASS___SDServerBrowser, "sharedBrowser"));
              __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 airDropNodesForDomain:v14]);

              if ([v22 count]) {
                -[SDNodeBrowser notifyClient](self, "notifyClient");
              }
            }

            id v12 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
          }

          while (v12);
        }

        id v6 = v23;
        unsigned __int8 v5 = v24;
      }
    }

    CFRelease(v5);
  }

- (void)loadSidebarPrefsMonitor
{
  if (-[NSString isEqual:](self->_kind, "isEqual:", kSFBrowserKindNetwork))
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 addObserver:self selector:"sidebarPrefsChanged:" name:@"com.apple.sharingd.FinderPrefsChanged" object:0];
  }

- (void)loadRapport
{
  id v3 = (const __CFSet *)SFNodeCopyKinds(self->_parent);
  if (CFSetContainsValue(v3, kSFNodeKindDomain)
    && -[NSString isEqual:](self->_kind, "isEqual:", kSFNodeKindAirDrop))
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v4 addObserver:self selector:"serversChanged:" name:@"com.apple.sharingd.RapportChanged" object:0];

    unsigned __int8 v5 = (SDRapportBrowser *)objc_claimAutoreleasedReturnValue( +[SDRapportBrowser sharedRapportBrowser]( &OBJC_CLASS___SDRapportBrowser,  "sharedRapportBrowser"));
    rapportBrowser = self->_rapportBrowser;
    self->_rapportBrowser = v5;

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDNodeBrowser helperConnection](self, "helperConnection"));
    -[SDRapportBrowser setHelperConnection:](self->_rapportBrowser, "setHelperConnection:", v7);

    -[SDRapportBrowser start](self->_rapportBrowser, "start");
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDRapportBrowser nodes](self->_rapportBrowser, "nodes"));
    if ([v8 count]) {
      -[SDNodeBrowser notifyClient](self, "notifyClient");
    }
  }

  if (v3) {
    CFRelease(v3);
  }
}

- (id)domainChildren
{
  return -[SDDomainBrowser childrenForNode:](self->_domainBrowser, "childrenForNode:", self->_parent);
}

- (id)workgroupChildren
{
  workgroupBrowser = self->_workgroupBrowser;
  if (workgroupBrowser)
  {
    if (self->_combineWorkgroups)
    {
      if (!-[NSString isEqual:](self->_kind, "isEqual:", kSFBrowserKindPrinter))
      {
        workgroupBrowser = 0LL;
        return workgroupBrowser;
      }

      workgroupBrowser = self->_workgroupBrowser;
    }

    workgroupBrowser = (SDWorkgroupBrowser *)objc_claimAutoreleasedReturnValue(-[SDWorkgroupBrowser nodes](workgroupBrowser, "nodes"));
  }

  return workgroupBrowser;
}

- (void)copyOverBonjourInfo:(__SFNode *)a3 source:(__SFNode *)a4
{
  id v6 = (id)SFNodeCopyModel(a4, a2);
  SFNodeSetModel(a3, v6);
  id v7 = (id)SFNodeCopyColor(a4);
  SFNodeSetColor(a3, v7);
  id v8 = (id)SFNodeCopySiblingNodes(a4);
  SFNodeSetSiblingNodes(a3, v8);
  id v9 = (id)SFNodeCopyDomain(a4);
  SFNodeSetDomain(a3, v9);
  id v10 = (id)SFNodeCopyAppleID(a4);
  SFNodeSetAppleID(a3, v10);
  id v11 = (id)SFNodeCopyIconData(a4);
  SFNodeSetIconData(a3, v11);
  id v12 = (id)SFNodeCopyIconHash(a4);
  SFNodeSetIconHash(a3, v12);
  id v13 = (id)SFNodeCopyLastName(a4);
  SFNodeSetLastName(a3, v13);
  id v14 = (id)SFNodeCopyFirstName(a4);
  SFNodeSetFirstName(a3, v14);
  id v15 = (id)SFNodeCopyContactIdentifier(a4);
  SFNodeSetContactIdentifier(a3, v15);
  id v16 = (id)SFNodeCopyContactIdentifiers(a4);
  SFNodeSetContactIdentifiers(a3, v16);
  id v17 = (id)SFNodeCopyComputerName(a4);
  SFNodeSetComputerName(a3, v17);
  id v18 = (id)SFNodeCopySecondaryName(a4);
  SFNodeSetSecondaryName(a3, v18);
  id v19 = (id)SFNodeCopyTransportBundleID(a4);
  SFNodeSetTransportBundleID(a3, v19);
  id v20 = (id)SFNodeCopyBonjourProtocols(a4);
  SFNodeSetBonjourProtocols(a3, v20);
  id v21 = (id)SFNodeCopyRapportFlags(a4);
  SFNodeSetRapportFlags(a3, v21);
  uint64_t SupportedMedia = SFNodeGetSupportedMedia(a4);
  SFNodeSetSupportedMedia(a3, SupportedMedia);
}

- (void)addBonjourChildrenFromCache:(id)a3
{
  id v4 = a3;
  uint64_t v38 = kSFBrowserKindRemoteDisc;
  if ((-[NSString isEqual:](self->_kind, "isEqual:") & 1) != 0)
  {
    uint64_t v5 = 14LL;
  }

  else
  {
    unsigned int v6 = -[NSString isEqual:](self->_kind, "isEqual:", kSFBrowserKindAirDrop);
    uint64_t v5 = 16LL;
    if (v6) {
      uint64_t v5 = 15LL;
    }
  }

  id v7 = (&self->super.isa)[v5];
  if (-[objc_class count](v7, "count"))
  {
    id v8 = (const __CFSet *)SFNodeCopyKinds(self->_parent);
    id v9 = v8;
    if (!self->_commentHashTable && CFSetContainsValue(v8, kSFNodeKindWorkgroup))
    {
      id v10 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
      commentHashTable = self->_commentHashTable;
      self->_commentHashTable = v10;
    }

    cf = v9;
    v33 = v7;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(-[objc_class allObjects](v7, "allObjects"));
    id v39 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v39)
    {
      uint64_t v36 = *(void *)v46;
      uint64_t v34 = kSFBrowserKindAirDrop;
      v37 = self;
      do
      {
        uint64_t v12 = 0LL;
        do
        {
          if (*(void *)v46 != v36) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v45 + 1) + 8 * v12);
          uint64_t v40 = v12;
          if (-[NSString isEqual:](self->_kind, "isEqual:", v38))
          {
            id v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](&OBJC_CLASS___SDServerBrowser, "sharedBrowser"));
            uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 odiskNodesForDomain:v13]);
          }

          else
          {
            unsigned int v16 = -[NSString isEqual:](self->_kind, "isEqual:", v34);
            id v17 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](&OBJC_CLASS___SDServerBrowser, "sharedBrowser"));
            id v14 = v17;
            if (v16) {
              uint64_t v15 = objc_claimAutoreleasedReturnValue([v17 airDropNodesForDomain:v13]);
            }
            else {
              uint64_t v15 = objc_claimAutoreleasedReturnValue([v17 bonjourNodesForDomain:v13]);
            }
          }

          id v18 = (void *)v15;

          __int128 v43 = 0u;
          __int128 v44 = 0u;
          __int128 v41 = 0u;
          __int128 v42 = 0u;
          id v19 = v18;
          id v20 = [v19 countByEnumeratingWithState:&v41 objects:v49 count:16];
          if (v20)
          {
            id v22 = v20;
            uint64_t v23 = *(void *)v42;
            do
            {
              for (uint64_t i = 0LL; i != v22; uint64_t i = (char *)i + 1)
              {
                if (*(void *)v42 != v23) {
                  objc_enumerationMutation(v19);
                }
                uint64_t v25 = *(void *)(*((void *)&v41 + 1) + 8LL * (void)i);
                uint64_t v26 = (void *)SFNodeCopyRealName(v25, v21);
                uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 lowercaseString]);
                Copy = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v27]);

                if (!Copy)
                {
                  Copy = (void *)SFNodeCreateCopy(0LL, v25);
                  [v4 setObject:Copy forKeyedSubscript:v27];
                  CFRelease(Copy);
                }

                __int128 v29 = (const void *)SFNodeCopyKinds(Copy);
                __int128 v30 = (const void *)SFNodeCopyKinds(v25);
                __int128 v31 = (const void *)SFNodeCopyDomain(v25);
                CFRelease(v29);
                CFRelease(v31);
                CFRelease(v30);
              }

              id v22 = [v19 countByEnumeratingWithState:&v41 objects:v49 count:16];
            }

            while (v22);
          }

          uint64_t v12 = v40 + 1;
          self = v37;
        }

        while ((id)(v40 + 1) != v39);
        id v39 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
      }

      while (v39);
    }

    CFRelease(cf);

    id v7 = v33;
  }

  if (self->_commentHashTable && ![v4 count]) {
    -[NSMutableDictionary removeAllObjects](self->_commentHashTable, "removeAllObjects");
  }
}

- (void)addWindowsChildrenFromCache:(id)a3
{
  id v39 = a3;
  if (self->_windowsWorkgroups && (!self->_workgroupBrowser || self->_combineWorkgroups))
  {
    id v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    v37 = self;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_windowsWorkgroups, "allObjects"));
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    id v6 = [v5 countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v46;
      do
      {
        for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v46 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v45 + 1) + 8LL * (void)i);
          id v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](&OBJC_CLASS___SDServerBrowser, "sharedBrowser"));
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 windowsNodesForWorkgroup:v10]);

          if (v12) {
            -[NSMutableArray addObjectsFromArray:](v4, "addObjectsFromArray:", v12);
          }
        }

        id v7 = [v5 countByEnumeratingWithState:&v45 objects:v50 count:16];
      }

      while (v7);
    }

    __int128 v30 = v5;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    uint64_t v13 = v4;
    id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v41,  v49,  16LL);
    uint64_t v15 = v37;
    if (v14)
    {
      id v16 = v14;
      uint64_t v17 = *(void *)v42;
      value = (void *)kSFNodeKindBonjour;
      v35 = (void *)kSFNodeProtocolSMB;
      uint64_t v34 = kSFNodeKindWindows;
      uint64_t v33 = kSFNodeKindRecent;
      uint64_t v32 = kSFNodeKindManaged;
      uint64_t v31 = kSFNodeKindConnected;
      uint64_t v36 = *(void *)v42;
      do
      {
        id v18 = 0LL;
        id v38 = v16;
        do
        {
          if (*(void *)v42 != v17) {
            objc_enumerationMutation(v13);
          }
          uint64_t v19 = *(void *)(*((void *)&v41 + 1) + 8LL * (void)v18);
          id v20 = (const __CFSet *)SFNodeCopyKinds(v19);
          if (!CFSetContainsValue(v20, value))
          {
            uint64_t v21 = (const void *)SFNodeCopyNetbiosName(v19);
            id v22 = (const void *)SFNodeCopyWorkgroup(v19);
            uint64_t v23 = (const __CFString *)SFNodeCopySecondaryName(v19);
            v24 = v23;
            if (v15->_commentHashTable
              && v23
              && CFStringGetLength(v23)
              && (uint64_t v25 = CFDictionaryGetValue((CFDictionaryRef)v15->_commentHashTable, v24)) != 0LL
              && (uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v39 objectForKeyedSubscript:v25]),
                  v26,
                  v26)
              || (uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v39 objectForKeyedSubscript:v21]),
                  v26,
                  v26))
            {
              uint64_t v27 = v13;
              Copy = (const __CFSet *)SFNodeCopyKinds(v26);
              __int128 v29 = (const __CFArray *)SFNodeCopyProtocols(v26);
              if (CFSetContainsValue(Copy, value)
                && (v51.length = CFArrayGetCount(v29), v51.location = 0LL, CFArrayContainsValue(v29, v51, v35)))
              {
                SFNodeAddKind(v19, value);
              }

              else
              {
                SFNodeSetMountPoint(v26, 0LL);
                SFNodeSetSecondaryName(v26, v24);
                SFNodeSetNetbiosName(v26, v21);
                SFNodeSetWorkgroup(v26, v22);
                SFNodeAddKind(v26, v34);
                SFNodeRemoveKind(v26, v33);
                SFNodeRemoveKind(v26, v32);
                SFNodeRemoveKind(v26, v31);
              }

              CFRelease(v29);
              uint64_t v13 = v27;
              uint64_t v17 = v36;
            }

            else
            {
              Copy = (const __CFSet *)SFNodeCreateCopy(0LL, v19);
              [v39 setObject:Copy forKeyedSubscript:v21];
            }

            id v16 = v38;
            CFRelease(Copy);
            if (v24) {
              CFRelease(v24);
            }
            CFRelease(v22);
            CFRelease(v21);
            uint64_t v15 = v37;
          }

          CFRelease(v20);
          id v18 = (char *)v18 + 1;
        }

        while (v16 != v18);
        id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v41,  v49,  16LL);
      }

      while (v16);
    }
  }
}

- (void)addClassroomChildrenFromCache:(id)a3
{
  id v4 = a3;
  classroomBrowser = self->_classroomBrowser;
  if (classroomBrowser)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDClassroomBrowser nodes](classroomBrowser, "nodes"));
    id v7 = v6;
    if (v6)
    {
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8)
      {
        id v10 = v8;
        uint64_t v11 = *(void *)v17;
        do
        {
          for (uint64_t i = 0LL; i != v10; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v7);
            }
            uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)i);
            id v14 = (void *)SFNodeCopyRealName(v13, v9);
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 lowercaseString]);
            [v4 setObject:v13 forKeyedSubscript:v15];
          }

          id v10 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }

        while (v10);
      }
    }
  }
}

- (void)addManagedChildrenFromCache:(id)a3
{
  id v4 = a3;
  managedBrowser = self->_managedBrowser;
  if (managedBrowser)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDManagedBrowser nodes](managedBrowser, "nodes"));
    if (v6)
    {
      managedURLTable = self->_managedURLTable;
      if (managedURLTable)
      {
        -[NSMutableDictionary removeAllObjects](managedURLTable, "removeAllObjects");
      }

      else
      {
        id v8 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
        uint64_t v9 = self->_managedURLTable;
        self->_managedURLTable = v8;
      }

      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      uint64_t v23 = v6;
      id v10 = v6;
      id v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v11)
      {
        id v13 = v11;
        uint64_t v14 = *(void *)v26;
        uint64_t v24 = kSFNodeKindManaged;
        do
        {
          for (uint64_t i = 0LL; i != v13; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v26 != v14) {
              objc_enumerationMutation(v10);
            }
            uint64_t v16 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)i);
            __int128 v17 = (void *)SFNodeCopyRealName(v16, v12);
            __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 lowercaseString]);
            if (v18)
            {
              Copy = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v18]);

              if (Copy)
              {
                uint64_t v20 = SFNodeCopyURL(v16);
                SFNodeAddKind(Copy, v24);
                SFNodeSetURL(Copy, v20);
                [v4 setObject:Copy forKeyedSubscript:v18];
                if (v20)
                {
                  uint64_t v21 = (const void *)v20;
                  goto LABEL_16;
                }
              }

              else
              {
                Copy = (void *)SFNodeCreateCopy(0LL, v16);
                [v4 setObject:Copy forKeyedSubscript:v18];
                uint64_t v21 = Copy;
LABEL_16:
                CFRelease(v21);
              }

              id v22 = (void *)SFNodeCopyURL(Copy);
              -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_managedURLTable,  "setObject:forKeyedSubscript:",  v18,  v22);
            }
          }

          id v13 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }

        while (v13);
      }

      id v6 = v23;
    }
  }
}

- (void)addConnectedChildrenFromCache:(id)a3
{
  id v34 = a3;
  if (self->_connectedBrowser)
  {
    if (-[NSString isEqual:](self->_kind, "isEqual:", kSFBrowserKindRemoteDisc))
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDConnectedBrowser odiskNodes](self->_connectedBrowser, "odiskNodes"));
      if (!v4)
      {
LABEL_45:

        goto LABEL_46;
      }
    }

    else
    {
      unsigned int v5 = -[NSString isEqual:](self->_kind, "isEqual:", kSFBrowserKindAirDrop);
      connectedBrowser = self->_connectedBrowser;
      if (v5)
      {
        id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDConnectedBrowser airDropNodes](connectedBrowser, "airDropNodes"));
        if (!v4) {
          goto LABEL_45;
        }
      }

      else
      {
        id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDConnectedBrowser nodes](connectedBrowser, "nodes"));
        if (!v4) {
          goto LABEL_45;
        }
      }
    }

    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    id v25 = v4;
    id obj = v4;
    id v33 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (!v33) {
      goto LABEL_44;
    }
    uint64_t v32 = *(void *)v38;
    value = (void *)kSFNodeKindRecent;
    v35 = (void *)kSFNodeKindConnected;
    __int128 v26 = (void *)kSFNodeKindBonjour;
LABEL_11:
    uint64_t v7 = 0LL;
    while (1)
    {
      if (*(void *)v38 != v32) {
        objc_enumerationMutation(obj);
      }
      uint64_t v8 = *(void *)(*((void *)&v37 + 1) + 8 * v7);
      uint64_t v9 = (const __CFURL *)SFNodeCopyURL(v8);
      id v10 = (const __CFSet *)SFNodeCopyKinds(v8);
      int v11 = CFSetContainsValue(v10, value);
      int v12 = CFSetContainsValue(v10, v35);
      uint64_t v14 = (void *)SFNodeCopyRealName(v8, v13);
      managedURLTable = self->_managedURLTable;
      if (!managedURLTable
        || (uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( managedURLTable,  "objectForKeyedSubscript:",  v9))) == 0LL)
      {
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lowercaseString", v25));
        if (!v16) {
          goto LABEL_40;
        }
      }

      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", v16, v25));

      if (v11)
      {
        unsigned int v18 = sub_100116E94((uint64_t)v9);
        if (!v17) {
          goto LABEL_28;
        }
        if (!v18) {
          goto LABEL_33;
        }
        CFStringRef v19 = CFURLCopyScheme(v9);
        CFSetRef theSet = (CFSetRef)SFNodeCopyKinds(v17);
        uint64_t v20 = (const void *)SFNodeCopyProtocols(v17);
        CFStringRef v29 = v19;
        if (!v19)
        {
          CFRelease(v20);
          CFRelease(theSet);
LABEL_33:
          SFNodeSetURL(v17, v9);
          SFNodeSetRealName(v17, v14);
          if (v11) {
            SFNodeAddKind(v17, value);
          }
          else {
            SFNodeRemoveKind(v17, value);
          }
          if (v12) {
            SFNodeAddKind(v17, v35);
          }
          else {
            SFNodeRemoveKind(v17, v35);
          }
          [v34 setObject:v17 forKeyedSubscript:v16];
          goto LABEL_40;
        }

        uint64_t v21 = v20;
        CFIndex Count = CFArrayGetCount((CFArrayRef)v20);
        if (!CFSetContainsValue(theSet, v26))
        {
          CFRelease(v29);
          CFRelease(v21);
          uint64_t v23 = theSet;
          goto LABEL_31;
        }

        v42.location = 0LL;
        v42.length = Count;
        int v28 = CFArrayContainsValue((CFArrayRef)v21, v42, v29);
        CFRelease(v29);
        CFRelease(v21);
        CFRelease(theSet);
        if (v28) {
          goto LABEL_33;
        }
      }

      else
      {
        if (!v17)
        {
          LOBYTE(v18) = 1;
LABEL_28:
          if (!v12 && (v18 & 1) != 0) {
            goto LABEL_40;
          }
          uint64_t Copy = SFNodeCreateCopy(0LL, v8);
          [v34 setObject:Copy forKeyedSubscript:v16];
          uint64_t v23 = (const void *)Copy;
LABEL_31:
          CFRelease(v23);
          goto LABEL_40;
        }

        if (v12) {
          goto LABEL_33;
        }
      }

- (void)addRapportChildrenFromCache:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDRapportBrowser nodes](self->_rapportBrowser, "nodes"));
  id v6 = v5;
  if (v5)
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      id v9 = v7;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0LL; i != v9; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)i);
          uint64_t v13 = (void *)SFNodeCopyRealName(v12, v8);
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 lowercaseString]);
          [v4 setObject:v12 forKeyedSubscript:v14];
        }

        id v9 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v9);
    }
  }
}

- (id)sidebarNodesFromServerNodes:(id)a3 nonServerCount:(unint64_t)a4 addAllNode:(BOOL *)a5
{
  id v8 = a3;
  id v9 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  unsigned int v10 = -[SDStatusMonitor connectedEnabled](self->_monitor, "connectedEnabled");
  unsigned int v41 = -[SDStatusMonitor bonjourEnabled](self->_monitor, "bonjourEnabled");
  unint64_t v11 = (unint64_t)[v8 count];
  if (v11)
  {
    id v33 = self;
    v35 = v9;
    unint64_t v37 = a4;
    __int128 v38 = a5;
    uint64_t v12 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    __int128 v40 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    id v34 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    uint64_t v13 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    id v36 = v8;
    id v14 = [v8 mutableCopy];
    [v14 sortUsingComparator:&stru_1005CE558];
    __int128 v15 = 0LL;
    __int128 v16 = (const void *)kSFNodeKindConnected;
    __int128 v17 = (const void *)kSFNodeKindManaged;
    value = (void *)kSFNodeKindRecent;
    do
    {
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndexedSubscript:v15]);

      CFStringRef v19 = (const __CFSet *)SFNodeCopyKinds(v18);
      uint64_t v20 = v19;
      if (v10 && (int v21 = CFSetContainsValue(v19, v16), v22 = v13, v21)
        || (v23 = CFSetContainsValue(v20, v17), id v22 = v12, v23)
        || v41 && (v24 = CFSetContainsValue(v20, value), id v22 = v40, v24))
      {
        -[NSMutableArray addObject:](v22, "addObject:", v18);
      }

      CFRelease(v20);
      ++v15;
    }

    while ((char *)v11 != v15);
    id v25 = -[NSMutableArray count](v12, "count");
    id v26 = -[NSMutableArray count](v13, "count");
    id v27 = -[NSMutableArray count](v40, "count");
    signed int v28 = -[SDStatusMonitor sidebarMaxCount](v33->_monitor, "sidebarMaxCount");
    else {
      unint64_t v29 = (unint64_t)v27;
    }
    if (v29)
    {
      __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray subarrayWithRange:](v40, "subarrayWithRange:", 0LL));
      -[NSMutableArray addObjectsFromArray:](v34, "addObjectsFromArray:", v30);
    }

    -[NSMutableArray sortUsingComparator:](v34, "sortUsingComparator:", &stru_1005CE578);
    id v9 = v35;
    -[NSMutableArray addObjectsFromArray:](v35, "addObjectsFromArray:", v13);
    -[NSMutableArray addObjectsFromArray:](v35, "addObjectsFromArray:", v12);
    -[NSMutableArray addObjectsFromArray:](v35, "addObjectsFromArray:", v34);

    a4 = v37;
    a5 = v38;
    id v8 = v36;
  }

  char v31 = v10 | v41;
  if (!(v11 | a4)) {
    char v31 = 0;
  }
  *a5 = v31;

  return v9;
}

- (id)neighborhoodNodes
{
  id v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDNodeBrowser domainChildren](self, "domainChildren"));
  -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v4);

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDNodeBrowser workgroupChildren](self, "workgroupChildren"));
  -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v5);

  return v3;
}

- (id)sharePointNodes
{
  unsigned __int8 v3 = -[NSString isEqual:](self->_kind, "isEqual:", kSFBrowserKindPrinter);
  sharePointBrowser = self->_sharePointBrowser;
  if ((v3 & 1) != 0) {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDSharePointBrowser printerNodes](sharePointBrowser, "printerNodes"));
  }
  else {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDSharePointBrowser fileNodes](sharePointBrowser, "fileNodes"));
  }
  return v5;
}

- (id)odiskNodes
{
  unsigned __int8 v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  -[SDNodeBrowser addBonjourChildrenFromCache:](self, "addBonjourChildrenFromCache:", v3);
  -[SDNodeBrowser addConnectedChildrenFromCache:](self, "addConnectedChildrenFromCache:", v3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v3, "allValues"));

  return v4;
}

- (id)airDropNodes
{
  unsigned __int8 v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  -[SDNodeBrowser addBonjourChildrenFromCache:](self, "addBonjourChildrenFromCache:", v3);
  -[SDNodeBrowser addConnectedChildrenFromCache:](self, "addConnectedChildrenFromCache:", v3);
  -[SDNodeBrowser addClassroomChildrenFromCache:](self, "addClassroomChildrenFromCache:", v3);
  -[SDNodeBrowser addRapportChildrenFromCache:](self, "addRapportChildrenFromCache:", v3);
  -[SDNodeBrowser addFakeRangingMeasurementIfAppropriateToNodesInCache:]( self,  "addFakeRangingMeasurementIfAppropriateToNodesInCache:",  v3);
  nodeCoalescer = self->_nodeCoalescer;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v3, "allValues"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[SDNodeCoalescer coalescedNodesForNewAvailableNodes:]( nodeCoalescer,  "coalescedNodesForNewAvailableNodes:",  v5));

  -[SDAirDropDiscoveryLogger updateWithAirDropNodes:](self->_airDropDiscoveryLogger, "updateWithAirDropNodes:", v6);
  -[SDNodeBrowser updateSelectionReasonInNodes:](self, "updateSelectionReasonInNodes:", v6);

  return v6;
}

- (void)unloadBonjour
{
  bonjourDomains = self->_bonjourDomains;
  if (bonjourDomains)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](bonjourDomains, "allObjects"));
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        id v8 = 0LL;
        do
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)v8);
          unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](&OBJC_CLASS___SDServerBrowser, "sharedBrowser"));
          [v10 stopBrowsingDomain:v9];

          id v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v6);
    }

    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v11 removeObserver:self name:@"com.apple.sharingd.BonjourChanged" object:0];

    uint64_t v12 = self->_bonjourDomains;
    self->_bonjourDomains = 0LL;
  }

- (void)unloadWindows
{
  windowsWorkgroups = self->_windowsWorkgroups;
  if (windowsWorkgroups)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](windowsWorkgroups, "allObjects"));
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        id v8 = 0LL;
        do
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)v8);
          unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](&OBJC_CLASS___SDServerBrowser, "sharedBrowser"));
          [v10 stopBrowsingWorkgroup:v9];

          id v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v6);
    }

    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v11 removeObserver:self name:@"com.apple.sharingd.WindowsChanged" object:0];

    uint64_t v12 = self->_windowsWorkgroups;
    self->_windowsWorkgroups = 0LL;
  }

- (void)unloadDomains
{
  if (self->_domainBrowser)
  {
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 removeObserver:self name:@"com.apple.sharingd.DomainsChanged" object:0];

    -[SDDomainBrowser stop](self->_domainBrowser, "stop");
    domainBrowser = self->_domainBrowser;
    self->_domainBrowser = 0LL;
  }

- (void)unloadWorkgroups
{
  if (self->_workgroupBrowser)
  {
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 removeObserver:self name:@"com.apple.sharingd.WorkgroupsChanged" object:0];

    -[SDWorkgroupBrowser stop](self->_workgroupBrowser, "stop");
    workgroupBrowser = self->_workgroupBrowser;
    self->_workgroupBrowser = 0LL;
  }

- (void)unloadSharePoints
{
  sharePointBrowser = self->_sharePointBrowser;
  if (sharePointBrowser)
  {
    -[SDSharePointBrowser setDelegate:](sharePointBrowser, "setDelegate:", 0LL);
    -[SDSharePointBrowser stop](self->_sharePointBrowser, "stop");
    id v4 = self->_sharePointBrowser;
    self->_sharePointBrowser = 0LL;
  }

- (void)unloadConnected
{
  if (self->_connectedBrowser)
  {
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 removeObserver:self name:@"com.apple.sharingd.ConnectedChanged" object:0];

    -[SDConnectedBrowser stop](self->_connectedBrowser, "stop");
    connectedBrowser = self->_connectedBrowser;
    self->_connectedBrowser = 0LL;
  }

- (void)unloadManaged
{
  if (self->_managedBrowser)
  {
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 removeObserver:self name:@"com.apple.sharingd.ManagedChanged" object:0];

    -[SDManagedBrowser stop](self->_managedBrowser, "stop");
    managedBrowser = self->_managedBrowser;
    self->_managedBrowser = 0LL;
  }

- (void)unloadClassroom
{
  if (self->_classroomBrowser)
  {
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 removeObserver:self name:@"com.apple.sharingd.ClassroomChanged" object:0];

    -[SDClassroomBrowser stop](self->_classroomBrowser, "stop");
    classroomBrowser = self->_classroomBrowser;
    self->_classroomBrowser = 0LL;
  }

- (void)unloadODisk
{
  odiskDomains = self->_odiskDomains;
  if (odiskDomains)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](odiskDomains, "allObjects"));
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        id v8 = 0LL;
        do
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)v8);
          unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](&OBJC_CLASS___SDServerBrowser, "sharedBrowser"));
          [v10 stopODiskBrowsing:v9];

          id v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v6);
    }

    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v11 removeObserver:self name:@"com.apple.sharingd.ODisksChanged" object:0];

    uint64_t v12 = self->_odiskDomains;
    self->_odiskDomains = 0LL;
  }

- (void)unloadAirDrop
{
  airDropDomains = self->_airDropDomains;
  if (airDropDomains)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](airDropDomains, "allObjects"));
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        id v8 = 0LL;
        do
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)v8);
          unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](&OBJC_CLASS___SDServerBrowser, "sharedBrowser"));
          [v10 stopAirDropBrowsing:v9];

          id v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v6);
    }

    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v11 removeObserver:self name:@"com.apple.sharingd.AirDropChanged" object:0];

    uint64_t v12 = self->_airDropDomains;
    self->_airDropDomains = 0LL;
  }

- (void)unloadSidebarPrefsMonitor
{
  if (-[NSString isEqual:](self->_kind, "isEqual:", kSFBrowserKindNetwork))
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 removeObserver:self name:@"com.apple.sharingd.FinderPrefsChanged" object:0];
  }

- (void)unloadRapport
{
  if (self->_rapportBrowser)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 removeObserver:self name:@"com.apple.sharingd.RapportChanged" object:0];

    -[SDRapportBrowser stop](self->_rapportBrowser, "stop");
    rapportBrowser = self->_rapportBrowser;
    self->_rapportBrowser = 0LL;
  }

- (void)start
{
  if (!self->_coalescer)
  {
    id location = 0LL;
    objc_initWeak(&location, self);
    id v3 = objc_opt_new(&OBJC_CLASS___CUCoalescer);
    coalescer = self->_coalescer;
    self->_coalescer = v3;

    -[CUCoalescer setDispatchQueue:](self->_coalescer, "setDispatchQueue:", self->_queue);
    -[CUCoalescer setMaxDelay:](self->_coalescer, "setMaxDelay:", 0.05);
    -[CUCoalescer setMinDelay:](self->_coalescer, "setMinDelay:", 0.02);
    uint64_t v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472LL;
    unint64_t v11 = sub_10010442C;
    uint64_t v12 = &unk_1005CB220;
    objc_copyWeak(&v13, &location);
    -[CUCoalescer setActionHandler:](self->_coalescer, "setActionHandler:", &v9);
    if (SFNodeIsNeighborhood(self->_parent))
    {
      -[SDNodeBrowser loadBonjour](self, "loadBonjour", v9, v10, v11, v12);
      -[SDNodeBrowser loadWindows](self, "loadWindows");
      -[SDNodeBrowser loadDomains](self, "loadDomains");
    }

    else if (SFNodeIsServer(self->_parent))
    {
      -[SDNodeBrowser loadSharePoints](self, "loadSharePoints", v9, v10, v11, v12);
    }

    if (SFNodeIsRoot(self->_parent))
    {
      -[SDNodeBrowser loadWorkgroups](self, "loadWorkgroups");
      -[SDNodeBrowser loadConnected](self, "loadConnected");
      -[SDNodeBrowser loadManaged](self, "loadManaged");
      -[SDNodeBrowser loadClassroom](self, "loadClassroom");
      -[SDNodeBrowser loadODisk](self, "loadODisk");
      -[SDNodeBrowser loadRapport](self, "loadRapport");
      -[SDNodeBrowser loadAirDrop](self, "loadAirDrop");
      -[SDNodeBrowser loadSidebarPrefsMonitor](self, "loadSidebarPrefsMonitor");
    }

    -[CUCoalescer trigger](self->_coalescer, "trigger", v9, v10, v11, v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  if (!self->_airDropDiscoveryLogger)
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___SDAirDropDiscoveryLogger);
    airDropDiscoveryLogger = self->_airDropDiscoveryLogger;
    self->_airDropDiscoveryLogger = v5;

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_options,  "objectForKeyedSubscript:",  kSFBrowserOptionsShouldDisableDiscoveryMetricsKey));
    unsigned int v8 = [v7 BOOLValueSafe];

    if (v8) {
      self->_shouldCollectNodeCoalescerMetrics = 0;
    }
    self->_startTime = CFAbsoluteTimeGetCurrent();
  }

- (void)stop
{
  if (self->_coalescer)
  {
    -[SDNodeBrowser unloadBonjour](self, "unloadBonjour");
    -[SDNodeBrowser unloadWindows](self, "unloadWindows");
    -[SDNodeBrowser unloadDomains](self, "unloadDomains");
    -[SDNodeBrowser unloadSharePoints](self, "unloadSharePoints");
    -[SDNodeBrowser unloadWorkgroups](self, "unloadWorkgroups");
    -[SDNodeBrowser unloadConnected](self, "unloadConnected");
    -[SDNodeBrowser unloadManaged](self, "unloadManaged");
    -[SDNodeBrowser unloadClassroom](self, "unloadClassroom");
    -[SDNodeBrowser unloadODisk](self, "unloadODisk");
    -[SDNodeBrowser unloadAirDrop](self, "unloadAirDrop");
    -[SDNodeBrowser unloadRapport](self, "unloadRapport");
    SFNodeSetConnectionState(self->_parent, 0LL);
    -[CUCoalescer invalidate](self->_coalescer, "invalidate");
    coalescer = self->_coalescer;
    self->_coalescer = 0LL;
  }

  airDropDiscoveryLogger = self->_airDropDiscoveryLogger;
  if (airDropDiscoveryLogger)
  {
    if (self->_shouldCollectNodeCoalescerMetrics)
    {
      -[SDAirDropDiscoveryLogger logMetricsWithSessionTime:]( airDropDiscoveryLogger,  "logMetricsWithSessionTime:",  CFAbsoluteTimeGetCurrent() - self->_startTime);
      airDropDiscoveryLogger = self->_airDropDiscoveryLogger;
    }

    self->_airDropDiscoveryLogger = 0LL;

    self->_startTime = 0.0;
  }

- (void)appendAllNode:(id)a3
{
  id v6 = a3;
  if (!qword_100657118)
  {
    CFStringRef v3 = sub_10008D598(@"All...");
    CFStringRef v4 = v3;
    if (v3) {
      id v5 = v3;
    }
    else {
      id v5 = @"All...";
    }
    qword_100657118 = SFNodeCreate(0LL, v5, @"All...");
    SFNodeAddKind(qword_100657118, kSFNodeKindAll);
    if (v4) {
      CFRelease(v4);
    }
  }

  [v6 addObject:qword_100657118];
}

- (id)nodesInternal:(BOOL)a3
{
  BOOL v3 = a3;
  char v15 = 0;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDNodeBrowser neighborhoodNodes](self, "neighborhoodNodes"));
  id v6 = [v5 count];
  uint64_t v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  else {
    BOOL v8 = 0;
  }
  if (-[NSString isEqual:](self->_kind, "isEqual:", kSFBrowserKindRemoteDisc))
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue(-[SDNodeBrowser odiskNodes](self, "odiskNodes"));
LABEL_8:
    uint64_t v10 = (NSMutableDictionary *)v9;
    -[NSMutableArray addObjectsFromArray:](v7, "addObjectsFromArray:", v9);
    goto LABEL_12;
  }

  if (-[NSString isEqual:](self->_kind, "isEqual:", kSFBrowserKindAirDrop))
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue(-[SDNodeBrowser airDropNodes](self, "airDropNodes"));
    goto LABEL_8;
  }

  uint64_t v10 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  -[SDNodeBrowser addBonjourChildrenFromCache:](self, "addBonjourChildrenFromCache:", v10);
  -[SDNodeBrowser addWindowsChildrenFromCache:](self, "addWindowsChildrenFromCache:", v10);
  -[SDNodeBrowser addManagedChildrenFromCache:](self, "addManagedChildrenFromCache:", v10);
  -[SDNodeBrowser addConnectedChildrenFromCache:](self, "addConnectedChildrenFromCache:", v10);
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v10, "allValues"));
  if (v8)
  {
    uint64_t v12 = objc_claimAutoreleasedReturnValue( -[SDNodeBrowser sidebarNodesFromServerNodes:nonServerCount:addAllNode:]( self,  "sidebarNodesFromServerNodes:nonServerCount:addAllNode:",  v11,  v6,  &v15));

    unint64_t v11 = (void *)v12;
  }

  -[NSMutableArray addObjectsFromArray:](v7, "addObjectsFromArray:", v11);

LABEL_12:
  if (self->_sharePointBrowser)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDNodeBrowser sharePointNodes](self, "sharePointNodes"));
    -[NSMutableArray addObjectsFromArray:](v7, "addObjectsFromArray:", v13);
  }

  if (v8)
  {
    if (v15 && -[SDStatusMonitor allEnabled](self->_monitor, "allEnabled")) {
      -[SDNodeBrowser appendAllNode:](self, "appendAllNode:", v7);
    }
  }

  else if (v6)
  {
    -[NSMutableArray addObjectsFromArray:](v7, "addObjectsFromArray:", v5);
  }

  return v7;
}

- (NSArray)nodes
{
  return (NSArray *)-[SDNodeBrowser nodesInternal:](self, "nodesInternal:", 0LL);
}

- (NSArray)sidebarNodes
{
  return (NSArray *)-[SDNodeBrowser nodesInternal:](self, "nodesInternal:", 1LL);
}

- (int)addNode:(__SFNode *)a3
{
  connectedBrowser = self->_connectedBrowser;
  if (connectedBrowser) {
    return -[SDConnectedBrowser addNode:](connectedBrowser, "addNode:", a3);
  }
  else {
    return -1;
  }
}

- (int)removeNode:(__SFNode *)a3
{
  id v5 = (const __CFSet *)SFNodeCopyKinds(a3);
  if (!v5) {
    return -1;
  }
  id v6 = v5;
  if (CFSetContainsValue(v5, kSFNodeKindPerson) || (connectedBrowser = self->_connectedBrowser) == 0LL) {
    int v7 = -1;
  }
  else {
    int v7 = -[SDConnectedBrowser removeNode:](connectedBrowser, "removeNode:", a3);
  }
  CFRelease(v6);
  return v7;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (SDXPCHelperConnection)helperConnection
{
  return (SDXPCHelperConnection *)objc_loadWeakRetained((id *)&self->_helperConnection);
}

- (void)setHelperConnection:(id)a3
{
}

- (SDNodeBrowserDelegate)delegate
{
  return (SDNodeBrowserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (OS_xpc_object)connection
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 264LL, 1);
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end