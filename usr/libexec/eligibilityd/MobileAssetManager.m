@interface MobileAssetManager
+ (id)sharedInstance;
- (BillingRegionAndLocationAsset)podcastsTranscriptsAsset;
- (CountryAndGracePeriodAsset)berylliumAsset;
- (CountryAndGracePeriodAsset)boronAsset;
- (CountryAndGracePeriodAsset)heliumAsset;
- (CountryAndGracePeriodAsset)lithiumAsset;
- (CountryAndGracePeriodAsset)potassiumAsset;
- (CountryAndGracePeriodAsset)vanadiumAsset;
- (CountryAndRegionAsset)rubidiumAsset;
- (CountryAsset)aluminumAsset;
- (CountryAsset)argonAsset;
- (CountryAsset)arsenicAsset;
- (CountryAsset)bromineAsset;
- (CountryAsset)carbonAsset;
- (CountryAsset)chlorineAsset;
- (CountryAsset)chromiumAsset;
- (CountryAsset)cobaltAsset;
- (CountryAsset)fluorineAsset;
- (CountryAsset)galliumAsset;
- (CountryAsset)germaniumAsset;
- (CountryAsset)greymatterAsset;
- (CountryAsset)hydrogenAsset;
- (CountryAsset)ironAsset;
- (CountryAsset)lotXAsset;
- (CountryAsset)magnesiumAsset;
- (CountryAsset)manganeseAsset;
- (CountryAsset)neonAsset;
- (CountryAsset)nickelAsset;
- (CountryAsset)nitrogenAsset;
- (CountryAsset)oxygenAsset;
- (CountryAsset)scandiumAsset;
- (CountryAsset)searchMarketplacesAsset;
- (CountryAsset)seleniumAsset;
- (CountryAsset)siliconAsset;
- (CountryAsset)sodiumAsset;
- (CountryAsset)strontiumAsset;
- (CountryAsset)swiftAssistAsset;
- (CountryAsset)titaniumAsset;
- (CountryAsset)xcodeLLMAsset;
- (CountryAsset)yttriumAsset;
- (EligibilityAsset)copperAsset;
- (MobileAssetManager)init;
- (NSNumber)assetVersion;
- (NSNumber)fallbackVersion;
- (OS_dispatch_queue)internalQueue;
- (OS_dispatch_queue)mobileAssetQueue;
- (PolicyAndGracePeriodAsset)kryptonAsset;
- (PolicyAndGracePeriodAsset)phosphorusAsset;
- (PolicyAndGracePeriodAsset)sulfurAsset;
- (id)debugDescription;
- (void)_initDomainsWithConfigPlist:(id)a3;
- (void)_onMobileAssetQueue_fetchMobileAssetContentWithCompletion:(id)a3;
- (void)_onMobileAssetQueue_markInterestInMobileAssetWithCompletion:(id)a3;
- (void)asyncRefetchMobileAsset;
- (void)registerForMobileAssetUpdateNotification;
- (void)setAluminumAsset:(id)a3;
- (void)setArgonAsset:(id)a3;
- (void)setArsenicAsset:(id)a3;
- (void)setAssetVersion:(id)a3;
- (void)setBerylliumAsset:(id)a3;
- (void)setBoronAsset:(id)a3;
- (void)setBromineAsset:(id)a3;
- (void)setCarbonAsset:(id)a3;
- (void)setChlorineAsset:(id)a3;
- (void)setChromiumAsset:(id)a3;
- (void)setCobaltAsset:(id)a3;
- (void)setCopperAsset:(id)a3;
- (void)setFallbackVersion:(id)a3;
- (void)setFluorineAsset:(id)a3;
- (void)setGalliumAsset:(id)a3;
- (void)setGermaniumAsset:(id)a3;
- (void)setGreymatterAsset:(id)a3;
- (void)setHeliumAsset:(id)a3;
- (void)setHydrogenAsset:(id)a3;
- (void)setIronAsset:(id)a3;
- (void)setKryptonAsset:(id)a3;
- (void)setLithiumAsset:(id)a3;
- (void)setLotXAsset:(id)a3;
- (void)setMagnesiumAsset:(id)a3;
- (void)setManganeseAsset:(id)a3;
- (void)setNeonAsset:(id)a3;
- (void)setNickelAsset:(id)a3;
- (void)setNitrogenAsset:(id)a3;
- (void)setOxygenAsset:(id)a3;
- (void)setPhosphorusAsset:(id)a3;
- (void)setPodcastsTranscriptsAsset:(id)a3;
- (void)setPotassiumAsset:(id)a3;
- (void)setRubidiumAsset:(id)a3;
- (void)setScandiumAsset:(id)a3;
- (void)setSearchMarketplacesAsset:(id)a3;
- (void)setSeleniumAsset:(id)a3;
- (void)setSiliconAsset:(id)a3;
- (void)setSodiumAsset:(id)a3;
- (void)setStrontiumAsset:(id)a3;
- (void)setSulfurAsset:(id)a3;
- (void)setSwiftAssistAsset:(id)a3;
- (void)setTitaniumAsset:(id)a3;
- (void)setVanadiumAsset:(id)a3;
- (void)setXcodeLLMAsset:(id)a3;
- (void)setYttriumAsset:(id)a3;
@end

