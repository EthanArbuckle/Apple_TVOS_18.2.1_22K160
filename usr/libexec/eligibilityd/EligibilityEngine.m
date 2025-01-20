@interface EligibilityEngine
+ (id)sharedInstance;
- (BOOL)_onQueue_saveDomainAnswerOutputsWithError:(id *)a3;
- (BOOL)_onQueue_saveDomainsWithError:(id *)a3;
- (BOOL)_onQueue_serializeInternalDomainStateToDiskWithError:(id *)a3;
- (BOOL)_onQueue_serializeOverrideDataToDiskWithError:(id *)a3;
- (BOOL)_sendNotification:(id)a3;
- (BOOL)_serializeObject:(id)a3 toURL:(id)a4 withError:(id *)a5;
- (BOOL)dumpToDirectory:(id)a3 withError:(id *)a4;
- (BOOL)forceDomainAnswer:(unint64_t)a3 answer:(unint64_t)a4 context:(id)a5 withError:(id *)a6;
- (BOOL)forceDomainSetAnswers:(unint64_t)a3 answer:(unint64_t)a4 context:(id)a5 withError:(id *)a6;
- (BOOL)resetAllDomainsWithError:(id *)a3;
- (BOOL)resetDomain:(unint64_t)a3 withError:(id *)a4;
- (BOOL)setInput:(unint64_t)a3 to:(id)a4 status:(unint64_t)a5 fromProcess:(id)a6 withError:(id *)a7;
- (EligibilityEngine)init;
- (EligibilityOverride)eligibilityOverrides;
- (NSDictionary)domains;
- (NSMutableSet)notificationsToSend;
- (OS_dispatch_queue)internalQueue;
- (id)_createDefaultDomains;
- (id)_decodeObjectOfClasses:(id)a3 atURL:(id)a4 withError:(id *)a5;
- (id)_loadDomainsWithError:(id *)a3;
- (id)_loadOverridesWithError:(id *)a3;
- (id)_onQueue_finalEligibilityDictionaryForDomain:(id)a3;
- (id)_onQueue_urlToDomainData;
- (id)internalStateWithError:(id *)a3;
- (id)mappingByRemovingEphemeralDomains:(id)a3;
- (id)stateDumpWithError:(id *)a3;
- (void)_onQueue_handleRecompute:(id)a3;
- (void)_onQueue_recomputeAllDomainAnswers;
- (void)_onQueue_sendNotifications;
- (void)asyncUpdateAndRecomputeAllAnswers;
- (void)recomputeAllDomainAnswers;
- (void)scheduleDailyRecompute;
- (void)setDomains:(id)a3;
- (void)setEligibilityOverrides:(id)a3;
- (void)setNotificationsToSend:(id)a3;
@end

@implementation EligibilityEngine

- (EligibilityEngine)init
{
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___EligibilityEngine;
  v2 = -[EligibilityEngine init](&v31, "init");
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine _createDefaultDomains](v2, "_createDefaultDomains"));
    id v5 = [v4 mutableCopy];

    id v30 = 0LL;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine _loadDomainsWithError:](v3, "_loadDomainsWithError:", &v30));
    id v7 = v30;
    id v8 = [v6 mutableCopy];

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v5 keysOfEntriesPassingTest:&stru_100034E40]);
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 allObjects]);
      [v8 removeObjectsForKeys:v10];

      [v5 addEntriesFromDictionary:v8];
    }

    else
    {
      id v11 = sub_10000C968();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v33 = "-[EligibilityEngine init]";
        __int16 v34 = 2112;
        id v35 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s: Unable to load serialized domains, initing with empty values: %@",  buf,  0x16u);
      }

      v9 = v7;
      id v7 = 0LL;
    }

    v13 = (NSDictionary *)[v5 copy];
    domains = v3->_domains;
    v3->_domains = v13;

    id v29 = v7;
    v15 = (EligibilityOverride *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine _loadOverridesWithError:](v3, "_loadOverridesWithError:", &v29));
    id v16 = v29;

    if (!v15)
    {
      id v17 = sub_10000C968();
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v33 = "-[EligibilityEngine init]";
        __int16 v34 = 2112;
        id v35 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s: Unable to load serialized overrides, initing with no overrides: %@",  buf,  0x16u);
      }

      v15 = objc_opt_new(&OBJC_CLASS___EligibilityOverride);
    }

    eligibilityOverrides = v3->_eligibilityOverrides;
    v3->_eligibilityOverrides = v15;
    v20 = v15;

    v21 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    notificationsToSend = v3->_notificationsToSend;
    v3->_notificationsToSend = v21;

    dispatch_queue_attr_t v23 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v24 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v23);
    dispatch_queue_t v25 = dispatch_queue_create("com.apple.eligibility.EligibilityEngine.internal", v24);
    internalQueue = v3->_internalQueue;
    v3->_internalQueue = (OS_dispatch_queue *)v25;

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v27 addObserver:v3 selector:"_currentLocaleDidChange:" name:NSCurrentLocaleDidChangeNotification object:0];
  }

  return v3;
}

