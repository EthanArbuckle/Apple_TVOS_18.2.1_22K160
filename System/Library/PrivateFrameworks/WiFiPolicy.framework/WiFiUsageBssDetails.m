@interface WiFiUsageBssDetails
+ (id)bssWithIdentifier:(id)a3 apProfile:(id)a4 apMode:(int64_t)a5 phyMode:(int)a6 channel:(int64_t)a7 channelFlags:(unint64_t)a8 channelWidth:(int64_t)a9 rssi:(int64_t)a10 latitude:(double)a11 longitude:(double)a12 isEdgeBss:(BOOL)a13;
+ (id)bssWithIdentifier:(id)a3 channel:(int64_t)a4 channelFlags:(unint64_t)a5 rssi:(int64_t)a6;
- (BOOL)hasAppleIE;
- (BOOL)hasDomainName;
- (BOOL)hasInterworkingIE;
- (BOOL)hasNaiRealms;
- (BOOL)hasRoamingOis;
- (BOOL)hasWpsIE;
- (BOOL)isEdgeBss;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOnChannel:(id)a3;
- (NSArray)currentMloLinks;
- (NSNumber)mloTrafficSwitchEnabled;
- (NSString)apProfile;
- (NSString)bssid;
- (NSString)deviceVersion;
- (NSString)manufacturerName;
- (NSString)modelName;
- (NSString)modelNumber;
- (double)locationLatitude;
- (double)locationLongitude;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)eventDictionary:(BOOL)a3;
- (id)redactedDescription;
- (int)band;
- (int)currentMloPreferredBand;
- (int)phyMode;
- (int64_t)apMode;
- (int64_t)channel;
- (int64_t)channelWidth;
- (int64_t)nSS;
- (int64_t)rssi;
- (unint64_t)channelFlags;
- (unint64_t)currentMloLinksCount;
- (unint64_t)hash;
- (unint64_t)networkAccessCode;
- (unint64_t)venueCode;
- (unint64_t)venueGroup;
- (void)setApMode:(int64_t)a3;
- (void)setApProfile:(id)a3;
- (void)setBand:(int)a3;
- (void)setBssid:(id)a3;
- (void)setChannel:(int64_t)a3;
- (void)setChannelFlags:(unint64_t)a3;
- (void)setChannelWidth:(int64_t)a3;
- (void)setCurrentMloLinks:(id)a3;
- (void)setCurrentMloLinksCount:(unint64_t)a3;
- (void)setCurrentMloPreferredBand:(int)a3;
- (void)setDeviceVersion:(id)a3;
- (void)setHasAppleIE:(BOOL)a3;
- (void)setHasDomainName:(BOOL)a3;
- (void)setHasInterworkingIE:(BOOL)a3;
- (void)setHasNaiRealms:(BOOL)a3;
- (void)setHasRoamingOis:(BOOL)a3;
- (void)setHasWpsIE:(BOOL)a3;
- (void)setIsEdgeBss:(BOOL)a3;
- (void)setLocationLatitude:(double)a3;
- (void)setLocationLongitude:(double)a3;
- (void)setManufacturerName:(id)a3;
- (void)setMloTrafficSwitchEnabled:(id)a3;
- (void)setModelName:(id)a3;
- (void)setModelNumber:(id)a3;
- (void)setNSS:(int64_t)a3;
- (void)setNetworkAccessCode:(unint64_t)a3;
- (void)setPhyMode:(int)a3;
- (void)setRssi:(int64_t)a3;
- (void)setVenueCode:(unint64_t)a3;
- (void)setVenueGroup:(unint64_t)a3;
- (void)updateMLORuntimeConfig:(id *)a3;
@end

@implementation WiFiUsageBssDetails

