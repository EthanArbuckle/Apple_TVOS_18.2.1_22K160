@interface NWSInterfaceSnapshot
- (NSString)interfaceDescription;
- (NSString)interfaceName;
- (NWSInterfaceSnapshot)initWithCounts:(const nstat_counts *)a3 interfaceDescriptor:(nstat_ifnet_descriptor *)a4 sourceIdent:(unint64_t)a5 seqno:(unint64_t)a6;
- (id)description;
- (id)provider;
- (id)traditionalDictionary;
- (unint64_t)cellConfigBackoffTime;
- (unint64_t)cellConfigInactivityTime;
- (unint64_t)cellUlAvgQueueSize;
- (unint64_t)cellUlMaxQueueSize;
- (unint64_t)cellUlMinQueueSize;
- (unint64_t)dlEffectiveBandwidth;
- (unint64_t)dlMaxBandwidth;
- (unint64_t)linkQualityMetric;
- (unint64_t)threshold;
- (unint64_t)ulBytesLost;
- (unint64_t)ulEffectiveBandwidth;
- (unint64_t)ulEffectiveLatency;
- (unint64_t)ulMaxBandwidth;
- (unint64_t)ulMaxLatency;
- (unint64_t)ulMinLatency;
- (unint64_t)ulReTxtLevel;
- (unint64_t)wifiConfigFrequency;
- (unint64_t)wifiConfigMulticastRate;
- (unint64_t)wifiDlEffectiveLatency;
- (unint64_t)wifiDlErrorRate;
- (unint64_t)wifiDlMaxLatency;
- (unint64_t)wifiDlMinLatency;
- (unint64_t)wifiScanCount;
- (unint64_t)wifiScanDuration;
- (unint64_t)wifiUlErrorRate;
- (unsigned)interfaceIndex;
- (unsigned)interfaceType;
- (void)_handleCellExtra:(nstat_ifnet_desc_cellular_status *)a3;
- (void)_handleDescriptor:(nstat_ifnet_descriptor *)a3;
- (void)_handleWifiExtra:(nstat_ifnet_desc_wifi_status *)a3;
- (void)_invalidateAllExtraCounts;
- (void)_invalidateCellCounts;
- (void)_invalidateCommonCounts;
- (void)_invalidateWifiCounts;
- (void)setCellConfigBackoffTime:(unint64_t)a3;
- (void)setCellConfigInactivityTime:(unint64_t)a3;
- (void)setCellUlAvgQueueSize:(unint64_t)a3;
- (void)setCellUlMaxQueueSize:(unint64_t)a3;
- (void)setCellUlMinQueueSize:(unint64_t)a3;
- (void)setDlEffectiveBandwidth:(unint64_t)a3;
- (void)setDlMaxBandwidth:(unint64_t)a3;
- (void)setLinkQualityMetric:(unint64_t)a3;
- (void)setUlBytesLost:(unint64_t)a3;
- (void)setUlEffectiveBandwidth:(unint64_t)a3;
- (void)setUlEffectiveLatency:(unint64_t)a3;
- (void)setUlMaxBandwidth:(unint64_t)a3;
- (void)setUlMaxLatency:(unint64_t)a3;
- (void)setUlMinLatency:(unint64_t)a3;
- (void)setUlReTxtLevel:(unint64_t)a3;
- (void)setWifiConfigFrequency:(unint64_t)a3;
- (void)setWifiConfigMulticastRate:(unint64_t)a3;
- (void)setWifiDlEffectiveLatency:(unint64_t)a3;
- (void)setWifiDlErrorRate:(unint64_t)a3;
- (void)setWifiDlMaxLatency:(unint64_t)a3;
- (void)setWifiDlMinLatency:(unint64_t)a3;
- (void)setWifiScanCount:(unint64_t)a3;
- (void)setWifiScanDuration:(unint64_t)a3;
- (void)setWifiUlErrorRate:(unint64_t)a3;
@end

@implementation NWSInterfaceSnapshot

- (id)provider
{
  return @"Interface";
}

- (unsigned)interfaceType
{
  return self->_descriptor.type;
}

- (NSString)interfaceName
{
  interfaceName = self->_interfaceName;
  if (!interfaceName)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%.16s", self->_descriptor.name);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_interfaceName;
    self->_interfaceName = v4;

    interfaceName = self->_interfaceName;
  }

  return interfaceName;
}

- (NSString)interfaceDescription
{
  interfaceDescription = self->_interfaceDescription;
  if (!interfaceDescription)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%.128s", self->_descriptor.description);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_interfaceDescription;
    self->_interfaceDescription = v4;

    interfaceDescription = self->_interfaceDescription;
  }

  return interfaceDescription;
}

- (unsigned)interfaceIndex
{
  return self->_descriptor.ifindex;
}

