@interface FFConfiguration
+ (BOOL)isValidDisclosureName:(id)a3;
+ (BOOL)isValidName:(id)a3;
+ (FFConfiguration)shared;
+ (id)_configurationForTestingWithFileReader:(id)a3 fileWriter:(id)a4 buildVersionGetter:(id)a5 parseErrorReporter:(id)a6 safeModeChecker:(id)a7;
+ (id)configurationForProfileManagement;
+ (id)configurationForTestingWithFileReader:(id)a3;
+ (id)configurationForTestingWithFileReader:(id)a3 fileWriter:(id)a4;
+ (id)configurationForTestingWithFileReader:(id)a3 fileWriter:(id)a4 buildVersionGetter:(id)a5;
+ (id)configurationForTestingWithFileReader:(id)a3 parseErrorReporter:(id)a4;
+ (id)configurationForTestingWithFileReader:(id)a3 parseErrorReporter:(id)a4 safeModeChecker:(id)a5;
+ (id)configurationForTestingWithFileWriter:(id)a3;
- (BOOL)addProfilePayload:(id)a3 error:(id *)a4;
- (BOOL)commitProfilePayloadsAndReturnError:(id *)a3;
- (BOOL)commitUpdates:(id *)a3;
- (BOOL)isFeatureHidden:(id)a3 domain:(id)a4;
- (BOOL)isSafeMode;
- (BOOL)isValidDisclosureName:(id)a3;
- (BOOL)isValidName:(id)a3;
- (BOOL)phaseShouldBeEnabledByDefault:(id)a3;
- (BOOL)reset:(id *)a3;
- (BOOL)resetDomain:(id)a3 error:(id *)a4;
- (BOOL)resolvedStateForDisclosure:(id)a3;
- (BOOL)writeCombinedUpdates:(id *)a3;
- (BOOL)writeCombinedUpdatesAtLevelIndex:(unint64_t)a3 error:(id *)a4;
- (BOOL)writeDisclosureUpdates:(id *)a3;
- (BOOL)writeDisclosureUpdatesAtlevelIndex:(unint64_t)a3 error:(id *)a4;
- (BOOL)writeDomainUpdates:(id *)a3;
- (BOOL)writeFeatureSetUpdates:(id *)a3;
- (BOOL)writeFeatureSetUpdatesAtLevelIndex:(unint64_t)a3 withError:(id *)a4;
- (BOOL)writeSubscriptionUpdates:(id *)a3;
- (BOOL)writeSubscriptionUpdatesAtLevelIndex:(unint64_t)a3 withError:(id *)a4;
- (FFBuildVersionGetter)buildVersionGetter;
- (FFFileReader)filereader;
- (FFFileWriter)filewriter;
- (FFParseErrorReporter)parseerrorreporter;
- (FFPlistParser)plistparser;
- (FFSafeModeChecker)safemodechecker;
- (NSMutableArray)profilePayloads;
- (NSSet)domains;
- (id)allFeatureGroups;
- (id)allSubscriptionsAtLevel:(int64_t)a3;
- (id)attributesForFeatureGroup:(id)a3;
- (id)currentDisclosures;
- (id)currentDisclosuresAtLevel:(int64_t)a3;
- (id)currentDisclosuresAtLevelIndex:(unint64_t)a3;
- (id)defaultStateForFeature:(id)a3 domain:(id)a4;
- (id)definedFeatureGroupsFilteredByCurrentDisclosures;
- (id)definedFeatureSetsFilteredByCurrentDisclosures;
- (id)disclosureFileURLForLevelIndex:(unint64_t)a3 pathIndex:(int)a4;
- (id)disclosureForFeature:(id)a3 domain:(id)a4;
- (id)disclosureForFeatureGroup:(id)a3;
- (id)effectiveStateForFeature:(id)a3 domain:(id)a4 levelIndex:(unint64_t)a5;
- (id)featureFlagsInSet:(id)a3 inGroup:(id)a4;
- (id)featureSetsFileURLForLevelIndex:(unint64_t)a3;
- (id)featureSetsInGroup:(id)a3;
- (id)featuresForDomain:(id)a3;
- (id)featuresForDomainAlreadyLocked:(id)a3;
- (id)fileURLForDomain:(id)a3 pathIndex:(int)a4;
- (id)fileURLForLevelIndex:(unint64_t)a3 pathIndex:(int)a4;
- (id)initPrivate;
- (id)initPrivateForBootTask;
- (id)internalDisclosureFileURLForLevelIndex:(unint64_t)a3;
- (id)makeFeatureDictionaryFrom:(id)a3 forDomain:(id)a4 atDomainLevel:(BOOL)a5 reportableFilename:(id)a6;
- (id)mutableDisclosureSetAtLevelIndex:(unint64_t)a3;
- (id)parseSubscriptionsDictionary:(id)a3;
- (id)resolvedStateForFeature:(id)a3 domain:(id)a4;
- (id)stateForFeature:(id)a3 domain:(id)a4;
- (id)stateForFeature:(id)a3 domain:(id)a4 level:(int64_t)a5;
- (id)subscriptionsFileURLForLevelIndex:(unint64_t)a3;
- (int64_t)_resolvedValueForFeatureSet:(id)a3;
- (int64_t)_valueForFeatureSet:(id)a3 atLevel:(int64_t)a4;
- (int64_t)resolvedValueForFeatureSet:(id)a3 inGroup:(id)a4;
- (int64_t)valueForFeatureSet:(id)a3 inGroup:(id)a4 atLevel:(int64_t)a5;
- (unsigned)sortValueForPhase:(id)a3;
- (void)_enableFeatureSetAlreadyLocked:(id)a3 atLevelIndex:(unint64_t)a4;
- (void)_unsetFeatureSetAlreadyLocked:(id)a3 atLevelIndex:(unint64_t)a4;
- (void)addDisclosure:(id)a3 atLevel:(int64_t)a4;
- (void)addDisclosureAlreadyLocked:(id)a3 atLevelIndex:(unint64_t)a4;
- (void)addFeaturesForDomain:(id)a3 pathIndex:(int)a4 fromURL:(id)a5;
- (void)addSubscription:(id)a3 atLevel:(int64_t)a4;
- (void)addSubscriptionAlreadyLocked:(id)a3 atLevelIndex:(unint64_t)a4;
- (void)clearCachedData;
- (void)createMutableDomainConfig:(id)a3 levelIndex:(unint64_t)a4;
- (void)disableFeature:(id)a3 domain:(id)a4 level:(int64_t)a5;
- (void)disableFeature:(id)a3 domain:(id)a4 level:(int64_t)a5 transient:(BOOL)a6;
- (void)disableFeature:(id)a3 domain:(id)a4 levelIndex:(unint64_t)a5;
- (void)disableFeature:(id)a3 domain:(id)a4 levelIndex:(unint64_t)a5 transient:(BOOL)a6;
- (void)disableFeaturesMatchingAttribute:(id)a3 level:(int64_t)a4;
- (void)enableFeature:(id)a3 domain:(id)a4 level:(int64_t)a5;
- (void)enableFeature:(id)a3 domain:(id)a4 level:(int64_t)a5 transient:(BOOL)a6;
- (void)enableFeature:(id)a3 domain:(id)a4 levelIndex:(unint64_t)a5;
- (void)enableFeature:(id)a3 domain:(id)a4 levelIndex:(unint64_t)a5 transient:(BOOL)a6;
- (void)enableFeatureSet:(id)a3 inGroup:(id)a4 atLevel:(int64_t)a5;
- (void)enableFeaturesMatchingAttribute:(id)a3 level:(int64_t)a4;
- (void)loadAllData;
- (void)loadAllLevelsForDomain:(id)a3;
- (void)loadCombinedDataForLevelIndex:(unint64_t)a3;
- (void)loadDomain:(id)a3 levelIndex:(unint64_t)a4;
- (void)loadFeatureSetDataForLevelIndex:(unint64_t)a3;
- (void)loadFeatureSetDefinitions;
- (void)loadFeatureSetDefinitionsNamed:(id)a3 fromURL:(id)a4;
- (void)loadSubscriptionDataForLevelIndex:(unint64_t)a3;
- (void)populateDictionary:(id)a3 withFeatures:(id)a4;
- (void)prepareToAddProfilePayloads;
- (void)recalculateFeatureSetEffectsAt:(unint64_t)a3;
- (void)recalculateSubscriptionEffectsAt:(unint64_t)a3;
- (void)removeAllDisclosuresAtLevelIndex:(unint64_t)a3;
- (void)removeAllFeatureSetDataAtLevelIndex:(unint64_t)a3;
- (void)removeAllSubscriptionsAtLevelIndex:(unint64_t)a3;
- (void)removeDisclosure:(id)a3 atLevel:(int64_t)a4;
- (void)removeDisclosure:(id)a3 atLevelIndex:(unint64_t)a4;
- (void)removeSubscription:(id)a3 atLevel:(int64_t)a4;
- (void)reportParseError:(id)a3 severity:(id)a4 whileParsingKey:(id)a5 inContext:(id)a6 inFile:(id)a7;
- (void)setBuildVersionGetter:(id)a3;
- (void)setFeaturesMatchingAttribute:(id)a3 levelIndex:(unint64_t)a4 value:(int64_t)a5;
- (void)setFilereader:(id)a3;
- (void)setFilewriter:(id)a3;
- (void)setParseerrorreporter:(id)a3;
- (void)setPlistparser:(id)a3;
- (void)setProfilePayloads:(id)a3;
- (void)setSafemodechecker:(id)a3;
- (void)setValue:(int64_t)a3 feature:(id)a4 domain:(id)a5 levelIndex:(unint64_t)a6;
- (void)setValue:(int64_t)a3 feature:(id)a4 domain:(id)a5 levelIndex:(unint64_t)a6 buildVersion:(id)a7;
- (void)unsetFeature:(id)a3 domain:(id)a4 level:(int64_t)a5;
- (void)unsetFeature:(id)a3 domain:(id)a4 levelIndex:(unint64_t)a5;
- (void)unsetFeatureSet:(id)a3 inGroup:(id)a4 atLevel:(int64_t)a5;
- (void)unsetFeaturesMatchingAttribute:(id)a3 level:(int64_t)a4;
- (void)validateName:(id)a3;
@end

@implementation FFConfiguration

+ (FFConfiguration)shared
{
  if (ffConfigOnce != -1) {
    _os_once();
  }
  return (FFConfiguration *)(id)instance;
}

- (id)initPrivate
{
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___FFConfiguration;
  v2 = -[FFConfiguration init](&v24, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->lock._os_unfair_lock_opaque = 0;
    -[FFConfiguration clearCachedData](v2, "clearCachedData");
    v4 = _os_feature_search_paths();
    v5 = (NSArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    if (*v4)
    {
      v6 = v4 + 1;
      do
      {
        objc_msgSend(NSString, "stringWithUTF8String:");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v5, "addObject:", v7);
      }

      while (*v6++);
    }

    searchPaths = v3->searchPaths;
    v3->searchPaths = v5;
    v10 = v5;

    v11 = objc_alloc_init(&OBJC_CLASS___FFDefaultFileWriter);
    filewriter = v3->_filewriter;
    v3->_filewriter = (FFFileWriter *)v11;

    v13 = objc_alloc_init(&OBJC_CLASS___FFDefaultFileReader);
    filereader = v3->_filereader;
    v3->_filereader = (FFFileReader *)v13;

    v15 = objc_alloc_init(&OBJC_CLASS___FFDefaultParseErrorReporter);
    parseerrorreporter = v3->_parseerrorreporter;
    v3->_parseerrorreporter = (FFParseErrorReporter *)v15;

    v17 = objc_alloc_init(&OBJC_CLASS___FFPlistParser);
    plistparser = v3->_plistparser;
    v3->_plistparser = v17;

    v19 = objc_alloc_init(&OBJC_CLASS___FFDefaultSafeModeChecker);
    safemodechecker = v3->_safemodechecker;
    v3->_safemodechecker = (FFSafeModeChecker *)v19;

    v21 = objc_alloc_init(&OBJC_CLASS___FFDefaultBuildVersionGetter);
    buildVersionGetter = v3->_buildVersionGetter;
    v3->_buildVersionGetter = (FFBuildVersionGetter *)v21;
  }

  return v3;
}

- (id)initPrivateForBootTask
{
  id v2 = -[FFConfiguration initPrivate](self, "initPrivate");
  v3 = v2;
  if (v2)
  {
    [v2 safemodechecker];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    int v5 = [v4 isItSafeMode];

    if (v5)
    {
      v6 = objc_alloc_init(&OBJC_CLASS___FFImmutableOnlyFileReader);
      [v3 filereader];
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[FFImmutableOnlyFileReader setUnderlying:](v6, "setUnderlying:", v7);

      [v3 setFilereader:v6];
    }
  }

  return v3;
}

+ (id)_configurationForTestingWithFileReader:(id)a3 fileWriter:(id)a4 buildVersionGetter:(id)a5 parseErrorReporter:(id)a6 safeModeChecker:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = -[FFConfiguration initPrivate](objc_alloc(&OBJC_CLASS___FFConfiguration), "initPrivate");
  v17 = v16;
  if (v16)
  {
    if (v11) {
      [v16 setFilereader:v11];
    }
    if (v12) {
      [v17 setFilewriter:v12];
    }
    if (v13) {
      [v17 setBuildVersionGetter:v13];
    }
    if (v14) {
      [v17 setParseerrorreporter:v14];
    }
    if (v15) {
      [v17 setSafemodechecker:v15];
    }
  }

  return v17;
}

+ (id)configurationForTestingWithFileReader:(id)a3 parseErrorReporter:(id)a4 safeModeChecker:(id)a5
{
  return (id)[a1 _configurationForTestingWithFileReader:a3 fileWriter:0 buildVersionGetter:0 parseErrorReporter:a4 safeModeChecker:a5];
}

+ (id)configurationForTestingWithFileReader:(id)a3 parseErrorReporter:(id)a4
{
  return (id)[a1 _configurationForTestingWithFileReader:a3 fileWriter:0 buildVersionGetter:0 parseErrorReporter:a4 safeModeChecker:0];
}

+ (id)configurationForTestingWithFileReader:(id)a3 fileWriter:(id)a4
{
  return (id)[a1 _configurationForTestingWithFileReader:a3 fileWriter:a4 buildVersionGetter:0 parseErrorReporter:0 safeModeChecker:0];
}

+ (id)configurationForTestingWithFileReader:(id)a3 fileWriter:(id)a4 buildVersionGetter:(id)a5
{
  return (id)[a1 _configurationForTestingWithFileReader:a3 fileWriter:a4 buildVersionGetter:a5 parseErrorReporter:0 safeModeChecker:0];
}

+ (id)configurationForTestingWithFileReader:(id)a3
{
  return (id)[a1 _configurationForTestingWithFileReader:a3 fileWriter:0 buildVersionGetter:0 parseErrorReporter:0 safeModeChecker:0];
}

+ (id)configurationForTestingWithFileWriter:(id)a3
{
  return (id)[a1 _configurationForTestingWithFileReader:0 fileWriter:a3 buildVersionGetter:0 parseErrorReporter:0 safeModeChecker:0];
}

- (void)clearCachedData
{
  uint64_t v3 = 0LL;
  configByLevelIndex = self->configByLevelIndex;
  char v5 = 1;
  do
  {
    uint64_t v6 = 0LL;
    char v7 = v5;
    v8 = configByLevelIndex[v3];
    do
    {
      v9 = v8[v6];
      v8[v6] = 0LL;

      ++v6;
    }

    while (v6 != 8);
    char v5 = 0;
    uint64_t v3 = 1LL;
  }

  while ((v7 & 1) != 0);
  uint64_t v10 = 0LL;
  metaByLevelIndex = self->metaByLevelIndex;
  do
  {
    id v12 = metaByLevelIndex[v10];
    metaByLevelIndex[v10] = 0LL;

    ++v10;
  }

  while (v10 != 8);
  -[NSMutableSet removeAllObjects](self->_domains, "removeAllObjects");
  uint64_t v13 = 0LL;
  disclosuresByLevelIndex = self->disclosuresByLevelIndex;
  do
  {
    id v15 = disclosuresByLevelIndex[v13];
    disclosuresByLevelIndex[v13] = 0LL;

    ++v13;
  }

  while (v13 != 8);
}

- (void)validateName:(id)a3
{
  id v4 = a3;
  if (!-[FFConfiguration isValidName:](self, "isValidName:")) {
    [MEMORY[0x189603F70] raise:@"FFInvalidName", @"Invalid domain or feature name: %@", v4 format];
  }
}