- (id)_createDefaultDomains
{
  v56[0] = @"OS_ELIGIBILITY_DOMAIN_LOTX";
  v55 = objc_opt_new(&OBJC_CLASS___LotXDomain);
  v57[0] = v55;
  v56[1] = @"OS_ELIGIBILITY_DOMAIN_PODCASTS_TRANSCRIPTS";
  v54 = objc_opt_new(&OBJC_CLASS___PodcastsTranscriptsDomain);
  v57[1] = v54;
  v56[2] = @"OS_ELIGIBILITY_DOMAIN_GREYMATTER";
  v53 = objc_opt_new(&OBJC_CLASS___GreymatterDomain);
  v57[2] = v53;
  v56[3] = @"OS_ELIGIBILITY_DOMAIN_XCODE_LLM";
  v52 = objc_opt_new(&OBJC_CLASS___XcodeLLMDomain);
  v57[3] = v52;
  v56[4] = @"OS_ELIGIBILITY_DOMAIN_SEARCH_MARKETPLACES";
  v51 = objc_opt_new(&OBJC_CLASS___SearchMarketplacesDomain);
  v57[4] = v51;
  v56[5] = @"OS_ELIGIBILITY_DOMAIN_SWIFT_ASSIST";
  v50 = objc_opt_new(&OBJC_CLASS___SwiftAssistDomain);
  v57[5] = v50;
  v56[6] = @"OS_ELIGIBILITY_DOMAIN_HYDROGEN";
  v49 = objc_opt_new(&OBJC_CLASS___HydrogenDomain);
  v57[6] = v49;
  v56[7] = @"OS_ELIGIBILITY_DOMAIN_HELIUM";
  v48 = objc_opt_new(&OBJC_CLASS___HeliumDomain);
  v57[7] = v48;
  v56[8] = @"OS_ELIGIBILITY_DOMAIN_LITHIUM";
  v47 = objc_opt_new(&OBJC_CLASS___LithiumDomain);
  v57[8] = v47;
  v56[9] = @"OS_ELIGIBILITY_DOMAIN_BERYLLIUM";
  v46 = objc_opt_new(&OBJC_CLASS___BerylliumDomain);
  v57[9] = v46;
  v56[10] = @"OS_ELIGIBILITY_DOMAIN_BORON";
  v45 = objc_opt_new(&OBJC_CLASS___BoronDomain);
  v57[10] = v45;
  v56[11] = @"OS_ELIGIBILITY_DOMAIN_CARBON";
  v44 = objc_opt_new(&OBJC_CLASS___CarbonDomain);
  v57[11] = v44;
  v56[12] = @"OS_ELIGIBILITY_DOMAIN_NITROGEN";
  v43 = objc_opt_new(&OBJC_CLASS___NitrogenDomain);
  v57[12] = v43;
  v56[13] = @"OS_ELIGIBILITY_DOMAIN_OXYGEN";
  v42 = objc_opt_new(&OBJC_CLASS___OxygenDomain);
  v57[13] = v42;
  v56[14] = @"OS_ELIGIBILITY_DOMAIN_FLUORINE";
  v41 = objc_opt_new(&OBJC_CLASS___FluorineDomain);
  v57[14] = v41;
  v56[15] = @"OS_ELIGIBILITY_DOMAIN_NEON";
  v40 = objc_opt_new(&OBJC_CLASS___NeonDomain);
  v57[15] = v40;
  v56[16] = @"OS_ELIGIBILITY_DOMAIN_SODIUM";
  v39 = objc_opt_new(&OBJC_CLASS___SodiumDomain);
  v57[16] = v39;
  v56[17] = @"OS_ELIGIBILITY_DOMAIN_MAGNESIUM";
  v38 = objc_opt_new(&OBJC_CLASS___MagnesiumDomain);
  v57[17] = v38;
  v56[18] = @"OS_ELIGIBILITY_DOMAIN_ALUMINUM";
  v37 = objc_opt_new(&OBJC_CLASS___AluminumDomain);
  v57[18] = v37;
  v56[19] = @"OS_ELIGIBILITY_DOMAIN_SILICON";
  v36 = objc_opt_new(&OBJC_CLASS___SiliconDomain);
  v57[19] = v36;
  v56[20] = @"OS_ELIGIBILITY_DOMAIN_PHOSPHORUS";
  id v35 = objc_opt_new(&OBJC_CLASS___PhosphorusDomain);
  v57[20] = v35;
  v56[21] = @"OS_ELIGIBILITY_DOMAIN_SULFUR";
  __int16 v34 = objc_opt_new(&OBJC_CLASS___SulfurDomain);
  v57[21] = v34;
  v56[22] = @"OS_ELIGIBILITY_DOMAIN_CHLORINE";
  v33 = objc_opt_new(&OBJC_CLASS___ChlorineDomain);
  v57[22] = v33;
  v56[23] = @"OS_ELIGIBILITY_DOMAIN_ARGON";
  v32 = objc_opt_new(&OBJC_CLASS___ArgonDomain);
  v57[23] = v32;
  v56[24] = @"OS_ELIGIBILITY_DOMAIN_POTASSIUM";
  objc_super v31 = objc_opt_new(&OBJC_CLASS___PotassiumDomain);
  v57[24] = v31;
  v56[25] = @"OS_ELIGIBILITY_DOMAIN_CALCIUM";
  id v30 = objc_opt_new(&OBJC_CLASS___CalciumDomain);
  v57[25] = v30;
  v56[26] = @"OS_ELIGIBILITY_DOMAIN_SCANDIUM";
  id v29 = objc_opt_new(&OBJC_CLASS___ScandiumDomain);
  v57[26] = v29;
  v56[27] = @"OS_ELIGIBILITY_DOMAIN_TITANIUM";
  v28 = objc_opt_new(&OBJC_CLASS___TitaniumDomain);
  v57[27] = v28;
  v56[28] = @"OS_ELIGIBILITY_DOMAIN_VANADIUM";
  v27 = objc_opt_new(&OBJC_CLASS___VanadiumDomain);
  v57[28] = v27;
  v56[29] = @"OS_ELIGIBILITY_DOMAIN_CHROMIUM";
  v26 = objc_opt_new(&OBJC_CLASS___ChromiumDomain);
  v57[29] = v26;
  v56[30] = @"OS_ELIGIBILITY_DOMAIN_MANGANESE";
  v24 = objc_opt_new(&OBJC_CLASS___ManganeseDomain);
  v57[30] = v24;
  v56[31] = @"OS_ELIGIBILITY_DOMAIN_IRON";
  dispatch_queue_attr_t v23 = objc_opt_new(&OBJC_CLASS___IronDomain);
  v57[31] = v23;
  v56[32] = @"OS_ELIGIBILITY_DOMAIN_COBALT";
  v22 = objc_opt_new(&OBJC_CLASS___CobaltDomain);
  v57[32] = v22;
  v56[33] = @"OS_ELIGIBILITY_DOMAIN_NICKEL";
  v21 = objc_opt_new(&OBJC_CLASS___NickelDomain);
  v57[33] = v21;
  v56[34] = @"OS_ELIGIBILITY_DOMAIN_COPPER";
  v20 = objc_opt_new(&OBJC_CLASS___CopperDomain);
  v57[34] = v20;
  v56[35] = @"OS_ELIGIBILITY_DOMAIN_ZINC";
  v19 = objc_opt_new(&OBJC_CLASS___ZincDomain);
  v57[35] = v19;
  v56[36] = @"OS_ELIGIBILITY_DOMAIN_GALLIUM";
  v18 = objc_opt_new(&OBJC_CLASS___GalliumDomain);
  v57[36] = v18;
  v56[37] = @"OS_ELIGIBILITY_DOMAIN_GERMANIUM";
  id v17 = objc_opt_new(&OBJC_CLASS___GermaniumDomain);
  v57[37] = v17;
  v56[38] = @"OS_ELIGIBILITY_DOMAIN_ARSENIC";
  v2 = objc_opt_new(&OBJC_CLASS___ArsenicDomain);
  v57[38] = v2;
  v56[39] = @"OS_ELIGIBILITY_DOMAIN_SELENIUM";
  v3 = objc_opt_new(&OBJC_CLASS___SeleniumDomain);
  v57[39] = v3;
  v56[40] = @"OS_ELIGIBILITY_DOMAIN_BROMINE";
  v4 = objc_opt_new(&OBJC_CLASS___BromineDomain);
  v57[40] = v4;
  v56[41] = @"OS_ELIGIBILITY_DOMAIN_KRYPTON";
  id v5 = objc_opt_new(&OBJC_CLASS___KryptonDomain);
  v57[41] = v5;
  v56[42] = @"OS_ELIGIBILITY_DOMAIN_RUBIDIUM";
  v6 = objc_opt_new(&OBJC_CLASS___RubidiumDomain);
  v57[42] = v6;
  v56[43] = @"OS_ELIGIBILITY_DOMAIN_STRONTIUM";
  id v7 = objc_opt_new(&OBJC_CLASS___StrontiumDomain);
  v57[43] = v7;
  v56[44] = @"OS_ELIGIBILITY_DOMAIN_YTTRIUM";
  id v8 = objc_opt_new(&OBJC_CLASS___YttriumDomain);
  v57[44] = v8;
  v56[45] = @"OS_ELIGIBILITY_DOMAIN_ZIRCONIUM";
  v9 = objc_opt_new(&OBJC_CLASS___ZirconiumDomain);
  v57[45] = v9;
  v56[46] = @"OS_ELIGIBILITY_DOMAIN_NIOBIUM";
  v10 = objc_opt_new(&OBJC_CLASS___NiobiumDomain);
  v57[46] = v10;
  v56[47] = @"OS_ELIGIBILITY_DOMAIN_MOLYBDENUM";
  id v11 = objc_opt_new(&OBJC_CLASS___MolybdenumDomain);
  v57[47] = v11;
  dispatch_queue_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v57,  v56,  48LL));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[GlobalConfiguration sharedInstance](&OBJC_CLASS___GlobalConfiguration, "sharedInstance"));
  LOBYTE(v4) = [v12 hasInternalContent];

  if ((v4 & 1) != 0)
  {
    id v13 = [v25 mutableCopy];
    v14 = objc_opt_new(&OBJC_CLASS___TestDomain);
    [v13 setObject:v14 forKeyedSubscript:@"OS_ELIGIBILITY_DOMAIN_TEST"];

    id v15 = [v13 copy];
  }

  else
  {
    id v15 = v25;
  }

  return v15;
}