+ (id)bssWithIdentifier:(id)a3 apProfile:(id)a4 apMode:(int64_t)a5 phyMode:(int)a6 channel:(int64_t)a7 channelFlags:(unint64_t)a8 channelWidth:(int64_t)a9 rssi:(int64_t)a10 latitude:(double)a11 longitude:(double)a12 isEdgeBss:(BOOL)a13
{
  uint64_t v17 = *(void *)&a6;
  id v21 = a3;
  id v22 = a4;
  id v23 = objc_alloc_init((Class)a1);
  [v23 setBssid:v21];
  [v23 setApMode:a5];
  [v23 setPhyMode:v17];
  [v23 setChannelFlags:a8];
  objc_msgSend( v23,  "setBand:",  +[WiFiUsagePrivacyFilter bandFromFlags:](WiFiUsagePrivacyFilter, "bandFromFlags:", a8));
  [v23 setChannel:a7];
  objc_msgSend( v23,  "setChannelWidth:",  +[WiFiUsagePrivacyFilter channelWidthFromFlags:](WiFiUsagePrivacyFilter, "channelWidthFromFlags:", a8));
  [v23 setLocationLatitude:a11];
  [v23 setLocationLongitude:a12];
  [v23 setIsEdgeBss:a13];
  [v23 setRssi:a10];
  [v23 setNSS:0x7FFFFFFFFFFFFFFFLL];
  if (v22)
  {
    [v23 setApProfile:v22];
  }

  else
  {
    v24 = +[WiFiUsageAccessPointProfile profileForBSSID:](&OBJC_CLASS___WiFiUsageAccessPointProfile, "profileForBSSID:", v21);
    [v23 setApProfile:v24];
  }

  [v23 setCurrentMloPreferredBand:3];

  return v23;
}

+ (id)bssWithIdentifier:(id)a3 channel:(int64_t)a4 channelFlags:(unint64_t)a5 rssi:(int64_t)a6
{
  id v9 = a3;
  v10 = (void *)objc_opt_class();
  v11 = +[WiFiUsageAccessPointProfile profileForBSSID:](&OBJC_CLASS___WiFiUsageAccessPointProfile, "profileForBSSID:", v9);
  LOBYTE(v14) = 0;
  [v10 bssWithIdentifier:v9 apProfile:v11 apMode:0 phyMode:0 channel:a4 channelFlags:a5 channelWidth:0.0 rssi:0.0 latitude:0 longitude:a6 isEdgeBss:v14];
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)description
{
  v3 = (void *)NSString;
  v4 = +[WiFiUsagePrivacyFilter reformatMACAddress:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "reformatMACAddress:",  self->_bssid);
  int64_t channel = self->_channel;
  v6 = +[WiFiUsagePrivacyFilter bandAsString:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "bandAsString:",  self->_band);
  [v3 stringWithFormat:@"{BSSID:%@,Channel:%d(%@ Ghz),RSSI:%d}", v4, channel, v6, self->_rssi];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)redactedDescription
{
  v3 = (void *)NSString;
  int64_t channel = self->_channel;
  v5 = +[WiFiUsagePrivacyFilter bandAsString:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "bandAsString:",  self->_band);
  [v3 stringWithFormat:@"{BSSID:<redacted>,Channel:%d(%@ Ghz),RSSI:%d}", channel, v5, self->_rssi];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)apProfile
{
  apProfile = self->_apProfile;
  if (!apProfile)
  {
    +[WiFiUsageAccessPointProfile profileForBSSID:]( &OBJC_CLASS___WiFiUsageAccessPointProfile,  "profileForBSSID:",  self->_bssid);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_apProfile;
    self->_apProfile = v4;

    apProfile = self->_apProfile;
  }

  return apProfile;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)objc_opt_class();
  LOBYTE(v7) = self->_isEdgeBss;
  [v4 bssWithIdentifier:self->_bssid apProfile:self->_apProfile apMode:self->_apMode phyMode:self->_phyMode channel:self->_channel channelFlags:self->_channelFlags channelWidth:self->_locationLatitude rssi:self->_locationLongitude latitude:self->_channelWidth longitude:self->_rssi isEdgeBss:v7];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setHasAppleIE:self->_hasAppleIE];
  [v5 setHasInterworkingIE:self->_hasInterworkingIE];
  [v5 setHasWpsIE:self->_hasWpsIE];
  [v5 setHasDomainName:self->_hasDomainName];
  [v5 setHasNaiRealms:self->_hasNaiRealms];
  [v5 setHasRoamingOis:self->_hasRoamingOis];
  [v5 setNetworkAccessCode:self->_networkAccessCode];
  [v5 setVenueGroup:self->_venueGroup];
  [v5 setVenueCode:self->_venueCode];
  [v5 setModelName:self->_modelName];
  [v5 setModelNumber:self->_modelNumber];
  [v5 setManufacturerName:self->_manufacturerName];
  [v5 setDeviceVersion:self->_deviceVersion];
  [v5 setRssi:self->_rssi];
  return v5;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[WiFiUsageBssDetails bssid](self, "bssid");
    [v4 bssid];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    char v7 = [v5 isEqualToString:v6];
  }

  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)eventDictionary:(BOOL)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!a3) {
    [v5 setObject:self->_bssid forKeyedSubscript:@"NetworkBssIdentifier"];
  }
  if (self->_bssid)
  {
    +[WiFiUsagePrivacyFilter sanitizedOUI:](&OBJC_CLASS___WiFiUsagePrivacyFilter, "sanitizedOUI:");
    char v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v7 forKeyedSubscript:@"NetworkBssOui"];
  }

  [v6 setObject:self->_apProfile forKeyedSubscript:@"NetworkBssApProfile"];
  [MEMORY[0x189607968] numberWithInteger:self->_phyMode];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v8 forKeyedSubscript:@"NetworkBssPhyMode"];

  [MEMORY[0x189607968] numberWithInteger:self->_apMode];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v9 forKeyedSubscript:@"NetworkBssApMode"];
  v10 = +[WiFiUsagePrivacyFilter bandAsString:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "bandAsString:",  self->_band);
  [v6 setObject:v10 forKeyedSubscript:@"NetworkBssBand"];

  [MEMORY[0x189607968] numberWithInteger:self->_channel];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v11 forKeyedSubscript:@"NetworkBssChannel"];

  [MEMORY[0x189607968] numberWithInteger:self->_channelWidth];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v12 forKeyedSubscript:@"NetworkBssChannelWidth"];

  [MEMORY[0x189607968] numberWithBool:self->_isEdgeBss];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v13 forKeyedSubscript:@"NetworkBssIsEdge"];

  [MEMORY[0x189607968] numberWithBool:self->_hasAppleIE];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v14 forKeyedSubscript:@"NetworkBssHasAppleIE"];

  [MEMORY[0x189607968] numberWithBool:self->_hasInterworkingIE];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v15 forKeyedSubscript:@"NetworkBssHasInterworkingIE"];

  [MEMORY[0x189607968] numberWithBool:self->_hasWpsIE];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v16 forKeyedSubscript:@"NetworkBssHasWpsIE"];

  [MEMORY[0x189607968] numberWithBool:self->_hasDomainName];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v17 forKeyedSubscript:@"NetworkBssHasDomainName"];

  [MEMORY[0x189607968] numberWithBool:self->_hasNaiRealms];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v18 forKeyedSubscript:@"NetworkBssHasNaiRealms"];

  [MEMORY[0x189607968] numberWithBool:self->_hasRoamingOis];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v19 forKeyedSubscript:@"NetworkBssHasRoamingOis"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_networkAccessCode];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v20 forKeyedSubscript:@"NetworkBssNetworkAccessCode"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_venueGroup];
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v21 forKeyedSubscript:@"NetworkBssVenueGroup"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:self->_venueCode];
  id v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v22 forKeyedSubscript:@"NetworkBssVenueCode"];

  return v6;
}