@implementation MobileAssetManager

- (CountryAsset)lotXAsset
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100016040;
  v11 = sub_100016050;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000163B4;
  v6[3] = &unk_100034FD0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)greymatterAsset
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100016040;
  v11 = sub_100016050;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000163A0;
  v6[3] = &unk_100034FD0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)xcodeLLMAsset
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100016040;
  v11 = sub_100016050;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10001638C;
  v6[3] = &unk_100034FD0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (BillingRegionAndLocationAsset)podcastsTranscriptsAsset
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100016040;
  v11 = sub_100016050;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100016378;
  v6[3] = &unk_100034FD0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (BillingRegionAndLocationAsset *)v4;
}

- (CountryAsset)searchMarketplacesAsset
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100016040;
  v11 = sub_100016050;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100016364;
  v6[3] = &unk_100034FD0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)swiftAssistAsset
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100016040;
  v11 = sub_100016050;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100016350;
  v6[3] = &unk_100034FD0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)hydrogenAsset
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100016040;
  v11 = sub_100016050;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10001633C;
  v6[3] = &unk_100034FD0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAndGracePeriodAsset)heliumAsset
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100016040;
  v11 = sub_100016050;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100016328;
  v6[3] = &unk_100034FD0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAndGracePeriodAsset *)v4;
}

- (CountryAndGracePeriodAsset)lithiumAsset
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100016040;
  v11 = sub_100016050;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100016314;
  v6[3] = &unk_100034FD0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAndGracePeriodAsset *)v4;
}

- (CountryAndGracePeriodAsset)berylliumAsset
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100016040;
  v11 = sub_100016050;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100016300;
  v6[3] = &unk_100034FD0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAndGracePeriodAsset *)v4;
}

- (CountryAndGracePeriodAsset)boronAsset
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100016040;
  v11 = sub_100016050;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000162EC;
  v6[3] = &unk_100034FD0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAndGracePeriodAsset *)v4;
}

- (CountryAsset)carbonAsset
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100016040;
  v11 = sub_100016050;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000162D8;
  v6[3] = &unk_100034FD0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)nitrogenAsset
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100016040;
  v11 = sub_100016050;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000162C4;
  v6[3] = &unk_100034FD0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)oxygenAsset
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100016040;
  v11 = sub_100016050;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000162B0;
  v6[3] = &unk_100034FD0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)fluorineAsset
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100016040;
  v11 = sub_100016050;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10001629C;
  v6[3] = &unk_100034FD0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)neonAsset
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100016040;
  v11 = sub_100016050;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100016288;
  v6[3] = &unk_100034FD0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)sodiumAsset
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100016040;
  v11 = sub_100016050;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100016274;
  v6[3] = &unk_100034FD0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)magnesiumAsset
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100016040;
  v11 = sub_100016050;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100016260;
  v6[3] = &unk_100034FD0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)aluminumAsset
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100016040;
  v11 = sub_100016050;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10001624C;
  v6[3] = &unk_100034FD0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)siliconAsset
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100016040;
  v11 = sub_100016050;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100016238;
  v6[3] = &unk_100034FD0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (PolicyAndGracePeriodAsset)phosphorusAsset
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100016040;
  v11 = sub_100016050;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100016224;
  v6[3] = &unk_100034FD0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (PolicyAndGracePeriodAsset *)v4;
}