- (id)fileURLForDomain:(id)a3 pathIndex:(int)a4
{
  searchPaths = self->searchPaths;
  uint64_t v5 = a4;
  id v6 = a3;
  -[NSArray objectAtIndexedSubscript:](searchPaths, "objectAtIndexedSubscript:", v5);
  char v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 stringByAppendingString:@".plist"];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189604030] fileURLWithPath:v7 isDirectory:1];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 URLByAppendingPathComponent:@"/Domain/" isDirectory:1];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 URLByAppendingPathComponent:v8 isDirectory:0];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)fileURLForLevelIndex:(unint64_t)a3 pathIndex:(int)a4
{
  uint64_t v5 = -[NSArray objectAtIndexedSubscript:](self->searchPaths, "objectAtIndexedSubscript:", a4);
  if (a3 > 7 || ((1LL << a3) & 0x92) == 0) {
    -[FFConfiguration fileURLForLevelIndex:pathIndex:].cold.1(a3);
  }
  id v6 = (void *)v5;
  if (((0x6DuLL >> a3) & 1) != 0)
  {
    v9 = 0LL;
  }

  else
  {
    uint64_t v7 = fileNamesByLevelIndex[a3];
    [MEMORY[0x189604030] fileURLWithPath:v5 isDirectory:1];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 URLByAppendingPathComponent:v7 isDirectory:0];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)disclosureFileURLForLevelIndex:(unint64_t)a3 pathIndex:(int)a4
{
  uint64_t v5 = -[NSArray objectAtIndexedSubscript:](self->searchPaths, "objectAtIndexedSubscript:", a4);
  if (a3 > 7 || ((1LL << a3) & 0x92) == 0) {
    -[FFConfiguration disclosureFileURLForLevelIndex:pathIndex:].cold.1(a3);
  }
  id v6 = (void *)v5;
  if (((0x6DuLL >> a3) & 1) != 0)
  {
    v9 = 0LL;
  }

  else
  {
    uint64_t v7 = disclosureFileNamesByLevelIndex[a3];
    [MEMORY[0x189604030] fileURLWithPath:v5 isDirectory:1];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 URLByAppendingPathComponent:v7 isDirectory:0];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)internalDisclosureFileURLForLevelIndex:(unint64_t)a3
{
  id v4 = (void *)[objc_alloc(NSString) initWithUTF8String:_os_feature_internal_search_path()];
  uint64_t v5 = 0LL;
  if (a3 != 7 && a3 != 4)
  {
    if (a3 != 1) {
      -[FFConfiguration disclosureFileURLForLevelIndex:pathIndex:].cold.1(a3);
    }
    [MEMORY[0x189604030] fileURLWithPath:v4 isDirectory:1];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 URLByAppendingPathComponent:0x189E9B848 isDirectory:0];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)featureSetsFileURLForLevelIndex:(unint64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 != 5 && a3 != 2) {
    -[FFConfiguration featureSetsFileURLForLevelIndex:].cold.1(a3);
  }
  uint64_t v5 = featureSetsFileNamesByLevelIndex[a3];
  [MEMORY[0x189604030] fileURLWithPath:v4 isDirectory:1];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 URLByAppendingPathComponent:v5 isDirectory:0];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)subscriptionsFileURLForLevelIndex:(unint64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 != 6 && a3 != 3) {
    -[FFConfiguration subscriptionsFileURLForLevelIndex:].cold.1(a3);
  }
  uint64_t v5 = subscriptionsFileNamesByLevelIndex[a3];
  [MEMORY[0x189604030] fileURLWithPath:v4 isDirectory:1];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 URLByAppendingPathComponent:v5 isDirectory:0];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)makeFeatureDictionaryFrom:(id)a3 forDomain:(id)a4 atDomainLevel:(BOOL)a5 reportableFilename:(id)a6
{
  BOOL v46 = a5;
  uint64_t v66 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v43 = a4;
  id v39 = a6;
  id v42 = objc_alloc_init(MEMORY[0x189603FC8]);
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v60 objects:v65 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    unint64_t v13 = 0x189603000uLL;
    uint64_t v14 = *(void *)v61;
    id v15 = @"DevelopmentPhase";
    uint64_t v40 = *(void *)v61;
    v41 = self;
    id v45 = v10;
    do
    {
      uint64_t v16 = 0LL;
      uint64_t v44 = v12;
      do
      {
        if (*(void *)v61 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v17 = *(void *)(*((void *)&v60 + 1) + 8 * v16);
        v18 = (void *)MEMORY[0x186E3CE58]();
        if (-[FFConfiguration isValidName:](self, "isValidName:", v17))
        {
          uint64_t v54 = v17;
          [v10 objectForKeyedSubscript:v17];
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            [v19 objectForKeyedSubscript:@"Enabled"];
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            if (v46)
            {
              uint64_t v20 = v13;
              uint64_t v21 = [v19 objectForKeyedSubscript:v15];
              v22 = v15;
              v23 = (void *)v21;
              if (v21) {
                BOOL v24 = v55 == 0LL;
              }
              else {
                BOOL v24 = 1;
              }
              if (!v24)
              {
                v37 = v22;
                -[FFConfiguration reportParseError:severity:whileParsingKey:inContext:inFile:]( self,  "reportParseError:severity:whileParsingKey:inContext:inFile:",  @"A flag cannot have both Enabled and DevelopmentPhase keys",  FFParseErrorContextSeverityError);
                goto LABEL_28;
              }

              v37 = v22;
              v53 = (void *)v21;
            }

            else
            {
              uint64_t v20 = v13;
              v37 = v15;
              v53 = 0LL;
            }

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v51 = v18;
              uint64_t v52 = v16;
              BOOL v47 = [v55 intValue] != 0;
              goto LABEL_20;
            }

            objc_opt_class();
            v23 = v53;
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v51 = v18;
              uint64_t v52 = v16;
              BOOL v47 = -[FFConfiguration phaseShouldBeEnabledByDefault:](self, "phaseShouldBeEnabledByDefault:", v53);
LABEL_20:
              [v19 objectForKeyedSubscript:@"DisclosureRequired"];
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              [v19 objectForKeyedSubscript:@"Attributes"];
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v50 = v19;
              [v19 objectForKeyedSubscript:@"BuildVersion"];
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              [MEMORY[0x189603FC8] dictionary];
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              __int128 v56 = 0u;
              __int128 v57 = 0u;
              __int128 v58 = 0u;
              __int128 v59 = 0u;
              id v27 = v25;
              uint64_t v28 = [v27 countByEnumeratingWithState:&v56 objects:v64 count:16];
              if (v28)
              {
                uint64_t v29 = v28;
                uint64_t v30 = *(void *)v57;
                do
                {
                  for (uint64_t i = 0LL; i != v29; ++i)
                  {
                    if (*(void *)v57 != v30) {
                      objc_enumerationMutation(v27);
                    }
                    uint64_t v32 = *(void *)(*((void *)&v56 + 1) + 8 * i);
                    v33 = (void *)MEMORY[0x186E3CE58]();
                    [v27 objectForKeyedSubscript:v32];
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    v35 = -[FFFeatureAttribute initWithName:value:]( objc_alloc(&OBJC_CLASS___FFFeatureAttribute),  "initWithName:value:",  v32,  v34);
                    [v26 setObject:v35 forKeyedSubscript:v32];

                    objc_autoreleasePoolPop(v33);
                  }

                  uint64_t v29 = [v27 countByEnumeratingWithState:&v56 objects:v64 count:16];
                }

                while (v29);
              }

              v36 = -[FFFeatureState initWithDomain:feature:value:phase:disclosureRequired:attributes:buildVersion:]( objc_alloc(&OBJC_CLASS___FFFeatureState),  "initWithDomain:feature:value:phase:disclosureRequired:attributes:buildVersion:",  v43,  v54,  v47,  v53,  v49,  v26,  v48);
              [v42 setObject:v36 forKeyedSubscript:v54];

              uint64_t v14 = v40;
              self = v41;
              uint64_t v20 = 0x189603000LL;
              uint64_t v12 = v44;
              v37 = @"DevelopmentPhase";
              v23 = v53;
              v18 = v51;
              uint64_t v16 = v52;
              v19 = v50;
            }

- (void)recalculateFeatureSetEffectsAt:(unint64_t)a3
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  os_unfair_lock_assert_owner(&self->lock);
  if (a3 != 2 && a3 != 5) {
    -[FFConfiguration recalculateFeatureSetEffectsAt:].cold.1(a3);
  }
  uint64_t v5 = &(&self->super.isa)[a3];
  Class v6 = v5[12];
  v5[12] = 0LL;

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  obuint64_t j = v5[44];
  uint64_t v20 = -[objc_class countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v25,  v30,  16LL);
  if (v20)
  {
    uint64_t v19 = *(void *)v26;
    do
    {
      for (uint64_t i = 0LL; i != v20; ++i)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(obj);
        }
        v8 = -[NSMutableDictionary objectForKeyedSubscript:]( self->definedFeatureSets,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v25 + 1) + 8 * i));
        id v9 = v8;
        if (v8)
        {
          __int128 v23 = 0u;
          __int128 v24 = 0u;
          __int128 v21 = 0u;
          __int128 v22 = 0u;
          [v8 features];
          id v10 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v22;
            do
            {
              for (uint64_t j = 0LL; j != v12; ++j)
              {
                if (*(void *)v22 != v13) {
                  objc_enumerationMutation(v10);
                }
                id v15 = *(void **)(*((void *)&v21 + 1) + 8 * j);
                [v15 featureName];
                uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
                [v15 domainName];
                uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
                -[FFConfiguration setValue:feature:domain:levelIndex:]( self,  "setValue:feature:domain:levelIndex:",  1LL,  v16,  v17,  a3);
              }

              uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
            }

            while (v12);
          }
        }
      }

      uint64_t v20 = -[objc_class countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v25,  v30,  16LL);
    }

    while (v20);
  }
}

- (void)recalculateSubscriptionEffectsAt:(unint64_t)a3
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  os_unfair_lock_assert_owner(&self->lock);
  if (a3 != 3 && a3 != 6) {
    -[FFConfiguration recalculateFeatureSetEffectsAt:].cold.1(a3);
  }
  uint64_t v5 = &(&self->super.isa)[a3];
  Class v6 = v5[12];
  v5[12] = 0LL;

  uint64_t v7 = (void *)-[NSMutableSet copy](self->_domains, "copy");
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  obuint64_t j = v7;
  uint64_t v22 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v35;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v35 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = v8;
        uint64_t v9 = *(void *)(*((void *)&v34 + 1) + 8 * v8);
        -[FFConfiguration featuresForDomainAlreadyLocked:](self, "featuresForDomainAlreadyLocked:", v9);
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v30 = 0u;
        __int128 v31 = 0u;
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        id v24 = v10;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v39 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v25 = *(void *)v31;
          do
          {
            for (uint64_t i = 0LL; i != v12; ++i)
            {
              if (*(void *)v31 != v25) {
                objc_enumerationMutation(v24);
              }
              uint64_t v14 = *(void *)(*((void *)&v30 + 1) + 8 * i);
              __int128 v26 = 0u;
              __int128 v27 = 0u;
              __int128 v28 = 0u;
              __int128 v29 = 0u;
              id v15 = self->subscriptionsByLevelIndex[a3];
              uint64_t v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v26,  v38,  16LL);
              if (v16)
              {
                uint64_t v17 = v16;
                uint64_t v18 = *(void *)v27;
                do
                {
                  for (uint64_t j = 0LL; j != v17; ++j)
                  {
                    if (*(void *)v27 != v18) {
                      objc_enumerationMutation(v15);
                    }
                    if ([*(id *)(*((void *)&v26 + 1) + 8 * j) matchesFeature:v14 inDomain:v9 inAlreadyLockedConfiguration:self]) {
                      -[FFConfiguration setValue:feature:domain:levelIndex:]( self,  "setValue:feature:domain:levelIndex:",  1LL,  v14,  v9,  a3);
                    }
                  }

                  uint64_t v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v26,  v38,  16LL);
                }

                while (v17);
              }
            }

            uint64_t v12 = [v24 countByEnumeratingWithState:&v30 objects:v39 count:16];
          }

          while (v12);
        }

        uint64_t v8 = v23 + 1;
      }

      while (v23 + 1 != v22);
      uint64_t v22 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
    }

    while (v22);
  }
}

- (void)reportParseError:(id)a3 severity:(id)a4 whileParsingKey:(id)a5 inContext:(id)a6 inFile:(id)a7
{
  v21[5] = *MEMORY[0x1895F89C0];
  v20[0] = FFParseErrorMessageKey;
  v20[1] = FFParseErrorContextKeyKey;
  v21[0] = a3;
  v21[1] = a5;
  v20[2] = FFParseErrorContextOtherKey;
  v20[3] = FFParseErrorContextFilenameKey;
  v21[2] = a6;
  v21[3] = a7;
  v20[4] = FFParseErrorContextSeverityKey;
  v21[4] = a4;
  uint64_t v12 = (void *)MEMORY[0x189603F68];
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  [v12 dictionaryWithObjects:v21 forKeys:v20 count:5];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[FFConfiguration parseerrorreporter](self, "parseerrorreporter");
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 reportError:v18];
}

- (void)loadFeatureSetDataForLevelIndex:(unint64_t)a3
{
  unint64_t v3 = a3;
  id v4 = self;
  uint64_t v60 = *MEMORY[0x1895F89C0];
  if (a3 != 2 && a3 != 5) {
    abort();
  }
  enabledFeatureSetsByLevelIndex = self->enabledFeatureSetsByLevelIndex;
  if (!self->enabledFeatureSetsByLevelIndex[a3])
  {
    Class v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    uint64_t v7 = enabledFeatureSetsByLevelIndex[v3];
    enabledFeatureSetsByLevelIndex[v3] = v6;

    uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    uint64_t v9 = v4->enabledFeatureSetsAtLevelIndexByGroup[v3];
    v4->enabledFeatureSetsAtLevelIndexByGroup[v3] = v8;

    -[FFConfiguration featureSetsFileURLForLevelIndex:](v4, "featureSetsFileURLForLevelIndex:", v3);
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[FFConfiguration filereader](v4, "filereader");
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = v10;
      id v13 = v11;
      v38 = v12;
      objc_msgSend(v11, "dictionaryWithContentsOfURL:error:");
      id v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        __int128 v37 = v14;
        [v14 objectForKeyedSubscript:@"TentpoleFeatureSets"];
        id v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          enabledFeatureSetsAtLevelIndexByGroup = v4->enabledFeatureSetsAtLevelIndexByGroup;
          unint64_t v46 = v3;
          __int128 v56 = 0u;
          __int128 v57 = 0u;
          __int128 v54 = 0u;
          __int128 v55 = 0u;
          id v16 = v15;
          id v17 = v15;
          uint64_t v18 = [v17 countByEnumeratingWithState:&v54 objects:v59 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v55;
            uint64_t v44 = v4;
            id v40 = v17;
            uint64_t v41 = v16;
            uint64_t v39 = *(void *)v55;
            do
            {
              uint64_t v21 = 0LL;
              uint64_t v42 = v19;
              do
              {
                if (*(void *)v55 != v20) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v22 = *(void *)(*((void *)&v54 + 1) + 8 * v21);
                if (-[FFConfiguration isValidName:](v4, "isValidName:", v22))
                {
                  [v17 objectForKeyedSubscript:v22];
                  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    uint64_t v49 = v22;
                    uint64_t v43 = v21;
                    __int128 v52 = 0u;
                    __int128 v53 = 0u;
                    __int128 v50 = 0u;
                    __int128 v51 = 0u;
                    id v24 = v23;
                    uint64_t v25 = [v24 countByEnumeratingWithState:&v50 objects:v58 count:16];
                    __int128 v26 = v23;
                    if (v25)
                    {
                      uint64_t v27 = v25;
                      uint64_t v28 = *(void *)v51;
                      id v47 = v24;
                      v48 = v23;
                      do
                      {
                        for (uint64_t i = 0LL; i != v27; ++i)
                        {
                          if (*(void *)v51 != v28) {
                            objc_enumerationMutation(v24);
                          }
                          uint64_t v30 = *(void *)(*((void *)&v50 + 1) + 8 * i);
                          if (-[FFConfiguration isValidName:](v4, "isValidName:", v30))
                          {
                            [v24 objectForKeyedSubscript:v30];
                            __int128 v31 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              __int128 v32 = -[FFFeatureSetIdentifier initWithGroup:set:]( objc_alloc(&OBJC_CLASS___FFFeatureSetIdentifier),  "initWithGroup:set:",  v49,  v30);
                              __int128 v33 = enabledFeatureSetsByLevelIndex;
                              -[NSMutableSet addObject:](enabledFeatureSetsByLevelIndex[v46], "addObject:", v32);
                              -[NSMutableDictionary objectForKeyedSubscript:]( enabledFeatureSetsAtLevelIndexByGroup[v46],  "objectForKeyedSubscript:",  v49);
                              __int128 v34 = (void *)objc_claimAutoreleasedReturnValue();

                              if (!v34)
                              {
                                id v35 = objc_alloc_init(MEMORY[0x189603FE0]);
                                -[NSMutableDictionary setObject:forKeyedSubscript:]( enabledFeatureSetsAtLevelIndexByGroup[v46],  "setObject:forKeyedSubscript:",  v35,  v49);
                              }

                              -[NSMutableDictionary objectForKeyedSubscript:]( enabledFeatureSetsAtLevelIndexByGroup[v46],  "objectForKeyedSubscript:",  v49);
                              __int128 v36 = (void *)objc_claimAutoreleasedReturnValue();
                              [v36 addObject:v32];

                              enabledFeatureSetsByLevelIndex = v33;
                              id v4 = v44;
                              id v24 = v47;
                              __int128 v26 = v48;
                            }
                          }
                        }

                        uint64_t v27 = [v24 countByEnumeratingWithState:&v50 objects:v58 count:16];
                      }

                      while (v27);
                    }

                    uint64_t v23 = v26;
                    id v17 = v40;
                    id v16 = v41;
                    uint64_t v20 = v39;
                    uint64_t v19 = v42;
                    uint64_t v21 = v43;
                  }
                }

                ++v21;
              }

              while (v21 != v19);
              uint64_t v19 = [v17 countByEnumeratingWithState:&v54 objects:v59 count:16];
            }

            while (v19);
          }

          unint64_t v3 = v46;
          id v15 = v16;
        }

        id v14 = v37;
      }

      id v10 = v38;
    }

    -[FFConfiguration recalculateFeatureSetEffectsAt:](v4, "recalculateFeatureSetEffectsAt:", v3);
  }

- (void)removeAllFeatureSetDataAtLevelIndex:(unint64_t)a3
{
  uint64_t v5 = (objc_class *)objc_alloc_init(MEMORY[0x189603FE0]);
  Class v6 = &(&self->super.isa)[a3];
  Class v7 = v6[44];
  v6[44] = v5;

  uint64_t v8 = (objc_class *)objc_alloc_init(MEMORY[0x189603FC8]);
  Class v9 = v6[52];
  v6[52] = v8;
}

- (void)loadFeatureSetDefinitions
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  if (!self->definedFeatureGroups && !self->definedFeatureSets)
  {
    unint64_t v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    definedFeatureGroups = self->definedFeatureGroups;
    self->definedFeatureGroups = v3;

    uint64_t v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    definedFeatureSets = self->definedFeatureSets;
    self->definedFeatureSets = v5;

    Class v7 = (void *)[objc_alloc(NSString) initWithUTF8String:_os_feature_internal_search_path()];
    [MEMORY[0x189604030] fileURLWithPath:v7 isDirectory:1];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 URLByAppendingPathComponent:@"Tentpole/"];
    Class v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[FFConfiguration filereader](self, "filereader");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    id v27 = 0LL;
    [v10 contentsOfDirectoryAtURL:v9 error:&v27];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = v27;

    if (!v12)
    {
      uint64_t v21 = v11;
      uint64_t v22 = v7;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      id v13 = v11;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v24;
        do
        {
          for (uint64_t i = 0LL; i != v15; ++i)
          {
            if (*(void *)v24 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            objc_msgSend(v18, "lastPathComponent", v21, v22, (void)v23);
            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
            [v19 stringByDeletingPathExtension];
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (-[FFConfiguration isValidName:](self, "isValidName:", v20)) {
              -[FFConfiguration loadFeatureSetDefinitionsNamed:fromURL:]( self,  "loadFeatureSetDefinitionsNamed:fromURL:",  v20,  v18);
            }
          }

          uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v28 count:16];
        }

        while (v15);
      }

      uint64_t v11 = v21;
      Class v7 = v22;
    }
  }