- (unint64_t)threshold
{
  return self->_descriptor.threshold;
}

- (void)_invalidateCommonCounts
{
  self->_linkQualityMetric = -1LL;
  self->_ulMaxBandwidth = -1LL;
  self->_ulEffectiveBandwidth = -1LL;
  self->_ulBytesLost = -1LL;
  self->_ulMinLatency = -1LL;
  self->_ulEffectiveLatency = -1LL;
  self->_ulMaxLatency = -1LL;
  self->_dlMaxBandwidth = -1LL;
  self->_dlEffectiveBandwidth = -1LL;
}

- (void)_invalidateCellCounts
{
  self->_cellUlMinQueueSize = -1LL;
  self->_cellUlAvgQueueSize = -1LL;
  self->_cellUlMaxQueueSize = -1LL;
  self->_cellConfigInactivityTime = -1LL;
  self->_cellConfigBackoffTime = -1LL;
}

- (void)_invalidateWifiCounts
{
  self->_wifiUlErrorRate = -1LL;
  self->_wifiDlMinLatency = -1LL;
  self->_wifiDlEffectiveLatency = -1LL;
  self->_wifiDlMaxLatency = -1LL;
  self->_wifiDlErrorRate = -1LL;
  self->_wifiConfigFrequency = -1LL;
  self->_wifiConfigMulticastRate = -1LL;
  self->_wifiScanCount = -1LL;
  self->_wifiScanDuration = -1LL;
}

- (void)_invalidateAllExtraCounts
{
}