- (id)_decodeObjectOfClasses:(id)a3 atURL:(id)a4 withError:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v29 = 0LL;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v8,  3LL,  &v29));
  v10 = (os_log_s *)v29;
  id v11 = v10;
  if (!v9)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s domain](v10, "domain"));
    if ([v16 isEqualToString:NSCocoaErrorDomain])
    {
      id v17 = -[os_log_s code](v11, "code");

      if (v17 == (id)260)
      {
        id v18 = sub_10000C968();
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 path]);
          *(_DWORD *)buf = 136315650;
          objc_super v31 = "-[EligibilityEngine _decodeObjectOfClasses:atURL:withError:]";
          __int16 v32 = 2112;
          v33 = v20;
          __int16 v34 = 2112;
          id v35 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%s: URL %@ doesn't exist yet: %@",  buf,  0x20u);
LABEL_23:

          goto LABEL_14;
        }

        goto LABEL_14;
      }
    }

    else
    {
    }

    id v22 = sub_10000C968();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 path]);
      *(_DWORD *)buf = 136315650;
      objc_super v31 = "-[EligibilityEngine _decodeObjectOfClasses:atURL:withError:]";
      __int16 v32 = 2112;
      v33 = v20;
      __int16 v34 = 2112;
      id v35 = v11;
      _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s: Failed to deserialize data in %@: %@",  buf,  0x20u);
      goto LABEL_23;
    }