- (void)loadFeatureSetDefinitionsNamed:(id)a3 fromURL:(id)a4
{
  uint64_t v73 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  __int128 v53 = v6;
  -[NSMutableDictionary objectForKeyedSubscript:](self->definedFeatureGroups, "objectForKeyedSubscript:", v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8) {
    -[FFConfiguration loadFeatureSetDefinitionsNamed:fromURL:].cold.2();
  }
  -[FFConfiguration filereader](self, "filereader");
  Class v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 dictionaryWithContentsOfURL:v7 error:0];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    uint64_t v11 = -[FFFeatureGroup initWithName:](objc_alloc(&OBJC_CLASS___FFFeatureGroup), "initWithName:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->definedFeatureGroups,  "setObject:forKeyedSubscript:",  v11,  v6);
    id v52 = objc_alloc_init(MEMORY[0x189603FC8]);
    -[FFFeatureGroup setFeatureSets:](v11, "setFeatureSets:");
    [v10 objectForKeyedSubscript:@"DisclosureRequired"];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v48 = self;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      id v12 = 0LL;
    }

    unint64_t v46 = v12;
    id v47 = v11;
    -[FFFeatureGroup setDisclosure:](v11, "setDisclosure:", v12);
    [v10 objectForKeyedSubscript:@"Attributes"];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603FC8] dictionary];
    __int128 v56 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    __int128 v69 = 0u;
    obuint64_t j = v13;
    uint64_t v14 = [obj countByEnumeratingWithState:&v66 objects:v72 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v67;
      do
      {
        for (uint64_t i = 0LL; i != v15; ++i)
        {
          if (*(void *)v67 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void *)(*((void *)&v66 + 1) + 8 * i);
          [obj objectForKeyedSubscript:v18];
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v20 = -[FFFeatureAttribute initWithName:value:]( objc_alloc(&OBJC_CLASS___FFFeatureAttribute),  "initWithName:value:",  v18,  v19);
          [v56 setObject:v20 forKeyedSubscript:v18];
        }

        uint64_t v15 = [obj countByEnumeratingWithState:&v66 objects:v72 count:16];
      }

      while (v15);
    }

    uint64_t v21 = v47;
    -[FFFeatureGroup setAttributes:](v47, "setAttributes:", v56);
    [v10 objectForKeyedSubscript:@"FeatureSets"];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v45 = v10;
      __int128 v64 = 0u;
      __int128 v65 = 0u;
      __int128 v62 = 0u;
      __int128 v63 = 0u;
      uint64_t v44 = v22;
      id v23 = v22;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v62 objects:v71 count:16];
      p_isa = (id *)&v48->super.isa;
      if (v24)
      {
        uint64_t v26 = v24;
        uint64_t v27 = *(void *)v63;
        uint64_t v50 = *(void *)v63;
        id v51 = v23;
        do
        {
          uint64_t v28 = 0LL;
          uint64_t v54 = v26;
          do
          {
            if (*(void *)v63 != v27) {
              objc_enumerationMutation(v23);
            }
            uint64_t v29 = *(void *)(*((void *)&v62 + 1) + 8 * v28);
            if ([p_isa isValidName:v29])
            {
              [v23 objectForKeyedSubscript:v29];
              uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              __int128 v55 = v30;
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                __int128 v31 = -[FFFeatureSetIdentifier initWithGroup:set:]( objc_alloc(&OBJC_CLASS___FFFeatureSetIdentifier),  "initWithGroup:set:",  v53,  v29);
                [p_isa[60] objectForKeyedSubscript:v31];
                __int128 v32 = (void *)objc_claimAutoreleasedReturnValue();

                if (v32) {
                  -[FFConfiguration loadFeatureSetDefinitionsNamed:fromURL:].cold.1();
                }
                id v33 = objc_alloc_init(MEMORY[0x189603FA8]);
                [v30 objectForKeyedSubscript:@"FeatureFlags"];
                __int128 v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  __int128 v60 = 0u;
                  __int128 v61 = 0u;
                  __int128 v58 = 0u;
                  __int128 v59 = 0u;
                  uint64_t v49 = v34;
                  id v35 = v34;
                  uint64_t v36 = [v35 countByEnumeratingWithState:&v58 objects:v70 count:16];
                  if (v36)
                  {
                    uint64_t v37 = v36;
                    uint64_t v38 = *(void *)v59;
                    do
                    {
                      for (uint64_t j = 0LL; j != v37; ++j)
                      {
                        if (*(void *)v59 != v38) {
                          objc_enumerationMutation(v35);
                        }
                        uint64_t v40 = *(void *)(*((void *)&v58 + 1) + 8 * j);
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          +[FFFeatureIdentifier identifierFromString:]( &OBJC_CLASS___FFFeatureIdentifier,  "identifierFromString:",  v40);
                          uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
                          if (v41) {
                            [v33 addObject:v41];
                          }
                        }
                      }

                      uint64_t v37 = [v35 countByEnumeratingWithState:&v58 objects:v70 count:16];
                    }

                    while (v37);
                  }

                  p_isa = (id *)&v48->super.isa;
                  __int128 v34 = v49;
                }

                uint64_t v42 = -[FFFeatureSet initWithIdentifier:]( objc_alloc(&OBJC_CLASS___FFFeatureSet),  "initWithIdentifier:",  v31);
                -[FFFeatureSet setFeatures:](v42, "setFeatures:", v33);
                [p_isa[60] setObject:v42 forKeyedSubscript:v31];
                -[FFFeatureSetIdentifier featureSetName](v31, "featureSetName");
                uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
                [v52 setObject:v42 forKeyedSubscript:v43];

                uint64_t v27 = v50;
                id v23 = v51;
                uint64_t v26 = v54;
              }
            }

            ++v28;
          }

          while (v28 != v26);
          uint64_t v26 = [v23 countByEnumeratingWithState:&v62 objects:v71 count:16];
        }

        while (v26);
      }

      id v10 = v45;
      uint64_t v21 = v47;
      uint64_t v22 = v44;
    }
  }
}

- (id)parseSubscriptionsDictionary:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
          -[FFConfiguration plistparser](self, "plistparser", (void)v15);
          id v12 = (void *)objc_claimAutoreleasedReturnValue();
          [v12 parseSubscriptionsFromDictionary:v11];
          id v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13) {
            [v5 addObject:v13];
          }

          ++v10;
        }

        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v8);
    }
  }

  return v5;
}

- (void)loadSubscriptionDataForLevelIndex:(unint64_t)a3
{
  if (a3 != 3 && a3 != 6) {
    -[FFConfiguration loadSubscriptionDataForLevelIndex:].cold.1(a3);
  }
  subscriptionsByLevelIndex = self->subscriptionsByLevelIndex;
  if (!self->subscriptionsByLevelIndex[a3])
  {
    id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    uint64_t v7 = subscriptionsByLevelIndex[a3];
    subscriptionsByLevelIndex[a3] = v6;

    -[FFConfiguration subscriptionsFileURLForLevelIndex:](self, "subscriptionsFileURLForLevelIndex:", a3);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[FFConfiguration filereader](self, "filereader");
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 dictionaryWithContentsOfURL:v12 error:0];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        [v9 objectForKeyedSubscript:@"Subscriptions"];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[FFConfiguration parseSubscriptionsDictionary:](self, "parseSubscriptionsDictionary:", v10);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObjectsFromArray:](subscriptionsByLevelIndex[a3], "addObjectsFromArray:", v11);
      }
    }

    -[FFConfiguration recalculateSubscriptionEffectsAt:](self, "recalculateSubscriptionEffectsAt:", a3);
  }

- (void)removeAllSubscriptionsAtLevelIndex:(unint64_t)a3
{
  if (a3 != 3 && a3 != 6) {
    -[FFConfiguration removeAllSubscriptionsAtLevelIndex:].cold.1(a3);
  }
  subscriptionsByLevelIndex = self->subscriptionsByLevelIndex;
  if (-[NSMutableArray count](self->subscriptionsByLevelIndex[a3], "count"))
  {
    id v6 = (objc_class *)objc_alloc_init(MEMORY[0x189603FC8]);
    uint64_t v7 = &(&self->super.isa)[a3];
    Class v8 = v7[62];
    v7[62] = v6;

    -[objc_class setObject:forKeyedSubscript:]( v7[62],  "setObject:forKeyedSubscript:",  MEMORY[0x189604A88],  @"#MODIFIED#");
    uint64_t v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    uint64_t v10 = subscriptionsByLevelIndex[a3];
    subscriptionsByLevelIndex[a3] = v9;

    Class v11 = v7[12];
    v7[12] = 0LL;
  }

- (void)loadCombinedDataForLevelIndex:(unint64_t)a3
{
  uint64_t v83 = *MEMORY[0x1895F89C0];
  if (!a3) {
    abort();
  }
  unint64_t v3 = a3;
  id v4 = self;
  configByLevelIndex = self->configByLevelIndex;
  if (!self->configByLevelIndex[0][a3])
  {
    uint64_t v5 = 0LL;
    location = (id *)&self->metaByLevelIndex[a3];
    disclosuresByLevelIndex = self->disclosuresByLevelIndex;
    char v7 = 1;
    unint64_t v8 = 0x189603000uLL;
    uint64_t v9 = @"Disclosed";
    __int128 v59 = self->disclosuresByLevelIndex;
    do
    {
      char v10 = v7;
      obuint64_t j = objc_alloc_init(*(Class *)(v8 + 4040));
      -[FFConfiguration fileURLForLevelIndex:pathIndex:](v4, "fileURLForLevelIndex:pathIndex:", v3, v5);
      Class v11 = (void *)objc_claimAutoreleasedReturnValue();
      id v12 = v11;
      char v67 = v10;
      if (v11)
      {
        [v11 path];
        id v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[FFConfiguration filereader](v4, "filereader");
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 dictionaryWithContentsOfURL:v12 error:0];
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          __int128 v64 = v12;
          __int128 v79 = 0u;
          __int128 v80 = 0u;
          __int128 v77 = 0u;
          __int128 v78 = 0u;
          v71 = v15;
          id v16 = v15;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v77 objects:v82 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v78;
            do
            {
              for (uint64_t i = 0LL; i != v18; ++i)
              {
                if (*(void *)v78 != v19) {
                  objc_enumerationMutation(v16);
                }
                uint64_t v21 = *(void *)(*((void *)&v77 + 1) + 8 * i);
                if (-[FFConfiguration isValidName:](v4, "isValidName:", v21))
                {
                  [v16 objectForKeyedSubscript:v21];
                  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    -[FFConfiguration makeFeatureDictionaryFrom:forDomain:atDomainLevel:reportableFilename:]( v4,  "makeFeatureDictionaryFrom:forDomain:atDomainLevel:reportableFilename:",  v22,  v21,  0LL,  v13);
                    id v23 = (void *)objc_claimAutoreleasedReturnValue();
                    [obj setObject:v23 forKeyedSubscript:v21];

                    id v4 = self;
                  }
                }
              }

              uint64_t v18 = [v16 countByEnumeratingWithState:&v77 objects:v82 count:16];
            }

            while (v18);
          }

          disclosuresByLevelIndex = v59;
          unint64_t v8 = 0x189603000uLL;
          id v12 = v64;
          __int128 v15 = v71;
        }

        uint64_t v9 = @"Disclosed";
      }

      objc_storeStrong((id *)&configByLevelIndex[v5][v3], obj);
      id v24 = objc_alloc_init(*(Class *)(v8 + 4040));
      [v24 setObject:v12 forKeyedSubscript:@"#FILE#"];
      objc_storeStrong(location, v24);
      v70 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
      uint64_t v25 = -[FFConfiguration disclosureFileURLForLevelIndex:pathIndex:]( v4,  "disclosureFileURLForLevelIndex:pathIndex:",  v3,  v5);
      uint64_t v26 = -[FFConfiguration internalDisclosureFileURLForLevelIndex:](v4, "internalDisclosureFileURLForLevelIndex:", v3);
      if (v25)
      {
        uint64_t v27 = disclosuresByLevelIndex;
        uint64_t v28 = v26;
        -[FFConfiguration filereader](v4, "filereader");
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v30 = (void *)v25;
        uint64_t v72 = [v29 dictionaryWithContentsOfURL:v25 error:0];

        uint64_t v26 = v28;
        disclosuresByLevelIndex = v27;
      }

      else
      {
        uint64_t v30 = 0LL;
        uint64_t v72 = 0LL;
      }

      __int128 v66 = (void *)v26;
      if (v26)
      {
        uint64_t v31 = v26;
        -[FFConfiguration filereader](v4, "filereader");
        __int128 v32 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v33 = [v32 dictionaryWithContentsOfURL:v31 error:0];
      }

      else
      {
        uint64_t v33 = 0LL;
      }

      __int128 v34 = v70;
      id v35 = (void *)v72;
      unint64_t v8 = 0x189603000LL;
      if (v72 | v33)
      {
        __int128 v60 = v30;
        [MEMORY[0x189603FA8] array];
        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v72)
        {
          [(id)v72 allKeys];
          uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
          [v36 addObjectsFromArray:v37];
        }

        id v61 = v24;
        __int128 v65 = v12;
        if (v33)
        {
          [(id)v33 allKeys];
          uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
          [v36 addObjectsFromArray:v38];
        }

        __int128 v75 = 0u;
        __int128 v76 = 0u;
        __int128 v73 = 0u;
        __int128 v74 = 0u;
        id v39 = v36;
        uint64_t v40 = [v39 countByEnumeratingWithState:&v73 objects:v81 count:16];
        if (v40)
        {
          uint64_t v41 = v40;
          uint64_t v42 = *(void *)v74;
          do
          {
            uint64_t v43 = 0LL;
            do
            {
              if (*(void *)v74 != v42) {
                objc_enumerationMutation(v39);
              }
              uint64_t v44 = *(void *)(*((void *)&v73 + 1) + 8 * v43);
              if (+[FFConfiguration isValidDisclosureName:]( &OBJC_CLASS___FFConfiguration,  "isValidDisclosureName:",  v44))
              {
                [v35 objectForKeyedSubscript:v44];
                id v45 = (void *)objc_claimAutoreleasedReturnValue();
                [v45 objectForKeyedSubscript:v9];
                unint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();

                if (v46)
                {
                  [v35 objectForKeyedSubscript:v44];
                  id v47 = (void *)objc_claimAutoreleasedReturnValue();
                  [v47 objectForKeyedSubscript:v9];
                  v48 = v9;
                  uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
                  int v50 = [v49 BOOLValue];
                }

                else
                {
                  int v50 = 0;
                  v48 = v9;
                }

                [(id)v33 objectForKeyedSubscript:v44];
                id v51 = (void *)objc_claimAutoreleasedReturnValue();
                [v51 objectForKeyedSubscript:v48];
                id v52 = (void *)objc_claimAutoreleasedReturnValue();

                if (v52)
                {
                  [(id)v33 objectForKeyedSubscript:v44];
                  __int128 v53 = (void *)objc_claimAutoreleasedReturnValue();
                  [v53 objectForKeyedSubscript:v48];
                  uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();
                  char v55 = [v54 BOOLValue];

                  uint64_t v9 = v48;
                  id v35 = (void *)v72;
                  if ((v55 & 1) == 0) {
                    goto LABEL_42;
                  }
LABEL_41:
                  -[NSMutableSet addObject:](v70, "addObject:", v44);
                  goto LABEL_42;
                }

                uint64_t v9 = v48;
                id v35 = (void *)v72;
                if (v50) {
                  goto LABEL_41;
                }
              }

- (void)addFeaturesForDomain:(id)a3 pathIndex:(int)a4 fromURL:(id)a5
{
  id v24 = a3;
  id v8 = a5;
  uint64_t v9 = (char *)self + 64 * (uint64_t)a4;
  uint64_t v11 = *((void *)v9 + 4);
  char v10 = (id *)(v9 + 32);
  if (!v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x189603FC8]);
    id v13 = *v10;
    id *v10 = v12;

    if (a4 == 1)
    {
      uint64_t v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
      __int128 v15 = self->metaByLevelIndex[0];
      self->metaByLevelIndex[0] = v14;
    }
  }

  [*v10 objectForKeyedSubscript:v24];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    id v17 = objc_alloc_init(MEMORY[0x189603FC8]);
    [*v10 setObject:v17 forKeyedSubscript:v24];

    if (a4 == 1)
    {
      id v18 = objc_alloc_init(MEMORY[0x189603FC8]);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->metaByLevelIndex[0],  "setObject:forKeyedSubscript:",  v18,  v24);
    }
  }

  -[FFConfiguration filereader](self, "filereader");
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 dictionaryWithContentsOfURL:v8 error:0];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

  [v8 path];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[FFConfiguration makeFeatureDictionaryFrom:forDomain:atDomainLevel:reportableFilename:]( self,  "makeFeatureDictionaryFrom:forDomain:atDomainLevel:reportableFilename:",  v20,  v24,  1LL,  v21);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  [*v10 setObject:v22 forKeyedSubscript:v24];

  if (a4 == 1)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->metaByLevelIndex[0], "objectForKeyedSubscript:", v24);
    id v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 setObject:v8 forKeyedSubscript:@"#FILE#"];
  }
}

