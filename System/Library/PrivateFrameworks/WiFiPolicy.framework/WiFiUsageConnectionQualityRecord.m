@interface WiFiUsageConnectionQualityRecord
- (GEOWiFiConnectionQuality)geoMessage;
- (NSString)identifier;
- (WiFiUsageConnectionQualityRecord)initWithUsageSession:(id)a3 andNeighborBssList:(id)a4 andOtherBssList:(id)a5;
- (void)setGeoMessage:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation WiFiUsageConnectionQualityRecord

- (WiFiUsageConnectionQualityRecord)initWithUsageSession:(id)a3 andNeighborBssList:(id)a4 andOtherBssList:(id)a5
{
  uint64_t v157 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!objc_opt_class())
  {
    v66 = 0LL;
    goto LABEL_72;
  }

  v137 = v10;
  v139 = v9;
  v153.receiver = self;
  v153.super_class = (Class)&OBJC_CLASS___WiFiUsageConnectionQualityRecord;
  v11 = -[WiFiUsageConnectionQualityRecord init](&v153, sel_init);
  v12 = (void *)NSString;
  [v8 networkDetails];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 networkName];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 networkDetails];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 connectedBss];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 bssid];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v18 = [v12 stringWithFormat:@"%@-%@", v14, v17];
  identifier = v11->_identifier;
  v11->_identifier = (NSString *)v18;

  v20 = (GEOWiFiConnectionQuality *)objc_alloc_init(MEMORY[0x18960F408]);
  geoMessage = v11->_geoMessage;
  v11->_geoMessage = v20;

  -[GEOWiFiConnectionQuality setPacketsIn:](v11->_geoMessage, "setPacketsIn:", [v8 totalRxFrames]);
  -[GEOWiFiConnectionQuality setPacketsOut:](v11->_geoMessage, "setPacketsOut:", [v8 totalTxFrames]);
  v22 = v11->_geoMessage;
  v23 = +[WiFiUsagePrivacyFilter numberWithByteCount:]( WiFiUsagePrivacyFilter,  "numberWithByteCount:",  [v8 netInterfaceRxBytes]);
  -[GEOWiFiConnectionQuality setBytesInTotal:](v22, "setBytesInTotal:", [v23 unsignedLongLongValue]);

  v24 = v11->_geoMessage;
  v25 = +[WiFiUsagePrivacyFilter numberWithByteCount:]( WiFiUsagePrivacyFilter,  "numberWithByteCount:",  [v8 netInterfaceTxBytes]);
  -[GEOWiFiConnectionQuality setBytesOutTotal:](v24, "setBytesOutTotal:", [v25 unsignedLongLongValue]);

  -[GEOWiFiConnectionQuality setCca:](v11->_geoMessage, "setCca:", [v8 averageCca]);
  -[GEOWiFiConnectionQuality setRssi:](v11->_geoMessage, "setRssi:", [v8 lastRssi]);
  -[GEOWiFiConnectionQuality setSnr:](v11->_geoMessage, "setSnr:", [v8 averageSnr]);
  v26 = v11->_geoMessage;
  [v8 networkDetails];
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v27 connectedBss];
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  [v28 bssid];
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOWiFiConnectionQuality setUniqueID:](v26, "setUniqueID:", v29);

  v30 = v11->_geoMessage;
  [v8 networkDetails];
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOWiFiConnectionQuality setHotspot20:](v30, "setHotspot20:", [v31 isPasspoint]);

  v32 = v11->_geoMessage;
  [v8 networkDetails];
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  [v33 connectedBss];
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOWiFiConnectionQuality setBand:](v32, "setBand:", [v34 band]);

  v35 = v11->_geoMessage;
  [v8 networkDetails];
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  [v36 connectedBss];
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOWiFiConnectionQuality setChannel:](v35, "setChannel:", [v37 channel]);

  v38 = v11->_geoMessage;
  [v8 networkDetails];
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  [v39 connectedBss];
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOWiFiConnectionQuality setChannelWidth:](v38, "setChannelWidth:", [v40 channelWidth]);

  v41 = v11->_geoMessage;
  [v8 networkDetails];
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  [v42 connectedBss];
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOWiFiConnectionQuality setPhyMode:](v41, "setPhyMode:", [v43 phyMode]);

  v44 = v11->_geoMessage;
  [v8 networkDetails];
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  [v45 connectedBss];
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOWiFiConnectionQuality setIsEdgeBSS:](v44, "setIsEdgeBSS:", [v46 isEdgeBss]);

  v47 = v11->_geoMessage;
  [v8 responsivenessScore];
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  [v48 doubleValue];
  -[GEOWiFiConnectionQuality setResponsivenessScore:](v47, "setResponsivenessScore:");

  v49 = v11->_geoMessage;
  [v8 networkDetails];
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 connectedBss];
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOWiFiConnectionQuality setNetworkType:]( v49,  "setNetworkType:",  [v51 networkAccessCode] + 1);

  v52 = v11;
  [v8 networkDetails];
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v50) = [v53 isAdhoc];

  if ((_DWORD)v50) {
    uint64_t v54 = 1LL;
  }
  else {
    uint64_t v54 = 2LL;
  }
  -[GEOWiFiConnectionQuality setApMode:](v11->_geoMessage, "setApMode:", v54);
  v55 = v11->_geoMessage;
  [v8 sessionStartTime];
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  [v56 timeIntervalSinceReferenceDate];
  -[GEOWiFiConnectionQuality setTimeOfDay:](v55, "setTimeOfDay:", (unint64_t)v57);

  [v8 networkDetails];
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v59 = [v58 captiveStatus];

  if (v59 <= 2) {
    -[GEOWiFiConnectionQuality setCaptiveDetermination:](v11->_geoMessage, "setCaptiveDetermination:", v59);
  }
  [v8 networkDetails];
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  int v61 = [v60 isAutoJoined];

  if (v61) {
    uint64_t v62 = 1LL;
  }
  else {
    uint64_t v62 = 2LL;
  }
  -[GEOWiFiConnectionQuality setAssociationReason:](v11->_geoMessage, "setAssociationReason:", v62);
  -[GEOWiFiConnectionQuality setDisassociationReason:]( v11->_geoMessage,  "setDisassociationReason:",  WiFiUsageConnectionQualityRecordConvertDisconnectReasonToGEOReason([v8 lastDisconnectReason]));
  [v8 sessionDuration];
  if (v63 >= 60.0)
  {
    [v8 sessionDuration];
    if (v67 >= 300.0)
    {
      [v8 sessionDuration];
      if (v68 >= 1200.0)
      {
        [v8 sessionDuration];
        if (v69 >= 3600.0)
        {
          [v8 sessionDuration];
          v64 = v11->_geoMessage;
          if (v70 >= 3600.0) {
            uint64_t v65 = 5LL;
          }
          else {
            uint64_t v65 = 0LL;
          }
        }

        else
        {
          v64 = v11->_geoMessage;
          uint64_t v65 = 4LL;
        }
      }

      else
      {
        v64 = v11->_geoMessage;
        uint64_t v65 = 3LL;
      }
    }

    else
    {
      v64 = v11->_geoMessage;
      uint64_t v65 = 2LL;
    }
  }

  else
  {
    v64 = v11->_geoMessage;
    uint64_t v65 = 1LL;
  }

  -[GEOWiFiConnectionQuality setAssociationLength:](v64, "setAssociationLength:", v65);
  [v8 networkDetails];
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  p_isa = (id *)&v11->super.isa;
  if (([v71 isPublic] & 1) == 0)
  {
    [v8 networkDetails];
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    if (![v73 isCarrierBased])
    {
LABEL_28:

      goto LABEL_29;
    }

    BOOL v74 = +[WiFiUsagePrivacyFilter canPerformActionWithSampleRate:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "canPerformActionWithSampleRate:",  1LL);

    if (!v74) {
      goto LABEL_29;
    }
LABEL_27:
    v75 = v11->_geoMessage;
    [v8 networkDetails];
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    [v71 networkName];
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOWiFiConnectionQuality setIdentifier:](v75, "setIdentifier:", v73);
    goto LABEL_28;
  }

  BOOL v72 = +[WiFiUsagePrivacyFilter canPerformActionWithSampleRate:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "canPerformActionWithSampleRate:",  1LL);

  if (v72) {
    goto LABEL_27;
  }
