@interface NWStatsTargetSelector
- (BOOL)_applySelection:(id)a3;
- (BOOL)shouldAddProvider:(int)a3;
- (NSDictionary)suppliedParams;
- (NWStatsTargetSelector)initWithMultipleSelections:(id)a3;
- (NWStatsTargetSelector)initWithSelection:(id)a3;
- (id)description;
- (unint64_t)connFilter;
- (unint64_t)events;
- (unint64_t)filter;
- (void)setConnFilter:(unint64_t)a3;
- (void)setEvents:(unint64_t)a3;
- (void)setFilter:(unint64_t)a3;
- (void)setSuppliedParams:(id)a3;
@end

@implementation NWStatsTargetSelector

- (BOOL)_applySelection:(id)a3
{
  uint64_t v97 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  objc_storeStrong((id *)&self->_suppliedParams, a3);
  [v5 objectForKeyedSubscript:@"kNWStatsSelectFlowEvents"];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    [v5 objectForKeyedSubscript:@"kNWStatsSelectFlowEvents"];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      [v5 objectForKeyedSubscript:@"kNWStatsSelectFlowEvents"];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      self->_events |= [v9 unsignedLongLongValue];
    }

    else
    {
      NStatGetLog();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
      {
        [v5 objectForKeyedSubscript:@"kNWStatsSelectFlowEvents"];
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        int v95 = 138412290;
        v96 = v10;
        _os_log_impl( &dword_187FF5000,  (os_log_t)v9,  OS_LOG_TYPE_ERROR,  "Incorrect class for configuration item %@",  (uint8_t *)&v95,  0xCu);
      }
    }
  }

  [v5 objectForKeyedSubscript:@"kNWStatsSelectConnEvents"];
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    [v5 objectForKeyedSubscript:@"kNWStatsSelectConnEvents"];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    char v13 = objc_opt_isKindOfClass();

    if ((v13 & 1) != 0)
    {
      [v5 objectForKeyedSubscript:@"kNWStatsSelectConnEvents"];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      self->_events |= [v14 unsignedLongLongValue];
    }

    else
    {
      NStatGetLog();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
      {
        [v5 objectForKeyedSubscript:@"kNWStatsSelectConnEvents"];
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        int v95 = 138412290;
        v96 = v15;
        _os_log_impl( &dword_187FF5000,  (os_log_t)v14,  OS_LOG_TYPE_ERROR,  "Incorrect class for configuration item %@",  (uint8_t *)&v95,  0xCu);
      }
    }
  }

  uint64_t v16 = [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceCellular"];
  if (v16)
  {
    v17 = (void *)v16;
    [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceCellular"];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    int v19 = [v18 BOOLValue];

    if (v19) {
      self->_filter |= 4uLL;
    }
  }

  uint64_t v20 = [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceWiFi"];
  if (v20)
  {
    v21 = (void *)v20;
    [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceWiFi"];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    int v23 = [v22 BOOLValue];

    if (v23) {
      self->_filter |= 8uLL;
    }
  }

  uint64_t v24 = [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceWired"];
  if (v24)
  {
    v25 = (void *)v24;
    [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceWired"];
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    int v27 = [v26 BOOLValue];

    if (v27) {
      self->_filter |= 0x10uLL;
    }
  }

  uint64_t v28 = [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceCompanionLink"];
  if (v28)
  {
    v29 = (void *)v28;
    [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceCompanionLink"];
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    int v31 = [v30 BOOLValue];

    if (v31) {
      self->_filter |= 0x200uLL;
    }
  }

  uint64_t v32 = [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceCompanionLinkBluetooth"];
  if (v32)
  {
    v33 = (void *)v32;
    [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceCompanionLinkBluetooth"];
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    int v35 = [v34 BOOLValue];

    if (v35) {
      self->_filter |= 0x400000040000uLL;
    }
  }

  uint64_t v36 = [v5 objectForKeyedSubscript:@"kNWStatsSelectBluetoothCounts"];
  if (v36)
  {
    v37 = (void *)v36;
    [v5 objectForKeyedSubscript:@"kNWStatsSelectBluetoothCounts"];
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    int v39 = [v38 BOOLValue];

    if (v39) {
      self->_filter |= 0x400000000000uLL;
    }
  }

  uint64_t v40 = [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceLoopback"];
  if (v40)
  {
    v41 = (void *)v40;
    [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceLoopback"];
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    int v43 = [v42 BOOLValue];

    if (v43) {
      self->_filter |= 2uLL;
    }
  }

  uint64_t v44 = [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceExpensive"];
  if (v44)
  {
    v45 = (void *)v44;
    [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceExpensive"];
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    int v47 = [v46 BOOLValue];

    if (v47) {
      self->_filter |= 0x40uLL;
    }
  }

  uint64_t v48 = [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceCellularViaFallback"];
  if (v48)
  {
    v49 = (void *)v48;
    [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceCellularViaFallback"];
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    int v51 = [v50 BOOLValue];

    if (v51) {
      self->_filter |= 0x100uLL;
    }
  }

  uint64_t v52 = [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceAWDL"];
  if (v52)
  {
    v53 = (void *)v52;
    [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceAWDL"];
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    int v55 = [v54 BOOLValue];

    if (v55) {
      self->_filter |= 0x20uLL;
    }
  }

  uint64_t v56 = [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceUnknown"];
  if (v56)
  {
    v57 = (void *)v56;
    [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceUnknown"];
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    int v59 = [v58 BOOLValue];

    if (v59) {
      self->_filter |= 1uLL;
    }
  }

  uint64_t v60 = [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceRouteValueError"];
  if (v60)
  {
    v61 = (void *)v60;
    [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceRouteValueError"];
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    int v63 = [v62 BOOLValue];

    if (v63) {
      self->_filter |= 0x2000uLL;
    }
  }

  uint64_t v64 = [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceFlowswitchValueError"];
  if (v64)
  {
    v65 = (void *)v64;
    [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceFlowswitchValueError"];
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    int v67 = [v66 BOOLValue];

    if (v67) {
      self->_filter |= 0x4000uLL;
    }
  }

  [v5 objectForKeyedSubscript:@"kNWStatsSelectAllFlowsAndSubFlows"];
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  if (v68)
  {
    [v5 objectForKeyedSubscript:@"kNWStatsSelectAllFlowsAndSubFlows"];
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    char v70 = [v69 BOOLValue];
    self->_hasExplicitTCP = 1;
    self->_explicitTCPValue = v70;
    self->_hasExplicitUDP = 1;
    self->_explicitUDPValue = v70;
    self->_hasExplicitQUIC = 1;
    self->_explicitQUICValue = v70;
    self->_hasExplicitUDPSubFlows = 1;
    self->_explicitUDPSubFlowsValue = v70;
  }

  [v5 objectForKeyedSubscript:@"kNWStatsSelectAllFlows"];
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  if (v71)
  {
    [v5 objectForKeyedSubscript:@"kNWStatsSelectAllFlows"];
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    char v73 = [v72 BOOLValue];
    self->_hasExplicitTCP = 1;
    self->_explicitTCPValue = v73;
    self->_hasExplicitUDP = 1;
    self->_explicitUDPValue = v73;
    self->_hasExplicitQUIC = 1;
    self->_explicitQUICValue = v73;
  }

  [v5 objectForKeyedSubscript:@"kNWStatsSelectTCP"];
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  if (v74)
  {
    [v5 objectForKeyedSubscript:@"kNWStatsSelectTCP"];
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    self->_hasExplicitTCP = 1;
    self->_explicitTCPValue = [v75 BOOLValue];
  }

  [v5 objectForKeyedSubscript:@"kNWStatsSelectUDP"];
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  if (v76)
  {
    [v5 objectForKeyedSubscript:@"kNWStatsSelectUDP"];
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    self->_hasExplicitUDP = 1;
    self->_explicitUDPValue = [v77 BOOLValue];
  }

  [v5 objectForKeyedSubscript:@"kNWStatsSelectUDPSubFlows"];
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  if (v78)
  {
    [v5 objectForKeyedSubscript:@"kNWStatsSelectUDPSubFlows"];
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    self->_hasExplicitUDPSubFlows = 1;
    self->_explicitUDPSubFlowsValue = [v79 BOOLValue];
  }

  [v5 objectForKeyedSubscript:@"kNWStatsSelectQUIC"];
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  if (v80)
  {
    [v5 objectForKeyedSubscript:@"kNWStatsSelectQUIC"];
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    self->_hasExplicitQUIC = 1;
    self->_explicitQUICValue = [v81 BOOLValue];
  }

  [v5 objectForKeyedSubscript:@"kNWStatsSelectFlowUsesChannels"];
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  if (v82)
  {
    [v5 objectForKeyedSubscript:@"kNWStatsSelectFlowUsesChannels"];
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    self->_hasExplicitChannels = 1;
    self->_explicitChannelsValue = [v83 BOOLValue];
  }

  [v5 objectForKeyedSubscript:@"kNWStatsSelectFlowUsesSockets"];
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  if (v84)
  {
    [v5 objectForKeyedSubscript:@"kNWStatsSelectFlowUsesSockets"];
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    self->_hasExplicitSockets = 1;
    self->_explicitSocketsValue = [v85 BOOLValue];
  }

  [v5 objectForKeyedSubscript:@"kNWStatsSelectUserlandConnections"];
  v86 = (void *)objc_claimAutoreleasedReturnValue();

  if (v86)
  {
    [v5 objectForKeyedSubscript:@"kNWStatsSelectUserlandConnections"];
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    self->_hasExplicitUserlandConnections = 1;
    self->_explicitUserlandConnectionsValue = [v87 BOOLValue];
  }

  [v5 objectForKeyedSubscript:@"kNWStatsSelectConnHasNetAccess"];
  v88 = (void *)objc_claimAutoreleasedReturnValue();

  if (v88)
  {
    [v5 objectForKeyedSubscript:@"kNWStatsSelectConnHasNetAccess"];
    v89 = (void *)objc_claimAutoreleasedReturnValue();
  }

  [v5 objectForKeyedSubscript:@"kNWStatsSelectStartupConnHasNetAccess"];
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  if (v90)
  {
    [v5 objectForKeyedSubscript:@"kNWStatsSelectStartupConnHasNetAccess"];
    v91 = (void *)objc_claimAutoreleasedReturnValue();
  }

  [v5 objectForKeyedSubscript:@"kNWStatsSelectTuneSkipNoChangeConnOnRefresh"];
  v92 = (void *)objc_claimAutoreleasedReturnValue();

  if (v92)
  {
    [v5 objectForKeyedSubscript:@"kNWStatsSelectTuneSkipNoChangeConnOnRefresh"];
    v93 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return 1;
}

- (NWStatsTargetSelector)initWithSelection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NWStatsTargetSelector;
  id v5 = -[NWStatsTargetSelector init](&v8, sel_init);
  v6 = v5;
  if (v5 && !-[NWStatsTargetSelector _applySelection:](v5, "_applySelection:", v4))
  {

    v6 = 0LL;
  }

  return v6;
}

- (NWStatsTargetSelector)initWithMultipleSelections:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NWStatsTargetSelector;
  id v5 = -[NWStatsTargetSelector init](&v16, sel_init);
  if (v5)
  {
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          if (!-[NWStatsTargetSelector _applySelection:]( v5,  "_applySelection:",  *(void *)(*((void *)&v12 + 1) + 8 * i),  (void)v12))
          {

            id v5 = 0LL;
            goto LABEL_12;
          }
        }

        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

- (BOOL)shouldAddProvider:(int)a3
{
  if (self->_hasExplicitTCP)
  {
    BOOL explicitTCPValue = self->_explicitTCPValue;
    BOOL hasExplicitUDP = self->_hasExplicitUDP;
    if (!hasExplicitUDP)
    {
      char v5 = 0;
      goto LABEL_7;
    }

    goto LABEL_6;
  }

  if (self->_hasExplicitUDP)
  {
    BOOL explicitTCPValue = 0;
LABEL_6:
    BOOL hasExplicitUDP = self->_explicitUDPValue;
    char v5 = 1;
    goto LABEL_7;
  }

  BOOL explicitTCPValue = !self->_hasExplicitQUIC && !self->_hasExplicitUDPSubFlows && !self->_hasExplicitUserlandConnections;
  if (self->_hasExplicitQUIC || self->_hasExplicitUDPSubFlows)
  {
    char v5 = 0;
    BOOL hasExplicitUDP = 0;
  }

  else
  {
    char v5 = 0;
    BOOL hasExplicitUDP = !self->_hasExplicitUserlandConnections;
  }

- (id)description
{
  return (id)[objc_alloc(NSString) initWithFormat:@"NWStatsTargetSelector at %p, filter 0x%llx connFilter 0x%llx events 0x%llx cfg UDP %d val %d cfg TCP %d val %d cfg QUIC %d val %d cfg subflows %d val %d cfg conns %d val %d cfg channels %d val %d cfg sockets %d val %d params %@", self, self->_filter, self->_connFilter, self->_events, self->_hasExplicitUDP, self->_explicitUDPValue, self->_hasExplicitTCP, self->_explicitTCPValue, self->_hasExplicitQUIC, self->_explicitQUICValue, self->_hasExplicitUDPSubFlows, self->_explicitUDPSubFlowsValue, self->_hasExplicitUserlandConnections, self->_explicitUserlandConnectionsValue, self->_hasExplicitChannels, self->_explicitChannelsValue, self->_hasExplicitSockets, self->_explicitSocketsValue, self->_suppliedParams];
}

- (NSDictionary)suppliedParams
{
  return (NSDictionary *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setSuppliedParams:(id)a3
{
}

- (unint64_t)filter
{
  return self->_filter;
}

- (void)setFilter:(unint64_t)a3
{
  self->_filter = a3;
}

- (unint64_t)connFilter
{
  return self->_connFilter;
}

- (void)setConnFilter:(unint64_t)a3
{
  self->_connFilter = a3;
}

- (unint64_t)events
{
  return self->_events;
}

- (void)setEvents:(unint64_t)a3
{
  self->_events = a3;
}

- (void).cxx_destruct
{
}

@end