- (void)loadDomain:(id)a3 levelIndex:(unint64_t)a4
{
  id v6 = a3;
  id v12 = v6;
  switch(a4)
  {
    case 0uLL:
      -[NSMutableDictionary objectForKeyedSubscript:](self->configByLevelIndex[0][0], "objectForKeyedSubscript:", v6);
      char v7 = (void *)objc_claimAutoreleasedReturnValue();

      id v6 = v12;
      if (v7) {
        goto LABEL_6;
      }
      id v8 = (void *)MEMORY[0x186E3CE58]();
      -[FFConfiguration fileURLForDomain:pathIndex:](self, "fileURLForDomain:pathIndex:", v12, 0LL);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[FFConfiguration addFeaturesForDomain:pathIndex:fromURL:]( self,  "addFeaturesForDomain:pathIndex:fromURL:",  v12,  0LL,  v9);

      objc_autoreleasePoolPop(v8);
      char v10 = (void *)MEMORY[0x186E3CE58]();
      -[FFConfiguration fileURLForDomain:pathIndex:](self, "fileURLForDomain:pathIndex:", v12, 1LL);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[FFConfiguration addFeaturesForDomain:pathIndex:fromURL:]( self,  "addFeaturesForDomain:pathIndex:fromURL:",  v12,  1LL,  v11);

      objc_autoreleasePoolPop(v10);
LABEL_5:
      id v6 = v12;
LABEL_6:

      return;
    case 1uLL:
    case 4uLL:
    case 7uLL:
      -[FFConfiguration loadCombinedDataForLevelIndex:](self, "loadCombinedDataForLevelIndex:", a4);
      goto LABEL_5;
    case 2uLL:
    case 5uLL:
      -[FFConfiguration loadFeatureSetDataForLevelIndex:](self, "loadFeatureSetDataForLevelIndex:", a4);
      goto LABEL_5;
    case 3uLL:
    case 6uLL:
      -[FFConfiguration loadSubscriptionDataForLevelIndex:](self, "loadSubscriptionDataForLevelIndex:", a4);
      goto LABEL_5;
    case 8uLL:
      abort();
    default:
      goto LABEL_6;
  }

- (void)loadAllLevelsForDomain:(id)a3
{
  id v4 = a3;
  -[FFConfiguration loadDomain:levelIndex:](self, "loadDomain:levelIndex:", v4, 0LL);
  -[FFConfiguration loadFeatureSetDefinitions](self, "loadFeatureSetDefinitions");
  -[FFConfiguration loadDomain:levelIndex:](self, "loadDomain:levelIndex:", v4, 1LL);
  -[FFConfiguration loadDomain:levelIndex:](self, "loadDomain:levelIndex:", v4, 2LL);
  -[FFConfiguration loadDomain:levelIndex:](self, "loadDomain:levelIndex:", v4, 4LL);
  -[FFConfiguration loadDomain:levelIndex:](self, "loadDomain:levelIndex:", v4, 5LL);
  -[FFConfiguration loadDomain:levelIndex:](self, "loadDomain:levelIndex:", v4, 7LL);
}

- (void)loadAllData
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  os_unfair_lock_assert_owner(&self->lock);
  uint64_t v3 = 0LL;
  id v4 = 0LL;
  char v5 = 1;
  unint64_t v6 = 0x189604000uLL;
  do
  {
    char v7 = v5;

    -[NSArray objectAtIndexedSubscript:](self->searchPaths, "objectAtIndexedSubscript:", v3);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(v6 + 48) fileURLWithPath:v8 isDirectory:1];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 URLByAppendingPathComponent:@"/Domain/"];
    char v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[FFConfiguration filereader](self, "filereader");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v44 = 0LL;
    [v11 contentsOfDirectoryAtURL:v10 error:&v44];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v4 = v44;

    if (!v4)
    {
      uint64_t v33 = v10;
      __int128 v34 = v8;
      char v35 = v7;
      __int128 v42 = 0u;
      __int128 v43 = 0u;
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v40 objects:v46 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v41;
        do
        {
          for (uint64_t i = 0LL; i != v15; ++i)
          {
            id v18 = v12;
            if (*(void *)v41 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v19 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            objc_msgSend(v19, "lastPathComponent", v33, v34);
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
            [v20 stringByDeletingPathExtension];
            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (-[FFConfiguration isValidName:](self, "isValidName:", v21)) {
              -[FFConfiguration addFeaturesForDomain:pathIndex:fromURL:]( self,  "addFeaturesForDomain:pathIndex:fromURL:",  v21,  v3,  v19);
            }

            id v12 = v18;
          }

          uint64_t v15 = [v13 countByEnumeratingWithState:&v40 objects:v46 count:16];
        }

        while (v15);
      }

      id v4 = 0LL;
      unint64_t v6 = 0x189604000LL;
      char v7 = v35;
      char v10 = v33;
      id v8 = v34;
    }

    char v5 = 0;
    uint64_t v3 = 1LL;
  }

  while ((v7 & 1) != 0);
  -[FFConfiguration loadFeatureSetDefinitions](self, "loadFeatureSetDefinitions");
  char v22 = 1;
  -[FFConfiguration loadCombinedDataForLevelIndex:](self, "loadCombinedDataForLevelIndex:", 1LL);
  -[FFConfiguration loadCombinedDataForLevelIndex:](self, "loadCombinedDataForLevelIndex:", 4LL);
  -[FFConfiguration loadCombinedDataForLevelIndex:](self, "loadCombinedDataForLevelIndex:", 7LL);
  -[FFConfiguration loadFeatureSetDataForLevelIndex:](self, "loadFeatureSetDataForLevelIndex:", 2LL);
  -[FFConfiguration loadFeatureSetDataForLevelIndex:](self, "loadFeatureSetDataForLevelIndex:", 5LL);
  id v23 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
  domains = self->_domains;
  self->_domains = v23;

  uint64_t v25 = 0LL;
  do
  {
    uint64_t v26 = 0LL;
    char v27 = v22;
    do
    {
      uint64_t v28 = self->configByLevelIndex[v25][v26];
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      uint64_t v29 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v28,  "countByEnumeratingWithState:objects:count:",  &v36,  v45,  16LL);
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v37;
        do
        {
          for (uint64_t j = 0LL; j != v30; ++j)
          {
            if (*(void *)v37 != v31) {
              objc_enumerationMutation(v28);
            }
            -[NSMutableSet addObject:]( self->_domains,  "addObject:",  *(void *)(*((void *)&v36 + 1) + 8 * j),  v33,  v34);
          }

          uint64_t v30 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v28,  "countByEnumeratingWithState:objects:count:",  &v36,  v45,  16LL);
        }

        while (v30);
      }

      ++v26;
    }

    while (v26 != 8);
    char v22 = 0;
    uint64_t v25 = 1LL;
  }

  while ((v27 & 1) != 0);
  -[FFConfiguration loadSubscriptionDataForLevelIndex:](self, "loadSubscriptionDataForLevelIndex:", 3LL);
  -[FFConfiguration loadSubscriptionDataForLevelIndex:](self, "loadSubscriptionDataForLevelIndex:", 6LL);
}

- (id)effectiveStateForFeature:(id)a3 domain:(id)a4 levelIndex:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  -[FFConfiguration buildVersionGetter](self, "buildVersionGetter");
  char v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 getBuildVersion];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_assert_owner(&self->lock);
  id v12 = &(&self->super.isa)[a5];
  for (uint64_t i = 12LL; i != -4; i -= 8LL)
  {
    -[objc_class objectForKeyedSubscript:](v12[i], "objectForKeyedSubscript:", v9);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 objectForKeyedSubscript:v8];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v16 = [v15 disclosurerequired];
    if (v16)
    {
      id v17 = (void *)v16;
      [v15 disclosurerequired];
      id v18 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v19 = -[FFConfiguration resolvedStateForDisclosure:](self, "resolvedStateForDisclosure:", v18);

      if (!v19) {
        goto LABEL_13;
      }
    }

    uint64_t v20 = [v15 buildVersion];
    if (v20)
    {
      uint64_t v21 = (void *)v20;
      [v15 buildVersion];
      char v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22 != v11 || v15 == 0LL) {
        goto LABEL_13;
      }
    }

    else if (!v15)
    {
      goto LABEL_13;
    }

    if ([v15 value] != 2) {
      goto LABEL_15;
    }
LABEL_13:
  }

  uint64_t v15 = 0LL;
LABEL_15:

  return v15;
}

- (BOOL)resolvedStateForDisclosure:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_assert_owner(&self->lock);
    uint64_t v5 = 0LL;
    unint64_t v6 = &self->disclosuresByLevelIndex[7];
    do
    {
      BOOL v7 = v5 != -8;
      if (v5 == -8) {
        break;
      }
      int v8 = -[NSMutableSet containsObject:](v6[v5--], "containsObject:", v4);
    }

    while (!v8);
  }

  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (id)resolvedStateForFeature:(id)a3 domain:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_owner(&self->lock);
  uint64_t v8 = 7LL;
  while (1)
  {
    -[FFConfiguration effectiveStateForFeature:domain:levelIndex:]( self,  "effectiveStateForFeature:domain:levelIndex:",  v6,  v7,  v8);
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    char v10 = v9;
    if (v9)
    {
      if ([v9 value] != 2) {
        break;
      }
    }

    if (--v8 == -1)
    {
      char v10 = 0LL;
      goto LABEL_11;
    }
  }

  if (v8)
  {
    -[FFConfiguration effectiveStateForFeature:domain:levelIndex:]( self,  "effectiveStateForFeature:domain:levelIndex:",  v6,  v7,  0LL);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = v11;
    if (v11)
    {
      [v11 phase];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        uint64_t v14 = (void *)[v10 copy];

        [v12 phase];
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 setPhase:v15];

        char v10 = v14;
      }
    }
  }

- (BOOL)isFeatureHidden:(id)a3 domain:(id)a4
{
  id v6 = a3;
  uint64_t v7 = 0LL;
  char v8 = 1;
  while (2)
  {
    char v9 = v8;
    char v10 = (char *)self + 64 * v7;
    for (uint64_t i = 88LL; i != 24; i -= 8LL)
    {
      [*(id *)&v10[i] objectForKeyedSubscript:a4];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 objectForKeyedSubscript:v6];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        uint64_t v14 = [v13 disclosurerequired];
        if (v14)
        {
          uint64_t v15 = (void *)v14;
          [v13 disclosurerequired];
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
          BOOL v17 = -[FFConfiguration resolvedStateForDisclosure:](self, "resolvedStateForDisclosure:", v16);

          if (!v17)
          {

            BOOL v18 = 1;
            goto LABEL_10;
          }
        }
      }
    }

    char v8 = 0;
    BOOL v18 = 0;
    uint64_t v7 = 1LL;
    if ((v9 & 1) != 0) {
      continue;
    }
    break;
  }

- (void)createMutableDomainConfig:(id)a3 levelIndex:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self->configByLevelIndex[1];
  char v8 = self->configByLevelIndex[1][a4];
  id v17 = v6;
  if (!v8)
  {
    char v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    char v10 = v7[a4];
    v7[a4] = v9;

    uint64_t v11 = (objc_class *)objc_alloc_init(MEMORY[0x189603FC8]);
    id v12 = &(&self->super.isa)[a4];
    Class v13 = v12[20];
    v12[20] = v11;

    id v6 = v17;
    char v8 = v7[a4];
  }

  -[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v6);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    id v15 = objc_alloc_init(MEMORY[0x189603FC8]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7[a4], "setObject:forKeyedSubscript:", v15, v17);

    id v16 = objc_alloc_init(MEMORY[0x189603FC8]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->metaByLevelIndex[a4],  "setObject:forKeyedSubscript:",  v16,  v17);
  }
}

- (void)setValue:(int64_t)a3 feature:(id)a4 domain:(id)a5 levelIndex:(unint64_t)a6
{
}

- (void)setValue:(int64_t)a3 feature:(id)a4 domain:(id)a5 levelIndex:(unint64_t)a6 buildVersion:(id)a7
{
  id v22 = a4;
  id v12 = a5;
  id v13 = a7;
  os_unfair_lock_assert_owner(&self->lock);
  if (a6 - 2 >= 6) {
    -[FFConfiguration setValue:feature:domain:levelIndex:buildVersion:].cold.2(a6);
  }
  if (a6 == 4)
  {
    -[FFConfiguration profilePayloads](self, "profilePayloads");
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14) {
      -[FFConfiguration setValue:feature:domain:levelIndex:buildVersion:].cold.1();
    }
  }

  -[FFConfiguration createMutableDomainConfig:levelIndex:](self, "createMutableDomainConfig:levelIndex:", v12, a6);
  id v15 = -[FFFeatureState initWithDomain:feature:value:buildVersion:]( objc_alloc(&OBJC_CLASS___FFFeatureState),  "initWithDomain:feature:value:buildVersion:",  v12,  v22,  a3,  v13);
  id v16 = (id *)&(&self->super.isa)[a6];
  [v16[12] objectForKeyedSubscript:v12];
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 setObject:v15 forKeyedSubscript:v22];

  if (a6 > 6 || ((1LL << a6) & 0x6C) == 0)
  {
    id v19 = v16[20];
    [v19 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"#MODIFIED#"];
    [v19 objectForKeyedSubscript:@"#FILE#"];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      -[FFConfiguration fileURLForLevelIndex:pathIndex:](self, "fileURLForLevelIndex:pathIndex:", a6, 1LL);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 setObject:v21 forKeyedSubscript:@"#FILE#"];
    }
  }

  if (a3 != 2)
  {
    domains = self->_domains;
    if (domains) {
      -[NSMutableSet addObject:](domains, "addObject:", v12);
    }
  }
}

- (void)setFeaturesMatchingAttribute:(id)a3 levelIndex:(unint64_t)a4 value:(int64_t)a5
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  -[FFConfiguration loadAllData](self, "loadAllData");
  uint64_t v7 = 0LL;
  __int128 v32 = self;
  configByLevelIndex = self->configByLevelIndex;
  char v8 = 1;
  do
  {
    char v9 = v8;
    if (a4 <= 7)
    {
      char v23 = v8;
      uint64_t v31 = (id *)configByLevelIndex[v7];
      do
      {
        __int128 v39 = 0u;
        __int128 v40 = 0u;
        __int128 v37 = 0u;
        __int128 v38 = 0u;
        obuint64_t j = *v31;
        uint64_t v26 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
        if (v26)
        {
          uint64_t v25 = *(void *)v38;
          do
          {
            uint64_t v10 = 0LL;
            do
            {
              if (*(void *)v38 != v25) {
                objc_enumerationMutation(obj);
              }
              uint64_t v27 = v10;
              uint64_t v11 = *(void *)(*((void *)&v37 + 1) + 8 * v10);
              __int128 v33 = 0u;
              __int128 v34 = 0u;
              __int128 v35 = 0u;
              __int128 v36 = 0u;
              [*v31 objectForKeyedSubscript:v11];
              id v30 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v12 = [v30 countByEnumeratingWithState:&v33 objects:v41 count:16];
              if (v12)
              {
                uint64_t v13 = v12;
                uint64_t v14 = *(void *)v34;
                do
                {
                  for (uint64_t i = 0LL; i != v13; ++i)
                  {
                    if (*(void *)v34 != v14) {
                      objc_enumerationMutation(v30);
                    }
                    uint64_t v16 = *(void *)(*((void *)&v33 + 1) + 8 * i);
                    [*v31 objectForKeyedSubscript:v11];
                    id v17 = (void *)objc_claimAutoreleasedReturnValue();
                    [v17 objectForKeyedSubscript:v16];
                    BOOL v18 = (void *)objc_claimAutoreleasedReturnValue();

                    [v18 attributes];
                    id v19 = (void *)objc_claimAutoreleasedReturnValue();
                    [v6 name];
                    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
                    [v19 objectForKeyedSubscript:v20];
                    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!-[FFConfiguration isFeatureHidden:domain:](v32, "isFeatureHidden:domain:", v16, v11)
                      && v21
                      && [v6 matchesAgainst:v21])
                    {
                      -[FFConfiguration setValue:feature:domain:levelIndex:]( v32,  "setValue:feature:domain:levelIndex:",  a5,  v16,  v11,  a4);
                    }
                  }

                  uint64_t v13 = [v30 countByEnumeratingWithState:&v33 objects:v41 count:16];
                }

                while (v13);
              }

              uint64_t v10 = v27 + 1;
            }

            while (v27 + 1 != v26);
            uint64_t v26 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
          }

          while (v26);
        }

        ++a4;
      }

      while (a4 != 8);
      a4 = 8LL;
      char v9 = v23;
    }

    char v8 = 0;
    uint64_t v7 = 1LL;
  }

  while ((v9 & 1) != 0);
}

- (void)populateDictionary:(id)a3 withFeatures:(id)a4
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        [v6 objectForKeyedSubscript:v11];
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v13 = [v12 value];
        if (v13 != 2
          || ([v12 buildVersion],
              uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(),
              v14,
              v14))
        {
          [v12 buildVersion];
          id v15 = (void *)objc_claimAutoreleasedReturnValue();

          uint64_t v16 = MEMORY[0x189604A80];
          if (v13 == 1) {
            uint64_t v16 = MEMORY[0x189604A88];
          }
          if (v15)
          {
            v26[0] = v16;
            v25[0] = @"Enabled";
            v25[1] = @"BuildVersion";
            [v12 buildVersion];
            id v17 = (void *)objc_claimAutoreleasedReturnValue();
            v26[1] = v17;
            [MEMORY[0x189603F68] dictionaryWithObjects:v26 forKeys:v25 count:2];
            BOOL v18 = (void *)objc_claimAutoreleasedReturnValue();
            [v5 setObject:v18 forKeyedSubscript:v11];
          }

          else
          {
            char v23 = @"Enabled";
            uint64_t v24 = v16;
            [MEMORY[0x189603F68] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
            id v17 = (void *)objc_claimAutoreleasedReturnValue();
            [v5 setObject:v17 forKeyedSubscript:v11];
          }
        }
      }

      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }

    while (v8);
  }
}

- (BOOL)writeDomainUpdates:(id *)a3
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v5 = self->metaByLevelIndex[0];
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  uint64_t v22 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
  if (v22)
  {
    __int128 v20 = self;
    uint64_t v21 = *(void *)v24;
    char v6 = 1;
    do
    {
      for (uint64_t i = 0LL; i != v22; ++i)
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(v5);
        }
        uint64_t v8 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v8);
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v9 objectForKeyedSubscript:@"#MODIFIED#"];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          [v9 objectForKeyedSubscript:@"#FILE#"];
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
          [v11 URLByDeletingLastPathComponent];
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[FFConfiguration filewriter](v20, "filewriter");
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
          int v14 = [v13 createDirectoryAtURL:v12 error:a3];

          if (v14)
          {
            id v15 = objc_alloc_init(MEMORY[0x189603FC8]);
            -[NSMutableDictionary objectForKeyedSubscript:]( v20->configByLevelIndex[1][0],  "objectForKeyedSubscript:",  v8);
            uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[FFConfiguration populateDictionary:withFeatures:](v20, "populateDictionary:withFeatures:", v15, v16);
            -[FFConfiguration filewriter](v20, "filewriter");
            id v17 = a3;
            BOOL v18 = (void *)objc_claimAutoreleasedReturnValue();
            char v6 = [v18 writeData:v15 toFile:v11 error:v17];

            a3 = v17;
          }

          else
          {
            char v6 = 0;
          }
        }
      }

      uint64_t v22 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
    }

    while (v22);
  }

  else
  {
    char v6 = 1;
  }

  return v6 & 1;
}

- (BOOL)writeCombinedUpdatesAtLevelIndex:(unint64_t)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  metaByLevelIndex = self->metaByLevelIndex;
  char v6 = self->metaByLevelIndex[a3];
  if (!v6) {
    return 1;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", @"#MODIFIED#");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9) {
    return 1;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](metaByLevelIndex[a3], "objectForKeyedSubscript:", @"#FILE#");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 URLByDeletingLastPathComponent];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FFConfiguration filewriter](self, "filewriter");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  int v13 = [v12 createDirectoryAtURL:v11 error:a4];

  if (v13)
  {
    __int128 v26 = v11;
    uint64_t v27 = v10;
    id v14 = objc_alloc_init(MEMORY[0x189603FC8]);
    id v15 = self->configByLevelIndex[1][a3];
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    uint64_t v16 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v28,  v32,  16LL);
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v29;
      do
      {
        for (uint64_t i = 0LL; i != v17; ++i)
        {
          if (*(void *)v29 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          id v21 = objc_alloc_init(MEMORY[0x189603FC8]);
          -[NSMutableDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v20);
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[FFConfiguration populateDictionary:withFeatures:](self, "populateDictionary:withFeatures:", v21, v22);
          [v14 setObject:v21 forKeyedSubscript:v20];
        }

        uint64_t v17 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v28,  v32,  16LL);
      }

      while (v17);
    }

    -[FFConfiguration filewriter](self, "filewriter");
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = v27;
    char v24 = [v23 writeData:v14 toFile:v27 error:a4];

    uint64_t v11 = v26;
  }

  else
  {
    char v24 = 0;
  }

  return v24;
}

