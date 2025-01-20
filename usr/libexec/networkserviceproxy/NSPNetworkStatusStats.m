@interface NSPNetworkStatusStats
- (NSString)tierType;
- (id)analyticsDict;
- (id)eventName;
- (unint64_t)cellStatusActiveCount;
- (unint64_t)cellStatusBlockedCount;
- (unint64_t)cellStatusDisabledCount;
- (unint64_t)wifiStatusActiveCount;
- (unint64_t)wifiStatusBlockedCount;
- (unint64_t)wifiStatusDisabledCount;
- (unint64_t)wiredStatusActiveCount;
- (unint64_t)wiredStatusBlockedCount;
- (unint64_t)wiredStatusDisabledCount;
- (void)setCellStatusActiveCount:(unint64_t)a3;
- (void)setCellStatusBlockedCount:(unint64_t)a3;
- (void)setCellStatusDisabledCount:(unint64_t)a3;
- (void)setTierType:(id)a3;
- (void)setWifiStatusActiveCount:(unint64_t)a3;
- (void)setWifiStatusBlockedCount:(unint64_t)a3;
- (void)setWifiStatusDisabledCount:(unint64_t)a3;
- (void)setWiredStatusActiveCount:(unint64_t)a3;
- (void)setWiredStatusBlockedCount:(unint64_t)a3;
- (void)setWiredStatusDisabledCount:(unint64_t)a3;
@end

@implementation NSPNetworkStatusStats

- (id)eventName
{
  return @"com.apple.nsp.networkStatusStats";
}

- (id)analyticsDict
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPNetworkStatusStats tierType](self, "tierType"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"TierType");

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPNetworkStatusStats wifiStatusBlockedCount](self, "wifiStatusBlockedCount")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v5,  @"NetworkStatusStatsWiFiBlockedCount");

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPNetworkStatusStats wifiStatusDisabledCount](self, "wifiStatusDisabledCount")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v6,  @"NetworkStatusStatsWiFiDisabledCount");

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPNetworkStatusStats wifiStatusActiveCount](self, "wifiStatusActiveCount")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v7,  @"NetworkStatusStatsWiFiActiveCount");

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPNetworkStatusStats cellStatusBlockedCount](self, "cellStatusBlockedCount")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v8,  @"NetworkStatusStatsCellBlockedCount");

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPNetworkStatusStats cellStatusDisabledCount](self, "cellStatusDisabledCount")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v9,  @"NetworkStatusStatsCellDisabledCount");

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPNetworkStatusStats cellStatusActiveCount](self, "cellStatusActiveCount")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v10,  @"NetworkStatusStatsCellActiveCount");

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPNetworkStatusStats wiredStatusBlockedCount](self, "wiredStatusBlockedCount")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v11,  @"NetworkStatusStatsWiredBlockedCount");

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPNetworkStatusStats wiredStatusDisabledCount](self, "wiredStatusDisabledCount")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v12,  @"NetworkStatusStatsWiredDisabledCount");

  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPNetworkStatusStats wiredStatusActiveCount](self, "wiredStatusActiveCount")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v13,  @"NetworkStatusStatsWiredActiveCount");

  return v3;
}

- (NSString)tierType
{
  return self->_tierType;
}

- (void)setTierType:(id)a3
{
}

- (unint64_t)wifiStatusBlockedCount
{
  return self->_wifiStatusBlockedCount;
}

- (void)setWifiStatusBlockedCount:(unint64_t)a3
{
  self->_wifiStatusBlockedCount = a3;
}

- (unint64_t)wifiStatusDisabledCount
{
  return self->_wifiStatusDisabledCount;
}

- (void)setWifiStatusDisabledCount:(unint64_t)a3
{
  self->_wifiStatusDisabledCount = a3;
}

- (unint64_t)wifiStatusActiveCount
{
  return self->_wifiStatusActiveCount;
}

- (void)setWifiStatusActiveCount:(unint64_t)a3
{
  self->_wifiStatusActiveCount = a3;
}

- (unint64_t)cellStatusBlockedCount
{
  return self->_cellStatusBlockedCount;
}

- (void)setCellStatusBlockedCount:(unint64_t)a3
{
  self->_cellStatusBlockedCount = a3;
}

- (unint64_t)cellStatusDisabledCount
{
  return self->_cellStatusDisabledCount;
}

- (void)setCellStatusDisabledCount:(unint64_t)a3
{
  self->_cellStatusDisabledCount = a3;
}

- (unint64_t)cellStatusActiveCount
{
  return self->_cellStatusActiveCount;
}

- (void)setCellStatusActiveCount:(unint64_t)a3
{
  self->_cellStatusActiveCount = a3;
}

- (unint64_t)wiredStatusBlockedCount
{
  return self->_wiredStatusBlockedCount;
}

- (void)setWiredStatusBlockedCount:(unint64_t)a3
{
  self->_wiredStatusBlockedCount = a3;
}

- (unint64_t)wiredStatusDisabledCount
{
  return self->_wiredStatusDisabledCount;
}

- (void)setWiredStatusDisabledCount:(unint64_t)a3
{
  self->_wiredStatusDisabledCount = a3;
}

- (unint64_t)wiredStatusActiveCount
{
  return self->_wiredStatusActiveCount;
}

- (void)setWiredStatusActiveCount:(unint64_t)a3
{
  self->_wiredStatusActiveCount = a3;
}

- (void).cxx_destruct
{
}

@end