- (PolicyAndGracePeriodAsset)sulfurAsset
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100016040;
  v11 = sub_100016050;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100016210;
  v6[3] = &unk_100034FD0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (PolicyAndGracePeriodAsset *)v4;
}

- (CountryAsset)chlorineAsset
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100016040;
  v11 = sub_100016050;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000161FC;
  v6[3] = &unk_100034FD0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)argonAsset
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100016040;
  v11 = sub_100016050;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000161E8;
  v6[3] = &unk_100034FD0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAndGracePeriodAsset)potassiumAsset
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100016040;
  v11 = sub_100016050;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000161D4;
  v6[3] = &unk_100034FD0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAndGracePeriodAsset *)v4;
}

- (CountryAsset)scandiumAsset
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100016040;
  v11 = sub_100016050;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000161C0;
  v6[3] = &unk_100034FD0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)titaniumAsset
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100016040;
  v11 = sub_100016050;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000161AC;
  v6[3] = &unk_100034FD0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAndGracePeriodAsset)vanadiumAsset
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100016040;
  v11 = sub_100016050;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100016198;
  v6[3] = &unk_100034FD0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAndGracePeriodAsset *)v4;
}

- (CountryAsset)chromiumAsset
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100016040;
  v11 = sub_100016050;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100016184;
  v6[3] = &unk_100034FD0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)manganeseAsset
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100016040;
  v11 = sub_100016050;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100016170;
  v6[3] = &unk_100034FD0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)ironAsset
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100016040;
  v11 = sub_100016050;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10001615C;
  v6[3] = &unk_100034FD0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)cobaltAsset
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100016040;
  v11 = sub_100016050;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100016148;
  v6[3] = &unk_100034FD0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)nickelAsset
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100016040;
  v11 = sub_100016050;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100016134;
  v6[3] = &unk_100034FD0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (EligibilityAsset)copperAsset
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100016040;
  v11 = sub_100016050;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100016120;
  v6[3] = &unk_100034FD0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (EligibilityAsset *)v4;
}

- (CountryAsset)galliumAsset
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100016040;
  v11 = sub_100016050;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10001610C;
  v6[3] = &unk_100034FD0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)germaniumAsset
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100016040;
  v11 = sub_100016050;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000160F8;
  v6[3] = &unk_100034FD0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)arsenicAsset
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100016040;
  v11 = sub_100016050;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000160E4;
  v6[3] = &unk_100034FD0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)seleniumAsset
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100016040;
  v11 = sub_100016050;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000160D0;
  v6[3] = &unk_100034FD0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)bromineAsset
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100016040;
  v11 = sub_100016050;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000160BC;
  v6[3] = &unk_100034FD0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (PolicyAndGracePeriodAsset)kryptonAsset
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100016040;
  v11 = sub_100016050;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000160A8;
  v6[3] = &unk_100034FD0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (PolicyAndGracePeriodAsset *)v4;
}

- (CountryAndRegionAsset)rubidiumAsset
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100016040;
  v11 = sub_100016050;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100016094;
  v6[3] = &unk_100034FD0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAndRegionAsset *)v4;
}

- (CountryAsset)strontiumAsset
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100016040;
  v11 = sub_100016050;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100016080;
  v6[3] = &unk_100034FD0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)yttriumAsset
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100016040;
  v11 = sub_100016050;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10001606C;
  v6[3] = &unk_100034FD0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (NSNumber)assetVersion
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100016040;
  v11 = sub_100016050;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100016058;
  v6[3] = &unk_100034FD0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSNumber *)v4;
}