- (BOOL)isOnChannel:(id)a3
{
  id v4 = a3;
  v5 = v4;
  int band = self->_band;
  if (band)
  {
    if (band != 2)
    {
      if (band != 1 || ([v4 is5GHz] & 1) == 0) {
        goto LABEL_5;
      }
LABEL_9:
      BOOL v7 = self->_channel == [v5 channelNumber];
      goto LABEL_10;
    }

    if ([v4 is6GHz]) {
      goto LABEL_9;
    }
  }

  else if (objc_msgSend(v4, "is2_4GHz"))
  {
    goto LABEL_9;
  }

- (void)updateMLORuntimeConfig:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageBssDetails setMloTrafficSwitchEnabled:](self, "setMloTrafficSwitchEnabled:", v5);

  v6 = (void *)MEMORY[0x1895BA820]( -[WiFiUsageBssDetails setCurrentMloPreferredBand:]( self,  "setCurrentMloPreferredBand:",  a3->var2));
  BOOL v7 = (void *)objc_opt_new();
  uint64_t v8 = 0LL;
  var1 = a3->var1;
  do
  {
    if (var1[v8] != 3)
    {
      v10 = +[WiFiUsagePrivacyFilter bandAsString:](&OBJC_CLASS___WiFiUsagePrivacyFilter, "bandAsString:");
      [v7 addObject:v10];
    }

    ++v8;
  }

  while (v8 != 3);
  [MEMORY[0x189603F18] arrayWithArray:v7];
  v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
  currentMloLinks = self->_currentMloLinks;
  self->_currentMloLinks = v11;

  objc_autoreleasePoolPop(v6);
}

- (NSString)bssid
{
  return self->_bssid;
}

- (void)setBssid:(id)a3
{
}

- (void)setApProfile:(id)a3
{
}

- (double)locationLatitude
{
  return self->_locationLatitude;
}