LABEL_29:
  id v76 = objc_alloc_init(MEMORY[0x18960F3E0]);
  [v8 networkDetails];
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  [v77 connectedBss];
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  [v78 locationLatitude];
  objc_msgSend(v76, "setLat:");

  [v8 networkDetails];
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  [v79 connectedBss];
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  [v80 locationLongitude];
  objc_msgSend(v76, "setLng:");

  id v81 = objc_alloc_init(MEMORY[0x18960F3E8]);
  v136 = v76;
  [v81 setLatLng:v76];
  v82 = (id *)&v52->super.isa;
  v135 = v81;
  -[GEOWiFiConnectionQuality setLocation:](v52->_geoMessage, "setLocation:", v81);
  [v8 networkDetails];
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v83 addedFromUI])
  {

LABEL_32:
    id v86 = p_isa[1];
    uint64_t v87 = 1LL;
    goto LABEL_33;
  }

  [v8 networkDetails];
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  int v85 = [v84 addedViaATJ];

  if (v85) {
    goto LABEL_32;
  }
  [v8 networkDetails];
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  int v95 = [v94 addedFromApp];

  if (v95)
  {
    id v86 = p_isa[1];
    uint64_t v87 = 2LL;
  }

  else
  {
    [v8 networkDetails];
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    int v99 = [v98 isCarrierBased];

    id v86 = p_isa[1];
    if (v99) {
      uint64_t v87 = 3LL;
    }
    else {
      uint64_t v87 = 0LL;
    }
  }

- (GEOWiFiConnectionQuality)geoMessage
{
  return self->_geoMessage;
}

- (void)setGeoMessage:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end