- (BOOL)writeCombinedUpdates:(id *)a3
{
  BOOL v5 = -[FFConfiguration writeCombinedUpdatesAtLevelIndex:error:]( self,  "writeCombinedUpdatesAtLevelIndex:error:",  1LL,  a3);
  if (v5)
  {
    uint64_t v6 = 2LL;
    do
    {
      uint64_t v7 = v6;
      if (v6 == 8) {
        break;
      }
      BOOL v8 = -[FFConfiguration writeCombinedUpdatesAtLevelIndex:error:]( self,  "writeCombinedUpdatesAtLevelIndex:error:",  v6,  a3);
      uint64_t v6 = v7 + 1;
    }

    while (v8);
    LOBYTE(v5) = (unint64_t)(v7 - 1) > 6;
  }

  return v5;
}

- (BOOL)writeDisclosureUpdatesAtlevelIndex:(unint64_t)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  BOOL v5 = self->metaByLevelIndex[a3];
  if (!v5) {
    return 1;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", @"#DISCLOSURES_MODIFIED#");
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8) {
    return 1;
  }
  -[FFConfiguration disclosureFileURLForLevelIndex:pathIndex:]( self,  "disclosureFileURLForLevelIndex:pathIndex:",  a3,  1LL);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 URLByDeletingLastPathComponent];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FFConfiguration filewriter](self, "filewriter");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  int v12 = [v11 createDirectoryAtURL:v10 error:a4];

  if (v12)
  {
    id v13 = objc_alloc_init(MEMORY[0x189603FC8]);
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id v14 = self->disclosuresByLevelIndex[a3];
    uint64_t v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v23;
      do
      {
        for (uint64_t i = 0LL; i != v16; ++i)
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend( v13,  "setObject:forKey:",  &unk_189E9DF50,  *(void *)(*((void *)&v22 + 1) + 8 * i),  (void)v22);
        }

        uint64_t v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
      }

      while (v16);
    }

    -[FFConfiguration filewriter](self, "filewriter");
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
    char v20 = [v19 writeData:v13 toFile:v9 error:a4];
  }

  else
  {
    char v20 = 0;
  }

  return v20;
}

- (BOOL)writeDisclosureUpdates:(id *)a3
{
  uint64_t v5 = 1LL;
  BOOL result = 1;
  do
    BOOL result = result
          && -[FFConfiguration writeDisclosureUpdatesAtlevelIndex:error:]( self,  "writeDisclosureUpdatesAtlevelIndex:error:",  v5++,  a3);
  while (v5 != 8);
  return result;
}

- (BOOL)writeFeatureSetUpdatesAtLevelIndex:(unint64_t)a3 withError:(id *)a4
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  featureSetsMetaByLevelIndex = self->featureSetsMetaByLevelIndex;
  uint64_t v6 = self->featureSetsMetaByLevelIndex[a3];
  if (!v6) {
    return 1;
  }
  unint64_t v8 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", @"#MODIFIED#");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9) {
    return 1;
  }
  -[FFConfiguration featureSetsFileURLForLevelIndex:](self, "featureSetsFileURLForLevelIndex:", v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 URLByDeletingLastPathComponent];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FFConfiguration filewriter](self, "filewriter");
  int v12 = (void *)objc_claimAutoreleasedReturnValue();
  int v13 = [v12 createDirectoryAtURL:v11 error:a4];

  if (v13)
  {
    __int128 v36 = a4;
    __int128 v37 = v11;
    __int128 v38 = v10;
    __int128 v39 = featureSetsMetaByLevelIndex;
    id v14 = objc_alloc_init(MEMORY[0x189603FC8]);
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    unint64_t v40 = v8;
    obuint64_t j = self->enabledFeatureSetsByLevelIndex[v8];
    uint64_t v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v42,  v46,  16LL);
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v43;
      do
      {
        for (uint64_t i = 0LL; i != v16; ++i)
        {
          if (*(void *)v43 != v17) {
            objc_enumerationMutation(obj);
          }
          __int128 v19 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          objc_msgSend(v19, "featureGroupName", v36, v37, v38, v39);
          char v20 = (void *)objc_claimAutoreleasedReturnValue();
          [v14 objectForKeyedSubscript:v20];
          id v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v21)
          {
            id v22 = objc_alloc_init(MEMORY[0x189603FC8]);
            [v19 featureGroupName];
            __int128 v23 = (void *)objc_claimAutoreleasedReturnValue();
            [v14 setObject:v22 forKeyedSubscript:v23];
          }

          definedFeatureGroups = self->definedFeatureGroups;
          [v19 featureGroupName];
          __int128 v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](definedFeatureGroups, "objectForKeyedSubscript:", v25);
          __int128 v26 = (void *)objc_claimAutoreleasedReturnValue();

          [v19 featureGroupName];
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
          [v14 objectForKeyedSubscript:v27];
          __int128 v28 = (void *)objc_claimAutoreleasedReturnValue();
          [v19 featureSetName];
          __int128 v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26) {
            __int128 v30 = &unk_189E9DF78;
          }
          else {
            __int128 v30 = &unk_189E9DFA0;
          }
          [v28 setObject:v30 forKeyedSubscript:v29];
        }

        uint64_t v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v42,  v46,  16LL);
      }

      while (v16);
    }

    if ([v14 count]) {
      [MEMORY[0x189603F68] dictionaryWithObject:v14 forKey:@"TentpoleFeatureSets"];
    }
    else {
      [MEMORY[0x189603F68] dictionary];
    }
    __int128 v32 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = v38;
    featureSetsMetaByLevelIndex = v39;
    uint64_t v33 = v36;
    uint64_t v11 = v37;
    -[FFConfiguration filewriter](self, "filewriter", v36, v37, v38, v39);
    __int128 v34 = (void *)objc_claimAutoreleasedReturnValue();
    char v31 = [v34 writeData:v32 toFile:v10 error:v33];

    unint64_t v8 = v40;
  }

  else
  {
    char v31 = 0;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( featureSetsMetaByLevelIndex[v8],  "setObject:forKeyedSubscript:",  0LL,  @"#MODIFIED#");

  return v31;
}

- (BOOL)writeFeatureSetUpdates:(id *)a3
{
  return 1;
}

- (BOOL)writeSubscriptionUpdatesAtLevelIndex:(unint64_t)a3 withError:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  uint64_t v5 = self->subscriptionsMetaByLevelIndex[a3];
  if (!v5) {
    return 1;
  }
  unint64_t v7 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", @"#MODIFIED#");
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8) {
    return 1;
  }
  -[FFConfiguration subscriptionsFileURLForLevelIndex:](self, "subscriptionsFileURLForLevelIndex:", v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 URLByDeletingLastPathComponent];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FFConfiguration filewriter](self, "filewriter");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  int v12 = [v11 createDirectoryAtURL:v10 error:a4];

  if (v12)
  {
    __int128 v26 = a4;
    uint64_t v27 = v10;
    id v13 = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    unint64_t v28 = v7;
    obuint64_t j = self->subscriptionsByLevelIndex[v7];
    uint64_t v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v30,  v34,  16LL);
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v31;
      do
      {
        for (uint64_t i = 0LL; i != v15; ++i)
        {
          if (*(void *)v31 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          objc_msgSend(v18, "nameOfClass", v26);
          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
          id v20 = objc_alloc_init(MEMORY[0x189603FC8]);
          [v20 setObject:v19 forKeyedSubscript:@"SubscriptionClass"];
          [v18 encodeToDictionary];
          id v21 = (void *)objc_claimAutoreleasedReturnValue();
          [v20 setObject:v21 forKeyedSubscript:@"SubscriptionContents"];

          [v13 addObject:v20];
        }

        uint64_t v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v30,  v34,  16LL);
      }

      while (v15);
    }

    [MEMORY[0x189603F68] dictionaryWithObject:v13 forKey:@"Subscriptions"];
    id v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[FFConfiguration filewriter](self, "filewriter");
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue();
    char v24 = [v23 writeData:v22 toFile:v9 error:v26];

    unint64_t v7 = v28;
    uint64_t v10 = v27;
  }

  else
  {
    char v24 = 0;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->featureSetsMetaByLevelIndex[v7],  "setObject:forKeyedSubscript:",  0LL,  @"#MODIFIED#",  v26);

  return v24;
}

- (BOOL)writeSubscriptionUpdates:(id *)a3
{
  BOOL v5 = -[FFConfiguration writeSubscriptionUpdatesAtLevelIndex:withError:]( self,  "writeSubscriptionUpdatesAtLevelIndex:withError:",  3LL,  a3);
  if (v5) {
    LOBYTE(v5) = -[FFConfiguration writeSubscriptionUpdatesAtLevelIndex:withError:]( self,  "writeSubscriptionUpdatesAtLevelIndex:withError:",  6LL,  a3);
  }
  return v5;
}

- (NSSet)domains
{
  p_lock = &self->lock;
  os_unfair_lock_lock(&self->lock);
  -[FFConfiguration loadAllData](self, "loadAllData");
  id v4 = (void *)-[NSMutableSet copy](self->_domains, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSSet *)v4;
}

- (id)featuresForDomainAlreadyLocked:(id)a3
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v21 = a3;
  char v24 = self;
  id v25 = objc_alloc_init(MEMORY[0x189603FE0]);
  uint64_t v22 = 0LL;
  configByLevelIndex = self->configByLevelIndex;
  char v4 = 1;
  do
  {
    uint64_t v5 = 0LL;
    char v19 = v4;
    do
    {
      uint64_t v23 = v5;
      -[NSMutableDictionary objectForKeyedSubscript:](configByLevelIndex[v22][v5], "objectForKeyedSubscript:", v21);
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (!v7) {
        goto LABEL_15;
      }
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v27;
      do
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          [v6 objectForKeyedSubscript:v11];
          int v12 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v13 = [v12 disclosurerequired];
          if (!v13)
          {

LABEL_12:
            [v25 addObject:v11];
            continue;
          }

          uint64_t v14 = (void *)v13;
          [v6 objectForKeyedSubscript:v11];
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
          [v15 disclosurerequired];
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
          BOOL v17 = -[FFConfiguration resolvedStateForDisclosure:](v24, "resolvedStateForDisclosure:", v16);

          if (v17) {
            goto LABEL_12;
          }
        }

        uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }

      while (v8);
LABEL_15:

      uint64_t v5 = v23 + 1;
    }

    while (v23 != 7);
    char v4 = 0;
    uint64_t v22 = 1LL;
  }

  while ((v19 & 1) != 0);

  return v25;
}

- (id)featuresForDomain:(id)a3
{
  id v4 = a3;
  -[FFConfiguration validateName:](self, "validateName:", v4);
  p_lock = &self->lock;
  os_unfair_lock_lock(&self->lock);
  -[FFConfiguration loadAllLevelsForDomain:](self, "loadAllLevelsForDomain:", v4);
  -[FFConfiguration featuresForDomainAlreadyLocked:](self, "featuresForDomainAlreadyLocked:", v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)stateForFeature:(id)a3 domain:(id)a4
{
  return -[FFConfiguration stateForFeature:domain:level:](self, "stateForFeature:domain:level:", a3, a4, 4LL);
}

- (id)stateForFeature:(id)a3 domain:(id)a4 level:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  -[FFConfiguration validateName:](self, "validateName:", v9);
  -[FFConfiguration validateName:](self, "validateName:", v8);
  p_lock = &self->lock;
  os_unfair_lock_lock(&self->lock);
  switch(a5)
  {
    case 0LL:
      goto LABEL_5;
    case 1LL:
      a5 = 1LL;
      goto LABEL_5;
    case 2LL:
      a5 = 4LL;
      goto LABEL_5;
    case 3LL:
      a5 = 7LL;
LABEL_5:
      -[FFConfiguration loadDomain:levelIndex:](self, "loadDomain:levelIndex:", v9, a5);
      uint64_t v11 = -[FFConfiguration effectiveStateForFeature:domain:levelIndex:]( self,  "effectiveStateForFeature:domain:levelIndex:",  v8,  v9,  a5);
      break;
    case 4LL:
      -[FFConfiguration loadAllLevelsForDomain:](self, "loadAllLevelsForDomain:", v9);
      uint64_t v11 = -[FFConfiguration resolvedStateForFeature:domain:](self, "resolvedStateForFeature:domain:", v8, v9);
      break;
    default:
      -[FFConfiguration stateForFeature:domain:level:].cold.1(a5);
  }

  int v12 = (void *)v11;
  os_unfair_lock_unlock(p_lock);

  return v12;
}

- (id)defaultStateForFeature:(id)a3 domain:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[FFConfiguration validateName:](self, "validateName:", v7);
  -[FFConfiguration validateName:](self, "validateName:", v6);
  os_unfair_lock_lock(&self->lock);
  -[FFConfiguration loadDomain:levelIndex:](self, "loadDomain:levelIndex:", v7, 0LL);
  uint64_t v8 = 1LL;
  -[FFConfiguration loadDomain:levelIndex:](self, "loadDomain:levelIndex:", v7, 1LL);
  while (1)
  {
    -[FFConfiguration effectiveStateForFeature:domain:levelIndex:]( self,  "effectiveStateForFeature:domain:levelIndex:",  v6,  v7,  v8);
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = v9;
    if (v9)
    {
      if ([v9 value] != 2) {
        break;
      }
    }

    if (--v8 == -1)
    {
      uint64_t v10 = 0LL;
      break;
    }
  }

  os_unfair_lock_unlock(&self->lock);

  return v10;
}

- (void)enableFeature:(id)a3 domain:(id)a4 level:(int64_t)a5
{
  id v10 = a3;
  id v8 = a4;
  switch(a5)
  {
    case 1LL:
      uint64_t v9 = 1LL;
      break;
    case 2LL:
      uint64_t v9 = 4LL;
      break;
    case 3LL:
      uint64_t v9 = 7LL;
      break;
    case 4LL:
      abort();
    default:
      uint64_t v9 = 0LL;
      break;
  }

  -[FFConfiguration enableFeature:domain:levelIndex:](self, "enableFeature:domain:levelIndex:", v10, v8, v9);
}

- (void)enableFeature:(id)a3 domain:(id)a4 level:(int64_t)a5 transient:(BOOL)a6
{
  BOOL v6 = a6;
  id v12 = a3;
  id v10 = a4;
  switch(a5)
  {
    case 1LL:
      uint64_t v11 = 1LL;
      break;
    case 2LL:
      uint64_t v11 = 4LL;
      break;
    case 3LL:
      uint64_t v11 = 7LL;
      break;
    case 4LL:
      abort();
    default:
      uint64_t v11 = 0LL;
      break;
  }

  -[FFConfiguration enableFeature:domain:levelIndex:transient:]( self,  "enableFeature:domain:levelIndex:transient:",  v12,  v10,  v11,  v6);
}

- (void)enableFeature:(id)a3 domain:(id)a4 levelIndex:(unint64_t)a5
{
}

- (void)enableFeature:(id)a3 domain:(id)a4 levelIndex:(unint64_t)a5 transient:(BOOL)a6
{
  BOOL v6 = a6;
  id v13 = a3;
  id v10 = a4;
  -[FFConfiguration validateName:](self, "validateName:", v10);
  -[FFConfiguration validateName:](self, "validateName:", v13);
  if (v6)
  {
    -[FFConfiguration buildVersionGetter](self, "buildVersionGetter");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 getBuildVersion];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v12 = 0LL;
  }

  os_unfair_lock_lock(&self->lock);
  -[FFConfiguration loadDomain:levelIndex:](self, "loadDomain:levelIndex:", v10, a5);
  -[FFConfiguration setValue:feature:domain:levelIndex:buildVersion:]( self,  "setValue:feature:domain:levelIndex:buildVersion:",  1LL,  v13,  v10,  a5,  v12);

  os_unfair_lock_unlock(&self->lock);
}

- (void)enableFeaturesMatchingAttribute:(id)a3 level:(int64_t)a4
{
  id v7 = a3;
  switch(a4)
  {
    case 1LL:
      uint64_t v6 = 1LL;
      break;
    case 2LL:
      uint64_t v6 = 4LL;
      break;
    case 3LL:
      uint64_t v6 = 7LL;
      break;
    case 4LL:
      abort();
    default:
      uint64_t v6 = 0LL;
      break;
  }

  os_unfair_lock_lock(&self->lock);
  -[FFConfiguration setFeaturesMatchingAttribute:levelIndex:value:]( self,  "setFeaturesMatchingAttribute:levelIndex:value:",  v7,  v6,  1LL);
  os_unfair_lock_unlock(&self->lock);
}

- (void)disableFeature:(id)a3 domain:(id)a4 level:(int64_t)a5
{
  id v10 = a3;
  id v8 = a4;
  switch(a5)
  {
    case 1LL:
      uint64_t v9 = 1LL;
      break;
    case 2LL:
      uint64_t v9 = 4LL;
      break;
    case 3LL:
      uint64_t v9 = 7LL;
      break;
    case 4LL:
      abort();
    default:
      uint64_t v9 = 0LL;
      break;
  }

  -[FFConfiguration disableFeature:domain:levelIndex:](self, "disableFeature:domain:levelIndex:", v10, v8, v9);
}

- (void)disableFeature:(id)a3 domain:(id)a4 level:(int64_t)a5 transient:(BOOL)a6
{
  BOOL v6 = a6;
  id v12 = a3;
  id v10 = a4;
  switch(a5)
  {
    case 1LL:
      uint64_t v11 = 1LL;
      break;
    case 2LL:
      uint64_t v11 = 4LL;
      break;
    case 3LL:
      uint64_t v11 = 7LL;
      break;
    case 4LL:
      abort();
    default:
      uint64_t v11 = 0LL;
      break;
  }

  -[FFConfiguration disableFeature:domain:levelIndex:transient:]( self,  "disableFeature:domain:levelIndex:transient:",  v12,  v10,  v11,  v6);
}

- (void)disableFeature:(id)a3 domain:(id)a4 levelIndex:(unint64_t)a5
{
}

- (void)disableFeature:(id)a3 domain:(id)a4 levelIndex:(unint64_t)a5 transient:(BOOL)a6
{
  BOOL v6 = a6;
  id v13 = a3;
  id v10 = a4;
  -[FFConfiguration validateName:](self, "validateName:", v10);
  -[FFConfiguration validateName:](self, "validateName:", v13);
  if (v6)
  {
    -[FFConfiguration buildVersionGetter](self, "buildVersionGetter");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 getBuildVersion];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v12 = 0LL;
  }

  os_unfair_lock_lock(&self->lock);
  -[FFConfiguration loadDomain:levelIndex:](self, "loadDomain:levelIndex:", v10, a5);
  -[FFConfiguration setValue:feature:domain:levelIndex:buildVersion:]( self,  "setValue:feature:domain:levelIndex:buildVersion:",  0LL,  v13,  v10,  a5,  v12);

  os_unfair_lock_unlock(&self->lock);
}