- (void)_initDomainsWithConfigPlist:(id)a3
{
  id v4 = a3;
  v5 = &off_10003B9B0;
  v6 = &off_10003B9B0;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([&off_10003B9B0 objectForKeyedSubscript:@"Version"]);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber);
  id v9 = v7;
  if ((objc_opt_isKindOfClass(v9, v8) & 1) != 0) {
    v10 = (_UNKNOWN **)v9;
  }
  else {
    v10 = 0LL;
  }

  if (!v10)
  {
    id v11 = sub_10000C968();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v168 = "-[MobileAssetManager _initDomainsWithConfigPlist:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_FAULT,  "%s: Fallback Mobile Asset is malformed: Missing version key",  buf,  0xCu);
    }

    v10 = &off_100038290;
  }

  -[MobileAssetManager setFallbackVersion:](self, "setFallbackVersion:", v10);
  if (v4
    && ((v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"Version"]),
         uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSNumber),
         id v15 = v13,
         (objc_opt_isKindOfClass(v15, v14) & 1) == 0)
      ? (id v16 = 0LL)
      : (id v16 = v15),
        v15,
        v15,
        v16))
  {
    v58 = v16;
    if ([v10 compare:v16] == (id)-1)
    {
      v17 = (_UNKNOWN **)v4;

      goto LABEL_17;
    }
  }

  else
  {
    v58 = 0LL;
  }

  v17 = &off_10003B9B0;