- (id)traditionalDictionary
{
  v38.receiver = self;
  v38.super_class = (Class)&OBJC_CLASS___NWSInterfaceSnapshot;
  v3 = -[NWSSnapshot _createCountsForProvider:](&v38, sel__createCountsForProvider_, 6LL);
  v4 = v3;
  if (v3)
  {
    [v3 setObject:kNStatProviderInterface forKeyedSubscript:kNStatSrcKeyProvider];
    v5 = -[NWSInterfaceSnapshot interfaceName](self, "interfaceName");
    if (v5)
    {
      v6 = -[NWSInterfaceSnapshot interfaceName](self, "interfaceName");
      [v4 setObject:v6 forKeyedSubscript:kNStatSrcKeyInterfaceName];
    }
    v7 = -[NWSInterfaceSnapshot interfaceDescription](self, "interfaceDescription");
    if (v7)
    {
      v8 = -[NWSInterfaceSnapshot interfaceDescription](self, "interfaceDescription");
      [v4 setObject:v8 forKeyedSubscript:kNStatSrcKeyInterfaceDescription];
    }

    [MEMORY[0x189607968] numberWithUnsignedInt:self->_descriptor.type];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v9 forKeyedSubscript:kNStatSrcKeyInterfaceType];

    [MEMORY[0x189607968] numberWithUnsignedInt:self->_descriptor.ifindex];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v10 forKeyedSubscript:kNStatSrcKeyInterface];

    [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_descriptor.threshold];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v11 forKeyedSubscript:kNStatSrcKeyInterfaceThreshold];

    if (-[NWSInterfaceSnapshot linkQualityMetric](self, "linkQualityMetric") != -1)
    {
      objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  -[NWSInterfaceSnapshot linkQualityMetric](self, "linkQualityMetric"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 setValue:v12 forKey:kNStatSrcKeyInterfaceLinkQualityMetric];
    }

    if (-[NWSInterfaceSnapshot ulMaxBandwidth](self, "ulMaxBandwidth") != -1)
    {
      objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  -[NWSInterfaceSnapshot ulMaxBandwidth](self, "ulMaxBandwidth"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 setValue:v13 forKey:kNStatSrcKeyInterfaceUlMaxBandwidth];
    }

    if (-[NWSInterfaceSnapshot ulEffectiveBandwidth](self, "ulEffectiveBandwidth") != -1)
    {
      objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  -[NWSInterfaceSnapshot ulEffectiveBandwidth](self, "ulEffectiveBandwidth"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 setValue:v14 forKey:kNStatSrcKeyInterfaceUlCurrentBandwidth];
    }

    if (-[NWSInterfaceSnapshot ulBytesLost](self, "ulBytesLost") != -1)
    {
      objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  -[NWSInterfaceSnapshot ulBytesLost](self, "ulBytesLost"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 setValue:v15 forKey:kNStatSrcKeyInterfaceUlBytesLost];
    }

    if (-[NWSInterfaceSnapshot ulMinLatency](self, "ulMinLatency") != -1)
    {
      objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  -[NWSInterfaceSnapshot ulMinLatency](self, "ulMinLatency"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 setValue:v16 forKey:kNStatSrcKeyInterfaceUlMinLatency];
    }

    if (-[NWSInterfaceSnapshot ulEffectiveLatency](self, "ulEffectiveLatency") != -1)
    {
      objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  -[NWSInterfaceSnapshot ulEffectiveLatency](self, "ulEffectiveLatency"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 setValue:v17 forKey:kNStatSrcKeyInterfaceUlEffectiveLatency];
    }

    if (-[NWSInterfaceSnapshot ulMaxLatency](self, "ulMaxLatency") != -1)
    {
      objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  -[NWSInterfaceSnapshot ulMaxLatency](self, "ulMaxLatency"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 setValue:v18 forKey:kNStatSrcKeyInterfaceUlMaxLatency];
    }

    if (-[NWSInterfaceSnapshot ulReTxtLevel](self, "ulReTxtLevel") != -1)
    {
      objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  -[NWSInterfaceSnapshot ulReTxtLevel](self, "ulReTxtLevel"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 setValue:v19 forKey:kNStatSrcKeyInterfaceUlReTxtLevel];
    }

    if (-[NWSInterfaceSnapshot dlMaxBandwidth](self, "dlMaxBandwidth") != -1)
    {
      objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  -[NWSInterfaceSnapshot dlMaxBandwidth](self, "dlMaxBandwidth"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 setValue:v20 forKey:kNStatSrcKeyInterfaceDlMaxBandwidth];
    }

    if (-[NWSInterfaceSnapshot dlEffectiveBandwidth](self, "dlEffectiveBandwidth") != -1)
    {
      objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  -[NWSInterfaceSnapshot dlEffectiveBandwidth](self, "dlEffectiveBandwidth"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 setValue:v21 forKey:kNStatSrcKeyInterfaceDlCurrentBandwidth];
    }

    if (-[NWSInterfaceSnapshot cellUlMinQueueSize](self, "cellUlMinQueueSize") != -1)
    {
      objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  -[NWSInterfaceSnapshot cellUlMinQueueSize](self, "cellUlMinQueueSize"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 setValue:v22 forKey:kNStatSrcKeyInterfaceCellUlMinQueueSize];
    }

    if (-[NWSInterfaceSnapshot cellUlAvgQueueSize](self, "cellUlAvgQueueSize") != -1)
    {
      objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  -[NWSInterfaceSnapshot cellUlAvgQueueSize](self, "cellUlAvgQueueSize"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 setValue:v23 forKey:kNStatSrcKeyInterfaceCellUlAvgQueueSize];
    }

    if (-[NWSInterfaceSnapshot cellUlMaxQueueSize](self, "cellUlMaxQueueSize") != -1)
    {
      objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  -[NWSInterfaceSnapshot cellUlMaxQueueSize](self, "cellUlMaxQueueSize"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 setValue:v24 forKey:kNStatSrcKeyInterfaceCellUlMaxQueueSize];
    }

    if (-[NWSInterfaceSnapshot cellConfigInactivityTime](self, "cellConfigInactivityTime") != -1)
    {
      objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  -[NWSInterfaceSnapshot cellConfigInactivityTime](self, "cellConfigInactivityTime"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 setValue:v25 forKey:kNStatSrcKeyInterfaceCellConfigInactivityTime];
    }

    if (-[NWSInterfaceSnapshot cellConfigBackoffTime](self, "cellConfigBackoffTime") != -1)
    {
      objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  -[NWSInterfaceSnapshot cellConfigBackoffTime](self, "cellConfigBackoffTime"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 setValue:v26 forKey:kNStatSrcKeyInterfaceCellConfigBackoffTime];
    }

    if (-[NWSInterfaceSnapshot wifiDlMinLatency](self, "wifiDlMinLatency") != -1)
    {
      objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  -[NWSInterfaceSnapshot wifiDlMinLatency](self, "wifiDlMinLatency"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 setValue:v27 forKey:kNStatSrcKeyInterfaceWifiDlMinLatency];
    }

    if (-[NWSInterfaceSnapshot wifiDlEffectiveLatency](self, "wifiDlEffectiveLatency") != -1)
    {
      objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  -[NWSInterfaceSnapshot wifiDlEffectiveLatency](self, "wifiDlEffectiveLatency"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 setValue:v28 forKey:kNStatSrcKeyInterfaceWifiDlEffectiveLatency];
    }

    if (-[NWSInterfaceSnapshot wifiDlMaxLatency](self, "wifiDlMaxLatency") != -1)
    {
      objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  -[NWSInterfaceSnapshot wifiDlMaxLatency](self, "wifiDlMaxLatency"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 setValue:v29 forKey:kNStatSrcKeyInterfaceWifiDlMaxLatency];
    }

    if (-[NWSInterfaceSnapshot wifiDlErrorRate](self, "wifiDlErrorRate") != -1)
    {
      objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  -[NWSInterfaceSnapshot wifiDlErrorRate](self, "wifiDlErrorRate"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 setValue:v30 forKey:kNStatSrcKeyInterfaceWifiDlErrorRate];
    }

    if (-[NWSInterfaceSnapshot wifiUlErrorRate](self, "wifiUlErrorRate") != -1)
    {
      objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  -[NWSInterfaceSnapshot wifiUlErrorRate](self, "wifiUlErrorRate"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 setValue:v31 forKey:kNStatSrcKeyInterfaceWifiUlErrorRate];
    }

    if (-[NWSInterfaceSnapshot wifiConfigFrequency](self, "wifiConfigFrequency") != -1)
    {
      objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  -[NWSInterfaceSnapshot wifiConfigFrequency](self, "wifiConfigFrequency"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 setValue:v32 forKey:kNStatSrcKeyInterfaceWifiConfigFrequency];
    }

    if (-[NWSInterfaceSnapshot wifiConfigMulticastRate](self, "wifiConfigMulticastRate") != -1)
    {
      objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  -[NWSInterfaceSnapshot wifiConfigMulticastRate](self, "wifiConfigMulticastRate"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 setValue:v33 forKey:kNStatSrcKeyInterfaceWifiConfigMulticastRate];
    }

    if (-[NWSInterfaceSnapshot wifiScanCount](self, "wifiScanCount") != -1)
    {
      objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  -[NWSInterfaceSnapshot wifiScanCount](self, "wifiScanCount"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 setValue:v34 forKey:kNStatSrcKeyInterfaceWifiScanCount];
    }

    if (-[NWSInterfaceSnapshot wifiScanDuration](self, "wifiScanDuration") != -1)
    {
      objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  -[NWSInterfaceSnapshot wifiScanDuration](self, "wifiScanDuration"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 setValue:v35 forKey:kNStatSrcKeyInterfaceWifiScanDuration];
    }

    id v36 = v4;
  }

  return v4;
}