- (void)setLocationLatitude:(double)a3
{
  self->_locationLatitude = a3;
}

- (double)locationLongitude
{
  return self->_locationLongitude;
}

- (void)setLocationLongitude:(double)a3
{
  self->_locationLongitude = a3;
}

- (int64_t)nSS
{
  return self->_nSS;
}

- (void)setNSS:(int64_t)a3
{
  self->_nSS = a3;
}

- (int)phyMode
{
  return self->_phyMode;
}

- (void)setPhyMode:(int)a3
{
  self->_phyMode = a3;
}

- (int64_t)apMode
{
  return self->_apMode;
}

- (void)setApMode:(int64_t)a3
{
  self->_apMode = a3;
}

- (int)band
{
  return self->_band;
}

- (void)setBand:(int)a3
{
  self->_int band = a3;
}

- (int64_t)channel
{
  return self->_channel;
}

- (void)setChannel:(int64_t)a3
{
  self->_int64_t channel = a3;
}

- (int64_t)channelWidth
{
  return self->_channelWidth;
}

- (void)setChannelWidth:(int64_t)a3
{
  self->_channelWidth = a3;
}

- (unint64_t)channelFlags
{
  return self->_channelFlags;
}

- (void)setChannelFlags:(unint64_t)a3
{
  self->_channelFlags = a3;
}

- (int64_t)rssi
{
  return self->_rssi;
}

- (void)setRssi:(int64_t)a3
{
  self->_rssi = a3;
}

- (BOOL)isEdgeBss
{
  return self->_isEdgeBss;
}

- (void)setIsEdgeBss:(BOOL)a3
{
  self->_isEdgeBss = a3;
}

- (BOOL)hasAppleIE
{
  return self->_hasAppleIE;
}

- (void)setHasAppleIE:(BOOL)a3
{
  self->_hasAppleIE = a3;
}

- (BOOL)hasInterworkingIE
{
  return self->_hasInterworkingIE;
}

- (void)setHasInterworkingIE:(BOOL)a3
{
  self->_hasInterworkingIE = a3;
}

- (BOOL)hasWpsIE
{
  return self->_hasWpsIE;
}

- (void)setHasWpsIE:(BOOL)a3
{
  self->_hasWpsIE = a3;
}

- (BOOL)hasDomainName
{
  return self->_hasDomainName;
}

- (void)setHasDomainName:(BOOL)a3
{
  self->_hasDomainName = a3;
}

- (BOOL)hasNaiRealms
{
  return self->_hasNaiRealms;
}

- (void)setHasNaiRealms:(BOOL)a3
{
  self->_hasNaiRealms = a3;
}

- (BOOL)hasRoamingOis
{
  return self->_hasRoamingOis;
}

- (void)setHasRoamingOis:(BOOL)a3
{
  self->_hasRoamingOis = a3;
}

- (unint64_t)networkAccessCode
{
  return self->_networkAccessCode;
}

- (void)setNetworkAccessCode:(unint64_t)a3
{
  self->_networkAccessCode = a3;
}

- (unint64_t)venueGroup
{
  return self->_venueGroup;
}

- (void)setVenueGroup:(unint64_t)a3
{
  self->_venueGroup = a3;
}

- (unint64_t)venueCode
{
  return self->_venueCode;
}

- (void)setVenueCode:(unint64_t)a3
{
  self->_venueCode = a3;
}

- (NSString)manufacturerName
{
  return self->_manufacturerName;
}

- (void)setManufacturerName:(id)a3
{
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
}

- (NSString)modelNumber
{
  return self->_modelNumber;
}

- (void)setModelNumber:(id)a3
{
}

- (NSString)deviceVersion
{
  return self->_deviceVersion;
}

- (void)setDeviceVersion:(id)a3
{
}

- (unint64_t)currentMloLinksCount
{
  return self->_currentMloLinksCount;
}

- (void)setCurrentMloLinksCount:(unint64_t)a3
{
  self->_currentMloLinksCount = a3;
}

- (int)currentMloPreferredBand
{
  return self->_currentMloPreferredBand;
}

- (void)setCurrentMloPreferredBand:(int)a3
{
  self->_currentMloPreferredBand = a3;
}

- (NSArray)currentMloLinks
{
  return self->_currentMloLinks;
}

- (void)setCurrentMloLinks:(id)a3
{
}

- (NSNumber)mloTrafficSwitchEnabled
{
  return self->_mloTrafficSwitchEnabled;
}

- (void)setMloTrafficSwitchEnabled:(id)a3
{
}

- (void).cxx_destruct
{
}

@end