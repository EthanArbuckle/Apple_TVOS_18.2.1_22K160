@interface WCAFetchBeaconDBParameters
- (BOOL)QBSS_Load;
- (BOOL)UAPSD;
- (BOOL)has_11krm;
- (NSString)antennas11n;
- (NSString)wlanAsel;
- (NSString)wlanFixedCapabilities;
- (NSString)wlanHTAmpduparam;
- (NSString)wlanHTCapabilities;
- (NSString)wlanHtexCapabilities;
- (NSString)wlanTxbf;
- (NSString)wlanVhtCapabilities;
- (NSString)wlanWfaIeWmeQosInfo;
- (float)antennas11c;
- (float)max_rates;
- (float)wlanTimDtimPeriod;
- (int64_t)beaconInterval;
- (void)fetchWithCompletion:(id)a3;
- (void)setAntennas11c:(float)a3;
- (void)setAntennas11n:(id)a3;
- (void)setBeaconInterval:(int64_t)a3;
- (void)setHas_11krm:(BOOL)a3;
- (void)setMax_rates:(float)a3;
- (void)setQBSS_Load:(BOOL)a3;
- (void)setUAPSD:(BOOL)a3;
- (void)setWlanAsel:(id)a3;
- (void)setWlanFixedCapabilities:(id)a3;
- (void)setWlanHTAmpduparam:(id)a3;
- (void)setWlanHTCapabilities:(id)a3;
- (void)setWlanHtexCapabilities:(id)a3;
- (void)setWlanTimDtimPeriod:(float)a3;
- (void)setWlanTxbf:(id)a3;
- (void)setWlanVhtCapabilities:(id)a3;
- (void)setWlanWfaIeWmeQosInfo:(id)a3;
@end

@implementation WCAFetchBeaconDBParameters