- (id)_loadOverridesWithError:(id *)a3
{
  id v18 = 0LL;
  id v5 = sub_100019D6C(&v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v18;
  if (v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( [v6 URLByAppendingPathComponent:@"Library/Caches/NeverRestore/eligibility_overrides.data" isDirectory:0]);
    v9 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  objc_opt_class(&OBJC_CLASS___EligibilityOverride),  0LL);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v17 = v7;
    id v11 = (void *)objc_claimAutoreleasedReturnValue( -[EligibilityEngine _decodeObjectOfClasses:atURL:withError:]( self,  "_decodeObjectOfClasses:atURL:withError:",  v10,  v8,  &v17));
    id v12 = v17;

    if (v11)
    {
      id v7 = v12;
      goto LABEL_13;
    }

    id v15 = sub_10000C968();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[EligibilityEngine _loadOverridesWithError:]";
      __int16 v21 = 2112;
      id v22 = v12;
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s: Failed to decode eligibility overrides: %@",  buf,  0x16u);
    }

    id v7 = v12;
  }

  else
  {
    id v13 = sub_10000C968();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[EligibilityEngine _loadOverridesWithError:]";
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to obtain the URL for our data container: %@",  buf,  0x16u);
    }

    id v8 = 0LL;
  }

  if (a3)
  {
    id v7 = v7;
    id v11 = 0LL;
    *a3 = v7;
  }

  else
  {
    id v11 = 0LL;
  }

- (id)_loadDomainsWithError:(id *)a3
{
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___EligibilityDomain);
  id v7 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v5,  v6,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v22 = 0LL;
  if (asprintf(&v22, "%s%s", "/", "/private/var/db/eligibilityd/domains.data") == -1)
  {
    v9 = (os_log_s *)sub_10000C968();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "copy_eligibility_domain_domains_serialization_path";
      __int16 v25 = 2080;
      v26 = "/private/var/db/eligibilityd/domains.data";
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s: Failed to construct absolute path for relative path: %s",  buf,  0x16u);
    }
  }

  v10 = v22;
  if (!v22)
  {
    id v16 = sub_10000C968();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[EligibilityEngine _loadDomainsWithError:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s: Failed to copy domains serialization path",  buf,  0xCu);
    }

    id v12 = 0LL;
    id v11 = 0LL;
    uint64_t v14 = 0LL;
    goto LABEL_13;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v22));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v11, 0LL));
  id v21 = 0LL;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[EligibilityEngine _decodeObjectOfClasses:atURL:withError:]( self,  "_decodeObjectOfClasses:atURL:withError:",  v8,  v12,  &v21));
  uint64_t v14 = (char *)v21;
  if (!v13)
  {
    id v18 = sub_10000C968();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[EligibilityEngine _loadDomainsWithError:]";
      __int16 v25 = 2112;
      v26 = v14;
      _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s: Failed to decode domains: %@",  buf,  0x16u);
    }

LABEL_13:
    id v15 = 0LL;
    goto LABEL_14;
  }

  id v15 = v13;
LABEL_14:
  free(v10);
  if (a3 && !v15) {
    *a3 = v14;
  }

  return v15;
}

- (BOOL)_onQueue_saveDomainsWithError:(id *)a3
{
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  id v15 = 0LL;
  unsigned int v6 = -[EligibilityEngine _onQueue_serializeInternalDomainStateToDiskWithError:]( self,  "_onQueue_serializeInternalDomainStateToDiskWithError:",  &v15);
  id v7 = v15;
  id v8 = v7;
  if (v6)
  {
    id v14 = v7;
    unsigned int v9 = -[EligibilityEngine _onQueue_saveDomainAnswerOutputsWithError:]( self,  "_onQueue_saveDomainAnswerOutputsWithError:",  &v14);
    id v10 = v14;

    if (v9)
    {
      id v13 = v10;
      BOOL v11 = -[EligibilityEngine _onQueue_serializeOverrideDataToDiskWithError:]( self,  "_onQueue_serializeOverrideDataToDiskWithError:",  &v13);
      id v8 = v13;

      if (!a3) {
        goto LABEL_10;
      }
    }

    else
    {
      BOOL v11 = 0;
      id v8 = v10;
      if (!a3) {
        goto LABEL_10;
      }
    }
  }

  else
  {
    BOOL v11 = 0;
    if (!a3) {
      goto LABEL_10;
    }
  }

  if (!v11) {
    *a3 = v8;
  }
LABEL_10:

  return v11;
}