- (void)_handleCellExtra:(nstat_ifnet_desc_cellular_status *)a3
{
  unsigned int valid_bitmask = a3->valid_bitmask;
  -[NWSInterfaceSnapshot _invalidateWifiCounts](self, "_invalidateWifiCounts");
  if ((valid_bitmask & 1) != 0) {
    uint64_t link_quality_metric = a3->link_quality_metric;
  }
  else {
    uint64_t link_quality_metric = -1LL;
  }
  -[NWSInterfaceSnapshot setLinkQualityMetric:](self, "setLinkQualityMetric:", link_quality_metric);
  if ((valid_bitmask & 2) != 0) {
    uint64_t ul_effective_bandwidth = a3->ul_effective_bandwidth;
  }
  else {
    uint64_t ul_effective_bandwidth = -1LL;
  }
  -[NWSInterfaceSnapshot setUlEffectiveBandwidth:](self, "setUlEffectiveBandwidth:", ul_effective_bandwidth);
  if ((valid_bitmask & 4) != 0) {
    uint64_t ul_max_bandwidth = a3->ul_max_bandwidth;
  }
  else {
    uint64_t ul_max_bandwidth = -1LL;
  }
  -[NWSInterfaceSnapshot setUlMaxBandwidth:](self, "setUlMaxBandwidth:", ul_max_bandwidth);
  if ((valid_bitmask & 8) != 0) {
    uint64_t ul_min_latency = a3->ul_min_latency;
  }
  else {
    uint64_t ul_min_latency = -1LL;
  }
  -[NWSInterfaceSnapshot setUlMinLatency:](self, "setUlMinLatency:", ul_min_latency);
  if ((valid_bitmask & 0x20) != 0)
  {
    -[NWSInterfaceSnapshot setUlEffectiveLatency:](self, "setUlEffectiveLatency:", a3->ul_effective_latency);
    uint64_t ul_max_latency = a3->ul_max_latency;
  }

  else
  {
    uint64_t ul_max_latency = -1LL;
    -[NWSInterfaceSnapshot setUlEffectiveLatency:](self, "setUlEffectiveLatency:", -1LL);
  }

  -[NWSInterfaceSnapshot setUlMaxLatency:](self, "setUlMaxLatency:", ul_max_latency);
  if ((valid_bitmask & 0x40) != 0) {
    uint64_t ul_retxt_level = a3->ul_retxt_level;
  }
  else {
    uint64_t ul_retxt_level = -1LL;
  }
  -[NWSInterfaceSnapshot setUlReTxtLevel:](self, "setUlReTxtLevel:", ul_retxt_level);
  if ((valid_bitmask & 0x80) != 0) {
    uint64_t ul_bytes_lost = a3->ul_bytes_lost;
  }
  else {
    uint64_t ul_bytes_lost = -1LL;
  }
  -[NWSInterfaceSnapshot setUlBytesLost:](self, "setUlBytesLost:", ul_bytes_lost);
  if ((valid_bitmask & 0x100) != 0) {
    uint64_t ul_min_queue_size = a3->ul_min_queue_size;
  }
  else {
    uint64_t ul_min_queue_size = -1LL;
  }
  -[NWSInterfaceSnapshot setCellUlMinQueueSize:](self, "setCellUlMinQueueSize:", ul_min_queue_size);
  if ((valid_bitmask & 0x200) != 0) {
    uint64_t ul_avg_queue_size = a3->ul_avg_queue_size;
  }
  else {
    uint64_t ul_avg_queue_size = -1LL;
  }
  -[NWSInterfaceSnapshot setCellUlAvgQueueSize:](self, "setCellUlAvgQueueSize:", ul_avg_queue_size);
  if ((valid_bitmask & 0x400) != 0) {
    uint64_t ul_max_queue_size = a3->ul_max_queue_size;
  }
  else {
    uint64_t ul_max_queue_size = -1LL;
  }
  -[NWSInterfaceSnapshot setCellUlMaxQueueSize:](self, "setCellUlMaxQueueSize:", ul_max_queue_size);
  if ((valid_bitmask & 0x800) != 0) {
    uint64_t dl_effective_bandwidth = a3->dl_effective_bandwidth;
  }
  else {
    uint64_t dl_effective_bandwidth = -1LL;
  }
  -[NWSInterfaceSnapshot setDlEffectiveBandwidth:](self, "setDlEffectiveBandwidth:", dl_effective_bandwidth);
  if ((valid_bitmask & 0x1000) != 0) {
    uint64_t dl_max_bandwidth = a3->dl_max_bandwidth;
  }
  else {
    uint64_t dl_max_bandwidth = -1LL;
  }
  -[NWSInterfaceSnapshot setDlMaxBandwidth:](self, "setDlMaxBandwidth:", dl_max_bandwidth);
  if ((valid_bitmask & 0x2000) != 0) {
    uint64_t config_inactivity_time = a3->config_inactivity_time;
  }
  else {
    uint64_t config_inactivity_time = -1LL;
  }
  -[NWSInterfaceSnapshot setCellConfigInactivityTime:](self, "setCellConfigInactivityTime:", config_inactivity_time);
  if ((valid_bitmask & 0x4000) != 0) {
    uint64_t config_backoff_time = a3->config_backoff_time;
  }
  else {
    uint64_t config_backoff_time = -1LL;
  }
  -[NWSInterfaceSnapshot setCellConfigBackoffTime:](self, "setCellConfigBackoffTime:", config_backoff_time);
}

