@interface WCAFetchWiFiBehaviorParameters
+ (void)fetchWiFiBehaviorWithCompletion:(id)a3;
- (NSArray)ambiguousSSIDs;
- (NSArray)internalSSIDs;
- (NSDictionary)apProfile;
- (NSDictionary)beaconParsing;
- (NSDictionary)datapathTelemetry;
- (NSDictionary)disabledMacRandomizationVersions;
- (NSDictionary)jtrnDefaults;
- (NSDictionary)softErrors;
- (void)setAmbiguousSSIDs:(id)a3;
- (void)setApProfile:(id)a3;
- (void)setBeaconParsing:(id)a3;
- (void)setDatapathTelemetry:(id)a3;
- (void)setDisabledMacRandomizationVersions:(id)a3;
- (void)setInternalSSIDs:(id)a3;
- (void)setJtrnDefaults:(id)a3;
- (void)setSoftErrors:(id)a3;
@end

@implementation WCAFetchWiFiBehaviorParameters

+ (void)fetchWiFiBehaviorWithCompletion:(id)a3
{
  v14[8] = *MEMORY[0x1895F89C0];
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___WCAFetchKeyValuesRequest);
  v14[0] = @"WiFiInternalSSIDs";
  v14[1] = @"MacRandomization";
  v14[2] = @"SoftErrors";
  v14[3] = @"JTRN";
  v14[4] = @"DataPathTelemetry";
  v14[5] = @"WiFiAmbiguousSSIDs";
  v14[6] = @"AccessPointProfile";
  v14[7] = @"BeaconParsing";
  [MEMORY[0x189603F18] arrayWithObjects:v14 count:8];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCAFetchKeyValuesRequest setKeys:](v4, "setKeys:", v5);
  v6 = +[WCAAsset wifiBehaviorPlistAsset](&OBJC_CLASS___WCAAsset, "wifiBehaviorPlistAsset");
  -[WCAFetchRequest setAsset:](v4, "setAsset:", v6);

  uint64_t v9 = MEMORY[0x1895F87A8];
  uint64_t v10 = 3221225472LL;
  v11 = __66__WCAFetchWiFiBehaviorParameters_fetchWiFiBehaviorWithCompletion___block_invoke;
  v12 = &unk_18A16E7A0;
  id v13 = v3;
  id v7 = v3;
  -[WCAFetchRequest setCompletionHandler:](v4, "setCompletionHandler:", &v9);
  v8 = +[WCAClient sharedClient](&OBJC_CLASS___WCAClient, "sharedClient", v9, v10, v11, v12);
  [v8 executeFetchRequest:v4];
}

void __66__WCAFetchWiFiBehaviorParameters_fetchWiFiBehaviorWithCompletion___block_invoke( uint64_t a1,  void *a2)
{
  id v33 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v3 = v33;
    v4 = (void *)objc_opt_new();
    [v3 keyValues];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 objectForKeyedSubscript:@"WiFiInternalSSIDs"];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 arrayValue];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setInternalSSIDs:v7];

    [v3 keyValues];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 objectForKeyedSubscript:@"MacRandomization"];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 dictionaryValue];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setDisabledMacRandomizationVersions:v10];

    [v3 keyValues];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 objectForKeyedSubscript:@"SoftErrors"];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 dictionaryValue];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setSoftErrors:v13];

    [v3 keyValues];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 objectForKeyedSubscript:@"DataPathTelemetry"];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 dictionaryValue];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setDatapathTelemetry:v16];

    [v3 keyValues];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 objectForKeyedSubscript:@"JTRN"];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 dictionaryValue];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setJtrnDefaults:v19];

    [v3 keyValues];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 objectForKeyedSubscript:@"WiFiAmbiguousSSIDs"];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 arrayValue];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setAmbiguousSSIDs:v22];

    [v3 keyValues];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 objectForKeyedSubscript:@"AccessPointProfile"];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 dictionaryValue];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setApProfile:v25];

    [v3 keyValues];
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v26 objectForKeyedSubscript:@"BeaconParsing"];
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    [v27 dictionaryValue];
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setBeaconParsing:v28];

    uint64_t v29 = *(void *)(a1 + 32);
    if (v29) {
      (*(void (**)(uint64_t, void *))(v29 + 16))(v29, v4);
    }
  }

  else
  {
    v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(@"Error: Response is not of type WCAFetchKeyValuesResponse, instead its %@", v31);

    uint64_t v32 = *(void *)(a1 + 32);
    if (v32) {
      (*(void (**)(uint64_t, void))(v32 + 16))(v32, 0LL);
    }
  }
}

- (NSArray)internalSSIDs
{
  return self->_internalSSIDs;
}

- (void)setInternalSSIDs:(id)a3
{
}

- (NSDictionary)disabledMacRandomizationVersions
{
  return self->_disabledMacRandomizationVersions;
}

- (void)setDisabledMacRandomizationVersions:(id)a3
{
}

- (NSDictionary)softErrors
{
  return self->_softErrors;
}

- (void)setSoftErrors:(id)a3
{
}

- (NSDictionary)datapathTelemetry
{
  return self->_datapathTelemetry;
}

- (void)setDatapathTelemetry:(id)a3
{
}

- (NSDictionary)jtrnDefaults
{
  return self->_jtrnDefaults;
}

- (void)setJtrnDefaults:(id)a3
{
}

- (NSArray)ambiguousSSIDs
{
  return self->_ambiguousSSIDs;
}

- (void)setAmbiguousSSIDs:(id)a3
{
}

- (NSDictionary)apProfile
{
  return self->_apProfile;
}

- (void)setApProfile:(id)a3
{
}

- (NSDictionary)beaconParsing
{
  return self->_beaconParsing;
}

- (void)setBeaconParsing:(id)a3
{
}

- (void).cxx_destruct
{
}

@end