- (BOOL)_serializeObject:(id)a3 toURL:(id)a4 withError:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  unsigned int v9 = -[NSKeyedArchiver initRequiringSecureCoding:]( objc_alloc(&OBJC_CLASS___NSKeyedArchiver),  "initRequiringSecureCoding:",  1LL);
  -[NSKeyedArchiver encodeObject:forKey:](v9, "encodeObject:forKey:", v7, NSKeyedArchiveRootObjectKey);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSKeyedArchiver encodedData](v9, "encodedData"));

  id v18 = 0LL;
  unsigned __int8 v11 = [v10 writeToURL:v8 options:268435457 error:&v18];
  id v12 = v18;
  if ((v11 & 1) != 0)
  {
    BOOL v13 = 1;
  }

  else
  {
    id v14 = sub_10000C968();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
      *(_DWORD *)buf = 136315906;
      v20 = "-[EligibilityEngine _serializeObject:toURL:withError:]";
      __int16 v21 = 2112;
      id v22 = v7;
      __int16 v23 = 2112;
      v24 = v16;
      __int16 v25 = 2112;
      id v26 = v12;
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s: Failed to write data %@ to disk at %@: %@",  buf,  0x2Au);
    }

    if (a5)
    {
      id v12 = v12;
      BOOL v13 = 0;
      *a5 = v12;
    }

    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (BOOL)_onQueue_serializeOverrideDataToDiskWithError:(id *)a3
{
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  id v19 = 0LL;
  id v6 = sub_100019D6C(&v19);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v19;
  if (v7)
  {
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( [v7 URLByAppendingPathComponent:@"Library/Caches/NeverRestore/eligibility_overrides.data" isDirectory:0]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine eligibilityOverrides](self, "eligibilityOverrides"));
    id v18 = v8;
    unsigned __int8 v11 = -[EligibilityEngine _serializeObject:toURL:withError:]( self,  "_serializeObject:toURL:withError:",  v10,  v9,  &v18);
    id v12 = v18;

    if ((v11 & 1) != 0)
    {
      BOOL v13 = 1;
      goto LABEL_13;
    }

    id v16 = sub_10000C968();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v21 = "-[EligibilityEngine _onQueue_serializeOverrideDataToDiskWithError:]";
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to write eligibility overrides data to disk: %@",  buf,  0x16u);
    }

    id v8 = v12;
  }

  else
  {
    id v14 = sub_10000C968();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v21 = "-[EligibilityEngine _onQueue_serializeOverrideDataToDiskWithError:]";
      __int16 v22 = 2112;
      id v23 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to obtain the URL for our data container: %@",  buf,  0x16u);
    }

    unsigned int v9 = 0LL;
  }

  if (a3)
  {
    id v12 = v8;
    BOOL v13 = 0;
    *a3 = v12;
  }

  else
  {
    BOOL v13 = 0;
    id v12 = v8;
  }

- (id)mappingByRemovingEphemeralDomains:(id)a3
{
  id v3 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000205AC;
  v7[3] = &unk_100034E68;
  id v8 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v4 = v8;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];

  id v5 = -[NSMutableDictionary copy](v4, "copy");
  return v5;
}

- (BOOL)_onQueue_serializeInternalDomainStateToDiskWithError:(id *)a3
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  id v19 = 0LL;
  if (asprintf(&v19, "%s%s", "/", "/private/var/db/eligibilityd/domains.data") == -1)
  {
    id v6 = (os_log_s *)sub_10000C968();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v21 = "copy_eligibility_domain_domains_serialization_path";
      __int16 v22 = 2080;
      id v23 = "/private/var/db/eligibilityd/domains.data";
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s: Failed to construct absolute path for relative path: %s",  buf,  0x16u);
    }
  }

  id v7 = v19;
  if (v19)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v19));
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v8, 0LL));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine domains](self, "domains"));
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue( -[EligibilityEngine mappingByRemovingEphemeralDomains:]( self,  "mappingByRemovingEphemeralDomains:",  v10));

    id v18 = 0LL;
    LODWORD(v10) = -[EligibilityEngine _serializeObject:toURL:withError:]( self,  "_serializeObject:toURL:withError:",  v11,  v9,  &v18);
    id v12 = (char *)v18;
    if ((_DWORD)v10)
    {
      free(v7);
      BOOL v13 = 1;
      goto LABEL_15;
    }

    id v16 = sub_10000C968();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v21 = "-[EligibilityEngine _onQueue_serializeInternalDomainStateToDiskWithError:]";
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to write domain data to disk: %@",  buf,  0x16u);
    }
  }

  else
  {
    id v14 = sub_10000C968();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v21 = "-[EligibilityEngine _onQueue_serializeInternalDomainStateToDiskWithError:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s: Failed to copy domains serialization path",  buf,  0xCu);
    }

    unsigned __int8 v11 = 0LL;
    id v8 = 0LL;
    unsigned int v9 = 0LL;
    id v12 = 0LL;
  }

  free(v7);
  if (a3)
  {
    id v12 = v12;
    BOOL v13 = 0;
    *a3 = v12;
  }

  else
  {
    BOOL v13 = 0;
  }

- (id)_onQueue_finalEligibilityDictionaryForDomain:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine eligibilityOverrides](self, "eligibilityOverrides"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "overrideResultDictionaryForDomain:", objc_msgSend(v4, "domain")));

  if (v7) {
    id v8 = v7;
  }
  else {
    id v8 = (id)objc_claimAutoreleasedReturnValue([v4 serialize]);
  }
  unsigned int v9 = v8;

  return v9;
}

- (id)_onQueue_urlToDomainData
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine domains](self, "domains"));
  unsigned int v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  unsigned __int8 v11 = sub_10002031C;
  id v12 = &unk_100034E90;
  BOOL v13 = v4;
  id v14 = self;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:&v9];

  id v7 = -[NSMutableDictionary copy](v6, "copy", v9, v10, v11, v12);
  return v7;
}

- (BOOL)_onQueue_saveDomainAnswerOutputsWithError:(id *)a3
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  id v17 = sub_10001F4D8;
  id v18 = sub_10001F4E8;
  id v19 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine _onQueue_urlToDomainData](self, "_onQueue_urlToDomainData"));
  uint64_t v10 = 0LL;
  unsigned __int8 v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  char v13 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10002018C;
  v9[3] = &unk_100034EB8;
  v9[4] = &v14;
  v9[5] = &v10;
  [v6 enumerateKeysAndObjectsUsingBlock:v9];
  int v7 = *((unsigned __int8 *)v11 + 24);
  if (a3 && !*((_BYTE *)v11 + 24)) {
    *a3 = (id) v15[5];
  }
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v14, 8);
  return v7 != 0;
}