- (void)fetchWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___WCAFetchSQLiteRequest);
  -[WCAFetchSQLiteRequest setTableName:](v5, "setTableName:", @"prof_clean");
  -[WCAFetchSQLiteRequest setColumnNames:](v5, "setColumnNames:", &unk_18A1B59C0);
  -[WCAFetchSQLiteRequest setLimit:](v5, "setLimit:", 1LL);
  v6 = (void *)objc_opt_new();
  -[WCAFetchBeaconDBParameters wlanTimDtimPeriod](self, "wlanTimDtimPeriod");
  if (v7 != 0.0)
  {
    v8 = (void *)MEMORY[0x189607968];
    -[WCAFetchBeaconDBParameters wlanTimDtimPeriod](self, "wlanTimDtimPeriod");
    objc_msgSend(v8, "numberWithFloat:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setValue:v9 forKey:@"wlan-tim-dtim_period"];
  }
  v10 = -[WCAFetchBeaconDBParameters wlanHTCapabilities](self, "wlanHTCapabilities");
  if (v10)
  {
    v11 = -[WCAFetchBeaconDBParameters wlanHTCapabilities](self, "wlanHTCapabilities");
    [v6 setValue:v11 forKey:@"wlan-ht-capabilities"];
  }
  v12 = -[WCAFetchBeaconDBParameters wlanWfaIeWmeQosInfo](self, "wlanWfaIeWmeQosInfo");
  if (v12)
  {
    v13 = -[WCAFetchBeaconDBParameters wlanWfaIeWmeQosInfo](self, "wlanWfaIeWmeQosInfo");
    [v6 setValue:v13 forKey:@"wlan-wfa-ie-wme-qos_info"];
  }
  v14 = -[WCAFetchBeaconDBParameters wlanHtexCapabilities](self, "wlanHtexCapabilities");
  if (v14)
  {
    v15 = -[WCAFetchBeaconDBParameters wlanHtexCapabilities](self, "wlanHtexCapabilities");
    [v6 setValue:v15 forKey:@"wlan-htex-capabilities"];
  }
  v16 = -[WCAFetchBeaconDBParameters wlanHTAmpduparam](self, "wlanHTAmpduparam");
  if (v16)
  {
    v17 = -[WCAFetchBeaconDBParameters wlanHTAmpduparam](self, "wlanHTAmpduparam");
    [v6 setValue:v17 forKey:@"wlan-ht-ampduparam"];
  }
  v18 = -[WCAFetchBeaconDBParameters wlanVhtCapabilities](self, "wlanVhtCapabilities");
  if (v18)
  {
    v19 = -[WCAFetchBeaconDBParameters wlanVhtCapabilities](self, "wlanVhtCapabilities");
    [v6 setValue:v19 forKey:@"wlan-vht-capabilities"];
  }
  v20 = -[WCAFetchBeaconDBParameters wlanTxbf](self, "wlanTxbf");
  if (v20)
  {
    v21 = -[WCAFetchBeaconDBParameters wlanTxbf](self, "wlanTxbf");
    [v6 setValue:v21 forKey:@"wlan-txbf"];
  }
  v22 = -[WCAFetchBeaconDBParameters wlanAsel](self, "wlanAsel");
  if (v22)
  {
    v23 = -[WCAFetchBeaconDBParameters wlanAsel](self, "wlanAsel");
    [v6 setValue:v23 forKey:@"wlan-asel"];
  }
  v24 = -[WCAFetchBeaconDBParameters wlanFixedCapabilities](self, "wlanFixedCapabilities");
  if (v24)
  {
    v25 = -[WCAFetchBeaconDBParameters wlanFixedCapabilities](self, "wlanFixedCapabilities");
    [v6 setValue:v25 forKey:@"wlan-fixed-capabilities"];
  }

  if (-[WCAFetchBeaconDBParameters beaconInterval](self, "beaconInterval"))
  {
    objc_msgSend( MEMORY[0x189607968],  "numberWithLong:",  -[WCAFetchBeaconDBParameters beaconInterval](self, "beaconInterval"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setValue:v26 forKey:@"beacon_interval"];
  }

  if (-[WCAFetchBeaconDBParameters QBSS_Load](self, "QBSS_Load"))
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[WCAFetchBeaconDBParameters QBSS_Load](self, "QBSS_Load"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setValue:v27 forKey:@"QBSS_Load"];
  }

  if (-[WCAFetchBeaconDBParameters has_11krm](self, "has_11krm"))
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[WCAFetchBeaconDBParameters has_11krm](self, "has_11krm"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setValue:v28 forKey:@"has_11krm"];
  }

  if (-[WCAFetchBeaconDBParameters UAPSD](self, "UAPSD"))
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[WCAFetchBeaconDBParameters UAPSD](self, "UAPSD"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setValue:v29 forKey:@"U-APSD"];
  }

  -[WCAFetchBeaconDBParameters antennas11c](self, "antennas11c");
  if (v30 != 0.0)
  {
    v31 = (void *)MEMORY[0x189607968];
    -[WCAFetchBeaconDBParameters antennas11c](self, "antennas11c");
    objc_msgSend(v31, "numberWithFloat:");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setValue:v32 forKey:@"11c_antennas"];
  }
  v33 = -[WCAFetchBeaconDBParameters antennas11n](self, "antennas11n");
  if (v33)
  {
    v34 = -[WCAFetchBeaconDBParameters antennas11n](self, "antennas11n");
    [v6 setValue:v34 forKey:@"11n_antennas"];
  }

  -[WCAFetchBeaconDBParameters max_rates](self, "max_rates");
  if (v35 != 0.0)
  {
    v36 = (void *)MEMORY[0x189607968];
    -[WCAFetchBeaconDBParameters max_rates](self, "max_rates");
    objc_msgSend(v36, "numberWithFloat:");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setValue:v37 forKey:@"max_rates"];
  }

  -[WCAFetchSQLiteRequest setParameters:](v5, "setParameters:", v6);
  v38 = +[WCAAsset beaconsDataAsset](&OBJC_CLASS___WCAAsset, "beaconsDataAsset");
  -[WCAFetchRequest setAsset:](v5, "setAsset:", v38);

  v41[0] = MEMORY[0x1895F87A8];
  v41[1] = 3221225472LL;
  v41[2] = __50__WCAFetchBeaconDBParameters_fetchWithCompletion___block_invoke;
  v41[3] = &unk_18A16E7A0;
  id v42 = v4;
  id v39 = v4;
  -[WCAFetchRequest setCompletionHandler:](v5, "setCompletionHandler:", v41);
  v40 = +[WCAClient sharedClient](&OBJC_CLASS___WCAClient, "sharedClient");
  [v40 executeFetchRequest:v5];
}