LABEL_17:
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[GlobalConfiguration sharedInstance](&OBJC_CLASS___GlobalConfiguration, "sharedInstance"));
  unsigned int v19 = [v18 hasInternalContent];

  v62 = v4;
  v60 = self;
  if (v19)
  {
    v166 = 0LL;
    if (asprintf(&v166, "%s%s", "/", "/private/var/db/eligibilityd/mobileAssetParametersOverride.plist") == -1)
    {
      v20 = (os_log_s *)sub_10000C968();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v168 = "copy_eligibility_domain_mobile_asset_override_path";
        __int16 v169 = 2080;
        v170 = "/private/var/db/eligibilityd/mobileAssetParametersOverride.plist";
        _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "%s: Failed to construct absolute path for relative path: %s",  buf,  0x16u);
      }
    }

    v21 = v166;
    if (v166)
    {
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v166));
      free(v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  v22,  0LL));
      v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:error:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:error:",  v23,  0LL));
      if (v24)
      {
        id v25 = sub_10000C968();
        v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v27 = (char *)objc_claimAutoreleasedReturnValue([v23 path]);
          *(_DWORD *)buf = 136315394;
          v168 = "-[MobileAssetManager _initDomainsWithConfigPlist:]";
          __int16 v169 = 2112;
          v170 = v27;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "%s: Found Mobile Asset override plist at path %@; Using that instead instead of real values",
            buf,
            0x16u);
        }

        v28 = v24;
        v17 = v28;
      }
    }

    else
    {
      id v29 = sub_10000C968();
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v168 = "-[MobileAssetManager _initDomainsWithConfigPlist:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%s: Failed to copy mobile asset override path; Ignoring it",
          buf,
          0xCu);
      }
    }
  }

  id v119 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]( objc_alloc(&OBJC_CLASS___CountryAsset),  "initForMobileAssetRootKey:withDictionary:",  @"Lot X",  v17);
  id v120 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]( objc_alloc(&OBJC_CLASS___CountryAsset),  "initForMobileAssetRootKey:withDictionary:",  @"Greymatter",  v17);
  id v117 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]( objc_alloc(&OBJC_CLASS___CountryAsset),  "initForMobileAssetRootKey:withDictionary:",  @"Xcode LLM",  v17);
  id v118 = -[BillingRegionAndLocationAsset initForMobileAssetRootKey:withDictionary:]( objc_alloc(&OBJC_CLASS___BillingRegionAndLocationAsset),  "initForMobileAssetRootKey:withDictionary:",  @"Podcasts Transcripts",  v17);
  id v115 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]( objc_alloc(&OBJC_CLASS___CountryAsset),  "initForMobileAssetRootKey:withDictionary:",  @"SearchMarketplaces",  v17);
  id v116 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]( objc_alloc(&OBJC_CLASS___CountryAsset),  "initForMobileAssetRootKey:withDictionary:",  @"Swift Assist",  v17);
  id v113 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]( objc_alloc(&OBJC_CLASS___CountryAsset),  "initForMobileAssetRootKey:withDictionary:",  @"Hydrogen",  v17);
  id v114 = -[CountryAndGracePeriodAsset initForMobileAssetRootKey:withDictionary:]( objc_alloc(&OBJC_CLASS___CountryAndGracePeriodAsset),  "initForMobileAssetRootKey:withDictionary:",  @"Helium",  v17);
  id v109 = -[CountryAndGracePeriodAsset initForMobileAssetRootKey:withDictionary:]( objc_alloc(&OBJC_CLASS___CountryAndGracePeriodAsset),  "initForMobileAssetRootKey:withDictionary:",  @"Lithium",  v17);
  id v111 = -[CountryAndGracePeriodAsset initForMobileAssetRootKey:withDictionary:]( objc_alloc(&OBJC_CLASS___CountryAndGracePeriodAsset),  "initForMobileAssetRootKey:withDictionary:",  @"Beryllium",  v17);
  id v105 = -[CountryAndGracePeriodAsset initForMobileAssetRootKey:withDictionary:]( objc_alloc(&OBJC_CLASS___CountryAndGracePeriodAsset),  "initForMobileAssetRootKey:withDictionary:",  @"Boron",  v17);
  id v107 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]( objc_alloc(&OBJC_CLASS___CountryAsset),  "initForMobileAssetRootKey:withDictionary:",  @"Carbon",  v17);
  id v103 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]( objc_alloc(&OBJC_CLASS___CountryAsset),  "initForMobileAssetRootKey:withDictionary:",  @"Nitrogen",  v17);
  id v101 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]( objc_alloc(&OBJC_CLASS___CountryAsset),  "initForMobileAssetRootKey:withDictionary:",  @"Oxygen",  v17);
  id v99 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]( objc_alloc(&OBJC_CLASS___CountryAsset),  "initForMobileAssetRootKey:withDictionary:",  @"Fluorine",  v17);
  id v97 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]( objc_alloc(&OBJC_CLASS___CountryAsset),  "initForMobileAssetRootKey:withDictionary:",  @"Neon",  v17);
  id v95 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]( objc_alloc(&OBJC_CLASS___CountryAsset),  "initForMobileAssetRootKey:withDictionary:",  @"Sodium",  v17);
  id v93 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]( objc_alloc(&OBJC_CLASS___CountryAsset),  "initForMobileAssetRootKey:withDictionary:",  @"Magnesium",  v17);
  id v91 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]( objc_alloc(&OBJC_CLASS___CountryAsset),  "initForMobileAssetRootKey:withDictionary:",  @"Aluminum",  v17);
  id v89 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]( objc_alloc(&OBJC_CLASS___CountryAsset),  "initForMobileAssetRootKey:withDictionary:",  @"Silicon",  v17);
  id v87 = -[PolicyAndGracePeriodAsset initForMobileAssetRootKey:withDictionary:]( objc_alloc(&OBJC_CLASS___PolicyAndGracePeriodAsset),  "initForMobileAssetRootKey:withDictionary:",  @"Phosphorus",  v17);
  id v85 = -[PolicyAndGracePeriodAsset initForMobileAssetRootKey:withDictionary:]( objc_alloc(&OBJC_CLASS___PolicyAndGracePeriodAsset),  "initForMobileAssetRootKey:withDictionary:",  @"Sulfur",  v17);
  id v83 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]( objc_alloc(&OBJC_CLASS___CountryAsset),  "initForMobileAssetRootKey:withDictionary:",  @"Chlorine",  v17);
  id v81 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]( objc_alloc(&OBJC_CLASS___CountryAsset),  "initForMobileAssetRootKey:withDictionary:",  @"Argon",  v17);
  id v79 = -[CountryAndGracePeriodAsset initForMobileAssetRootKey:withDictionary:]( objc_alloc(&OBJC_CLASS___CountryAndGracePeriodAsset),  "initForMobileAssetRootKey:withDictionary:",  @"Potassium",  v17);
  id v77 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]( objc_alloc(&OBJC_CLASS___CountryAsset),  "initForMobileAssetRootKey:withDictionary:",  @"Scandium",  v17);
  id v75 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]( objc_alloc(&OBJC_CLASS___CountryAsset),  "initForMobileAssetRootKey:withDictionary:",  @"Titanium",  v17);
  id v73 = -[CountryAndGracePeriodAsset initForMobileAssetRootKey:withDictionary:]( objc_alloc(&OBJC_CLASS___CountryAndGracePeriodAsset),  "initForMobileAssetRootKey:withDictionary:",  @"Vanadium",  v17);
  id v71 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]( objc_alloc(&OBJC_CLASS___CountryAsset),  "initForMobileAssetRootKey:withDictionary:",  @"Chromium",  v17);
  id v69 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]( objc_alloc(&OBJC_CLASS___CountryAsset),  "initForMobileAssetRootKey:withDictionary:",  @"Manganese",  v17);
  id v67 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]( objc_alloc(&OBJC_CLASS___CountryAsset),  "initForMobileAssetRootKey:withDictionary:",  @"Iron",  v17);
  id v65 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]( objc_alloc(&OBJC_CLASS___CountryAsset),  "initForMobileAssetRootKey:withDictionary:",  @"Cobalt",  v17);
  id v63 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]( objc_alloc(&OBJC_CLASS___CountryAsset),  "initForMobileAssetRootKey:withDictionary:",  @"Nickel",  v17);
  id v30 = -[EligibilityAsset initForMobileAssetRootKey:withDictionary:]( objc_alloc(&OBJC_CLASS___EligibilityAsset),  "initForMobileAssetRootKey:withDictionary:",  @"Copper",  v17);
  id v46 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]( objc_alloc(&OBJC_CLASS___CountryAsset),  "initForMobileAssetRootKey:withDictionary:",  @"Gallium",  v17);
  id v31 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]( objc_alloc(&OBJC_CLASS___CountryAsset),  "initForMobileAssetRootKey:withDictionary:",  @"Germanium",  v17);
  id v49 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]( objc_alloc(&OBJC_CLASS___CountryAsset),  "initForMobileAssetRootKey:withDictionary:",  @"Arsenic",  v17);
  id v51 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]( objc_alloc(&OBJC_CLASS___CountryAsset),  "initForMobileAssetRootKey:withDictionary:",  @"Selenium",  v17);
  id v53 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]( objc_alloc(&OBJC_CLASS___CountryAsset),  "initForMobileAssetRootKey:withDictionary:",  @"Bromine",  v17);
  id v32 = -[PolicyAndGracePeriodAsset initForMobileAssetRootKey:withDictionary:]( objc_alloc(&OBJC_CLASS___PolicyAndGracePeriodAsset),  "initForMobileAssetRootKey:withDictionary:",  @"Krypton",  v17);
  id v33 = -[CountryAndRegionAsset initForMobileAssetRootKey:withDictionary:]( objc_alloc(&OBJC_CLASS___CountryAndRegionAsset),  "initForMobileAssetRootKey:withDictionary:",  @"Rubidium",  v17);
  id v34 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]( objc_alloc(&OBJC_CLASS___CountryAsset),  "initForMobileAssetRootKey:withDictionary:",  @"Strontium",  v17);
  id v35 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]( objc_alloc(&OBJC_CLASS___CountryAsset),  "initForMobileAssetRootKey:withDictionary:",  @"Yttrium",  v17);
  queue = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](v60, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[2] = sub_100015E1C;
  block[3] = &unk_100034C70;
  block[1] = 3221225472LL;
  block[4] = v60;
  id v122 = v119;
  id v123 = v120;
  id v124 = v117;
  id v125 = v118;
  id v126 = v115;
  id v127 = v116;
  id v128 = v113;
  id v129 = v114;
  id v130 = v109;
  id v131 = v111;
  id v132 = v105;
  id v133 = v107;
  id v134 = v103;
  id v135 = v101;
  id v136 = v99;
  id v137 = v97;
  id v138 = v95;
  id v139 = v93;
  id v140 = v91;
  id v141 = v89;
  id v142 = v87;
  id v143 = v85;
  id v144 = v83;
  id v145 = v81;
  id v146 = v79;
  id v147 = v77;
  id v148 = v75;
  id v149 = v73;
  id v150 = v71;
  id v151 = v69;
  id v152 = v67;
  id v153 = v65;
  id v154 = v63;
  id v155 = v30;
  id v156 = v46;
  id v157 = v31;
  id v158 = v49;
  id v159 = v51;
  id v160 = v53;
  id v161 = v32;
  id v162 = v33;
  id v163 = v34;
  id v164 = v35;
  id v165 = v58;
  id v61 = v58;
  id v59 = v35;
  id v57 = v34;
  id v56 = v33;
  id v55 = v32;
  id v54 = v53;
  id v52 = v51;
  id v50 = v49;
  id v48 = v31;
  id v47 = v46;
  id v45 = v30;
  id v64 = v63;
  id v66 = v65;
  id v68 = v67;
  id v70 = v69;
  id v72 = v71;
  id v74 = v73;
  id v76 = v75;
  id v78 = v77;
  id v80 = v79;
  id v82 = v81;
  id v84 = v83;
  id v86 = v85;
  id v88 = v87;
  id v90 = v89;
  id v92 = v91;
  id v94 = v93;
  id v96 = v95;
  id v98 = v97;
  id v100 = v99;
  id v102 = v101;
  id v104 = v103;
  id v108 = v107;
  id v106 = v105;
  id v112 = v111;
  id v110 = v109;
  id v36 = v114;
  id v37 = v113;
  id v38 = v116;
  id v39 = v115;
  id v40 = v118;
  id v41 = v117;
  id v42 = v120;
  id v43 = v119;
  dispatch_sync(queue, block);
}