- (BOOL)_sendNotification:(id)a3
{
  id v3 = (const char *)[a3 UTF8String];
  uint32_t v4 = notify_post(v3);
  if (v4)
  {
    id v5 = sub_10000C968();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315650;
      unsigned int v9 = "-[EligibilityEngine _sendNotification:]";
      __int16 v10 = 2080;
      unsigned __int8 v11 = v3;
      __int16 v12 = 1024;
      uint32_t v13 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s: Could not post domain change notification %s: %u",  (uint8_t *)&v8,  0x1Cu);
    }
  }

  return v4 == 0;
}

- (void)_onQueue_sendNotifications
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  uint32_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine notificationsToSend](self, "notificationsToSend"));
  if ([v4 count]) {
    [v4 addObject:@"com.apple.os-eligibility-domain.change"];
  }
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v5 = objc_msgSend(v4, "copy", 0);
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8LL * (void)i);
        if (-[EligibilityEngine _sendNotification:](self, "_sendNotification:", v10)) {
          [v4 removeObject:v10];
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }
}

- (void)recomputeAllDomainAnswers
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100020184;
  block[3] = &unk_100034EE0;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)_onQueue_recomputeAllDomainAnswers
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  uint32_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine domains](self, "domains"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100020024;
  v10[3] = &unk_100034E68;
  v10[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v10];

  id v9 = 0LL;
  unsigned __int8 v5 = -[EligibilityEngine _onQueue_saveDomainsWithError:](self, "_onQueue_saveDomainsWithError:", &v9);
  id v6 = v9;
  if ((v5 & 1) != 0)
  {
    -[EligibilityEngine _onQueue_sendNotifications](self, "_onQueue_sendNotifications");
  }

  else
  {
    id v7 = sub_10000C968();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int128 v12 = "-[EligibilityEngine _onQueue_recomputeAllDomainAnswers]";
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s: Failed to save domains to disk: %@",  buf,  0x16u);
    }
  }
}

- (BOOL)setInput:(unint64_t)a3 to:(id)a4 status:(unint64_t)a5 fromProcess:(id)a6 withError:(id *)a7
{
  id v12 = a4;
  id v13 = a6;
  switch(a3)
  {
    case 1uLL:
      id v14 = -[LocatedCountryInput initWithCountryCodes:status:process:]( objc_alloc(&OBJC_CLASS___LocatedCountryInput),  "initWithCountryCodes:status:process:",  v12,  a5,  v13);
      goto LABEL_10;
    case 2uLL:
      id v14 = -[CountryBillingInput initWithBillingCountry:status:process:]( objc_alloc(&OBJC_CLASS___CountryBillingInput),  "initWithBillingCountry:status:process:",  v12,  a5,  v13);
      goto LABEL_10;
    case 4uLL:
      id v14 = -[DeviceLocaleInput initWithDeviceLocale:status:process:]( objc_alloc(&OBJC_CLASS___DeviceLocaleInput),  "initWithDeviceLocale:status:process:",  v12,  a5,  v13);
      goto LABEL_10;
    case 9uLL:
      id v14 = -[GreymatterQueueInput initOnQueue:status:process:]( objc_alloc(&OBJC_CLASS___GreymatterQueueInput),  "initOnQueue:status:process:",  v12,  a5,  v13);
      goto LABEL_10;
    case 0xEuLL:
      id v14 = -[InitialSetupLocationInput initWithLocations:status:process:]( objc_alloc(&OBJC_CLASS___InitialSetupLocationInput),  "initWithLocations:status:process:",  v12,  a5,  v13);
      goto LABEL_10;
    case 0xFuLL:
      id v14 = -[BirthdateInput initWithDate:status:process:]( objc_alloc(&OBJC_CLASS___BirthdateInput),  "initWithDate:status:process:",  v12,  a5,  v13);
LABEL_10:
      v20 = v14;
      if (v14)
      {
        __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine internalQueue](self, "internalQueue"));
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472LL;
        v27[2] = sub_10001FF18;
        v27[3] = &unk_100034F08;
        v28 = v20;
        id v29 = self;
        __int16 v22 = v20;
        sub_100016A8C(v21, v27);

        id v23 = 0LL;
        BOOL v24 = 1;
      }

      else
      {
        id v25 = sub_10000C968();
        uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          objc_super v31 = "-[EligibilityEngine setInput:to:status:fromProcess:withError:]";
          id v17 = "%s: Failed to initalize input type";
          id v18 = v16;
          uint32_t v19 = 12;
LABEL_18:
          _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
        }

- (BOOL)resetDomain:(unint64_t)a3 withError:(id *)a4
{
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  __int16 v22 = sub_10001F4D8;
  id v23 = sub_10001F4E8;
  id v24 = 0LL;
  id v7 = sub_10000580C(a3);
  if (a3 && (uint64_t v8 = v7) != 0LL)
  {
    uint64_t v15 = 0LL;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x2020000000LL;
    char v18 = 0;
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine internalQueue](self, "internalQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001FC9C;
    block[3] = &unk_100034F30;
    block[7] = v8;
    block[8] = a3;
    block[4] = self;
    void block[5] = &v19;
    block[6] = &v15;
    dispatch_sync(v9, block);

    BOOL v10 = *((_BYTE *)v16 + 24) != 0;
    _Block_object_dispose(&v15, 8);
    if (!a4) {
      goto LABEL_8;
    }
  }

  else
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL));
    id v12 = (void *)v20[5];
    v20[5] = v11;

    BOOL v10 = 0;
    if (!a4) {
      goto LABEL_8;
    }
  }

  if (!v10) {
    *a4 = (id) v20[5];
  }