- (void)_handleWifiExtra:(nstat_ifnet_desc_wifi_status *)a3
{
  unsigned int valid_bitmask = a3->valid_bitmask;
  -[NWSInterfaceSnapshot _invalidateCellCounts](self, "_invalidateCellCounts");
  if ((valid_bitmask & 1) != 0) {
    uint64_t link_quality_metric = a3->link_quality_metric;
  }
  else {
    uint64_t link_quality_metric = -1LL;
  }
  -[NWSInterfaceSnapshot setLinkQualityMetric:](self, "setLinkQualityMetric:", link_quality_metric);
  if ((valid_bitmask & 2) != 0) {
    uint64_t ul_effective_bandwidth = a3->ul_effective_bandwidth;
  }
  else {
    uint64_t ul_effective_bandwidth = -1LL;
  }
  -[NWSInterfaceSnapshot setUlEffectiveBandwidth:](self, "setUlEffectiveBandwidth:", ul_effective_bandwidth);
  if ((valid_bitmask & 4) != 0) {
    uint64_t ul_max_bandwidth = a3->ul_max_bandwidth;
  }
  else {
    uint64_t ul_max_bandwidth = -1LL;
  }
  -[NWSInterfaceSnapshot setUlMaxBandwidth:](self, "setUlMaxBandwidth:", ul_max_bandwidth);
  if ((valid_bitmask & 8) != 0) {
    uint64_t ul_min_latency = a3->ul_min_latency;
  }
  else {
    uint64_t ul_min_latency = -1LL;
  }
  -[NWSInterfaceSnapshot setUlMinLatency:](self, "setUlMinLatency:", ul_min_latency);
  if ((valid_bitmask & 0x10) != 0) {
    uint64_t ul_effective_latency = a3->ul_effective_latency;
  }
  else {
    uint64_t ul_effective_latency = -1LL;
  }
  -[NWSInterfaceSnapshot setUlEffectiveLatency:](self, "setUlEffectiveLatency:", ul_effective_latency);
  if ((valid_bitmask & 0x20) != 0) {
    uint64_t ul_max_latency = a3->ul_max_latency;
  }
  else {
    uint64_t ul_max_latency = -1LL;
  }
  -[NWSInterfaceSnapshot setUlMaxLatency:](self, "setUlMaxLatency:", ul_max_latency);
  if ((valid_bitmask & 0x40) != 0) {
    uint64_t ul_retxt_level = a3->ul_retxt_level;
  }
  else {
    uint64_t ul_retxt_level = -1LL;
  }
  -[NWSInterfaceSnapshot setUlReTxtLevel:](self, "setUlReTxtLevel:", ul_retxt_level);
  if ((valid_bitmask & 0x100) != 0) {
    uint64_t ul_bytes_lost = a3->ul_bytes_lost;
  }
  else {
    uint64_t ul_bytes_lost = -1LL;
  }
  -[NWSInterfaceSnapshot setUlBytesLost:](self, "setUlBytesLost:", ul_bytes_lost);
  if ((valid_bitmask & 0x4000) != 0) {
    uint64_t ul_error_rate = a3->ul_error_rate;
  }
  else {
    uint64_t ul_error_rate = -1LL;
  }
  -[NWSInterfaceSnapshot setWifiUlErrorRate:](self, "setWifiUlErrorRate:", ul_error_rate);
  if ((valid_bitmask & 0x200) != 0) {
    uint64_t dl_effective_bandwidth = a3->dl_effective_bandwidth;
  }
  else {
    uint64_t dl_effective_bandwidth = -1LL;
  }
  -[NWSInterfaceSnapshot setDlEffectiveBandwidth:](self, "setDlEffectiveBandwidth:", dl_effective_bandwidth);
  if ((valid_bitmask & 0x400) != 0) {
    uint64_t dl_max_bandwidth = a3->dl_max_bandwidth;
  }
  else {
    uint64_t dl_max_bandwidth = -1LL;
  }
  -[NWSInterfaceSnapshot setDlMaxBandwidth:](self, "setDlMaxBandwidth:", dl_max_bandwidth);
  if ((valid_bitmask & 0x800) != 0) {
    uint64_t dl_min_latency = a3->dl_min_latency;
  }
  else {
    uint64_t dl_min_latency = -1LL;
  }
  -[NWSInterfaceSnapshot setWifiDlMinLatency:](self, "setWifiDlMinLatency:", dl_min_latency);
  if ((valid_bitmask & 0x1000) != 0) {
    uint64_t dl_effective_latency = a3->dl_effective_latency;
  }
  else {
    uint64_t dl_effective_latency = -1LL;
  }
  -[NWSInterfaceSnapshot setWifiDlEffectiveLatency:](self, "setWifiDlEffectiveLatency:", dl_effective_latency);
  if ((valid_bitmask & 0x2000) != 0) {
    uint64_t dl_max_latency = a3->dl_max_latency;
  }
  else {
    uint64_t dl_max_latency = -1LL;
  }
  -[NWSInterfaceSnapshot setWifiDlMaxLatency:](self, "setWifiDlMaxLatency:", dl_max_latency);
  if ((valid_bitmask & 0x4000) != 0) {
    uint64_t dl_error_rate = a3->dl_error_rate;
  }
  else {
    uint64_t dl_error_rate = -1LL;
  }
  -[NWSInterfaceSnapshot setWifiDlErrorRate:](self, "setWifiDlErrorRate:", dl_error_rate);
  if ((valid_bitmask & 0x8000) != 0) {
    uint64_t config_frequency = a3->config_frequency;
  }
  else {
    uint64_t config_frequency = -1LL;
  }
  -[NWSInterfaceSnapshot setWifiConfigFrequency:](self, "setWifiConfigFrequency:", config_frequency);
  if ((valid_bitmask & 0x10000) != 0) {
    uint64_t config_multicast_rate = a3->config_multicast_rate;
  }
  else {
    uint64_t config_multicast_rate = -1LL;
  }
  -[NWSInterfaceSnapshot setWifiConfigMulticastRate:](self, "setWifiConfigMulticastRate:", config_multicast_rate);
  if ((valid_bitmask & 0x20000) != 0) {
    uint64_t scan_count = a3->scan_count;
  }
  else {
    uint64_t scan_count = -1LL;
  }
  -[NWSInterfaceSnapshot setWifiScanCount:](self, "setWifiScanCount:", scan_count);
  if ((valid_bitmask & 0x40000) != 0) {
    uint64_t scan_duration = a3->scan_duration;
  }
  else {
    uint64_t scan_duration = -1LL;
  }
  -[NWSInterfaceSnapshot setWifiScanDuration:](self, "setWifiScanDuration:", scan_duration);
}