- (void)disableFeaturesMatchingAttribute:(id)a3 level:(int64_t)a4
{
  id v7 = a3;
  switch(a4)
  {
    case 1LL:
      uint64_t v6 = 1LL;
      break;
    case 2LL:
      uint64_t v6 = 4LL;
      break;
    case 3LL:
      uint64_t v6 = 7LL;
      break;
    case 4LL:
      abort();
    default:
      uint64_t v6 = 0LL;
      break;
  }

  os_unfair_lock_lock(&self->lock);
  -[FFConfiguration setFeaturesMatchingAttribute:levelIndex:value:]( self,  "setFeaturesMatchingAttribute:levelIndex:value:",  v7,  v6,  0LL);
  os_unfair_lock_unlock(&self->lock);
}

- (void)unsetFeature:(id)a3 domain:(id)a4 level:(int64_t)a5
{
  id v10 = a3;
  id v8 = a4;
  switch(a5)
  {
    case 1LL:
      uint64_t v9 = 1LL;
      break;
    case 2LL:
      uint64_t v9 = 4LL;
      break;
    case 3LL:
      uint64_t v9 = 7LL;
      break;
    case 4LL:
      abort();
    default:
      uint64_t v9 = 0LL;
      break;
  }

  -[FFConfiguration unsetFeature:domain:levelIndex:](self, "unsetFeature:domain:levelIndex:", v10, v8, v9);
}

- (void)unsetFeature:(id)a3 domain:(id)a4 levelIndex:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  -[FFConfiguration validateName:](self, "validateName:", v8);
  -[FFConfiguration validateName:](self, "validateName:", v9);
  os_unfair_lock_lock(&self->lock);
  -[FFConfiguration loadDomain:levelIndex:](self, "loadDomain:levelIndex:", v8, a5);
  -[FFConfiguration setValue:feature:domain:levelIndex:](self, "setValue:feature:domain:levelIndex:", 2LL, v9, v8, a5);

  os_unfair_lock_unlock(&self->lock);
}

- (void)unsetFeaturesMatchingAttribute:(id)a3 level:(int64_t)a4
{
  id v7 = a3;
  switch(a4)
  {
    case 1LL:
      uint64_t v6 = 1LL;
      break;
    case 2LL:
      uint64_t v6 = 4LL;
      break;
    case 3LL:
      uint64_t v6 = 7LL;
      break;
    case 4LL:
      abort();
    default:
      uint64_t v6 = 0LL;
      break;
  }

  os_unfair_lock_lock(&self->lock);
  -[FFConfiguration setFeaturesMatchingAttribute:levelIndex:value:]( self,  "setFeaturesMatchingAttribute:levelIndex:value:",  v7,  v6,  2LL);
  os_unfair_lock_unlock(&self->lock);
}

- (void)_enableFeatureSetAlreadyLocked:(id)a3 atLevelIndex:(unint64_t)a4
{
  id v20 = a3;
  os_unfair_lock_assert_owner(&self->lock);
  -[NSMutableSet addObject:](self->enabledFeatureSetsByLevelIndex[a4], "addObject:", v20);
  enabledFeatureSetsAtLevelIndexByGroup = self->enabledFeatureSetsAtLevelIndexByGroup;
  id v7 = self->enabledFeatureSetsAtLevelIndexByGroup[a4];
  [v20 featureGroupName];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v8);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x189603FE0]);
    uint64_t v11 = enabledFeatureSetsAtLevelIndexByGroup[a4];
    [v20 featureGroupName];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v10, v12);
  }

  id v13 = enabledFeatureSetsAtLevelIndexByGroup[a4];
  [v20 featureGroupName];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v14);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 addObject:v20];

  featureSetsMetaByLevelIndex = self->featureSetsMetaByLevelIndex;
  BOOL v17 = self->featureSetsMetaByLevelIndex[a4];
  if (!v17)
  {
    uint64_t v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    char v19 = featureSetsMetaByLevelIndex[a4];
    featureSetsMetaByLevelIndex[a4] = v18;

    BOOL v17 = featureSetsMetaByLevelIndex[a4];
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  MEMORY[0x189604A88],  @"#MODIFIED#");
  -[FFConfiguration recalculateFeatureSetEffectsAt:](self, "recalculateFeatureSetEffectsAt:", a4);
}

- (void)_unsetFeatureSetAlreadyLocked:(id)a3 atLevelIndex:(unint64_t)a4
{
  p_lock = &self->lock;
  id v7 = a3;
  os_unfair_lock_assert_owner(p_lock);
  id v8 = (id *)&(&self->super.isa)[a4];
  [v8[44] removeObject:v7];
  id v9 = v8[52];
  [v7 featureGroupName];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 objectForKeyedSubscript:v10];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 removeObject:v7];

  featureSetsMetaByLevelIndex = self->featureSetsMetaByLevelIndex;
  id v13 = self->featureSetsMetaByLevelIndex[a4];
  if (!v13)
  {
    uint64_t v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    uint64_t v15 = featureSetsMetaByLevelIndex[a4];
    featureSetsMetaByLevelIndex[a4] = v14;

    id v13 = featureSetsMetaByLevelIndex[a4];
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  MEMORY[0x189604A88],  @"#MODIFIED#");
  -[FFConfiguration recalculateFeatureSetEffectsAt:](self, "recalculateFeatureSetEffectsAt:", a4);
}

- (void)addSubscriptionAlreadyLocked:(id)a3 atLevelIndex:(unint64_t)a4
{
  id v14 = a3;
  os_unfair_lock_assert_owner(&self->lock);
  subscriptionsByLevelIndex = self->subscriptionsByLevelIndex;
  id v7 = self->subscriptionsByLevelIndex[a4];
  if (!v7)
  {
    id v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    id v9 = subscriptionsByLevelIndex[a4];
    subscriptionsByLevelIndex[a4] = v8;

    id v7 = subscriptionsByLevelIndex[a4];
  }

  -[NSMutableArray addObject:](v7, "addObject:", v14);
  subscriptionsMetaByLevelIndex = self->subscriptionsMetaByLevelIndex;
  uint64_t v11 = self->subscriptionsMetaByLevelIndex[a4];
  if (!v11)
  {
    id v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    id v13 = subscriptionsMetaByLevelIndex[a4];
    subscriptionsMetaByLevelIndex[a4] = v12;

    uint64_t v11 = subscriptionsMetaByLevelIndex[a4];
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  MEMORY[0x189604A88],  @"#MODIFIED#");
  -[FFConfiguration recalculateSubscriptionEffectsAt:](self, "recalculateSubscriptionEffectsAt:", a4);
}

- (BOOL)commitUpdates:(id *)a3
{
  p_lock = &self->lock;
  os_unfair_lock_lock(&self->lock);
  BOOL v6 = -[FFConfiguration writeDomainUpdates:](self, "writeDomainUpdates:", a3)
    && -[FFConfiguration writeCombinedUpdates:](self, "writeCombinedUpdates:", a3)
    && -[FFConfiguration writeDisclosureUpdates:](self, "writeDisclosureUpdates:", a3)
    && -[FFConfiguration writeFeatureSetUpdates:](self, "writeFeatureSetUpdates:", a3)
    && -[FFConfiguration writeSubscriptionUpdates:](self, "writeSubscriptionUpdates:", a3);
  os_unfair_lock_unlock(p_lock);
  notify_post((const char *)[@"com.apple.featureflags.changed" UTF8String]);
  return v6;
}

+ (BOOL)isValidName:(id)a3
{
  id v3 = a3;
  id v4 = (unsigned __int8 *)[v3 UTF8String];
  int v5 = *v4;
  if (!*v4) {
    goto LABEL_13;
  }
  BOOL v6 = v4;
  uint64_t v7 = MEMORY[0x1895F8770];
  if (v5 == 95) {
    goto LABEL_7;
  }
  if (((char)v5 & 0x80000000) == 0)
  {
    goto LABEL_13;
  }

  if (!__maskrune((char)v5, 0x100uLL))
  {
LABEL_13:
    BOOL v10 = 0;
    goto LABEL_15;
  }

  while (1)
  {
    do
    {
LABEL_7:
      int v9 = *v6++;
      int v8 = v9;
    }

    while (v9 == 95);
    if (!v8) {
      break;
    }
    if ((char)v8 < 0)
    {
    }

    else if ((*(_DWORD *)(v7 + 4LL * (char)v8 + 60) & 0x500) == 0)
    {
      goto LABEL_13;
    }
  }

  BOOL v10 = 1;
LABEL_15:

  return v10;
}

- (BOOL)isValidName:(id)a3
{
  return +[FFConfiguration isValidName:](&OBJC_CLASS___FFConfiguration, "isValidName:", a3);
}

+ (BOOL)isValidDisclosureName:(id)a3
{
  id v3 = a3;
  id v4 = (char *)[v3 UTF8String];
  char v5 = *v4;
  if (*v4)
  {
    BOOL v6 = v4 + 1;
    uint64_t v7 = MEMORY[0x1895F8770];
    while (1)
    {
      if (v5 != 45 && v5 != 95)
      {
        if (!v5)
        {
          BOOL v9 = 1;
          goto LABEL_13;
        }

        if (v5 < 0)
        {
          if (!__maskrune(v5, 0x500uLL)) {
            break;
          }
        }

        else if ((*(_DWORD *)(v7 + 4LL * v5 + 60) & 0x500) == 0)
        {
          break;
        }
      }

      char v8 = *v6++;
      char v5 = v8;
    }
  }

  BOOL v9 = 0;
LABEL_13:

  return v9;
}

- (BOOL)resetDomain:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  -[FFConfiguration validateName:](self, "validateName:", v5);
  os_unfair_lock_lock(&self->lock);
  -[FFConfiguration loadAllLevelsForDomain:](self, "loadAllLevelsForDomain:", v5);
  for (uint64_t i = 4LL; i != 8; ++i)
  {
    uint64_t v7 = self->configByLevelIndex[1][i];
    -[NSMutableDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v5);
    char v8 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v9 = (void *)[v8 copy];

    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t j = 0LL; j != v12; ++j)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          -[FFConfiguration setValue:feature:domain:levelIndex:]( self,  "setValue:feature:domain:levelIndex:",  2LL,  *(void *)(*((void *)&v18 + 1) + 8 * j),  v5,  i);
        }

        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }

      while (v12);
    }
  }

  BOOL v15 = -[FFConfiguration writeDomainUpdates:](self, "writeDomainUpdates:", a4)
     && -[FFConfiguration writeCombinedUpdates:](self, "writeCombinedUpdates:", a4)
     && -[FFConfiguration writeFeatureSetUpdates:](self, "writeFeatureSetUpdates:", a4)
     && -[FFConfiguration writeSubscriptionUpdates:](self, "writeSubscriptionUpdates:", a4);
  os_unfair_lock_unlock(&self->lock);
  notify_post((const char *)[@"com.apple.featureflags.changed" UTF8String]);

  return v15;
}

- (BOOL)reset:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->lock);
  -[FFConfiguration fileURLForLevelIndex:pathIndex:](self, "fileURLForLevelIndex:pathIndex:", 7LL, 1LL);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 path];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  int v8 = [v5 fileExistsAtPath:v7];

  if (v8
    && ([v6 path],
        BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(),
        char v10 = [v5 removeItemAtPath:v9 error:a3],
        v9,
        (v10 & 1) == 0))
  {
    os_unfair_lock_unlock(&self->lock);
    BOOL v16 = 0;
    uint64_t v11 = v6;
  }

  else
  {
    -[FFConfiguration disclosureFileURLForLevelIndex:pathIndex:]( self,  "disclosureFileURLForLevelIndex:pathIndex:",  7LL,  1LL);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

    [v11 path];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    int v13 = [v5 fileExistsAtPath:v12];

    if (v13
      && ([v11 path],
          id v14 = (void *)objc_claimAutoreleasedReturnValue(),
          char v15 = [v5 removeItemAtPath:v14 error:a3],
          v14,
          (v15 & 1) == 0))
    {
      os_unfair_lock_unlock(&self->lock);
      BOOL v16 = 0;
    }

    else
    {
      -[FFConfiguration clearCachedData](self, "clearCachedData");
      os_unfair_lock_unlock(&self->lock);
      notify_post((const char *)[@"com.apple.featureflags.changed" UTF8String]);
      BOOL v16 = 1;
    }
  }

  return v16;
}

- (BOOL)isSafeMode
{
  return -[FFSafeModeChecker isItSafeMode](self->_safemodechecker, "isItSafeMode");
}

- (BOOL)phaseShouldBeEnabledByDefault:(id)a3
{
  return [a3 isEqualToString:@"FeatureComplete"];
}

- (unsigned)sortValueForPhase:(id)a3
{
  if (objc_msgSend(@"UnderDevelopment", "isEqualToString:")) {
    return 10;
  }
  uint64_t v5 = 0LL;
  do
  {
    uint64_t v6 = v5;
    v5 += 16LL;
  }

  while (v5 != 64
       && ![*(id *)((char *)&FFKnownPhasesAndValues + v6 + 24) isEqualToString:a3]);
  return *(_DWORD *)((char *)&FFKnownPhasesAndValues + v6 + 16);
}

- (FFFileWriter)filewriter
{
  return self->_filewriter;
}

- (void)setFilewriter:(id)a3
{
}

- (FFFileReader)filereader
{
  return self->_filereader;
}

- (void)setFilereader:(id)a3
{
}

- (FFParseErrorReporter)parseerrorreporter
{
  return self->_parseerrorreporter;
}

- (void)setParseerrorreporter:(id)a3
{
}

- (FFPlistParser)plistparser
{
  return self->_plistparser;
}

- (void)setPlistparser:(id)a3
{
}

- (FFSafeModeChecker)safemodechecker
{
  return self->_safemodechecker;
}

- (void)setSafemodechecker:(id)a3
{
}

- (FFBuildVersionGetter)buildVersionGetter
{
  return self->_buildVersionGetter;
}

- (void)setBuildVersionGetter:(id)a3
{
}

- (NSMutableArray)profilePayloads
{
  return self->_profilePayloads;
}

- (void)setProfilePayloads:(id)a3
{
}

- (void).cxx_destruct
{
  for (uint64_t i = 0LL; i != -8; --i)
    objc_storeStrong((id *)&self->subscriptionsByLevelIndex[i + 7], 0LL);
  for (uint64_t j = 0LL; j != -8; --j)
    objc_storeStrong((id *)&self->subscriptionsMetaByLevelIndex[j + 7], 0LL);
  objc_storeStrong((id *)&self->definedFeatureGroups, 0LL);
  objc_storeStrong((id *)&self->definedFeatureSets, 0LL);
  for (uint64_t k = 0LL; k != -8; --k)
    objc_storeStrong((id *)&self->enabledFeatureSetsAtLevelIndexByGroup[k + 7], 0LL);
  for (uint64_t m = 0LL; m != -8; --m)
    objc_storeStrong((id *)&self->enabledFeatureSetsByLevelIndex[m + 7], 0LL);
  for (uint64_t n = 0LL; n != -8; --n)
    objc_storeStrong((id *)&self->featureSetsMetaByLevelIndex[n + 7], 0LL);
  for (iuint64_t i = 0LL; ii != -8; --ii)
    objc_storeStrong((id *)&self->disclosuresByLevelIndex[ii + 7], 0LL);
  for (juint64_t j = 0LL; jj != -8; --jj)
    objc_storeStrong((id *)&self->metaByLevelIndex[jj + 7], 0LL);
  for (kuint64_t k = 19LL; kk != 3; --kk)
    objc_storeStrong((id *)&(&self->super.isa)[kk], 0LL);
  objc_storeStrong((id *)&self->_domains, 0LL);
  objc_storeStrong((id *)&self->searchPaths, 0LL);
}

- (id)definedFeatureGroupsFilteredByCurrentDisclosures
{
  uint64_t v3 = MEMORY[0x1895F87A8];
  definedFeatureGroups = self->definedFeatureGroups;
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __79__FFConfiguration_Disclosure__definedFeatureGroupsFilteredByCurrentDisclosures__block_invoke;
  v16[3] = &unk_189E9B3D8;
  v16[4] = self;
  -[NSMutableDictionary keysOfEntriesPassingTest:](definedFeatureGroups, "keysOfEntriesPassingTest:", v16);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = self->enabledFeatureSetsAtLevelIndexByGroup[5];
  v15[0] = v3;
  v15[1] = 3221225472LL;
  v15[2] = __79__FFConfiguration_Disclosure__definedFeatureGroupsFilteredByCurrentDisclosures__block_invoke_2;
  v15[3] = &unk_189E9B400;
  v15[4] = self;
  -[NSMutableDictionary keysOfEntriesPassingTest:](v6, "keysOfEntriesPassingTest:", v15);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary keysOfEntriesPassingTest:]( self->enabledFeatureSetsAtLevelIndexByGroup[2],  "keysOfEntriesPassingTest:",  &__block_literal_global);
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setByAddingObjectsFromSet:v7];
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 setByAddingObjectsFromSet:v8];
  char v10 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v11 = self->definedFeatureGroups;
  [v10 allObjects];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary dictionaryWithValuesForKeys:](v11, "dictionaryWithValuesForKeys:", v12);
  int v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __79__FFConfiguration_Disclosure__definedFeatureGroupsFilteredByCurrentDisclosures__block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  [a3 disclosure];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v3 resolvedStateForDisclosure:v4];

  return v5;
}

uint64_t __79__FFConfiguration_Disclosure__definedFeatureGroupsFilteredByCurrentDisclosures__block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v5 = a3;
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 488) objectForKeyedSubscript:a2];

  if (v6) {
    uint64_t v6 = [v5 count] != 0;
  }

  return v6;
}

BOOL __79__FFConfiguration_Disclosure__definedFeatureGroupsFilteredByCurrentDisclosures__block_invoke_3( uint64_t a1,  uint64_t a2,  void *a3)
{
  return [a3 count] != 0;
}

- (id)definedFeatureSetsFilteredByCurrentDisclosures
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 allValues];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  id v5 = objc_alloc_init(MEMORY[0x189603FC8]);
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __77__FFConfiguration_Disclosure__definedFeatureSetsFilteredByCurrentDisclosures__block_invoke;
  v8[3] = &unk_189E9B490;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateObjectsUsingBlock:v8];

  return v6;
}