- (MobileAssetManager)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MobileAssetManager;
  v2 = -[MobileAssetManager init](&v16, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.eligibility.MobileAssetManager.mobileAsset", v4);

    mobileAssetQueue = v2->_mobileAssetQueue;
    v2->_mobileAssetQueue = (OS_dispatch_queue *)v5;
    uint64_t v7 = v5;

    dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.eligibility.MobileAssetManager.internal", v9);

    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v10;
    id v12 = v10;

    -[MobileAssetManager _initDomainsWithConfigPlist:](v2, "_initDomainsWithConfigPlist:", 0LL);
    -[MobileAssetManager registerForMobileAssetUpdateNotification](v2, "registerForMobileAssetUpdateNotification");
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100015B38;
    v14[3] = &unk_100034EE0;
    id v15 = v2;
    sub_100016A8C(v7, v14);
  }

  return v2;
}

- (void)registerForMobileAssetUpdateNotification
{
  int out_token = -1;
  id v3 = objc_claimAutoreleasedReturnValue( +[MAAutoAssetNotifications notifyRegistrationName:forAssetType:]( &OBJC_CLASS___MAAutoAssetNotifications, "notifyRegistrationName:forAssetType:", @"ASSET_VERSION_DOWNLOADED", @"com.apple.MobileAsset.OSEligibility"));
  id v4 = (const char *)[v3 UTF8String];
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager mobileAssetQueue](self, "mobileAssetQueue"));
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100015950;
  handler[3] = &unk_100034D20;
  id v8 = v3;
  id v9 = self;
  id v6 = v3;
  notify_register_dispatch(v4, &out_token, v5, handler);
}