- (void)_handleDescriptor:(nstat_ifnet_descriptor *)a3
{
  __int128 v3 = *(_OWORD *)&a3->link_status.u.wifi.ul_bytes_lost;
  __int128 v5 = *(_OWORD *)&a3->threshold;
  __int128 v4 = *(_OWORD *)&a3->link_status.u.cellular.valid_bitmask;
  *(_OWORD *)&self->_descriptor.link_status.u.wifi.uint64_t ul_min_latency = *(_OWORD *)&a3->link_status.u.wifi.ul_min_latency;
  *(_OWORD *)&self->_descriptor.link_status.u.wifi.uint64_t ul_bytes_lost = v3;
  *(_OWORD *)&self->_descriptor.threshold = v5;
  *(_OWORD *)&self->_descriptor.link_status.u.cellular.unsigned int valid_bitmask = v4;
  __int128 v6 = *(_OWORD *)&a3->description[12];
  __int128 v8 = *(_OWORD *)&a3->link_status.u.wifi.dl_min_latency;
  __int128 v7 = *(_OWORD *)&a3->link_status.u.wifi.config_frequency;
  *(_OWORD *)&self->_descriptor.type = *(_OWORD *)&a3->type;
  *(_OWORD *)&self->_descriptor.description[12] = v6;
  *(_OWORD *)&self->_descriptor.link_status.u.wifi.uint64_t dl_min_latency = v8;
  *(_OWORD *)&self->_descriptor.link_status.u.wifi.uint64_t config_frequency = v7;
  __int128 v9 = *(_OWORD *)&a3->description[76];
  __int128 v11 = *(_OWORD *)&a3->description[28];
  __int128 v10 = *(_OWORD *)&a3->description[44];
  *(_OWORD *)&self->_descriptor.description[60] = *(_OWORD *)&a3->description[60];
  *(_OWORD *)&self->_descriptor.description[76] = v9;
  *(_OWORD *)&self->_descriptor.description[28] = v11;
  *(_OWORD *)&self->_descriptor.description[44] = v10;
  __int128 v13 = *(_OWORD *)&a3->description[108];
  __int128 v12 = *(_OWORD *)&a3->description[124];
  __int128 v14 = *(_OWORD *)&a3->description[92];
  *(void *)&self->_descriptor.name[12] = *(void *)&a3->name[12];
  *(_OWORD *)&self->_descriptor.description[108] = v13;
  *(_OWORD *)&self->_descriptor.description[124] = v12;
  *(_OWORD *)&self->_descriptor.description[92] = v14;
  unsigned int link_status_type = a3->link_status.link_status_type;
  if (link_status_type == 2)
  {
    -[NWSInterfaceSnapshot _handleWifiExtra:](self, "_handleWifiExtra:", &a3->link_status.u);
  }

  else if (link_status_type == 1)
  {
    -[NWSInterfaceSnapshot _handleCellExtra:](self, "_handleCellExtra:", &a3->link_status.u);
  }

  else
  {
    -[NWSInterfaceSnapshot _invalidateAllExtraCounts](self, "_invalidateAllExtraCounts");
  }

- (id)description
{
  __ret = 0LL;
  __int128 v3 = (_printf_domain *)printf_domain();
  asxprintf(&__ret, v3, 0LL, "NWStatisticsInterfaceSnapshot %I", self->_descriptor.ifindex);
  if (!__ret) {
    return 0LL;
  }
  [NSString stringWithCString:__ret encoding:4];
  __int128 v4 = (void *)objc_claimAutoreleasedReturnValue();
  free(__ret);
  return v4;
}

- (NWSInterfaceSnapshot)initWithCounts:(const nstat_counts *)a3 interfaceDescriptor:(nstat_ifnet_descriptor *)a4 sourceIdent:(unint64_t)a5 seqno:(unint64_t)a6
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NWSInterfaceSnapshot;
  __int128 v7 = -[NWSSnapshot _initWithCounts:sourceIdent:seqno:](&v10, sel__initWithCounts_sourceIdent_seqno_, a3, a5, a6);
  __int128 v8 = v7;
  if (v7) {
    -[NWSInterfaceSnapshot _handleDescriptor:](v7, "_handleDescriptor:", a4);
  }
  return v8;
}