LABEL_8:
  _Block_object_dispose(&v19, 8);

  return v10;
}

- (BOOL)resetAllDomainsWithError:(id *)a3
{
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = 0;
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  id v13 = sub_10001F4D8;
  id v14 = sub_10001F4E8;
  id v15 = 0LL;
  unsigned __int8 v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001FA64;
  block[3] = &unk_100034F58;
  block[4] = self;
  void block[5] = &v10;
  block[6] = &v16;
  dispatch_sync(v5, block);

  int v6 = *((unsigned __int8 *)v17 + 24);
  if (a3 && !*((_BYTE *)v17 + 24))
  {
    *a3 = (id) v11[5];
    int v6 = *((unsigned __int8 *)v17 + 24);
  }

  BOOL v7 = v6 != 0;
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v7;
}

- (BOOL)forceDomainAnswer:(unint64_t)a3 answer:(unint64_t)a4 context:(id)a5 withError:(id *)a6
{
  id v10 = a5;
  uint64_t v33 = 0LL;
  __int16 v34 = &v33;
  uint64_t v35 = 0x3032000000LL;
  v36 = sub_10001F4D8;
  v37 = sub_10001F4E8;
  id v38 = 0LL;
  uint64_t v11 = sub_10000580C(a3);
  if (!a3 || (uint64_t v12 = v11) == 0LL)
  {
    uint64_t v18 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL));
    char v19 = (void *)v34[5];
    v34[5] = v18;

    goto LABEL_9;
  }

  if (!v10)
  {
    __int16 v22 = 0LL;
    goto LABEL_13;
  }

  xpc_type_t type = xpc_get_type(v10);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    __int16 v22 = (void *)_CFXPCCreateCFObjectFromXPCObject(v10);
LABEL_13:
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000LL;
    char v40 = 0;
    id v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine internalQueue](self, "internalQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001F800;
    block[3] = &unk_100034F80;
    id v30 = v12;
    unint64_t v31 = a3;
    block[4] = self;
    v28 = &v33;
    unint64_t v32 = a4;
    id v20 = v22;
    id v27 = v20;
    id v29 = buf;
    dispatch_sync(v23, block);

    BOOL v21 = *(_BYTE *)(*(void *)&buf[8] + 24LL) != 0;
    _Block_object_dispose(buf, 8);
    if (!a6) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }

  id v14 = sub_10000C968();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    name = xpc_type_get_name(type);
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[EligibilityEngine forceDomainAnswer:answer:context:withError:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = name;
    _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s: Expected context to be a dictionary but instead was a %s",  buf,  0x16u);
  }

  uint64_t v16 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL));
  uint64_t v17 = (void *)v34[5];
  v34[5] = v16;

LABEL_9:
  id v20 = 0LL;
  BOOL v21 = 0;
  if (!a6) {
    goto LABEL_16;
  }
LABEL_14:
  if (!v21) {
    *a6 = (id) v34[5];
  }
LABEL_16:

  _Block_object_dispose(&v33, 8);
  return v21;
}

- (BOOL)forceDomainSetAnswers:(unint64_t)a3 answer:(unint64_t)a4 context:(id)a5 withError:(id *)a6
{
  id v10 = a5;
  uint64_t v11 = v10;
  uint64_t v29 = 0LL;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  unint64_t v32 = sub_10001F4D8;
  uint64_t v33 = sub_10001F4E8;
  id v34 = 0LL;
  if (!v10)
  {
    char v19 = 0LL;
    goto LABEL_9;
  }

  xpc_type_t type = xpc_get_type(v10);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    char v19 = (void *)_CFXPCCreateCFObjectFromXPCObject(v11);
LABEL_9:
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000LL;
    char v36 = 0;
    id v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine internalQueue](self, "internalQueue"));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10001F4F0;
    v23[3] = &unk_100034FA8;
    v23[4] = self;
    unint64_t v27 = a3;
    unint64_t v28 = a4;
    id v17 = v19;
    id v24 = v17;
    id v25 = &v29;
    id v26 = buf;
    dispatch_sync(v20, v23);

    BOOL v18 = *(_BYTE *)(*(void *)&buf[8] + 24LL) != 0;
    _Block_object_dispose(buf, 8);
    if (!a6) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }

  id v13 = sub_10000C968();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    name = xpc_type_get_name(type);
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[EligibilityEngine forceDomainSetAnswers:answer:context:withError:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = name;
    _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s: Expected context to be a dictionary but instead was a %s",  buf,  0x16u);
  }

  uint64_t v15 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL));
  uint64_t v16 = (void *)v30[5];
  v30[5] = v15;

  id v17 = 0LL;
  BOOL v18 = 0;
  if (a6)
  {
LABEL_10:
    if (!v18) {
      *a6 = (id) v30[5];
    }
  }

- (id)internalStateWithError:(id *)a3
{
  uint32_t v4 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  unsigned __int8 v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine internalQueue](self, "internalQueue"));
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  uint64_t v11 = sub_10001F330;
  uint64_t v12 = &unk_100034F08;
  id v13 = v4;
  id v14 = self;
  int v6 = v4;
  dispatch_sync(v5, &v9);

  id v7 = -[NSMutableDictionary copy](v6, "copy", v9, v10, v11, v12);
  return v7;
}