void __50__WCAFetchBeaconDBParameters_fetchWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  [v12 records];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 count];

  if (v4)
  {
    [v12 records];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 firstObject];
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    [v6 valueForKey:@"index"];
    float v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = (int)[v7 intValue];
  }

  else
  {
    uint64_t v8 = -1LL;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(@"Error: Response is not of type WCAFetchKeyValuesResponse, instead its %@", v10);
  }

  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v11, v8);
  }
}

- (float)wlanTimDtimPeriod
{
  return self->_wlanTimDtimPeriod;
}

- (void)setWlanTimDtimPeriod:(float)a3
{
  self->_wlanTimDtimPeriod = a3;
}

- (NSString)wlanHTCapabilities
{
  return self->_wlanHTCapabilities;
}

- (void)setWlanHTCapabilities:(id)a3
{
}

- (NSString)wlanWfaIeWmeQosInfo
{
  return self->_wlanWfaIeWmeQosInfo;
}

- (void)setWlanWfaIeWmeQosInfo:(id)a3
{
}

- (NSString)wlanHtexCapabilities
{
  return self->_wlanHtexCapabilities;
}

- (void)setWlanHtexCapabilities:(id)a3
{
}

- (NSString)wlanHTAmpduparam
{
  return self->_wlanHTAmpduparam;
}

- (void)setWlanHTAmpduparam:(id)a3
{
}

- (NSString)wlanVhtCapabilities
{
  return self->_wlanVhtCapabilities;
}

- (void)setWlanVhtCapabilities:(id)a3
{
}

- (NSString)wlanTxbf
{
  return self->_wlanTxbf;
}

- (void)setWlanTxbf:(id)a3
{
}

- (NSString)wlanAsel
{
  return self->_wlanAsel;
}

- (void)setWlanAsel:(id)a3
{
}

- (NSString)wlanFixedCapabilities
{
  return self->_wlanFixedCapabilities;
}

- (void)setWlanFixedCapabilities:(id)a3
{
}

- (int64_t)beaconInterval
{
  return self->_beaconInterval;
}

- (void)setBeaconInterval:(int64_t)a3
{
  self->_beaconInterval = a3;
}

- (BOOL)QBSS_Load
{
  return self->_QBSS_Load;
}

- (void)setQBSS_Load:(BOOL)a3
{
  self->_QBSS_Load = a3;
}

- (BOOL)has_11krm
{
  return self->_has_11krm;
}

- (void)setHas_11krm:(BOOL)a3
{
  self->_has_11krm = a3;
}

- (BOOL)UAPSD
{
  return self->_UAPSD;
}

- (void)setUAPSD:(BOOL)a3
{
  self->_UAPSD = a3;
}

- (float)antennas11c
{
  return self->_antennas11c;
}

- (void)setAntennas11c:(float)a3
{
  self->_antennas11c = a3;
}

- (NSString)antennas11n
{
  return self->_antennas11n;
}

- (void)setAntennas11n:(id)a3
{
}

- (float)max_rates
{
  return self->_max_rates;
}

- (void)setMax_rates:(float)a3
{
  self->_max_rates = a3;
}

- (void).cxx_destruct
{
}

@end