- (unint64_t)linkQualityMetric
{
  return self->_linkQualityMetric;
}

- (void)setLinkQualityMetric:(unint64_t)a3
{
  self->_linkQualityMetric = a3;
}

- (unint64_t)ulMaxBandwidth
{
  return self->_ulMaxBandwidth;
}

- (void)setUlMaxBandwidth:(unint64_t)a3
{
  self->_ulMaxBandwidth = a3;
}

- (unint64_t)ulEffectiveBandwidth
{
  return self->_ulEffectiveBandwidth;
}

- (void)setUlEffectiveBandwidth:(unint64_t)a3
{
  self->_ulEffectiveBandwidth = a3;
}

- (unint64_t)ulBytesLost
{
  return self->_ulBytesLost;
}

- (void)setUlBytesLost:(unint64_t)a3
{
  self->_ulBytesLost = a3;
}

- (unint64_t)ulMinLatency
{
  return self->_ulMinLatency;
}

- (void)setUlMinLatency:(unint64_t)a3
{
  self->_ulMinLatency = a3;
}

- (unint64_t)ulEffectiveLatency
{
  return self->_ulEffectiveLatency;
}

- (void)setUlEffectiveLatency:(unint64_t)a3
{
  self->_ulEffectiveLatency = a3;
}

- (unint64_t)ulMaxLatency
{
  return self->_ulMaxLatency;
}