void __77__FFConfiguration_Disclosure__definedFeatureSetsFilteredByCurrentDisclosures__block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __77__FFConfiguration_Disclosure__definedFeatureSetsFilteredByCurrentDisclosures__block_invoke_2;
  v4[3] = &unk_189E9B468;
  id v5 = *(id *)(a1 + 32);
  [v3 enumerateKeysAndObjectsUsingBlock:v4];
}

void __77__FFConfiguration_Disclosure__definedFeatureSetsFilteredByCurrentDisclosures__block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a3;
  [v4 identifier];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v4 forKey:v5];
}

- (id)mutableDisclosureSetAtLevelIndex:(unint64_t)a3
{
  disclosuresByLevelIndex = self->disclosuresByLevelIndex;
  id v6 = disclosuresByLevelIndex[a3];
  if (!v6)
  {
    uint64_t v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    int v8 = disclosuresByLevelIndex[a3];
    disclosuresByLevelIndex[a3] = v7;

    id v6 = disclosuresByLevelIndex[a3];
  }

  return v6;
}

- (void)addDisclosure:(id)a3 atLevel:(int64_t)a4
{
  id v6 = a3;
  id v9 = v6;
  if (a4 == 2)
  {
    -[FFConfiguration profilePayloads](self, "profilePayloads");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7) {
      -[FFConfiguration(Disclosure) addDisclosure:atLevel:].cold.2();
    }
    uint64_t v8 = 4LL;
  }

  else
  {
    uint64_t v8 = 7LL;
  }

  os_unfair_lock_lock(&self->lock);
  -[FFConfiguration addDisclosureAlreadyLocked:atLevelIndex:](self, "addDisclosureAlreadyLocked:atLevelIndex:", v9, v8);
  os_unfair_lock_unlock(&self->lock);
}

- (void)addDisclosureAlreadyLocked:(id)a3 atLevelIndex:(unint64_t)a4
{
  id v11 = a3;
  -[FFConfiguration mutableDisclosureSetAtLevelIndex:](self, "mutableDisclosureSetAtLevelIndex:", a4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (([v6 containsObject:v11] & 1) == 0)
  {
    [v6 addObject:v11];
    metaByLevelIndex = self->metaByLevelIndex;
    uint64_t v8 = self->metaByLevelIndex[a4];
    if (!v8)
    {
      id v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
      char v10 = metaByLevelIndex[a4];
      metaByLevelIndex[a4] = v9;

      uint64_t v8 = metaByLevelIndex[a4];
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  MEMORY[0x189604A88],  @"#DISCLOSURES_MODIFIED#");
  }

  -[FFConfiguration recalculateSubscriptionEffectsAt:](self, "recalculateSubscriptionEffectsAt:", 3LL);
  -[FFConfiguration recalculateSubscriptionEffectsAt:](self, "recalculateSubscriptionEffectsAt:", 6LL);
}

- (void)removeDisclosure:(id)a3 atLevel:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  id v10 = v6;
  if (a4 == 2)
  {
    -[FFConfiguration profilePayloads](self, "profilePayloads");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8) {
      -[FFConfiguration(Disclosure) removeDisclosure:atLevel:].cold.2();
    }
    uint64_t v9 = 4LL;
    id v7 = v10;
  }

  else
  {
    uint64_t v9 = 7LL;
  }

  -[FFConfiguration removeDisclosure:atLevelIndex:](self, "removeDisclosure:atLevelIndex:", v7, v9);
}

- (void)removeDisclosure:(id)a3 atLevelIndex:(unint64_t)a4
{
  id v11 = a3;
  os_unfair_lock_lock(&self->lock);
  -[FFConfiguration mutableDisclosureSetAtLevelIndex:](self, "mutableDisclosureSetAtLevelIndex:", a4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v6 containsObject:v11])
  {
    [v6 removeObject:v11];
    metaByLevelIndex = self->metaByLevelIndex;
    uint64_t v8 = self->metaByLevelIndex[a4];
    if (!v8)
    {
      uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
      id v10 = metaByLevelIndex[a4];
      metaByLevelIndex[a4] = v9;

      uint64_t v8 = metaByLevelIndex[a4];
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  MEMORY[0x189604A88],  @"#DISCLOSURES_MODIFIED#");
  }

  -[FFConfiguration recalculateSubscriptionEffectsAt:](self, "recalculateSubscriptionEffectsAt:", 3LL);
  -[FFConfiguration recalculateSubscriptionEffectsAt:](self, "recalculateSubscriptionEffectsAt:", 6LL);
  os_unfair_lock_unlock(&self->lock);
}

- (void)removeAllDisclosuresAtLevelIndex:(unint64_t)a3
{
  if (a3 == 4)
  {
    -[FFConfiguration profilePayloads](self, "profilePayloads");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5) {
      -[FFConfiguration(Disclosure) removeAllDisclosuresAtLevelIndex:].cold.2();
    }
  }

  else if (a3 != 7)
  {
    -[FFConfiguration(Disclosure) removeAllDisclosuresAtLevelIndex:].cold.1(a3);
  }

  os_unfair_lock_assert_owner(&self->lock);
  -[FFConfiguration mutableDisclosureSetAtLevelIndex:](self, "mutableDisclosureSetAtLevelIndex:", a3);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v10 removeAllObjects];
  metaByLevelIndex = self->metaByLevelIndex;
  id v7 = metaByLevelIndex[a3];
  if (!v7)
  {
    uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    uint64_t v9 = metaByLevelIndex[a3];
    metaByLevelIndex[a3] = v8;

    id v7 = metaByLevelIndex[a3];
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  MEMORY[0x189604A88],  @"#DISCLOSURES_MODIFIED#");
}

- (id)currentDisclosuresAtLevel:(int64_t)a3
{
  switch(a3)
  {
    case 1LL:
      uint64_t v3 = 1LL;
      break;
    case 2LL:
      uint64_t v3 = 4LL;
      break;
    case 3LL:
      uint64_t v3 = 7LL;
      break;
    case 4LL:
      abort();
    default:
      uint64_t v3 = 0LL;
      break;
  }

  return -[FFConfiguration currentDisclosuresAtLevelIndex:](self, "currentDisclosuresAtLevelIndex:", v3);
}

- (id)currentDisclosuresAtLevelIndex:(unint64_t)a3
{
  p_locuint64_t k = &self->lock;
  os_unfair_lock_lock(&self->lock);
  -[FFConfiguration loadAllData](self, "loadAllData");
  -[FFConfiguration mutableDisclosureSetAtLevelIndex:](self, "mutableDisclosureSetAtLevelIndex:", a3);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = (void *)[v6 copy];

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (id)currentDisclosures
{
  p_locuint64_t k = &self->lock;
  os_unfair_lock_lock(&self->lock);
  -[FFConfiguration loadAllData](self, "loadAllData");
  id v4 = objc_alloc_init(MEMORY[0x189603FE0]);
  for (uint64_t i = 7LL; i != -1; --i)
  {
    id v6 = (void *)MEMORY[0x186E3CE58]();
    -[FFConfiguration mutableDisclosureSetAtLevelIndex:](self, "mutableDisclosureSetAtLevelIndex:", i);
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 unionSet:v7];

    objc_autoreleasePoolPop(v6);
  }

  uint64_t v8 = (void *)[v4 copy];
  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (BOOL)isValidDisclosureName:(id)a3
{
  return +[FFConfiguration isValidDisclosureName:](&OBJC_CLASS___FFConfiguration, "isValidDisclosureName:", a3);
}

- (id)disclosureForFeature:(id)a3 domain:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  locuint64_t k = &self->lock;
  os_unfair_lock_lock(&self->lock);
  uint64_t v8 = 0LL;
  char v9 = 1;
  while (2)
  {
    char v10 = v9;
    id v11 = (char *)self + 64 * v8;
    for (uint64_t i = 88LL; i != 24; i -= 8LL)
    {
      [*(id *)&v11[i] objectForKeyedSubscript:v7];
      int v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 objectForKeyedSubscript:v6];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        uint64_t v15 = [v14 disclosurerequired];
        if (v15)
        {
          BOOL v16 = (void *)v15;
          [v14 disclosurerequired];
          BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();
          BOOL v18 = -[FFConfiguration resolvedStateForDisclosure:](self, "resolvedStateForDisclosure:", v17);

          if (v18)
          {
            os_unfair_lock_unlock(lock);
            [v14 disclosurerequired];
            __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_10;
          }
        }
      }
    }

    char v9 = 0;
    uint64_t v8 = 1LL;
    if ((v10 & 1) != 0) {
      continue;
    }
    break;
  }

  os_unfair_lock_unlock(lock);
  __int128 v19 = 0LL;
LABEL_10:

  return v19;
}

+ (id)configurationForProfileManagement
{
  return -[FFConfiguration initPrivate](objc_alloc(&OBJC_CLASS___FFConfiguration), "initPrivate");
}

- (void)prepareToAddProfilePayloads
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  locuint64_t k = &self->lock;
  os_unfair_lock_lock(&self->lock);
  -[FFConfiguration loadCombinedDataForLevelIndex:](self, "loadCombinedDataForLevelIndex:", 4LL);
  id v3 = objc_alloc_init(MEMORY[0x189603FA8]);
  -[FFConfiguration setProfilePayloads:](self, "setProfilePayloads:", v3);

  id v4 = self->configByLevelIndex[1][4];
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  -[NSMutableDictionary allKeys](v4, "allKeys");
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v8);
        char v9 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v18 = 0u;
        __int128 v19 = 0u;
        __int128 v20 = 0u;
        __int128 v21 = 0u;
        [v9 allKeys];
        char v10 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v19;
          do
          {
            for (uint64_t j = 0LL; j != v12; ++j)
            {
              if (*(void *)v19 != v13) {
                objc_enumerationMutation(v10);
              }
              -[FFConfiguration setValue:feature:domain:levelIndex:]( self,  "setValue:feature:domain:levelIndex:",  2LL,  *(void *)(*((void *)&v18 + 1) + 8 * j),  v8,  4LL);
            }

            uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }

          while (v12);
        }

        -[NSMutableDictionary removeObjectForKey:](v4, "removeObjectForKey:", v8);
      }

      uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }

    while (v6);
  }

  -[FFConfiguration removeAllDisclosuresAtLevelIndex:](self, "removeAllDisclosuresAtLevelIndex:", 4LL);
  -[FFConfiguration removeAllFeatureSetDataAtLevelIndex:](self, "removeAllFeatureSetDataAtLevelIndex:", 2LL);
  -[FFConfiguration removeAllSubscriptionsAtLevelIndex:](self, "removeAllSubscriptionsAtLevelIndex:", 3LL);
  os_unfair_lock_unlock(lock);
}

- (BOOL)addProfilePayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v12 = 0LL;
  char v7 = FFConfigurationValidateProfilePayload(v6, &v12);
  id v8 = v12;
  char v9 = v8;
  if ((v7 & 1) != 0)
  {
    -[FFConfiguration profilePayloads](self, "profilePayloads");
    char v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 addObject:v6];
  }

  else if (a4)
  {
    *a4 = v8;
  }

  return v7;
}

- (BOOL)commitProfilePayloadsAndReturnError:(id *)a3
{
  v135[1] = *MEMORY[0x1895F89C0];
  -[FFConfiguration profilePayloads](self, "profilePayloads");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v81 = a3;
    os_unfair_lock_lock(&self->lock);
    __int128 v125 = 0u;
    __int128 v126 = 0u;
    __int128 v123 = 0u;
    __int128 v124 = 0u;
    -[FFConfiguration profilePayloads](self, "profilePayloads");
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v82 = [obj countByEnumeratingWithState:&v123 objects:v133 count:16];
    if (v82)
    {
      uint64_t v83 = *(void *)v124;
      do
      {
        uint64_t v6 = 0LL;
        do
        {
          if (*(void *)v124 != v83) {
            objc_enumerationMutation(obj);
          }
          uint64_t v85 = v6;
          char v7 = *(void **)(*((void *)&v123 + 1) + 8 * v6);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_85;
          }
          uint64_t v8 = [v7 objectForKeyedSubscript:@"Features"];
          if (v8)
          {
            char v9 = (void *)v8;
            [v7 objectForKeyedSubscript:@"Features"];
            char v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) == 0) {
              goto LABEL_85;
            }
          }

          __int128 v121 = 0u;
          __int128 v122 = 0u;
          __int128 v119 = 0u;
          __int128 v120 = 0u;
          v86 = v7;
          [v7 objectForKeyedSubscript:@"Features"];
          id v87 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v91 = [v87 countByEnumeratingWithState:&v119 objects:v132 count:16];
          if (v91)
          {
            uint64_t v89 = *(void *)v120;
            do
            {
              uint64_t v12 = 0LL;
              do
              {
                if (*(void *)v120 != v89) {
                  objc_enumerationMutation(v87);
                }
                uint64_t v13 = *(void **)(*((void *)&v119 + 1) + 8 * v12);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  goto LABEL_85;
                }
                [v13 objectForKeyedSubscript:@"Domain"];
                id v14 = (void *)objc_claimAutoreleasedReturnValue();
                [v13 objectForKeyedSubscript:@"Features"];
                uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                char v16 = objc_opt_isKindOfClass();

                if ((v16 & 1) == 0) {
                  goto LABEL_85;
                }
                uint64_t v93 = v12;
                __int128 v117 = 0u;
                __int128 v118 = 0u;
                __int128 v115 = 0u;
                __int128 v116 = 0u;
                [v13 objectForKeyedSubscript:@"Features"];
                uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v18 = [v17 countByEnumeratingWithState:&v115 objects:v131 count:16];
                if (v18)
                {
                  uint64_t v19 = v18;
                  uint64_t v20 = *(void *)v116;
                  do
                  {
                    for (uint64_t i = 0LL; i != v19; ++i)
                    {
                      if (*(void *)v116 != v20) {
                        objc_enumerationMutation(v17);
                      }
                      __int128 v22 = *(void **)(*((void *)&v115 + 1) + 8 * i);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0) {
                        goto LABEL_85;
                      }
                      [v22 objectForKeyedSubscript:@"FeatureName"];
                      __int128 v23 = (void *)objc_claimAutoreleasedReturnValue();
                      [v22 objectForKeyedSubscript:@"Enabled"];
                      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue();
                      uint64_t v25 = [v24 BOOLValue];

                      -[FFConfiguration setValue:feature:domain:levelIndex:]( self,  "setValue:feature:domain:levelIndex:",  v25,  v23,  v14,  4LL);
                    }

                    uint64_t v19 = [v17 countByEnumeratingWithState:&v115 objects:v131 count:16];
                  }

                  while (v19);
                }

                uint64_t v12 = v93 + 1;
              }

              while (v93 + 1 != v91);
              uint64_t v91 = [v87 countByEnumeratingWithState:&v119 objects:v132 count:16];
            }

            while (v91);
          }

          uint64_t v26 = [v86 objectForKeyedSubscript:@"Disclosures"];
          if (v26)
          {
            __int128 v27 = (void *)v26;
            [v86 objectForKeyedSubscript:@"Disclosures"];
            uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            char v29 = objc_opt_isKindOfClass();

            if ((v29 & 1) == 0) {
              goto LABEL_85;
            }
          }

          __int128 v113 = 0u;
          __int128 v114 = 0u;
          __int128 v111 = 0u;
          __int128 v112 = 0u;
          [v86 objectForKeyedSubscript:@"Disclosures"];
          __int128 v30 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v31 = [v30 countByEnumeratingWithState:&v111 objects:v130 count:16];
          if (v31)
          {
            uint64_t v32 = v31;
            uint64_t v33 = *(void *)v112;
            do
            {
              for (uint64_t j = 0LL; j != v32; ++j)
              {
                if (*(void *)v112 != v33) {
                  objc_enumerationMutation(v30);
                }
                uint64_t v35 = *(void **)(*((void *)&v111 + 1) + 8 * j);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  goto LABEL_85;
                }
                [v35 objectForKeyedSubscript:@"DisclosureName"];
                __int128 v36 = (void *)objc_claimAutoreleasedReturnValue();
                -[FFConfiguration addDisclosureAlreadyLocked:atLevelIndex:]( self,  "addDisclosureAlreadyLocked:atLevelIndex:",  v36,  4LL);
              }

              uint64_t v32 = [v30 countByEnumeratingWithState:&v111 objects:v130 count:16];
            }

            while (v32);
          }

          __int128 v37 = @"FeatureSets";
          uint64_t v38 = [v86 objectForKeyedSubscript:@"FeatureSets"];
          if (v38)
          {
            __int128 v39 = (void *)v38;
            [v86 objectForKeyedSubscript:@"FeatureSets"];
            unint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            char v41 = objc_opt_isKindOfClass();

            if ((v41 & 1) == 0) {
              goto LABEL_85;
            }
          }

          __int128 v109 = 0u;
          __int128 v110 = 0u;
          __int128 v107 = 0u;
          __int128 v108 = 0u;
          [v86 objectForKeyedSubscript:@"FeatureSets"];
          id v88 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v92 = [v88 countByEnumeratingWithState:&v107 objects:v129 count:16];
          if (v92)
          {
            uint64_t v90 = *(void *)v108;
            do
            {
              uint64_t v42 = 0LL;
              do
              {
                if (*(void *)v108 != v90) {
                  objc_enumerationMutation(v88);
                }
                __int128 v43 = *(void **)(*((void *)&v107 + 1) + 8 * v42);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  goto LABEL_85;
                }
                [v43 objectForKeyedSubscript:@"FeatureSetGroupName"];
                __int128 v44 = (void *)objc_claimAutoreleasedReturnValue();
                [v43 objectForKeyedSubscript:v37];
                __int128 v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                char v46 = objc_opt_isKindOfClass();

                if ((v46 & 1) == 0) {
                  goto LABEL_85;
                }
                uint64_t v94 = v42;
                __int128 v105 = 0u;
                __int128 v106 = 0u;
                __int128 v103 = 0u;
                __int128 v104 = 0u;
                uint64_t v47 = v37;
                [v43 objectForKeyedSubscript:v37];
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v49 = [v48 countByEnumeratingWithState:&v103 objects:v128 count:16];
                if (v49)
                {
                  uint64_t v50 = v49;
                  uint64_t v51 = *(void *)v104;
                  do
                  {
                    for (uint64_t k = 0LL; k != v50; ++k)
                    {
                      if (*(void *)v104 != v51) {
                        objc_enumerationMutation(v48);
                      }
                      __int128 v53 = *(void **)(*((void *)&v103 + 1) + 8 * k);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0) {
                        goto LABEL_85;
                      }
                      [v53 objectForKeyedSubscript:@"FeatureSetName"];
                      uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();
                      char v55 = -[FFFeatureSetIdentifier initWithGroup:set:]( objc_alloc(&OBJC_CLASS___FFFeatureSetIdentifier),  "initWithGroup:set:",  v44,  v54);
                      if (v55) {
                        -[FFConfiguration _enableFeatureSetAlreadyLocked:atLevelIndex:]( self,  "_enableFeatureSetAlreadyLocked:atLevelIndex:",  v55,  2LL);
                      }
                    }

                    uint64_t v50 = [v48 countByEnumeratingWithState:&v103 objects:v128 count:16];
                  }

                  while (v50);
                }

                uint64_t v42 = v94 + 1;
                __int128 v37 = v47;
              }

              while (v94 + 1 != v92);
              uint64_t v92 = [v88 countByEnumeratingWithState:&v107 objects:v129 count:16];
            }

            while (v92);
          }

          uint64_t v56 = [v86 objectForKeyedSubscript:@"Subscriptions"];
          if (v56)
          {
            __int128 v57 = (void *)v56;
            [v86 objectForKeyedSubscript:@"Subscriptions"];
            __int128 v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            char v59 = objc_opt_isKindOfClass();

            if ((v59 & 1) == 0) {
LABEL_85:
            }
              abort();
          }

          __int128 v101 = 0u;
          __int128 v102 = 0u;
          __int128 v99 = 0u;
          __int128 v100 = 0u;
          [v86 objectForKeyedSubscript:@"Subscriptions"];
          __int128 v60 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v61 = [v60 countByEnumeratingWithState:&v99 objects:v127 count:16];
          if (v61)
          {
            uint64_t v62 = v61;
            uint64_t v63 = *(void *)v100;
            do
            {
              for (uint64_t m = 0LL; m != v62; ++m)
              {
                if (*(void *)v100 != v63) {
                  objc_enumerationMutation(v60);
                }
                uint64_t v65 = *(void *)(*((void *)&v99 + 1) + 8 * m);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  goto LABEL_85;
                }
                -[FFConfiguration plistparser](self, "plistparser");
                __int128 v66 = (void *)objc_claimAutoreleasedReturnValue();
                [v66 parseSubscriptionsFromDictionary:v65];
                char v67 = (void *)objc_claimAutoreleasedReturnValue();

                if (v67) {
                  -[FFConfiguration addSubscriptionAlreadyLocked:atLevelIndex:]( self,  "addSubscriptionAlreadyLocked:atLevelIndex:",  v67,  3LL);
                }
              }

              uint64_t v62 = [v60 countByEnumeratingWithState:&v99 objects:v127 count:16];
            }

            while (v62);
          }

          uint64_t v6 = v85 + 1;
        }

        while (v85 + 1 != v82);
        uint64_t v82 = [obj countByEnumeratingWithState:&v123 objects:v133 count:16];
      }

      while (v82);
    }

    id v98 = 0LL;
    BOOL v68 = -[FFConfiguration writeCombinedUpdatesAtLevelIndex:error:]( self,  "writeCombinedUpdatesAtLevelIndex:error:",  4LL,  &v98);
    id v69 = v98;
    v70 = v69;
    if (v81 && !v68) {
      id *v81 = v69;
    }
    id v97 = v70;
    BOOL v71 = -[FFConfiguration writeDisclosureUpdatesAtlevelIndex:error:]( self,  "writeDisclosureUpdatesAtlevelIndex:error:",  4LL,  &v97);
    id v72 = v97;

    if (v81 && !v71) {
      id *v81 = v72;
    }
    id v96 = v72;
    BOOL v73 = -[FFConfiguration writeFeatureSetUpdatesAtLevelIndex:withError:]( self,  "writeFeatureSetUpdatesAtLevelIndex:withError:",  2LL,  &v96);
    id v74 = v96;

    if (v81 && !v73) {
      id *v81 = v74;
    }
    id v95 = v74;
    BOOL v75 = -[FFConfiguration writeSubscriptionUpdatesAtLevelIndex:withError:]( self,  "writeSubscriptionUpdatesAtLevelIndex:withError:",  3LL,  &v95);
    id v76 = v95;

    if (v81 && !v75) {
      id *v81 = v76;
    }
    os_unfair_lock_unlock(&self->lock);
  }

  else
  {
    __int128 v77 = (void *)MEMORY[0x189607870];
    uint64_t v78 = *MEMORY[0x189607688];
    uint64_t v134 = *MEMORY[0x189607490];
    v135[0] = @"Must prepareToAddProfilePayloads before committing";
    [MEMORY[0x189603F68] dictionaryWithObjects:v135 forKeys:&v134 count:1];
    __int128 v79 = (void *)objc_claimAutoreleasedReturnValue();
    [v77 errorWithDomain:v78 code:22 userInfo:v79];
    id v76 = (id)objc_claimAutoreleasedReturnValue();

    if (a3) {
      *a3 = v76;
    }
    notify_post((const char *)[@"com.apple.featureflags.changed" UTF8String]);
    LOBYTE(v75) = 0;
  }

  return v75;
}