- (void)_onMobileAssetQueue_markInterestInMobileAssetWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager mobileAssetQueue](self, "mobileAssetQueue"));
  dispatch_assert_queue_V2(v5);

  id v6 = [[MAAutoAssetSelector alloc] initForAssetType:@"com.apple.MobileAsset.OSEligibility" withAssetSpecifier:@"Parameters"];
  id v7 = objc_alloc(&OBJC_CLASS___MAAutoAsset);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager mobileAssetQueue](self, "mobileAssetQueue"));
  id v15 = 0LL;
  id v9 = [v7 initForClientName:@"eligibilityd:interestInContent" selectingAsset:v6 completingFromQueue:v8 error:&v15];
  id v10 = v15;

  if (v9)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000157D4;
    v13[3] = &unk_100034D48;
    id v14 = v4;
    [v9 interestInContent:@"EligibilityConfig" completion:v13];
  }

  else
  {
    id v11 = sub_10000C968();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[MobileAssetManager _onMobileAssetQueue_markInterestInMobileAssetWithCompletion:]";
      __int16 v18 = 2112;
      id v19 = v10;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s: Unable to create auto-asset instance: %@",  buf,  0x16u);
    }

    (*((void (**)(id, id))v4 + 2))(v4, v10);
  }
}

- (void)asyncRefetchMobileAsset
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager mobileAssetQueue](self, "mobileAssetQueue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100015700;
  v4[3] = &unk_100034EE0;
  v4[4] = self;
  sub_100016A8C(v3, v4);
}