- (id)stateDumpWithError:(id *)a3
{
  uint32_t v4 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  unsigned __int8 v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine internalQueue](self, "internalQueue"));
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  uint64_t v11 = sub_10001F120;
  uint64_t v12 = &unk_100034F08;
  id v13 = v4;
  id v14 = self;
  int v6 = v4;
  dispatch_sync(v5, &v9);

  id v7 = -[NSMutableDictionary copy](v6, "copy", v9, v10, v11, v12);
  return v7;
}

- (BOOL)dumpToDirectory:(id)a3 withError:(id *)a4
{
  int v6 = (void *)objc_claimAutoreleasedReturnValue([a3 URLByAppendingPathComponent:@"state.plist" isDirectory:0]);
  id v18 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine stateDumpWithError:](self, "stateDumpWithError:", &v18));
  id v8 = v18;
  id v9 = v8;
  if (v7)
  {
    id v17 = v8;
    unsigned __int8 v10 = [v7 writeToURL:v6 error:&v17];
    id v11 = v17;

    if ((v10 & 1) != 0)
    {
      BOOL v12 = 1;
      goto LABEL_12;
    }

    id v15 = sub_10000C968();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v20 = "-[EligibilityEngine dumpToDirectory:withError:]";
      __int16 v21 = 2112;
      id v22 = v11;
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s: Failed to save state dump to disk: %@",  buf,  0x16u);
    }

    id v9 = v11;
  }

  else
  {
    id v13 = sub_10000C968();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v20 = "-[EligibilityEngine dumpToDirectory:withError:]";
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s: Failed to generate state dump: %@",  buf,  0x16u);
    }
  }

  if (a4)
  {
    id v11 = v9;
    BOOL v12 = 0;
    *a4 = v11;
  }

  else
  {
    BOOL v12 = 0;
    id v11 = v9;
  }

- (void)asyncUpdateAndRecomputeAllAnswers
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine internalQueue](self, "internalQueue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001F014;
  v4[3] = &unk_100034EE0;
  v4[4] = self;
  sub_100016A8C(v3, v4);
}

- (void)_onQueue_handleRecompute:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  uint64_t v29 = 0LL;
  id v30 = &v29;
  uint64_t v31 = 0x2020000000LL;
  char v32 = 0;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10001EF48;
  v26[3] = &unk_100034FD0;
  id v6 = (id)objc_claimAutoreleasedReturnValue([v4 identifier]);
  id v27 = v6;
  unint64_t v28 = &v29;
  [v4 setExpirationHandler:v26];
  id v7 = sub_10000C968();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v34 = "-[EligibilityEngine _onQueue_handleRecompute:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Refresh MobileAsset parameters", buf, 0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[MobileAssetManager sharedInstance](&OBJC_CLASS___MobileAssetManager, "sharedInstance"));
  [v9 asyncRefetchMobileAsset];

  if (*((_BYTE *)v30 + 24)) {
    goto LABEL_18;
  }
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine domains](self, "domains"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 allValues]);

  id v12 = [v11 countByEnumeratingWithState:&v22 objects:v37 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v23;
    while (2)
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * (void)i) updateParameters];
        if (*((_BYTE *)v30 + 24))
        {

          goto LABEL_18;
        }
      }

      id v12 = [v11 countByEnumeratingWithState:&v22 objects:v37 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  id v15 = sub_10000C968();
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v34 = "-[EligibilityEngine _onQueue_handleRecompute:]";
    __int16 v35 = 2112;
    id v36 = v6;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s: Recomputing eligiblity for %@", buf, 0x16u);
  }

  -[EligibilityEngine _onQueue_recomputeAllDomainAnswers](self, "_onQueue_recomputeAllDomainAnswers");
  if (*((_BYTE *)v30 + 24)
    || (-[EligibilityEngine _sendNotification:]( self,  "_sendNotification:",  @"com.apple.os-eligibility-domain.input-needed"),  *((_BYTE *)v30 + 24)))
  {
LABEL_18:
    id v21 = 0LL;
    unsigned __int8 v18 = [v4 setTaskExpiredWithRetryAfter:&v21 error:0.0];
    id v17 = v21;
    if ((v18 & 1) == 0)
    {
      id v19 = sub_10000C968();
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v34 = "-[EligibilityEngine _onQueue_handleRecompute:]";
        __int16 v35 = 2112;
        id v36 = v17;
        _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "%s: Failed to expire task with error: %@",  buf,  0x16u);
      }

      [v4 setTaskCompleted];
    }
  }

  else
  {
    [v4 setTaskCompleted];
    id v17 = 0LL;
  }

  _Block_object_dispose(&v29, 8);
}

- (void)scheduleDailyRecompute
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](&OBJC_CLASS___BGSystemTaskScheduler, "sharedScheduler"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityEngine internalQueue](self, "internalQueue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10001EF3C;
  v5[3] = &unk_100034FF8;
  v5[4] = self;
  [v3 registerForTaskWithIdentifier:@"com.apple.eligibility.recompute" usingQueue:v4 launchHandler:v5];
}

- (NSDictionary)domains
{
  return self->_domains;
}

- (void)setDomains:(id)a3
{
}

- (NSMutableSet)notificationsToSend
{
  return self->_notificationsToSend;
}

- (void)setNotificationsToSend:(id)a3
{
}

- (EligibilityOverride)eligibilityOverrides
{
  return self->_eligibilityOverrides;
}

- (void)setEligibilityOverrides:(id)a3
{
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100020694;
  block[3] = &unk_100034E00;
  block[4] = a1;
  if (qword_1000447A0 != -1) {
    dispatch_once(&qword_1000447A0, block);
  }
  return (id)qword_100044798;
}

@end