- (id)allFeatureGroups
{
  p_locuint64_t k = &self->lock;
  os_unfair_lock_lock(&self->lock);
  -[FFConfiguration loadAllData](self, "loadAllData");
  id v4 = (void *)MEMORY[0x189604010];
  -[FFConfiguration definedFeatureGroupsFilteredByCurrentDisclosures]( self,  "definedFeatureGroupsFilteredByCurrentDisclosures");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 allKeys];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setWithArray:v6];
  char v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (id)attributesForFeatureGroup:(id)a3
{
  p_locuint64_t k = &self->lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[FFConfiguration loadAllData](self, "loadAllData");
  -[FFConfiguration definedFeatureGroupsFilteredByCurrentDisclosures]( self,  "definedFeatureGroupsFilteredByCurrentDisclosures");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKeyedSubscript:v5];
  char v7 = (void *)objc_claimAutoreleasedReturnValue();

  [v7 attributes];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = (void *)[v8 copy];

  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (id)featureSetsInGroup:(id)a3
{
  p_locuint64_t k = &self->lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[FFConfiguration loadAllData](self, "loadAllData");
  -[FFConfiguration definedFeatureGroupsFilteredByCurrentDisclosures]( self,  "definedFeatureGroupsFilteredByCurrentDisclosures");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKeyedSubscript:v5];
  char v7 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v8 = (void *)MEMORY[0x189604010];
  if (v7)
  {
    [v7 featureSets];
    char v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 allKeys];
    char v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setWithArray:v10];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [MEMORY[0x189604010] set];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  os_unfair_lock_unlock(p_lock);

  return v11;
}

- (id)featureFlagsInSet:(id)a3 inGroup:(id)a4
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  locuint64_t k = &self->lock;
  os_unfair_lock_lock(&self->lock);
  -[FFConfiguration loadAllData](self, "loadAllData");
  uint64_t v26 = v7;
  __int128 v27 = v6;
  uint64_t v8 = -[FFFeatureSetIdentifier initWithGroup:set:]( objc_alloc(&OBJC_CLASS___FFFeatureSetIdentifier),  "initWithGroup:set:",  v7,  v6);
  -[FFConfiguration definedFeatureSetsFilteredByCurrentDisclosures]( self,  "definedFeatureSetsFilteredByCurrentDisclosures");
  char v9 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v24 = v8;
  [v9 objectForKeyedSubscript:v8];
  char v10 = (void *)objc_claimAutoreleasedReturnValue();

  id v11 = objc_alloc_init(MEMORY[0x189603FC8]);
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  [v10 features];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v29;
    do
    {
      for (uint64_t i = 0LL; i != v14; ++i)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        [v17 domainName];
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 objectForKeyedSubscript:v18];
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19)
        {
          id v20 = objc_alloc_init(MEMORY[0x189603FE0]);
          [v11 setObject:v20 forKeyedSubscript:v18];
        }

        [v11 objectForKeyedSubscript:v18];
        __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();
        [v17 featureName];
        __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();
        [v21 addObject:v22];
      }

      uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }

    while (v14);
  }

  os_unfair_lock_unlock(lock);
  return v11;
}

- (int64_t)valueForFeatureSet:(id)a3 inGroup:(id)a4 atLevel:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  char v10 = -[FFFeatureSetIdentifier initWithGroup:set:]( objc_alloc(&OBJC_CLASS___FFFeatureSetIdentifier),  "initWithGroup:set:",  v8,  v9);

  int64_t v11 = -[FFConfiguration _valueForFeatureSet:atLevel:](self, "_valueForFeatureSet:atLevel:", v10, a5);
  return v11;
}

- (int64_t)resolvedValueForFeatureSet:(id)a3 inGroup:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[FFFeatureSetIdentifier initWithGroup:set:]( objc_alloc(&OBJC_CLASS___FFFeatureSetIdentifier),  "initWithGroup:set:",  v6,  v7);

  int64_t v9 = -[FFConfiguration _resolvedValueForFeatureSet:](self, "_resolvedValueForFeatureSet:", v8);
  return v9;
}

- (int64_t)_resolvedValueForFeatureSet:(id)a3
{
  id v4 = a3;
  int64_t v5 = -[FFConfiguration _valueForFeatureSet:atLevel:](self, "_valueForFeatureSet:atLevel:", v4, 3LL);
  if (v5 == 2) {
    int64_t v5 = -[FFConfiguration _valueForFeatureSet:atLevel:](self, "_valueForFeatureSet:atLevel:", v4, 2LL);
  }

  return v5;
}

- (int64_t)_valueForFeatureSet:(id)a3 atLevel:(int64_t)a4
{
  id v6 = a3;
  if (a4 != 2)
  {
    if (a4 != 3) {
      -[FFConfiguration(FeatureSets) _valueForFeatureSet:atLevel:].cold.1(a4);
    }
    a4 = 5LL;
  }

  os_unfair_lock_lock(&self->lock);
  -[FFConfiguration loadAllData](self, "loadAllData");
  else {
    int64_t v7 = 2LL;
  }
  os_unfair_lock_unlock(&self->lock);

  return v7;
}

- (void)enableFeatureSet:(id)a3 inGroup:(id)a4 atLevel:(int64_t)a5
{
  id v10 = a3;
  id v8 = a4;
  if (a5 != 2)
  {
    if (a5 != 3) {
      -[FFConfiguration(FeatureSets) _valueForFeatureSet:atLevel:].cold.1(a5);
    }
    a5 = 5LL;
  }

  int64_t v9 = -[FFFeatureSetIdentifier initWithGroup:set:]( objc_alloc(&OBJC_CLASS___FFFeatureSetIdentifier),  "initWithGroup:set:",  v8,  v10);
  if (v9)
  {
    os_unfair_lock_lock(&self->lock);
    -[FFConfiguration loadAllData](self, "loadAllData");
    -[FFConfiguration _enableFeatureSetAlreadyLocked:atLevelIndex:]( self,  "_enableFeatureSetAlreadyLocked:atLevelIndex:",  v9,  a5);
    os_unfair_lock_unlock(&self->lock);
  }
}

- (void)unsetFeatureSet:(id)a3 inGroup:(id)a4 atLevel:(int64_t)a5
{
  id v10 = a3;
  id v8 = a4;
  if (a5 != 2)
  {
    if (a5 != 3) {
      -[FFConfiguration(FeatureSets) _valueForFeatureSet:atLevel:].cold.1(a5);
    }
    a5 = 5LL;
  }

  int64_t v9 = -[FFFeatureSetIdentifier initWithGroup:set:]( objc_alloc(&OBJC_CLASS___FFFeatureSetIdentifier),  "initWithGroup:set:",  v8,  v10);
  if (v9)
  {
    os_unfair_lock_lock(&self->lock);
    -[FFConfiguration loadAllData](self, "loadAllData");
    -[FFConfiguration _unsetFeatureSetAlreadyLocked:atLevelIndex:]( self,  "_unsetFeatureSetAlreadyLocked:atLevelIndex:",  v9,  a5);
    os_unfair_lock_unlock(&self->lock);
  }
}

- (id)disclosureForFeatureGroup:(id)a3
{
  p_locuint64_t k = &self->lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[FFConfiguration loadAllData](self, "loadAllData");
  -[NSMutableDictionary objectForKeyedSubscript:](self->definedFeatureGroups, "objectForKeyedSubscript:", v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6) {
    goto LABEL_5;
  }
  [v6 disclosure];
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = (void *)[v7 copy];

  if (!v8 || !-[FFConfiguration resolvedStateForDisclosure:](self, "resolvedStateForDisclosure:", v8))
  {

LABEL_5:
    id v8 = 0LL;
  }

  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (void)addSubscription:(id)a3 atLevel:(int64_t)a4
{
  id v7 = a3;
  os_unfair_lock_lock(&self->lock);
  -[FFConfiguration loadAllData](self, "loadAllData");
  if (a4 == 2)
  {
    uint64_t v6 = 3LL;
  }

  else
  {
    if (a4 != 3) {
      -[FFConfiguration(Subscriptions) addSubscription:atLevel:].cold.1((NSString *)a4);
    }
    uint64_t v6 = 6LL;
  }

  -[FFConfiguration addSubscriptionAlreadyLocked:atLevelIndex:]( self,  "addSubscriptionAlreadyLocked:atLevelIndex:",  v7,  v6);
  os_unfair_lock_unlock(&self->lock);
}

- (void)removeSubscription:(id)a3 atLevel:(int64_t)a4
{
  id v11 = a3;
  os_unfair_lock_lock(&self->lock);
  -[FFConfiguration loadAllData](self, "loadAllData");
  if (a4 == 2)
  {
    uint64_t v6 = 3LL;
  }

  else
  {
    if (a4 != 3) {
      -[FFConfiguration(Subscriptions) addSubscription:atLevel:].cold.1((NSString *)a4);
    }
    uint64_t v6 = 6LL;
  }

  -[NSMutableArray removeObject:](self->subscriptionsByLevelIndex[v6], "removeObject:", v11);
  subscriptionsMetaByLevelIndex = self->subscriptionsMetaByLevelIndex;
  id v8 = self->subscriptionsMetaByLevelIndex[v6];
  if (!v8)
  {
    int64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    id v10 = subscriptionsMetaByLevelIndex[v6];
    subscriptionsMetaByLevelIndex[v6] = v9;

    id v8 = subscriptionsMetaByLevelIndex[v6];
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  MEMORY[0x189604A88],  @"#MODIFIED#");
  -[FFConfiguration recalculateSubscriptionEffectsAt:](self, "recalculateSubscriptionEffectsAt:", v6);
  os_unfair_lock_unlock(&self->lock);
}

- (id)allSubscriptionsAtLevel:(int64_t)a3
{
  p_locuint64_t k = &self->lock;
  os_unfair_lock_lock(&self->lock);
  -[FFConfiguration loadAllData](self, "loadAllData");
  if (a3 == 2)
  {
    uint64_t v6 = 73LL;
  }

  else
  {
    if (a3 != 3) {
      -[FFConfiguration(Subscriptions) addSubscription:atLevel:].cold.1((NSString *)a3);
    }
    uint64_t v6 = 76LL;
  }

  id v7 = (void *)-[objc_class copy]((&self->super.isa)[v6], "copy");
  os_unfair_lock_unlock(p_lock);
  if (v7)
  {
    id v8 = v7;
  }

  else
  {
    [MEMORY[0x189603F18] array];
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }

  int64_t v9 = v8;

  return v9;
}

- (void)fileURLForLevelIndex:(uint64_t)a1 pathIndex:.cold.1(uint64_t a1)
{
  qword_18C68EFE0 = (uint64_t)"BUG IN LIBFEATUREFLAGS: Call to fileURLForLevel with unexpected level";
  qword_18C68F010 = a1;
  __break(1u);
}

- (void)disclosureFileURLForLevelIndex:(uint64_t)a1 pathIndex:.cold.1(uint64_t a1)
{
  qword_18C68EFE0 = (uint64_t)"BUG IN LIBFEATUREFLAGS: Call to disclosureFileURLForLevel with unexpected level";
  qword_18C68F010 = a1;
  __break(1u);
}

- (void)featureSetsFileURLForLevelIndex:(uint64_t)a1 .cold.1(uint64_t a1)
{
  qword_18C68EFE0 = (uint64_t)"BUG IN LIBFEATUREFLAGS: Call to featureSetsFileURLForLevelIndex with unexpected level";
  qword_18C68F010 = a1;
  __break(1u);
}

- (void)subscriptionsFileURLForLevelIndex:(uint64_t)a1 .cold.1(uint64_t a1)
{
  qword_18C68EFE0 = (uint64_t)"BUG IN LIBFEATUREFLAGS: Call to subscriptionsFileURLForLevelIndex with unexpected level";
  qword_18C68F010 = a1;
  __break(1u);
}

- (void)recalculateFeatureSetEffectsAt:(uint64_t)a1 .cold.1(uint64_t a1)
{
  qword_18C68EFE0 = (uint64_t)"BUG IN LIBFEATUREFLAGS: wrong level";
  qword_18C68F010 = a1;
  __break(1u);
}

- (void)loadFeatureSetDefinitionsNamed:fromURL:.cold.1()
{
  qword_18C68EFE0 = (uint64_t)"BUG IN LIBFEATUREFLAGS: feature group/set name was duplicated, which shouldn't be possible";
  __break(1u);
}

- (void)loadFeatureSetDefinitionsNamed:fromURL:.cold.2()
{
  qword_18C68EFE0 = (uint64_t)"BUG IN LIBFEATUREFLAGS: feature group name was duplicated, which shouldn't be possible";
  __break(1u);
}

- (void)loadSubscriptionDataForLevelIndex:(uint64_t)a1 .cold.1(uint64_t a1)
{
  qword_18C68EFE0 = (uint64_t)"BUG IN LIBFEATUREFLAGS: call to loadSubscriptionDataForLevelIndex with a level that is not permitted";
  qword_18C68F010 = a1;
  __break(1u);
}

- (void)removeAllSubscriptionsAtLevelIndex:(uint64_t)a1 .cold.1(uint64_t a1)
{
  qword_18C68EFE0 = (uint64_t)"BUG IN LIBFEATUREFLAGS: call to removeAllSubscriptionsAtLevelIndex with a level that is not permitted";
  qword_18C68F010 = a1;
  __break(1u);
}

- (void)setValue:feature:domain:levelIndex:buildVersion:.cold.1()
{
  qword_18C68EFE0 = (uint64_t)"BUG IN LIBFEATUREFLAGS: call to setValue with a level that is not permitted";
  qword_18C68F010 = 4LL;
  __break(1u);
}

- (void)setValue:(uint64_t)a1 feature:domain:levelIndex:buildVersion:.cold.2(uint64_t a1)
{
  qword_18C68EFE0 = (uint64_t)"BUG IN LIBFEATUREFLAGS: call to setValue with a level that is not permitted";
  qword_18C68F010 = a1;
  __break(1u);
}

- (void)stateForFeature:(uint64_t)a1 domain:level:.cold.1(uint64_t a1)
{
  qword_18C68EFE0 = (uint64_t)"BUG IN CLIENT OF LIBFEATUREFLAGS: Call to this function with a level that is unknown/invalid/unsupported";
  qword_18C68F010 = a1;
  __break(1u);
}

@end