- (void)setUlMaxLatency:(unint64_t)a3
{
  self->_ulMaxLatency = a3;
}

- (unint64_t)ulReTxtLevel
{
  return self->_ulReTxtLevel;
}

- (void)setUlReTxtLevel:(unint64_t)a3
{
  self->_ulReTxtLevel = a3;
}

- (unint64_t)dlMaxBandwidth
{
  return self->_dlMaxBandwidth;
}

- (void)setDlMaxBandwidth:(unint64_t)a3
{
  self->_dlMaxBandwidth = a3;
}

- (unint64_t)dlEffectiveBandwidth
{
  return self->_dlEffectiveBandwidth;
}

- (void)setDlEffectiveBandwidth:(unint64_t)a3
{
  self->_dlEffectiveBandwidth = a3;
}

- (unint64_t)cellUlMinQueueSize
{
  return self->_cellUlMinQueueSize;
}

- (void)setCellUlMinQueueSize:(unint64_t)a3
{
  self->_cellUlMinQueueSize = a3;
}

- (unint64_t)cellUlAvgQueueSize
{
  return self->_cellUlAvgQueueSize;
}

- (void)setCellUlAvgQueueSize:(unint64_t)a3
{
  self->_cellUlAvgQueueSize = a3;
}

- (unint64_t)cellUlMaxQueueSize
{
  return self->_cellUlMaxQueueSize;
}

- (void)setCellUlMaxQueueSize:(unint64_t)a3
{
  self->_cellUlMaxQueueSize = a3;
}

- (unint64_t)cellConfigInactivityTime
{
  return self->_cellConfigInactivityTime;
}

- (void)setCellConfigInactivityTime:(unint64_t)a3
{
  self->_cellConfigInactivityTime = a3;
}

- (unint64_t)cellConfigBackoffTime
{
  return self->_cellConfigBackoffTime;
}

- (void)setCellConfigBackoffTime:(unint64_t)a3
{
  self->_cellConfigBackoffTime = a3;
}

- (unint64_t)wifiUlErrorRate
{
  return self->_wifiUlErrorRate;
}

- (void)setWifiUlErrorRate:(unint64_t)a3
{
  self->_wifiUlErrorRate = a3;
}

- (unint64_t)wifiDlMinLatency
{
  return self->_wifiDlMinLatency;
}

- (void)setWifiDlMinLatency:(unint64_t)a3
{
  self->_wifiDlMinLatency = a3;
}

- (unint64_t)wifiDlEffectiveLatency
{
  return self->_wifiDlEffectiveLatency;
}

- (void)setWifiDlEffectiveLatency:(unint64_t)a3
{
  self->_wifiDlEffectiveLatency = a3;
}

- (unint64_t)wifiDlMaxLatency
{
  return self->_wifiDlMaxLatency;
}

- (void)setWifiDlMaxLatency:(unint64_t)a3
{
  self->_wifiDlMaxLatency = a3;
}

- (unint64_t)wifiDlErrorRate
{
  return self->_wifiDlErrorRate;
}

- (void)setWifiDlErrorRate:(unint64_t)a3
{
  self->_wifiDlErrorRate = a3;
}

- (unint64_t)wifiConfigFrequency
{
  return self->_wifiConfigFrequency;
}

- (void)setWifiConfigFrequency:(unint64_t)a3
{
  self->_wifiConfigFrequency = a3;
}

- (unint64_t)wifiConfigMulticastRate
{
  return self->_wifiConfigMulticastRate;
}

- (void)setWifiConfigMulticastRate:(unint64_t)a3
{
  self->_wifiConfigMulticastRate = a3;
}

- (unint64_t)wifiScanCount
{
  return self->_wifiScanCount;
}

- (void)setWifiScanCount:(unint64_t)a3
{
  self->_wifiScanCount = a3;
}

- (unint64_t)wifiScanDuration
{
  return self->_wifiScanDuration;
}

- (void)setWifiScanDuration:(unint64_t)a3
{
  self->_wifiScanDuration = a3;
}

- (void).cxx_destruct
{
}

@end