- (void)_onMobileAssetQueue_fetchMobileAssetContentWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager mobileAssetQueue](self, "mobileAssetQueue"));
  dispatch_assert_queue_V2(v5);

  id v6 = [[MAAutoAssetSelector alloc] initForAssetType:@"com.apple.MobileAsset.OSEligibility" withAssetSpecifier:@"Parameters"];
  id v7 = objc_alloc(&OBJC_CLASS___MAAutoAsset);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager mobileAssetQueue](self, "mobileAssetQueue"));
  id v16 = 0LL;
  id v9 = [v7 initForClientName:@"eligibilityd:lockContent" selectingAsset:v6 completingFromQueue:v8 error:&v16];
  id v10 = v16;

  if (v9)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000150D8;
    v13[3] = &unk_100034D90;
    id v15 = v4;
    void v13[4] = self;
    id v14 = v9;
    [v14 lockContent:@"lockEligibilityConfigOptions" withTimeout:-1 completion:v13];
  }

  else
  {
    id v11 = sub_10000C968();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v18 = "-[MobileAssetManager _onMobileAssetQueue_fetchMobileAssetContentWithCompletion:]";
      __int16 v19 = 2112;
      id v20 = v10;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s: Unable to create auto-asset instance: %@",  buf,  0x16u);
    }

    (*((void (**)(id, id))v4 + 2))(v4, v10);
  }
}

- (id)debugDescription
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager fallbackVersion](self, "fallbackVersion"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager assetVersion](self, "assetVersion"));
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<MobileAssetManager fallbackVersion: %@ assetVersion: %@>",  v3,  v4));

  return v5;
}

- (void)setLotXAsset:(id)a3
{
}

- (void)setGreymatterAsset:(id)a3
{
}

- (void)setXcodeLLMAsset:(id)a3
{
}

- (void)setPodcastsTranscriptsAsset:(id)a3
{
}

- (void)setSearchMarketplacesAsset:(id)a3
{
}

- (void)setSwiftAssistAsset:(id)a3
{
}

- (void)setHydrogenAsset:(id)a3
{
}

- (void)setHeliumAsset:(id)a3
{
}

- (void)setLithiumAsset:(id)a3
{
}

- (void)setBerylliumAsset:(id)a3
{
}

- (void)setBoronAsset:(id)a3
{
}

- (void)setCarbonAsset:(id)a3
{
}

- (void)setNitrogenAsset:(id)a3
{
}

- (void)setOxygenAsset:(id)a3
{
}

- (void)setFluorineAsset:(id)a3
{
}

- (void)setNeonAsset:(id)a3
{
}

- (void)setSodiumAsset:(id)a3
{
}

- (void)setMagnesiumAsset:(id)a3
{
}

- (void)setAluminumAsset:(id)a3
{
}

- (void)setSiliconAsset:(id)a3
{
}

- (void)setPhosphorusAsset:(id)a3
{
}

- (void)setSulfurAsset:(id)a3
{
}

- (void)setChlorineAsset:(id)a3
{
}

- (void)setArgonAsset:(id)a3
{
}

- (void)setPotassiumAsset:(id)a3
{
}

- (void)setScandiumAsset:(id)a3
{
}

- (void)setTitaniumAsset:(id)a3
{
}

- (void)setVanadiumAsset:(id)a3
{
}

- (void)setChromiumAsset:(id)a3
{
}

- (void)setManganeseAsset:(id)a3
{
}

- (void)setIronAsset:(id)a3
{
}

- (void)setCobaltAsset:(id)a3
{
}

- (void)setNickelAsset:(id)a3
{
}

- (void)setCopperAsset:(id)a3
{
}

- (void)setGalliumAsset:(id)a3
{
}

- (void)setGermaniumAsset:(id)a3
{
}

- (void)setArsenicAsset:(id)a3
{
}

- (void)setSeleniumAsset:(id)a3
{
}

- (void)setBromineAsset:(id)a3
{
}

- (void)setKryptonAsset:(id)a3
{
}

- (void)setRubidiumAsset:(id)a3
{
}

- (void)setStrontiumAsset:(id)a3
{
}

- (void)setYttriumAsset:(id)a3
{
}

- (void)setAssetVersion:(id)a3
{
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (OS_dispatch_queue)mobileAssetQueue
{
  return self->_mobileAssetQueue;
}

- (NSNumber)fallbackVersion
{
  return self->_fallbackVersion;
}

- (void)setFallbackVersion:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001643C;
  block[3] = &unk_100034E00;
  block[4] = a1;
  if (qword_100044790 != -1) {
    dispatch_once(&qword_100044790, block);
  }
  return (id)qword_100044788;
}

@end