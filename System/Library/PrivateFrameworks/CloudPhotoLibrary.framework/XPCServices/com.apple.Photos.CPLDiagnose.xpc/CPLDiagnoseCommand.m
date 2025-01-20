@interface CPLDiagnoseCommand
+ (BOOL)ignoreInCPLStore;
+ (BOOL)isAppleInternal;
+ (id)_syndicationLibraryPath;
+ (id)commandName;
+ (id)help;
+ (id)parameters;
+ (id)shortDescription;
+ (id)supportedFeatureAreas;
- (BOOL)_chooseLibraryInteractively;
- (BOOL)_isUBFExtension:(id)a3;
- (BOOL)_libraryIdentifierMatchesLibraryFilterRegExp:(id)a3;
- (BOOL)_lookForLibrary;
- (BOOL)_path:(id)a3 existsInFileIdentifiersAddIfNot:(id)a4;
- (BOOL)_url:(id)a3 existsInFileIdentifiersAddIfNot:(id)a4;
- (BOOL)_wrapperStatusMatchesLibraryFilterRegExp:(id)a3;
- (BOOL)collectOutputOfCommand:(id)a3 label:(id)a4 filename:(id)a5;
- (BOOL)collectOutputOfCommand:(id)a3 label:(id)a4 filename:(id)a5 outputIsStderr:(BOOL)a6 timeout:(BOOL)a7;
- (BOOL)collectOutputOfCommand:(id)a3 label:(id)a4 filename:(id)a5 timeout:(BOOL)a6;
- (BOOL)collectOutputOfCommandAndArguments:(id)a3 label:(id)a4 filename:(id)a5 outputIsStderr:(BOOL)a6 timeout:(BOOL)a7;
- (BOOL)collectOutputOfTask:(id)a3 label:(id)a4 filename:(id)a5 outputIsStderr:(BOOL)a6 timeout:(BOOL)a7;
- (BOOL)createBaseFolderAndLogFile;
- (BOOL)includeSPL;
- (BOOL)includeSyndication;
- (BOOL)parseCommandOptionsWithArgc:(int)a3 argv:(char *)a4;
- (id)_abbreviatedPathForURL:(id)a3;
- (id)_determineLibraryPathFromDiagnoseBundleIdentifier:(id)a3;
- (id)_goodNameForLibraryIdentifier:(id)a3;
- (id)_libraryURLFromWrapperStatus:(id)a3;
- (id)_photosSpotlightSearchAttributes;
- (id)_readAppPrivateData;
- (id)_simplifiedPathForURL:(id)a3;
- (id)_syndicationLibrarySpotlightSearchAttributes;
- (id)getEngineWrapperStatusesWithError:(id *)a3;
- (id)interestingDatabasesForUBFLibraryPath:(id)a3 isSharingLibrary:(BOOL)a4;
- (id)interestingFilesInDirectoryPath:(id)a3 withPredicate:(id)a4;
- (id)preferencesforDomain:(id)a3 withKeys:(id)a4 currentUser:(BOOL)a5;
- (id)prependPath:(id)a3 toStringsInArray:(id)a4;
- (id)processDetailPath:(id)a3;
- (id)processes;
- (int)execute;
- (void)_collectPhotosSearchDiagnostics;
- (void)_collectSearchEntityDonationDiagnostics;
- (void)_collectSharedAlbumFilesAtPath:(id)a3;
- (void)_collectUniversalSearchDiagnostics;
- (void)_collectUniversalSearchFeatureAreaDiagnostics;
- (void)_diagnoseLibraryIdentifier:(id)a3;
- (void)_diagnoseLibraryWrapperStatus:(id)a3;
- (void)_diagnoseWithCPLLibraryIdentifier:(id)a3;
- (void)_printWrapperStatus:(id)a3;
- (void)_removeResourceDataFromFaceCropChangeCPLSerializedRecords:(sqlite3 *)a3;
- (void)_removeShareURLFromCPLScopes:(sqlite3 *)a3;
- (void)_removeShareURLFromPhotosMomentShare:(sqlite3 *)a3;
- (void)addFilesFromVisionCacheToDictionary:(id)a3;
- (void)collectAccountStatus;
- (void)collectAdditionalInformationForDatabaseAtPath:(id)a3 toDirectory:(id)a4;
- (void)collectAppLibraryIdentifiers;
- (void)collectCloudPhotodGlobalStatus;
- (void)collectCloudPhotodStatusWithLibraryIdentifier:(id)a3 subdirectory:(id)a4;
- (void)collectDatabaseAtPath:(id)a3 libraryPath:(id)a4 subdirectory:(id)a5;
- (void)collectDefaults;
- (void)collectDiagnosticLog:(id)a3;
- (void)collectDiagnosticLogs;
- (void)collectDuetInfo;
- (void)collectFeatureAreaDiagnostics;
- (void)collectFileAtPath:(id)a3;
- (void)collectFileAtPath:(id)a3 suffix:(id)a4;
- (void)collectFileAtURL:(id)a3 suffix:(id)a4 destinationDirectory:(id)a5;
- (void)collectFileListingAtPath:(id)a3 label:(id)a4 filename:(id)a5 extendedDetail:(BOOL)a6;
- (void)collectFilePaths:(id)a3 toSubdirectory:(id)a4;
- (void)collectFiles;
- (void)collectLOFetchRecordings;
- (void)collectLocalLibraryMetadataInfo;
- (void)collectPhotosLibraryUpgradeLogs;
- (void)collectPreferences;
- (void)collectSilentMover;
- (void)collectSysdiagnose:(id)a3;
- (void)collectTaskInfo;
- (void)copyDatabaseFromPath:(id)a3 toPath:(id)a4;
- (void)determineLibraryPaths;
- (void)displayConsent;
- (void)executeMemoryToolsOnProcess:(id)a3;
- (void)executeTool:(id)a3 onProcess:(id)a4;
- (void)markPurgeable:(id)a3;
- (void)prepareOutputURLs;
- (void)printDiskCapacity:(id)a3;
- (void)printFormat:(id)a3 arguments:(char *)a4;
- (void)revertToRootMode:(BOOL)a3;
- (void)runAsUser:(id)a3;
- (void)sampleProcess:(id)a3;
- (void)sampleProcesses;
- (void)setUserMode:(BOOL)a3;
- (void)signalProcesses;
- (void)startDiagnostic;
- (void)writePreferenceInDomain:(id)a3 withKey:(id)a4 toDirectory:(id)a5 currentUser:(BOOL)a6;
@end

@implementation CPLDiagnoseCommand

+ (id)commandName
{
  return @"diagnose";
}

+ (id)shortDescription
{
  return @"gather diagnostics on cpl.";
}

+ (id)parameters
{
  unsigned int v2 = [a1 isAppleInternal];
  v3 = @" [-c] [-m]";
  if (!v2) {
    v3 = &stru_1000319D0;
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[-o <outputfile>] [-l <librarypath>] [-s] [-S] [-t] [-d|-D] [-O] [-f <feature>] [-a <annotation>]%@%@",  v3,  &stru_1000319D0);
}

+ (id)help
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%@\n\t%@",  @"-o <outputfile>",  @"save diagnostic to a specific file.");
  -[NSMutableString appendString:](v3, "appendString:", @"\n");
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%@\n\t%@",  @"-l <librarypath>",  @"copy information from the library at path.");
  -[NSMutableString appendString:](v3, "appendString:", @"\n");
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%@\n\t%@",  @"-i",  @"interactively chose the library to copy information from");
  -[NSMutableString appendString:](v3, "appendString:", @"\n");
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%@\n\t%@",  @"-r <regexp>",  @"automatically pick the first library matching the expression");
  -[NSMutableString appendString:](v3, "appendString:", @"\n");
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%@\n\t%@",  @"-b <bundleid>",  @"choose the library path using the bundle ID that matches a library container identifier");
  -[NSMutableString appendString:](v3, "appendString:", @"\n");
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%@\n\t%@",  @"-S",  @"skip appending auto suffix to specified diagnostic file.");
  -[NSMutableString appendString:](v3, "appendString:", @"\n");
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%@\n\t%@",  @"-s",  @"skip sysdiagnose phase.");
  -[NSMutableString appendString:](v3, "appendString:", @"\n");
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%@\n\t%@",  @"-L",  @"request sysdiagnose collect a full logarchive.");
  -[NSMutableString appendString:](v3, "appendString:", @"\n");
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%@\n\t%@",  @"-t",  @"time-out long operations.");
  -[NSMutableString appendString:](v3, "appendString:", @"\n");
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%@\n\t%@",  @"-O",  @"do not strip OCR data from the database.");
  -[NSMutableString appendString:](v3, "appendString:", @"\n");
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%@\n\t%@",  @"-P",  @"run library preprocessing.");
  -[NSMutableString appendString:](v3, "appendString:", @"\n");
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%@\n\t%@",  @"-d/-D",  @"skip database copying. (-d for databases bigger than 1200 MB, -D always)");
  -[NSMutableString appendString:](v3, "appendString:", @"\n");
  v4 = (void *)objc_claimAutoreleasedReturnValue([a1 supportedFeatureAreas]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 componentsJoinedByString:@"\n\t"]);
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%@\n\t%@\n\t(supported values: %@)",  @"-f <feature>",  @"capture additional diagnostics for the specified feature area.",  v5);

  -[NSMutableString appendString:](v3, "appendString:", @"\n");
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%@\n\t%@",  @"-a <annotation>",  @"annotate output file name (e.g. downloader), ignored if -o used.");
  if ([a1 isAppleInternal])
  {
    -[NSMutableString appendString:](v3, "appendString:", @"\n");
    -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%@\n\t%@",  @"-c",  @"do not display consent prompt.");
    -[NSMutableString appendString:](v3, "appendString:", @"\n");
    -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%@\n\t%@",  @"-m",  @"include story diagnostics.");
  }

  -[NSMutableString appendString:](v3, "appendString:", @"\n");
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%@\n\t%@",  @"-n",  @"do not automatically include System Photo Library and Syndication library");
  return v3;
}

- (BOOL)parseCommandOptionsWithArgc:(int)a3 argv:(char *)a4
{
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCTLCommand defaultLibraryURL](self, "defaultLibraryURL"));
  v8 = (NSString *)objc_claimAutoreleasedReturnValue([v7 path]);
  p_libraryPath = &self->_libraryPath;
  libraryPath = self->_libraryPath;
  self->_libraryPath = v8;

  unsigned __int8 v11 = [(id)objc_opt_class(self) isAppleInternal];
  self->_isAppleInternal = v11;
  self->_hasFullShellCommands = v11;
  self->_isRoot = geteuid() == 0;
  self->_optionalTimeOut = 0;
  self->_skipDBCopy = 0;
  self->_skipBigDBCopy = 0;
  self->_skipLibraryPreprocessing = 1;
  self->_noAutoSuffix = 0;
  self->_displayConsent = 1;
  self->_copyRecoverJournals = 1;
  v12 = getenv("CPLCTL_PHOTOSCTL");
  v13 = &CFDictionaryGetTypeID_ptr;
  if (v12) {
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v12));
  }
  else {
    v14 = @"/usr/local/bin/photosctl";
  }
  objc_storeStrong((id *)&self->_photosctlCommand, v14);
  if (v12) {

  }
  self->_includeStoryDiagnostics = 0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v16 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v16, "setDateFormat:", @"yyyyMMdd-HHmmss");
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale localeWithLocaleIdentifier:]( &OBJC_CLASS___NSLocale,  "localeWithLocaleIdentifier:",  @"en_US"));
  -[NSDateFormatter setLocale:](v16, "setLocale:", v17);

  v18 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v16, "stringFromDate:", v15));
  timestamp = self->_timestamp;
  self->_timestamp = v18;

  optreset = 1;
  optind = 1;
  int v20 = getopt(a3, a4, "o:l:tdDa:f:LcsSOmPir:nb:") << 24;
  if (v20 != -16777216)
  {
    v87 = v16;
    v86 = (void *)CPLDiagnosticsInProgressPrefix;
    uint64_t v21 = 1LL;
    do
    {
      uint64_t v22 = v21;
      uint64_t v21 = 0LL;
      switch(v20 >> 24)
      {
        case 'D':
          uint64_t v23 = 449LL;
          goto LABEL_41;
        case 'L':
          uint64_t v23 = 475LL;
          goto LABEL_41;
        case 'O':
          uint64_t v23 = 479LL;
          goto LABEL_41;
        case 'P':
          uint64_t v24 = 451LL;
          goto LABEL_20;
        case 'S':
          uint64_t v23 = 477LL;
          goto LABEL_41;
        case 'a':
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
          id v26 = [v25 stringWithFileSystemRepresentation:optarg length:strlen(optarg)];
          v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

          if ([v27 length])
          {
            v28 = (NSString *)objc_claimAutoreleasedReturnValue([v13[66] stringWithFormat:@"-%@", v27]);
            annotation = self->_annotation;
            self->_annotation = v28;
          }

          else
          {
            uint64_t v22 = 0LL;
          }

          uint64_t v21 = v22;
          break;
        case 'b':
          if (*p_libraryPath)
          {
            v30 = self;
            v31 = @"-l cannot be used with -b";
            goto LABEL_29;
          }

          v53 = (void *)objc_claimAutoreleasedReturnValue([v13[66] stringWithCString:optarg encoding:4]);
          uint64_t v54 = objc_claimAutoreleasedReturnValue( -[CPLDiagnoseCommand _determineLibraryPathFromDiagnoseBundleIdentifier:]( self,  "_determineLibraryPathFromDiagnoseBundleIdentifier:",  v53));
          v55 = *p_libraryPath;
          *p_libraryPath = (NSString *)v54;

          uint64_t v21 = (*p_libraryPath != 0LL) & v22;
          break;
        case 'c':
          uint64_t v24 = 478LL;
LABEL_20:
          *((_BYTE *)&self->super.super.isa + v24) = 0;
          goto LABEL_42;
        case 'd':
          uint64_t v23 = 450LL;
          goto LABEL_41;
        case 'f':
          v32 = (void *)objc_claimAutoreleasedReturnValue([v13[66] stringWithCString:optarg encoding:4]);
          v33 = (void *)objc_claimAutoreleasedReturnValue([v32 lowercaseString]);

          id v34 = [(id)objc_opt_class(self) supportedFeatureAreas];
          v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
          unsigned int v36 = [v35 containsObject:v33];

          if (v36)
          {
            featureAreas = self->_featureAreas;
            if (featureAreas)
            {
              v38 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSArray arrayByAddingObject:](featureAreas, "arrayByAddingObject:", v33));
            }

            else
            {
              v93 = v33;
              v38 = (NSArray *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v93,  1LL));
            }

            v70 = self->_featureAreas;
            self->_featureAreas = v38;
          }

          else
          {
            -[CPLCTLCommand printFormat:](self, "printFormat:", @"Invalid feature area: %@", v33);
            uint64_t v22 = 0LL;
          }

          goto LABEL_65;
        case 'i':
          uint64_t v23 = 138LL;
          goto LABEL_41;
        case 'j':
          self->_copyRecoverJournals = 1;
          -[CPLCTLCommand printFormat:]( self,  "printFormat:",  @"-j is no longer a required option to capture rebuild journals");
          goto LABEL_42;
        case 'l':
          if (!*p_libraryPath)
          {
            v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
            id v57 = [v56 stringWithFileSystemRepresentation:optarg length:strlen(optarg)];
            v33 = (void *)objc_claimAutoreleasedReturnValue(v57);

            if ([v33 length])
            {
              unsigned __int8 v90 = 0;
              v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
              unsigned int v59 = [v58 fileExistsAtPath:v33 isDirectory:&v90];
              int v60 = v90;

              BOOL v61 = !v59 || v60 == 0;
              p_libraryPath = &self->_libraryPath;
              if (!v61) {
                objc_storeStrong((id *)&self->_libraryPath, v33);
              }
            }

            if (!*p_libraryPath)
            {
              -[CPLCTLCommand printFormat:](self, "printFormat:", @"Invalid library path");
              uint64_t v22 = 0LL;
            }

- (id)_determineLibraryPathFromDiagnoseBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v23 = 0LL;
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCTLCommand getLibraryIdentifiersWithDomain:error:]( self,  "getLibraryIdentifiersWithDomain:error:",  3LL,  &v23));
  id v6 = v23;
  v7 = v6;
  if (v5)
  {
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v9)
    {
      id v10 = v9;
      v18 = v7;
      uint64_t v11 = *(void *)v20;
      v12 = @"/var/mobile/Media";
      while (2)
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          v14 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue([v14 containerIdentifier]);
          id v16 = [v15 caseInsensitiveCompare:v4];

          if (!v16)
          {
            v12 = (__CFString *)objc_claimAutoreleasedReturnValue([v14 path]);
            goto LABEL_12;
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
        if (v10) {
          continue;
        }
        break;
      }

+ (BOOL)ignoreInCPLStore
{
  return 1;
}

- (BOOL)includeSPL
{
  return self->_targetLibraryIsSPL || !self->_noAutoIncludeSPLAndSyndication;
}

- (BOOL)includeSyndication
{
  return self->_targetLibraryIsSyndication || !self->_noAutoIncludeSPLAndSyndication;
}

- (id)_simplifiedPathForURL:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 path]);
  if ([v3 hasPrefix:@"/var/mobile/Library/Logs/"])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringFromIndex:", objc_msgSend(@"/var/mobile/Library/Logs/", "length")));
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @".../%@", v4));

    v3 = (void *)v5;
  }

  return v3;
}

- (id)_abbreviatedPathForURL:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 path]);
  if ([v3 hasPrefix:@"/private/"])
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringFromIndex:", objc_msgSend(@"/private", "length")));

    v3 = (void *)v4;
  }

  if ([v3 hasPrefix:@"/var/mobile/"])
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringFromIndex:", objc_msgSend(@"/var/mobile/", "length")));
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"~mobile/%@", v5));

    v3 = (void *)v6;
  }

  return v3;
}

- (id)_libraryURLFromWrapperStatus:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 parameters]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 libraryIdentifier]);
  unsigned __int8 v6 = [v5 isEqualToString:CPLLibraryIdentifierSystemLibrary];

  if ((v6 & 1) != 0)
  {
LABEL_6:
    id v8 = 0LL;
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v3 parameters]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 clientLibraryBaseURL]);

    while (1)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 pathExtension]);
      unsigned __int8 v10 = [v9 isEqualToString:@"photoslibrary"];

      if ((v10 & 1) != 0) {
        break;
      }
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 URLByDeletingLastPathComponent]);

      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 path]);
      unsigned int v13 = [v12 isEqualToString:@"/"];

      id v8 = v11;
      if (v13)
      {

        goto LABEL_6;
      }
    }
  }

  return v8;
}

- (void)_diagnoseWithCPLLibraryIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v14 = v4;
    unsigned __int8 v6 = [v4 isEqualToString:CPLLibraryIdentifierSystemLibrary];
    uint64_t v5 = v14;
    if ((v6 & 1) == 0)
    {
      uint64_t v7 = CPLContainerIdentifierForLibraryIdentifier(v14);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      annotation = self->_annotation;
      unsigned __int8 v10 = objc_alloc(&OBJC_CLASS___NSString);
      if (annotation) {
        uint64_t v11 = -[NSString initWithFormat:](v10, "initWithFormat:", @"-%@%@", v8, self->_annotation);
      }
      else {
        uint64_t v11 = -[NSString initWithFormat:](v10, "initWithFormat:", @"-%@", v8, v13);
      }
      v12 = self->_annotation;
      self->_annotation = v11;

      uint64_t v5 = v14;
    }
  }
}

- (void)_diagnoseLibraryWrapperStatus:(id)a3
{
  id v4 = a3;
  id v12 = (id)objc_claimAutoreleasedReturnValue(-[CPLDiagnoseCommand _libraryURLFromWrapperStatus:](self, "_libraryURLFromWrapperStatus:", v4));
  if (v12)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 parameters]);
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 libraryIdentifier]);
    -[CPLCTLCommand printFormat:](self, "printFormat:", @"Will diagnose library with CPL identifier %@", v6);

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDiagnoseCommand _abbreviatedPathForURL:](self, "_abbreviatedPathForURL:", v12));
    -[CPLCTLCommand printFormat:](self, "printFormat:", @"  path: %@", v7);

    id v8 = (NSString *)objc_claimAutoreleasedReturnValue([v12 path]);
    libraryPath = self->_libraryPath;
    self->_libraryPath = v8;
  }

  else
  {
    -[CPLCTLCommand printFormat:](self, "printFormat:", @"Will diagnose the System library");
  }

  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v4 parameters]);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 libraryIdentifier]);
  -[CPLDiagnoseCommand _diagnoseWithCPLLibraryIdentifier:](self, "_diagnoseWithCPLLibraryIdentifier:", v11);

  -[CPLCTLCommand printFormat:](self, "printFormat:", @"============================");
}

- (id)_goodNameForLibraryIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);

  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
    unsigned __int8 v6 = v5;
    if (v5) {
      uint64_t v7 = v5;
    }
    else {
      uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 containerIdentifier]);
    }
    id v8 = v7;
  }

  else
  {
    id v8 = @"System Library";
  }

  return v8;
}

- (void)_diagnoseLibraryIdentifier:(id)a3
{
  id v15 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v15 path]);
  if (v4)
  {
    uint64_t v5 = -[NSURL initFileURLWithPath:isDirectory:]( objc_alloc(&OBJC_CLASS___NSURL),  "initFileURLWithPath:isDirectory:",  v4,  1LL);
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDiagnoseCommand _goodNameForLibraryIdentifier:](self, "_goodNameForLibraryIdentifier:", v15));
    if (v6)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v15 uuid]);
      -[CPLCTLCommand printFormat:](self, "printFormat:", @"Will diagnose library %@ (%@)", v6, v7);

      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDiagnoseCommand _abbreviatedPathForURL:](self, "_abbreviatedPathForURL:", v5));
      -[CPLCTLCommand printFormat:](self, "printFormat:", @"  path: %@", v8);
    }

    else
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDiagnoseCommand _abbreviatedPathForURL:](self, "_abbreviatedPathForURL:", v5));
      -[CPLCTLCommand printFormat:](self, "printFormat:", @"Will diagnose library at %@", v8);
    }

    objc_storeStrong((id *)&self->_libraryPath, v4);
    if (v6)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByReplacingOccurrencesOfString:@"/" withString:@":"]);

      annotation = self->_annotation;
      uint64_t v11 = objc_alloc(&OBJC_CLASS___NSString);
      if (annotation) {
        id v12 = -[NSString initWithFormat:](v11, "initWithFormat:", @"-%@%@", v9, self->_annotation);
      }
      else {
        id v12 = -[NSString initWithFormat:](v11, "initWithFormat:", @"-%@", v9, v14);
      }
      uint64_t v13 = self->_annotation;
      self->_annotation = v12;
    }
  }

  else
  {
    -[CPLCTLCommand printFormat:](self, "printFormat:", @"Will diagnose the System Library");
  }

  -[CPLCTLCommand printFormat:](self, "printFormat:", @"============================");
}

- (BOOL)_url:(id)a3 existsInFileIdentifiersAddIfNot:(id)a4
{
  id v5 = a4;
  id v12 = 0LL;
  unsigned int v6 = [a3 getResourceValue:&v12 forKey:NSURLFileIdentifierKey error:0];
  id v7 = v12;
  id v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0LL;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9) {
    goto LABEL_8;
  }
  if (([v5 containsObject:v7] & 1) == 0)
  {
    [v5 addObject:v8];
LABEL_8:
    BOOL v10 = 0;
    goto LABEL_9;
  }

  BOOL v10 = 1;
LABEL_9:

  return v10;
}

- (BOOL)_path:(id)a3 existsInFileIdentifiersAddIfNot:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[NSURL initFileURLWithPath:](objc_alloc(&OBJC_CLASS___NSURL), "initFileURLWithPath:", v7);

  LOBYTE(v7) = -[CPLDiagnoseCommand _url:existsInFileIdentifiersAddIfNot:]( self,  "_url:existsInFileIdentifiersAddIfNot:",  v8,  v6);
  return (char)v7;
}

- (BOOL)_chooseLibraryInteractively
{
  id v92 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[CPLDiagnoseCommand getEngineWrapperStatusesWithError:]( self,  "getEngineWrapperStatusesWithError:",  &v92));
  id v4 = v92;
  id v5 = v4;
  if (v3)
  {
    if ([v3 count])
    {
      id v76 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      v72 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      id v91 = v5;
      id v6 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCTLCommand getLibraryIdentifiersWithDomain:error:]( self,  "getLibraryIdentifiersWithDomain:error:",  3LL,  &v91));
      id v7 = v91;

      v67 = v6;
      v68 = v3;
      id v66 = v7;
      if (v6)
      {
        __int128 v89 = 0u;
        __int128 v90 = 0u;
        __int128 v87 = 0u;
        __int128 v88 = 0u;
        id v8 = v6;
        id v9 = [v8 countByEnumeratingWithState:&v87 objects:v95 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v88;
          do
          {
            for (i = 0LL; i != v10; i = (char *)i + 1)
            {
              if (*(void *)v88 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void **)(*((void *)&v87 + 1) + 8LL * (void)i);
              uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 path]);
              id v15 = v14;
              if (v14)
              {
                id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 pathExtension]);
                if ([v16 isEqualToString:@"photoslibrary"])
                {
                  unsigned __int8 v17 = -[CPLDiagnoseCommand _path:existsInFileIdentifiersAddIfNot:]( self,  "_path:existsInFileIdentifiersAddIfNot:",  v15,  v72);

                  if ((v17 & 1) == 0) {
                    -[NSMutableArray addObject:](v76, "addObject:", v13);
                  }
                }

                else
                {
                }
              }
            }

            id v10 = [v8 countByEnumeratingWithState:&v87 objects:v95 count:16];
          }

          while (v10);
          id v3 = v68;
        }
      }

      else
      {
        id v8 = (id)objc_claimAutoreleasedReturnValue([v7 localizedDescription]);
        -[CPLCTLCommand printFormat:]( self,  "printFormat:",  @"WARNING: failed to get libraries from Photos daemon: %@",  v8);
      }

      __int128 v85 = 0u;
      __int128 v86 = 0u;
      __int128 v83 = 0u;
      __int128 v84 = 0u;
      id obj = v3;
      id v21 = [obj countByEnumeratingWithState:&v83 objects:v94 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v84;
        uint64_t v24 = CPLLibraryIdentifierSystemLibrary;
        do
        {
          for (j = 0LL; j != v22; j = (char *)j + 1)
          {
            if (*(void *)v84 != v23) {
              objc_enumerationMutation(obj);
            }
            id v26 = *(void **)(*((void *)&v83 + 1) + 8LL * (void)j);
            v27 = (void *)objc_claimAutoreleasedReturnValue( -[CPLDiagnoseCommand _libraryURLFromWrapperStatus:]( self,  "_libraryURLFromWrapperStatus:",  v26));
            v28 = (void *)objc_claimAutoreleasedReturnValue([v26 parameters]);
            v29 = (void *)objc_claimAutoreleasedReturnValue([v28 libraryIdentifier]);
            unsigned int v30 = [v29 isEqualToString:v24];

            if (v30)
            {
              -[NSMutableArray insertObject:atIndex:](v76, "insertObject:atIndex:", v26, 0LL);
            }

            else if (v27 {
                   && !-[CPLDiagnoseCommand _url:existsInFileIdentifiersAddIfNot:]( self,  "_url:existsInFileIdentifiersAddIfNot:",  v27,  v72))
            }
            {
              -[NSMutableArray addObject:](v76, "addObject:", v26);
            }
          }

          id v22 = [obj countByEnumeratingWithState:&v83 objects:v94 count:16];
        }

        while (v22);
      }

      __int128 v81 = 0u;
      __int128 v82 = 0u;
      __int128 v79 = 0u;
      __int128 v80 = 0u;
      v71 = v76;
      id v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v71,  "countByEnumeratingWithState:objects:count:",  &v79,  v93,  16LL);
      if (v31)
      {
        id v32 = v31;
        uint64_t v33 = 0LL;
        id obja = *(id *)v80;
        id v34 = &selRef_releasePowerAssertion_;
        uint64_t v69 = CPLLibraryIdentifierSystemLibrary;
        do
        {
          v35 = 0LL;
          uint64_t v70 = v33;
          do
          {
            if (*(id *)v80 != obja) {
              objc_enumerationMutation(v71);
            }
            unsigned int v36 = *(void **)(*((void *)&v79 + 1) + 8LL * (void)v35);
            uint64_t v37 = objc_opt_class(v34 + 314);
            id v77 = v36;
            if ((objc_opt_isKindOfClass(v36, v37) & 1) != 0)
            {
              id v38 = v36;
              uint64_t v39 = objc_claimAutoreleasedReturnValue([v38 path]);
              if (!v39) {
                sub_10001CFA4();
              }
              id v40 = (void *)v39;
              v41 = -[NSURL initFileURLWithPath:isDirectory:]( objc_alloc(&OBJC_CLASS___NSURL),  "initFileURLWithPath:isDirectory:",  v39,  1LL);
              v73 = (void *)objc_claimAutoreleasedReturnValue( -[CPLDiagnoseCommand _goodNameForLibraryIdentifier:]( self,  "_goodNameForLibraryIdentifier:",  v38));
              v42 = (void *)objc_claimAutoreleasedReturnValue([v38 uuid]);
              uint64_t v43 = objc_claimAutoreleasedReturnValue([v38 userDescription]);
              uint64_t v44 = (void *)v43;
              uint64_t v45 = (uint64_t)v35 + v33 + 1;
              id v46 = v32;
              if (v43) {
                v47 = (const __CFString *)v43;
              }
              else {
                v47 = @"(no description)";
              }
              v48 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDiagnoseCommand _abbreviatedPathForURL:](self, "_abbreviatedPathForURL:", v41));
              v65 = v47;
              id v32 = v46;
              v49 = v41;
              -[CPLCTLCommand printFormat:]( self,  "printFormat:",  @"%d %@ %@ %@ (from Photos)\n  in %@"),  v45,  v73,  v42,  v65,  v48);

              uint64_t v33 = v70;
              id v34 = &selRef_releasePowerAssertion_;
            }

            else
            {
              uint64_t v50 = objc_opt_class(&OBJC_CLASS___CPLEngineWrapperStatus);
              if ((objc_opt_isKindOfClass(v36, v50) & 1) == 0) {
                sub_10001CFCC();
              }
              uint64_t v51 = (uint64_t)v35 + v33 + 1;
              id v52 = v36;
              v53 = (void *)objc_claimAutoreleasedReturnValue([v52 parameters]);
              uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue([v53 libraryIdentifier]);
              unsigned int v55 = [v54 isEqualToString:v69];

              if (v55)
              {
                id v40 = (void *)objc_claimAutoreleasedReturnValue([v52 parameters]);
                v49 = (NSURL *)objc_claimAutoreleasedReturnValue([v40 libraryIdentifier]);
                -[CPLCTLCommand printFormat:](self, "printFormat:", @"%d %@ (from CPL)"), v51, v49);
              }

              else
              {
                id v40 = (void *)objc_claimAutoreleasedReturnValue( -[CPLDiagnoseCommand _libraryURLFromWrapperStatus:]( self,  "_libraryURLFromWrapperStatus:",  v52));
                v49 = (NSURL *)objc_claimAutoreleasedReturnValue([v52 parameters]);
                v56 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL libraryIdentifier](v49, "libraryIdentifier"));
                id v57 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDiagnoseCommand _abbreviatedPathForURL:](self, "_abbreviatedPathForURL:", v40));
                -[CPLCTLCommand printFormat:](self, "printFormat:", @"%d %@ (from CPL)\n  in %@"), v51, v56, v57);
              }
            }

            v35 = (char *)v35 + 1;
          }

          while (v32 != v35);
          id v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v71,  "countByEnumeratingWithState:objects:count:",  &v79,  v93,  16LL);
          uint64_t v33 = (v33 + (_DWORD)v35);
        }

        while (v32);
      }

      -[CPLCTLCommand put:](self, "put:", @"Pick a library: ");
      if (fgets(v78, 5, __stdinp))
      {
        int v58 = atoi(v78);
        uint64_t v59 = (v58 - 1);
        int v60 = v67;
        if (v58 >= 1 && (unint64_t)-[NSMutableArray count](v71, "count") >= v58)
        {
          -[CPLCTLCommand endLine](self, "endLine");
          v62 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v71, "objectAtIndexedSubscript:", v59));
          uint64_t v63 = objc_opt_class(&OBJC_CLASS___CPLEngineWrapperStatus);
          if ((objc_opt_isKindOfClass(v62, v63) & 1) != 0)
          {
            -[CPLDiagnoseCommand _diagnoseLibraryWrapperStatus:](self, "_diagnoseLibraryWrapperStatus:", v62);
          }

          else
          {
            uint64_t v64 = objc_opt_class(&OBJC_CLASS___PLPhotoLibraryIdentifier);
            if ((objc_opt_isKindOfClass(v62, v64) & 1) == 0) {
              sub_10001CF7C();
            }
            -[CPLDiagnoseCommand _diagnoseLibraryIdentifier:](self, "_diagnoseLibraryIdentifier:", v62);
          }

          id v3 = v68;
          __int128 v20 = v66;

          BOOL v19 = 1;
          goto LABEL_56;
        }

        -[CPLCTLCommand printFormat:](self, "printFormat:", @"Invalid choice");
        BOOL v19 = 0;
        id v3 = v68;
      }

      else
      {
        BOOL v19 = 0;
        int v60 = v67;
        id v3 = v68;
      }

      __int128 v20 = v66;
LABEL_56:

      goto LABEL_57;
    }

    -[CPLCTLCommand printFormat:](self, "printFormat:", @"No engines are registered");
  }

  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedDescription]);
    -[CPLCTLCommand printFormat:](self, "printFormat:", @"Failed to get the list of registered engines: %@", v18);
  }

  BOOL v19 = 0;
  __int128 v20 = v5;
LABEL_57:

  return v19;
}

- (BOOL)_wrapperStatusMatchesLibraryFilterRegExp:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 parameters]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 libraryIdentifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSRegularExpression firstMatchInString:options:range:]( self->_libraryFilterRegExp,  "firstMatchInString:options:range:",  v5,  0,  0,  [v5 length]));

  if (v6
    || (id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 mainScopeIdentifier]),
        id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSRegularExpression firstMatchInString:options:range:]( self->_libraryFilterRegExp,  "firstMatchInString:options:range:",  v7,  0,  0,  [v7 length])),  v8,  v7,  v8))
  {
    BOOL v9 = 1;
  }

  else
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 clientLibraryBaseURL]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 path]);

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSRegularExpression firstMatchInString:options:range:]( self->_libraryFilterRegExp,  "firstMatchInString:options:range:",  v12,  0,  0,  [v12 length]));
    BOOL v9 = v13 != 0LL;
  }

  return v9;
}

- (BOOL)_libraryIdentifierMatchesLibraryFilterRegExp:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSRegularExpression firstMatchInString:options:range:]( self->_libraryFilterRegExp,  "firstMatchInString:options:range:",  v5,  0,  0,  [v5 length]));

  if (v6) {
    goto LABEL_4;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 containerIdentifier]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSRegularExpression firstMatchInString:options:range:]( self->_libraryFilterRegExp,  "firstMatchInString:options:range:",  v7,  0,  0,  [v7 length]));

  if (v8
    || (BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]),
        id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSRegularExpression firstMatchInString:options:range:]( self->_libraryFilterRegExp,  "firstMatchInString:options:range:",  v9,  0,  0,  [v9 length])),  v10,  v9,  v10))
  {
LABEL_4:
    BOOL v11 = 1;
  }

  else
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSRegularExpression firstMatchInString:options:range:]( self->_libraryFilterRegExp,  "firstMatchInString:options:range:",  v13,  0,  0,  [v13 length]));

    BOOL v11 = v14 != 0LL;
  }

  return v11;
}

- (BOOL)_lookForLibrary
{
  if (!self->_libraryFilterRegExp) {
    sub_10001CFF4();
  }
  id v36 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[CPLDiagnoseCommand getEngineWrapperStatusesWithError:]( self,  "getEngineWrapperStatusesWithError:",  &v36));
  id v4 = v36;
  id v5 = v4;
  if (v3)
  {
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id v6 = v3;
    id v7 = [v6 countByEnumeratingWithState:&v32 objects:v38 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v33;
      while (2)
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v33 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)i);
          if (-[CPLDiagnoseCommand _wrapperStatusMatchesLibraryFilterRegExp:]( self,  "_wrapperStatusMatchesLibraryFilterRegExp:",  v11))
          {
            -[CPLDiagnoseCommand _diagnoseLibraryWrapperStatus:](self, "_diagnoseLibraryWrapperStatus:", v11);
            BOOL v23 = 1;
            goto LABEL_25;
          }
        }

        id v8 = [v6 countByEnumeratingWithState:&v32 objects:v38 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    id v31 = v5;
    id v6 = (id)objc_claimAutoreleasedReturnValue( -[CPLCTLCommand getLibraryIdentifiersWithDomain:error:]( self,  "getLibraryIdentifiersWithDomain:error:",  3LL,  &v31));
    id v12 = v31;

    if (v6)
    {
      id v25 = v12;
      id v26 = v3;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      id v13 = v6;
      id v14 = [v13 countByEnumeratingWithState:&v27 objects:v37 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v28;
        while (2)
        {
          for (j = 0LL; j != v15; j = (char *)j + 1)
          {
            if (*(void *)v28 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)j);
            BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v18 path]);
            __int128 v20 = v19;
            if (v19)
            {
              id v21 = (void *)objc_claimAutoreleasedReturnValue([v19 pathExtension]);
              unsigned int v22 = [v21 isEqualToString:@"photoslibrary"];

              if (v22)
              {
                if (-[CPLDiagnoseCommand _libraryIdentifierMatchesLibraryFilterRegExp:]( self,  "_libraryIdentifierMatchesLibraryFilterRegExp:",  v18))
                {
                  -[CPLDiagnoseCommand _diagnoseLibraryIdentifier:](self, "_diagnoseLibraryIdentifier:", v18);

                  BOOL v23 = 1;
                  goto LABEL_28;
                }
              }
            }
          }

          id v15 = [v13 countByEnumeratingWithState:&v27 objects:v37 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }

      id v13 = (id)objc_claimAutoreleasedReturnValue(-[NSRegularExpression pattern](self->_libraryFilterRegExp, "pattern"));
      -[CPLCTLCommand printFormat:](self, "printFormat:", @"Found no libraries matching '%@'", v13);
      BOOL v23 = 0;
LABEL_28:
      id v12 = v25;
      id v3 = v26;
    }

    else
    {
      id v13 = (id)objc_claimAutoreleasedReturnValue([v12 localizedDescription]);
      -[CPLCTLCommand printFormat:](self, "printFormat:", @"Failed to get the list of active libraries: %@", v13);
      BOOL v23 = 0;
    }
  }

  else
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue([v4 localizedDescription]);
    -[CPLCTLCommand printFormat:](self, "printFormat:", @"Failed to get the list of registered engines: %@", v6);
    BOOL v23 = 0;
LABEL_25:
    id v12 = v5;
  }

  return v23;
}

- (int)execute
{
  if (self->_skipSysdiagnose
    || !+[Libsysdiagnose isSysdiagnoseInProgressWithError:]( &OBJC_CLASS___Libsysdiagnose,  "isSysdiagnoseInProgressWithError:",  0LL))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCTLCommand defaultLibraryURL](self, "defaultLibraryURL"));

    if (v4)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCTLCommand defaultLibraryIdentifier](self, "defaultLibraryIdentifier"));
      -[CPLCTLCommand printFormat:](self, "printFormat:", @"Will diagnose library with CPL identifier %@", v5);

      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCTLCommand defaultLibraryURL](self, "defaultLibraryURL"));
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDiagnoseCommand _abbreviatedPathForURL:](self, "_abbreviatedPathForURL:", v6));
      -[CPLCTLCommand printFormat:](self, "printFormat:", @"  path: %@", v7);

      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCTLCommand defaultLibraryIdentifier](self, "defaultLibraryIdentifier"));
      -[CPLDiagnoseCommand _diagnoseWithCPLLibraryIdentifier:](self, "_diagnoseWithCPLLibraryIdentifier:", v8);
    }

    else
    {
      if (self->_pickInteractively)
      {
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCTLCommand daemonConnection](self, "daemonConnection"));
        if (!-[CPLDiagnoseCommand _chooseLibraryInteractively](self, "_chooseLibraryInteractively")) {
          goto LABEL_37;
        }
        goto LABEL_7;
      }

      if (self->_libraryFilterRegExp)
      {
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCTLCommand daemonConnection](self, "daemonConnection"));
        if (!-[CPLDiagnoseCommand _lookForLibrary](self, "_lookForLibrary")) {
          goto LABEL_37;
        }
        goto LABEL_7;
      }
    }

    uint64_t v9 = 0LL;
LABEL_7:
    if (self->_displayConsent && isatty(1)) {
      -[CPLDiagnoseCommand displayConsent](self, "displayConsent");
    }
    -[CPLDiagnoseCommand prepareOutputURLs](self, "prepareOutputURLs");
    if (self->_isRoot)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      uint64_t v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  10LL));
      incompleteTasks = self->incompleteTasks;
      self->incompleteTasks = v11;

      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDiagnoseCommand _simplifiedPathForURL:](self, "_simplifiedPathForURL:", self->_outputFolder));
      -[CPLCTLCommand printFormat:](self, "printFormat:", @"Will gather diagnostics in %@", v13);

      if (-[CPLDiagnoseCommand createBaseFolderAndLogFile](self, "createBaseFolderAndLogFile"))
      {
        if (self->_isAppleInternal) {
          id v14 = @" internal";
        }
        else {
          id v14 = &stru_1000319D0;
        }
        if (self->_hasFullShellCommands) {
          id v15 = &stru_1000319D0;
        }
        else {
          id v15 = @" limited";
        }
        uint64_t v16 = __CPLVersion();
        unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        -[CPLCTLCommand printFormat:]( self,  "printFormat:",  @"Starting%@ diagnostic - Installed CPL is %@%@",  v14,  v15,  v17);

        v18 = (void *)objc_claimAutoreleasedReturnValue(+[CPLDateFormatter stringFromDate:](&OBJC_CLASS___CPLDateFormatter, "stringFromDate:", v10));
        BOOL v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone defaultTimeZone](&OBJC_CLASS___NSTimeZone, "defaultTimeZone"));
        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 name]);
        -[CPLCTLCommand printFormat:](self, "printFormat:", @"Date: %@ (%@)", v18, v20);

        -[CPLDiagnoseCommand startDiagnostic](self, "startDiagnostic");
        -[CPLCTLCommand printFormat:](self, "printFormat:", @"- Waiting for unfinished tasks if necessary");
        if (!+[CPLTask waitForAllLongTasksToFinish](&OBJC_CLASS___CPLTask, "waitForAllLongTasksToFinish")) {
          -[CPLCTLCommand printFormat:](self, "printFormat:", @"  Some diagnostic tasks did not finish!");
        }
        [v10 timeIntervalSinceNow];
        -[CPLCTLCommand printFormat:]( self,  "printFormat:",  @"(TOTAL elapsed time minus archiving: %.2fs)\n",  fabs(v21));
        if (-[NSMutableArray count](self->incompleteTasks, "count"))
        {
          -[CPLCTLCommand printFormat:](self, "printFormat:", @"Incomplete Tasks:\n");
          __int128 v55 = 0u;
          __int128 v56 = 0u;
          __int128 v53 = 0u;
          __int128 v54 = 0u;
          unsigned int v22 = self->incompleteTasks;
          id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v53,  v57,  16LL);
          if (v23)
          {
            id v24 = v23;
            uint64_t v25 = *(void *)v54;
            do
            {
              for (i = 0LL; i != v24; i = (char *)i + 1)
              {
                if (*(void *)v54 != v25) {
                  objc_enumerationMutation(v22);
                }
                -[CPLCTLCommand printFormat:]( self,  "printFormat:",  @"   %@",  *(void *)(*((void *)&v53 + 1) + 8LL * (void)i));
              }

              id v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v53,  v57,  16LL);
            }

            while (v24);
          }
        }

        -[CPLDiagnoseCommand printDiskCapacity:](self, "printDiskCapacity:", @"archive");
        __int128 v27 = (void *)objc_claimAutoreleasedReturnValue( -[CPLDiagnoseCommand _simplifiedPathForURL:]( self,  "_simplifiedPathForURL:",  self->_outputFolder));
        __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDiagnoseCommand _simplifiedPathForURL:](self, "_simplifiedPathForURL:", self->_outputFile));
        -[CPLCTLCommand printFormat:](self, "printFormat:", @"- Archiving %@ to %@", v27, v28);

        +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
        double v30 = v29;
        id v31 = objc_alloc(&OBJC_CLASS___CPLDiagnoseArchive);
        __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self->_outputFile, "path"));
        __int128 v33 = -[CPLDiagnoseArchive initWithPath:shouldCompress:](v31, "initWithPath:shouldCompress:", v32, 1LL);

        if (v33)
        {
          __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self->_outputFolder, "path"));
          __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v34 lastPathComponent]);
          uint64_t v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "substringFromIndex:", objc_msgSend(CPLDiagnosticsInProgressPrefix, "length")));

          -[CPLDiagnoseArchive addDirectoryToArchive:withDirName:](v33, "addDirectoryToArchive:withDirName:", v34, v36);
          -[CPLDiagnoseArchive closeArchive](v33, "closeArchive");
          +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
          -[CPLCTLCommand printFormat:](self, "printFormat:", @"  elapsed time: %.2fs", v37 - v30);

          -[CPLDiagnoseCommand printDiskCapacity:](self, "printDiskCapacity:", @"cleanup");
          id v38 = (void *)objc_claimAutoreleasedReturnValue( -[CPLDiagnoseCommand _simplifiedPathForURL:]( self,  "_simplifiedPathForURL:",  self->_outputFolder));
          -[CPLCTLCommand printFormat:](self, "printFormat:", @"- Removing %@", v38);

          uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
          outputFolder = self->_outputFolder;
          id v52 = 0LL;
          LOBYTE(v36) = [v39 removeItemAtURL:outputFolder error:&v52];
          id v41 = v52;

          if ((v36 & 1) == 0)
          {
            v42 = (void *)objc_claimAutoreleasedReturnValue([v41 localizedDescription]);
            -[CPLCTLCommand printFormat:](self, "printFormat:", @"  Failed: %@", v42);
          }
        }

        else
        {
          -[CPLCTLCommand printFormat:](self, "printFormat:", @"  Failed");
        }

        if (self->_isRoot)
        {
          -[CPLCTLCommand printFormat:](self, "printFormat:", @"Changing owner of archive to mobile");
          uint64_t v43 = getpwnam("mobile");
          if (v43)
          {
            gid_t pw_uid = v43->pw_uid;
            uid_t pw_gid = v43->pw_gid;
          }

          else
          {
            uid_t pw_gid = 0;
            gid_t pw_uid = 0;
          }

          if (chown(-[NSURL fileSystemRepresentation](self->_outputFile, "fileSystemRepresentation"), pw_gid, pw_uid))
          {
            id v46 = __error();
            -[CPLCTLCommand printFormat:](self, "printFormat:", @"  Failed: %s", strerror(*v46));
          }

          else
          {
            -[CPLCTLCommand printFormat:](self, "printFormat:", @"  Succeeded", v51);
          }
        }

        -[CPLDiagnoseCommand printDiskCapacity:](self, "printDiskCapacity:", @"complete");
        -[CPLCTLCommand printFormat:](self, "printFormat:", @"- mark output file purgeable");
        -[CPLDiagnoseCommand markPurgeable:](self, "markPurgeable:", self->_outputFile);
        v47 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self->_outputFile, "path"));
        -[CPLCTLCommand printFormat:](self, "printFormat:", @"\nDiagnostic is available at %@", v47);

        -[CPLCTLCommand printFormat:](self, "printFormat:", @"\nEnjoy.");
        [v10 timeIntervalSinceNow];
        -[CPLCTLCommand printFormat:](self, "printFormat:", @"(TOTAL elapsed time: %.2fs)", fabs(v48));
        diagnosticLog = self->_diagnosticLog;
        if (diagnosticLog)
        {
          fclose(diagnosticLog);
          self->_diagnosticLog = 0LL;
        }

        int v3 = 0;
      }

      else
      {
        int v3 = 1;
      }

      goto LABEL_54;
    }

    -[CPLCTLCommand printFormat:]( self,  "printFormat:",  @"********************************  WARNING  ************************************");
    -[CPLCTLCommand printFormat:]( self,  "printFormat:",  @"  You need to run this tool as root in order to collect the new-style of logs.");
    -[CPLCTLCommand printFormat:](self, "printFormat:", @"                   Please run this tool again as root.");
    -[CPLCTLCommand printFormat:]( self,  "printFormat:",  @"*******************************************************************************");
LABEL_37:
    int v3 = 1;
LABEL_54:

    return v3;
  }

  -[CPLCTLCommand printError:](self, "printError:", @"sysdiagnose is already in progress!");
  -[CPLCTLCommand printError:](self, "printError:", @"  run with -s to skip sysdiagnose");
  return 1;
}

- (void)printFormat:(id)a3 arguments:(char *)a4
{
  id v6 = a3;
  id v7 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", v6, a4);

  id v10 = v7;
  id v8 = -[NSString UTF8String](v10, "UTF8String");
  diagnosticLog = self->_diagnosticLog;
  if (diagnosticLog)
  {
    fprintf(diagnosticLog, "%s\n", v8);
    fflush(self->_diagnosticLog);
  }

  fprintf(__stdoutp, "%s\n", v8);
  fflush(__stdoutp);
}

- (void)printDiskCapacity:(id)a3
{
  id v4 = a3;
  NSURLResourceKey v17 = NSURLVolumeAvailableCapacityKey;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByDeletingLastPathComponent](self->_outputFolder, "URLByDeletingLastPathComponent"));
  id v10 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 resourceValuesForKeys:v5 error:&v10]);
  id v8 = v10;

  if (v7)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:NSURLVolumeAvailableCapacityKey]);
    -[CPLCTLCommand printFormat:]( self,  "printFormat:",  @"- diagnostic volume capacity=%@ importantCapacity=%@ (%@)",  v9,  @"<unsupported>",  v4);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543874;
      id v12 = v9;
      __int16 v13 = 2114;
      id v14 = @"<unsupported>";
      __int16 v15 = 2114;
      id v16 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "PhotosDiagnostic volume capacity=%{public}@ importantCapacity=%{public}@ (%{public}@)",  buf,  0x20u);
    }
  }

  else
  {
    -[CPLCTLCommand printError:](self, "printError:", @"Error finding disk capacity: %@", v8);
  }
}

- (BOOL)createBaseFolderAndLogFile
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v22[0] = NSFilePosixPermissions;
  v22[1] = NSFileOwnerAccountName;
  v23[0] = &off_1000371D8;
  v23[1] = @"mobile";
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  2LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByDeletingLastPathComponent](self->_outputFile, "URLByDeletingLastPathComponent"));
  id v21 = 0LL;
  unsigned __int8 v6 = [v3 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:v4 error:&v21];
  id v7 = v21;
  id v8 = v7;
  if ((v6 & 1) != 0)
  {
    outputFolder = self->_outputFolder;
    id v20 = v7;
    unsigned __int8 v10 = [v3 createDirectoryAtURL:outputFolder withIntermediateDirectories:1 attributes:v4 error:&v20];
    id v11 = v20;

    if ((v10 & 1) != 0)
    {
      id v12 = objc_claimAutoreleasedReturnValue( -[NSURL URLByAppendingPathComponent:isDirectory:]( self->_outputFolder, "URLByAppendingPathComponent:isDirectory:", @"diagnostic.log", 0LL));
      __int16 v13 = fopen((const char *)[v12 fileSystemRepresentation], "a+");
      self->_diagnosticLog = v13;
      if (v13)
      {
        -[CPLCTLCommand setLogOutputFd:](self, "setLogOutputFd:", fileno(v13));
      }

      else
      {
        NSURLResourceKey v17 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDiagnoseCommand _simplifiedPathForURL:](self, "_simplifiedPathForURL:", v12));
        v18 = __error();
        -[CPLCTLCommand printFormat:]( self,  "printFormat:",  @"Can't create diagnostic log at %@: %s",  v17,  strerror(*v18));
      }

      BOOL v15 = 1;
    }

    else
    {
      id v12 = (id)objc_claimAutoreleasedReturnValue(-[CPLDiagnoseCommand _simplifiedPathForURL:](self, "_simplifiedPathForURL:", self->_outputFolder));
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 localizedDescription]);
      -[CPLCTLCommand printFormat:](self, "printFormat:", @"Can't create %@: %@", v12, v16);

      BOOL v15 = 0;
    }

    id v8 = v11;
  }

  else
  {
    id v12 = (id)objc_claimAutoreleasedReturnValue(-[CPLDiagnoseCommand _simplifiedPathForURL:](self, "_simplifiedPathForURL:", v5));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedDescription]);
    -[CPLCTLCommand printFormat:](self, "printFormat:", @"Can't create %@: %@", v12, v14);

    BOOL v15 = 0;
  }

  return v15;
}

- (void)runAsUser:(id)a3
{
}

+ (BOOL)isAppleInternal
{
  if (qword_10003D3D0 != -1) {
    dispatch_once(&qword_10003D3D0, &stru_100031040);
  }
  return byte_10003D3C8;
}

- (void)displayConsent
{
  do
    int v3 = fgetc(__stdinp) << 24;
  while (v3 != 218103808 && v3 != 167772160);
}

- (id)processDetailPath:(id)a3
{
  return [@"ProcessDetail" stringByAppendingPathComponent:a3];
}

- (id)getEngineWrapperStatusesWithError:(id *)a3
{
  cachedWrapperStatuses = self->_cachedWrapperStatuses;
  if (cachedWrapperStatuses) {
    return cachedWrapperStatuses;
  }
  p_getWrapperStatusesError = &self->_getWrapperStatusesError;
  getWrapperStatusesError = self->_getWrapperStatusesError;
  if (getWrapperStatusesError)
  {
    if (a3) {
      *a3 = getWrapperStatusesError;
    }
    return 0LL;
  }

  else
  {
    v15.receiver = self;
    v15.super_class = (Class)&OBJC_CLASS___CPLDiagnoseCommand;
    id v16 = 0LL;
    id v8 = -[CPLCTLCommand getEngineWrapperStatusesWithError:](&v15, "getEngineWrapperStatusesWithError:", &v16);
    uint64_t v9 = (NSArray *)objc_claimAutoreleasedReturnValue(v8);
    id v10 = v16;
    id v11 = v16;
    id v12 = self->_cachedWrapperStatuses;
    self->_cachedWrapperStatuses = v9;

    __int16 v13 = self->_cachedWrapperStatuses;
    if (!v13)
    {
      objc_storeStrong((id *)p_getWrapperStatusesError, v10);
      __int16 v13 = self->_cachedWrapperStatuses;
    }

    id v14 = v13;

    return v14;
  }

- (void)prepareOutputURLs
{
  if (self->_outputFile || self->_outputFolder) {
    return;
  }
  host = self->host;
  if (gethostname(self->host, 0xFFuLL))
  {
    *(_DWORD *)&self->host[8] = 7631727;
    *(void *)host = *(void *)"UnknownHost";
  }

  for (i = self->host; *i == 47; ++i)
  {
    char *i = 95;
LABEL_11:
    ;
  }

  if (*i) {
    goto LABEL_11;
  }
  annotation = (const __CFString *)self->_annotation;
  if (!annotation) {
    annotation = &stru_1000319D0;
  }
  if (self->_isRoot) {
    unsigned __int8 v6 = "-root";
  }
  else {
    unsigned __int8 v6 = "";
  }
  if (self->_hasFullShellCommands) {
    id v7 = "";
  }
  else {
    id v7 = "-limited";
  }
  id v17 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@-%s%s%s-T%@",  @"CPL-diagnostics",  annotation,  self->host,  v6,  v7,  self->_timestamp));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v17 stringByAppendingPathExtension:@"cpldiagnostics"]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  @"/var/tmp",  1LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([CPLDiagnosticsInProgressPrefix stringByAppendingString:v8]);
  id v11 = (NSURL *)objc_claimAutoreleasedReturnValue([v9 URLByAppendingPathComponent:v10 isDirectory:1]);
  outputFolder = self->_outputFolder;
  self->_outputFolder = v11;

  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  @"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/photos",  1LL));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingPathExtension:@"tgz"]);
  objc_super v15 = (NSURL *)objc_claimAutoreleasedReturnValue([v13 URLByAppendingPathComponent:v14 isDirectory:0]);
  outputFile = self->_outputFile;
  self->_outputFile = v15;
}

- (void)setUserMode:(BOOL)a3
{
  if (a3)
  {
    int v3 = getpwnam("mobile");
    if (v3) {
      seteuid(v3->pw_uid);
    }
    else {
      seteuid(0x1F5u);
    }
  }

- (void)revertToRootMode:(BOOL)a3
{
  if (a3)
  {
    uid_t v3 = getuid();
    seteuid(v3);
  }

- (void)markPurgeable:(id)a3
{
  uint64_t v7 = 66053LL;
  id v4 = objc_claimAutoreleasedReturnValue([a3 path]);
  int v5 = fsctl((const char *)[v4 fileSystemRepresentation], 0xC0084A44uLL, &v7, 0);

  if (v5 == -1)
  {
    unsigned __int8 v6 = __error();
    -[CPLCTLCommand printError:](self, "printError:", @"  error marking purgeable: %s", strerror(*v6));
  }

- (id)preferencesforDomain:(id)a3 withKeys:(id)a4 currentUser:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = &kCFPreferencesCurrentUser;
  if (!a5) {
    id v8 = &kCFPreferencesAnyUser;
  }
  uint64_t v9 = *v8;
  if (a3) {
    id v10 = (const __CFString *)a3;
  }
  else {
    id v10 = kCFPreferencesAnyApplication;
  }
  id v11 = (const __CFArray *)a4;
  id v12 = a3;
  -[CPLDiagnoseCommand setUserMode:](self, "setUserMode:", v5);
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  CFDictionaryRef v14 = CFPreferencesCopyMultiple(v11, v10, v9, kCFPreferencesCurrentHost);

  CFTypeID v15 = CFGetTypeID(v14);
  if (v15 == CFDictionaryGetTypeID()) {
    [v13 addEntriesFromDictionary:v14];
  }
  else {
    -[CPLCTLCommand printFormat:](self, "printFormat:", @"  Unable to get preferences");
  }
  CFRelease(v14);
  -[CPLDiagnoseCommand revertToRootMode:](self, "revertToRootMode:", v5);
  return v13;
}

- (void)writePreferenceInDomain:(id)a3 withKey:(id)a4 toDirectory:(id)a5 currentUser:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = (__CFString *)a3;
  id v11 = (__CFString *)a4;
  id v12 = a5;
  if (v11)
  {
    __int128 v28 = v11;
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v28, 1LL));
    CFDictionaryRef v14 = v11;
  }

  else
  {
    __int16 v13 = 0LL;
    CFDictionaryRef v14 = @"all";
  }

  if (v10) {
    CFTypeID v15 = v10;
  }
  else {
    CFTypeID v15 = @"global";
  }
  -[CPLCTLCommand printFormat:]( self,  "printFormat:",  @"- Collecting preferences for domain: %@, key: %@.",  v15,  v14);
  id v16 = (void *)objc_claimAutoreleasedReturnValue( -[CPLDiagnoseCommand preferencesforDomain:withKeys:currentUser:]( self,  "preferencesforDomain:withKeys:currentUser:",  v10,  v13,  v6));
  if (v16)
  {
    id v17 = @"-";
    v18 = &stru_1000319D0;
    if (v11) {
      v18 = v11;
    }
    else {
      id v17 = &stru_1000319D0;
    }
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@%@",  v15,  v17,  v18));
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 stringByAppendingPathExtension:@"plist"]);
    id v26 = v12;
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v12 URLByAppendingPathComponent:v20]);

    unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v16,  100LL,  0LL,  0LL));
    id v27 = 0LL;
    unsigned __int8 v23 = [v22 writeToURL:v21 options:0 error:&v27];
    id v24 = v27;
    uint64_t v25 = v24;
    if ((v23 & 1) == 0) {
      -[CPLCTLCommand printError:](self, "printError:", @"Failed to write defaults to file (%@): %@", v21, v24);
    }

    id v12 = v26;
  }
}

- (BOOL)collectOutputOfCommand:(id)a3 label:(id)a4 filename:(id)a5
{
  return -[CPLDiagnoseCommand collectOutputOfCommand:label:filename:outputIsStderr:timeout:]( self,  "collectOutputOfCommand:label:filename:outputIsStderr:timeout:",  a3,  a4,  a5,  0LL,  a5 != 0LL);
}

- (BOOL)collectOutputOfCommand:(id)a3 label:(id)a4 filename:(id)a5 timeout:(BOOL)a6
{
  return -[CPLDiagnoseCommand collectOutputOfCommand:label:filename:outputIsStderr:timeout:]( self,  "collectOutputOfCommand:label:filename:outputIsStderr:timeout:",  a3,  a4,  a5,  0LL,  a6);
}

- (BOOL)collectOutputOfCommand:(id)a3 label:(id)a4 filename:(id)a5 outputIsStderr:(BOOL)a6 timeout:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = a5;
  id v13 = a4;
  CFDictionaryRef v14 = (void *)objc_claimAutoreleasedReturnValue(+[CPLTask taskWithCommandAndArguments:](&OBJC_CLASS___CPLTask, "taskWithCommandAndArguments:", a3));
  LOBYTE(v7) = -[CPLDiagnoseCommand collectOutputOfTask:label:filename:outputIsStderr:timeout:]( self,  "collectOutputOfTask:label:filename:outputIsStderr:timeout:",  v14,  v13,  v12,  v8,  v7);

  return v7;
}

- (BOOL)collectOutputOfCommandAndArguments:(id)a3 label:(id)a4 filename:(id)a5 outputIsStderr:(BOOL)a6 timeout:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  CFTypeID v15 = objc_alloc_init(&OBJC_CLASS___CPLTask);
  -[CPLTask setArgv:](v15, "setArgv:", v14);

  LOBYTE(v7) = -[CPLDiagnoseCommand collectOutputOfTask:label:filename:outputIsStderr:timeout:]( self,  "collectOutputOfTask:label:filename:outputIsStderr:timeout:",  v15,  v13,  v12,  v8,  v7);
  return v7;
}

- (BOOL)collectOutputOfTask:(id)a3 label:(id)a4 filename:(id)a5 outputIsStderr:(BOOL)a6 timeout:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (!self->_isAppleInternal)
  {
    CFTypeID v15 = (void *)objc_claimAutoreleasedReturnValue([v12 command]);
    if ([v15 hasPrefix:@"/bin/"])
    {
    }

    else
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v12 command]);
      unsigned __int8 v17 = [v16 hasPrefix:@"/usr/bin/"];

      if ((v17 & 1) == 0)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue([v12 command]);
        -[CPLCTLCommand printFormat:]( self,  "printFormat:",  @"  * attempt to run %@ on non-internal system *",  v18);
        BOOL v38 = 1;
        goto LABEL_35;
      }
    }
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v12 setCleanupEmptyFiles:1];
  [v12 setCanTimeout:v7];
  if (v14)
  {
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue( -[NSURL URLByAppendingPathComponent:isDirectory:]( self->_outputFolder,  "URLByAppendingPathComponent:isDirectory:",  v14,  0LL));
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 path]);
    if (v8)
    {
      [v12 setRedirectStderrToFileAtPath:v20];

      diagnosticLog = self->_diagnosticLog;
      if (diagnosticLog) {
        [v12 setRedirectStdoutToFileDescriptor:fileno(diagnosticLog)];
      }
    }

    else
    {
      [v12 setRedirectStdoutToFileAtPath:v20];
    }

    if (v8) {
      goto LABEL_17;
    }
  }

  else
  {
    unsigned int v22 = self->_diagnosticLog;
    if (v22) {
      [v12 setRedirectStdoutToFileDescriptor:fileno(v22)];
    }
    if (v8) {
      goto LABEL_17;
    }
  }

  unsigned __int8 v23 = self->_diagnosticLog;
  if (v23) {
    [v12 setRedirectStderrToFileDescriptor:fileno(v23)];
  }
LABEL_17:
  -[CPLCTLCommand printFormat:](self, "printFormat:", @"- %@", v13);
  id v24 = self->_diagnosticLog;
  if (v24)
  {
    BOOL isRoot = self->_isRoot;
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v12 argv]);
    id v27 = objc_claimAutoreleasedReturnValue([v26 componentsJoinedByString:@" "]);
    __int128 v28 = (const char *)[v27 UTF8String];
    uint64_t v29 = 35LL;
    if (!isRoot) {
      uint64_t v29 = 37LL;
    }
    fprintf(v24, "  %c %s\n", v29, v28);

    fflush(self->_diagnosticLog);
  }

  if (v14)
  {
    id v30 = [v12 exec];
  }

  else
  {
    id v31 = self->_diagnosticLog;
    if (v31)
    {
      fwrite("--- Beginning ---\n", 0x12uLL, 1uLL, v31);
      fflush(self->_diagnosticLog);
    }

    id v30 = [v12 exec];
    __int128 v32 = self->_diagnosticLog;
    if (v32)
    {
      fwrite("--- End ---\n", 0xCuLL, 1uLL, v32);
      fflush(self->_diagnosticLog);
    }
  }

  if (v30 == (id)2)
  {
    __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v12 redirectStdoutToFileAtPath]);

    if (v33)
    {
      __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v12 redirectStdoutToFileAtPath]);
      -[CPLCTLCommand printFormat:]( self,  "printFormat:",  @"  took too long. %@ might end up being incomplete",  v34);
    }

    else
    {
      -[CPLCTLCommand printFormat:](self, "printFormat:", @"  took too long.");
    }

    incompleteTasks = self->incompleteTasks;
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Timed out %@.",  v13));
    -[NSMutableArray addObject:](incompleteTasks, "addObject:", v36);
  }

  else if (v30 == (id)1)
  {
    -[CPLCTLCommand printFormat:](self, "printFormat:", @"  failed");
  }

  [v18 timeIntervalSinceNow];
  -[CPLCTLCommand printFormat:](self, "printFormat:", @"  elapsed time: %.2fs", fabs(v37));
  BOOL v38 = v30 == 0LL;
LABEL_35:

  return v38;
}

- (void)collectFileListingAtPath:(id)a3 label:(id)a4 filename:(id)a5 extendedDetail:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a5;
  if (v10)
  {
    id v12 = a4;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[CPLCTLCommand printFormat:](self, "printFormat:", @"- %@", v12);

    diagnosticLog = self->_diagnosticLog;
    if (diagnosticLog)
    {
      BOOL isRoot = self->_isRoot;
      unsigned __int8 v23 = (const char *)[v10 UTF8String];
      id v24 = (const char *)[v11 UTF8String];
      uint64_t v16 = 35LL;
      if (!isRoot) {
        uint64_t v16 = 37LL;
      }
      fprintf(diagnosticLog, "  %c recursive file listing of %s into %s\n", v16, v23, v24);
      fflush(self->_diagnosticLog);
    }

    char v26 = 0;
    uint64_t v17 = objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:](self->_outputFolder, "URLByAppendingPathComponent:", v11));
    v18 = (void *)objc_claimAutoreleasedReturnValue([(id)v17 path]);

    id v25 = 0LL;
    LOBYTE(v17) = CPLDiagnoseRecursiveFileListing(v10, v18, v6, &v26, 0LL, &v25);
    id v19 = v25;
    id v20 = v19;
    if ((v17 & 1) != 0)
    {
      if (v26) {
        -[CPLCTLCommand printFormat:](self, "printFormat:", @"  empty file removed");
      }
    }

    else
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v19 description]);
      -[CPLCTLCommand printFormat:](self, "printFormat:", @"  failed: %@", v21);
    }

    [v13 timeIntervalSinceNow];
    -[CPLCTLCommand printFormat:](self, "printFormat:", @"  elapsed time: %.2fs", fabs(v22));
  }
}

- (void)collectFileAtURL:(id)a3 suffix:(id)a4 destinationDirectory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
    unsigned int v14 = [v12 fileExistsAtPath:v13];

    uint64_t v15 = objc_claimAutoreleasedReturnValue(-[CPLDiagnoseCommand _simplifiedPathForURL:](self, "_simplifiedPathForURL:", v8));
    uint64_t v16 = (void *)v15;
    if (v14)
    {
      -[CPLCTLCommand printFormat:](self, "printFormat:", @"- Collecting %@", v15);

      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v8 lastPathComponent]);
      uint64_t v16 = v17;
      if (v9)
      {
        uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 stringByAppendingString:v9]);

        uint64_t v16 = (void *)v18;
      }

      id v19 = (void *)objc_claimAutoreleasedReturnValue([v10 URLByAppendingPathComponent:v16]);
      id v28 = 0LL;
      unsigned __int8 v20 = [v12 copyItemAtURL:v8 toURL:v19 error:&v28];
      id v21 = v28;
      double v22 = v21;
      if ((v20 & 1) == 0)
      {
        unsigned __int8 v23 = (void *)objc_claimAutoreleasedReturnValue([v21 localizedDescription]);
        -[CPLCTLCommand printFormat:](self, "printFormat:", @"  failed: %@", v23);

        incompleteTasks = self->incompleteTasks;
        id v24 = v11;
        id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed collecting %@.",  v8));
        -[NSMutableArray addObject:](incompleteTasks, "addObject:", v25);

        id v11 = v24;
      }

      [v11 timeIntervalSinceNow];
      -[CPLCTLCommand printFormat:](self, "printFormat:", @"  elapsed time: %.2fs", fabs(v26));
    }

    else
    {
      -[CPLCTLCommand printFormat:](self, "printFormat:", @"- %@ does not exist", v15);
    }
  }
}

- (void)collectFileAtPath:(id)a3 suffix:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", a3));
    -[CPLDiagnoseCommand collectFileAtURL:suffix:destinationDirectory:]( self,  "collectFileAtURL:suffix:destinationDirectory:",  v7,  v6,  self->_outputFolder);
  }

- (void)collectFileAtPath:(id)a3
{
}

- (void)collectDiagnosticLog:(id)a3
{
  if (a3)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue( objc_msgSend( @"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs",  "stringByAppendingPathComponent:"));
    -[CPLDiagnoseCommand collectFileAtPath:](self, "collectFileAtPath:", v4);
  }

- (void)sampleProcess:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDiagnoseCommand processDetailPath:](self, "processDetailPath:", v4));
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-sample.txt", v5));

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:](self->_outputFolder, "URLByAppendingPathComponent:", v10));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"/usr/bin/sample %@ 1 -f %@",  v4,  v7));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Sampling %@", v4));

  -[CPLDiagnoseCommand collectOutputOfCommand:label:filename:]( self,  "collectOutputOfCommand:label:filename:",  v8,  v9,  0LL);
}

- (id)processes
{
  if (qword_10003D3E0 != -1) {
    dispatch_once(&qword_10003D3E0, &stru_100031060);
  }
  return (id)qword_10003D3D8;
}

- (void)executeMemoryToolsOnProcess:(id)a3
{
  id v4 = a3;
  if (!qword_10003D3E8)
  {
    if (self->_isAppleInternal) {
      BOOL v5 = &off_100037370;
    }
    else {
      BOOL v5 = &off_100037388;
    }
    qword_10003D3E8 = (uint64_t)v5;
  }

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v6 = (id)qword_10003D3E8;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[CPLDiagnoseCommand executeTool:onProcess:]( self,  "executeTool:onProcess:",  *(void *)(*((void *)&v11 + 1) + 8LL * (void)i),  v4,  (void)v11);
      }

      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v8);
  }
}

- (void)executeTool:(id)a3 onProcess:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Getting %@ for %@",  v19,  v6));
  unsigned int v8 = [v19 hasPrefix:@"/"];
  uint64_t v9 = @"/usr/bin/";
  if (v8) {
    uint64_t v9 = &stru_1000319D0;
  }
  id v10 = v9;
  if ([v19 isEqualToString:@"leaks"])
  {
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self->_outputFolder, "path"));
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDiagnoseCommand processDetailPath:](self, "processDetailPath:", v6));
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v11 stringByAppendingPathComponent:v12]);
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 stringByAppendingPathExtension:@"memgraph"]);

    uint64_t v15 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @" --forkCorpse --physFootprint --outputGraph=%@",  v14);
    uint64_t v16 = 0LL;
  }

  else
  {
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDiagnoseCommand processDetailPath:](self, "processDetailPath:", v6));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v19 lastPathComponent]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@.txt",  v14,  v17));

    uint64_t v15 = &stru_1000319D0;
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@%@ %@",  v10,  v19,  v15,  v6));
  -[CPLDiagnoseCommand collectOutputOfCommand:label:filename:]( self,  "collectOutputOfCommand:label:filename:",  v18,  v7,  v16);
}

- (void)collectDiagnosticLogs
{
  if (self->_isAppleInternal) {
    -[CPLDiagnoseCommand _collectSharedAlbumFilesAtPath:]( self,  "_collectSharedAlbumFilesAtPath:",  @"/var/mobile/Library/MediaStream/albumshare/");
  }
}

- (void)collectPhotosLibraryUpgradeLogs
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100012C88;
  v2[3] = &unk_100030B88;
  v2[4] = self;
  -[CPLDiagnoseCommand runAsUser:](self, "runAsUser:", v2);
}

- (void)_removeResourceDataFromFaceCropChangeCPLSerializedRecords:(sqlite3 *)a3
{
  if (sqlite3_create_function_v2( a3,  "filterCPLSerializedRecord",  1,  2053,  0LL,  (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))sub_100013264,  0LL,  0LL,  0LL))
  {
    -[CPLCTLCommand printFormat:]( self,  "printFormat:",  @"error creating filterCPLSerializedRecord function to remove CPL storage: remove all CPLFaceCropChange records");
    sqlite3_exec(a3, "update clientCache set serializedRecord = '' where class='CPLFaceCropChange'", 0LL, 0LL, 0LL);
    sqlite3_exec( a3,  "update cloudCache set serializedRecord = null, stagedSerializedRecord = null where class='CPLFaceCropChange'",  0LL,  0LL,  0LL);
    sqlite3_exec( a3,  "update transientPullRepository set serializedRecord = '' where class='CPLFaceCropChange'",  0LL,  0LL,  0LL);
    sqlite3_exec(a3, "update pullQueue set serializedRecord = '' where class='CPLFaceCropChange'", 0LL, 0LL, 0LL);
  }

  else
  {
    BOOL v5 = objc_autoreleasePoolPush();
    sqlite3_exec( a3,  "update clientCache set serializedRecord = filterCPLSerializedRecord(serializedRecord) where class='CPLFaceCropChange'",  0LL,  0LL,  0LL);
    sqlite3_exec( a3,  "update pullQueue set serializedRecord = filterCPLSerializedRecord(serializedRecord) where class='CPLFaceCropChange'",  0LL,  0LL,  0LL);
    sqlite3_exec( a3,  "update transientPullRepository set serializedRecord = filterCPLSerializedRecord(serializedRecord) where class='CPLFaceCropChange'",  0LL,  0LL,  0LL);
    sqlite3_exec( a3,  "update cloudCache set serializedRecord = filterCPLSerializedRecord(serializedRecord), stagedSerializedRecord = fil terCPLSerializedRecord(stagedSerializedRecord) where class='CPLFaceCropChange'",  0LL,  0LL,  0LL);
    objc_autoreleasePoolPop(v5);
  }

- (void)_removeShareURLFromCPLScopes:(sqlite3 *)a3
{
  if (sqlite3_create_function_v2( a3,  "filterLibraryInfo",  1,  2053,  0LL,  (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))sub_100013530,  0LL,  0LL,  0LL))
  {
    -[CPLCTLCommand printFormat:]( self,  "printFormat:",  @"error creating filterShareURL function to remove CPL storage: remove shareURL from scopes");
    sqlite3_exec(a3, "update scopes set libraryInfo = null", 0LL, 0LL, 0LL);
  }

  else
  {
    BOOL v5 = objc_autoreleasePoolPush();
    sqlite3_exec(a3, "update scopes set libraryInfo = filterLibraryInfo(libraryInfo)", 0LL, 0LL, 0LL);
    -[CPLCTLCommand printFormat:](self, "printFormat:", @"  redacted %d scopes", sqlite3_changes(a3));
    objc_autoreleasePoolPop(v5);
  }

- (void)_removeShareURLFromPhotosMomentShare:(sqlite3 *)a3
{
  if (sqlite3_create_function_v2( a3,  "filterMomentShareURL",  1,  2053,  0LL,  (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))sub_100013800,  0LL,  0LL,  0LL))
  {
    -[CPLCTLCommand printFormat:]( self,  "printFormat:",  @"error creating filterMomentShare function to remove Photos storage: remove shareURL from MomentShare");
    sqlite3_exec(a3, "update ZSHARE set ZSHAREURL = null, ZPREVIEWDATA = null", 0LL, 0LL, 0LL);
  }

  else
  {
    BOOL v5 = objc_autoreleasePoolPush();
    sqlite3_exec( a3,  "update ZSHARE set ZSHAREURL = filterMomentShareURL(ZSHAREURL), ZPREVIEWDATA = null",  0LL,  0LL,  0LL);
    -[CPLCTLCommand printFormat:](self, "printFormat:", @"  redacted %d moment shares", sqlite3_changes(a3));
    objc_autoreleasePoolPop(v5);
  }

- (id)_readAppPrivateData
{
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue( -[NSString stringByAppendingPathComponent:]( self->_libraryPath,  "stringByAppendingPathComponent:",  @"private/com.apple.photolibraryd"));
  uid_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingPathComponent:@"appPrivateData.plist"]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v3));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:",  v4));

  return v5;
}

- (void)copyDatabaseFromPath:(id)a3 toPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
  unsigned int v9 = -[NSArray containsObject:](self->_databasesWithPIIData, "containsObject:", v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 pathExtension]);
  unsigned __int8 v11 = [&off_1000373A0 containsObject:v10];

  if ((v11 & 1) != 0)
  {
    id v25 = 0LL;
    ppDb = 0LL;
    id v12 = v6;
    if (ppDb) {
      sqlite3_close(ppDb);
    }
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v12));
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 absoluteString]);
    id v15 = objc_claimAutoreleasedReturnValue([v14 stringByAppendingString:@"?readonly_shm=1"]);
    int v16 = sqlite3_open_v2((const char *)[v15 UTF8String], &ppDb, 1, 0);

    if (!v16) {
      goto LABEL_13;
    }
    if (ppDb) {
      sqlite3_close(ppDb);
    }
    -[CPLCTLCommand printFormat:]( self,  "printFormat:",  @"couldn't open source database readonly, trying read/write mode");
    id v17 = v12;
    uint64_t v18 = sqlite3_open_v2((const char *)[v17 UTF8String], &ppDb, 2, 0);
    if ((_DWORD)v18)
    {
      uint64_t v19 = v18;
      if (ppDb) {
        sqlite3_close(ppDb);
      }
      -[CPLCTLCommand printFormat:]( self,  "printFormat:",  @"Failed to open src db %@: sqlite error %d\n",  v17,  v19);
    }

    else
    {
LABEL_13:
      id v21 = v7;
      uint64_t v22 = sqlite3_open_v2((const char *)[v21 UTF8String], &v25, 6, 0);
      if ((_DWORD)v22)
      {
        uint64_t v23 = v22;
        if (ppDb) {
          sqlite3_close(ppDb);
        }
        if (v25) {
          sqlite3_close(v25);
        }
        -[CPLCTLCommand printFormat:]( self,  "printFormat:",  @"Failed to open dst db %@: sqlite error %d\n",  v21,  v23);
      }

      else
      {
        uint64_t v24 = sqlite3_file_control(v25, 0LL, 102, ppDb);
        if ((_DWORD)v24)
        {
          -[CPLCTLCommand printFormat:]( self,  "printFormat:",  @"Failed to replace %@ with %@: sqlite error %d\n",  v21,  v12,  v24);
        }

        else
        {
          if (v9)
          {
            sqlite3_exec(v25, "pragma secure_delete=fast", 0LL, 0LL, 0LL);
            -[CPLCTLCommand printFormat:]( self,  "printFormat:",  @"  remove PII image data and obfuscate share URLs from %@",  v21);
            if ([v8 hasPrefix:@"Photos.sqlite"])
            {
              -[CPLCTLCommand printFormat:]( self,  "printFormat:",  @"  removing ZFACECROP ZRESOURCEDATA and share URL scopes");
              sqlite3_exec(v25, "update ZFACECROP set ZRESOURCEDATA = null", 0LL, 0LL, 0LL);
              -[CPLDiagnoseCommand _removeShareURLFromPhotosMomentShare:]( self,  "_removeShareURLFromPhotosMomentShare:",  v25);
              if (!self->_doNotStripOCR)
              {
                -[CPLCTLCommand printFormat:](self, "printFormat:", @"  removing OCR data");
                sqlite3_exec( v25,  "update ZCHARACTERRECOGNITIONATTRIBUTES set ZCHARACTERRECOGNITIONDATA = null",  0LL,  0LL,  0LL);
                sqlite3_exec( v25,  "update ZCHARACTERRECOGNITIONATTRIBUTES set ZMACHINEREADABLECODEDATA = null",  0LL,  0LL,  0LL);
                sqlite3_exec(v25, "update ZVISUALSEARCHATTRIBUTES set ZVISUALSEARCHDATA = null", 0LL, 0LL, 0LL);
              }
            }

            if ([v8 isEqualToString:@"photo.db"])
            {
              -[CPLCTLCommand printFormat:](self, "printFormat:", @"  removing RKFaceCrop");
              sqlite3_exec(v25, "update RKFaceCrop set resourceData = null", 0LL, 0LL, 0LL);
            }

            if ([v8 isEqualToString:@"Faces.db"])
            {
              -[CPLCTLCommand printFormat:](self, "printFormat:", @"  removing RKDetectedFaceBlob");
              sqlite3_exec(v25, "drop table RKDetectedFaceBlob", 0LL, 0LL, 0LL);
            }

            if ([v8 isEqualToString:@"store.cloudphotodb"])
            {
              -[CPLCTLCommand printFormat:]( self,  "printFormat:",  @"  removing resource data from serialized CPL records");
              -[CPLDiagnoseCommand _removeResourceDataFromFaceCropChangeCPLSerializedRecords:]( self,  "_removeResourceDataFromFaceCropChangeCPLSerializedRecords:",  v25);
              -[CPLDiagnoseCommand _removeShareURLFromCPLScopes:](self, "_removeShareURLFromCPLScopes:", v25);
            }

            sqlite3_exec(v25, "pragma incremental_vacuum", 0LL, 0LL, 0LL);
          }

          sqlite3_exec(v25, "pragma journal_mode=delete", 0LL, 0LL, 0LL);
        }

        if (ppDb) {
          sqlite3_close(ppDb);
        }
        if (v25) {
          sqlite3_close(v25);
        }
      }
    }
  }

  else
  {
    unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    [v20 copyItemAtPath:v6 toPath:v7 error:0];
  }
}

- (BOOL)_isUBFExtension:(id)a3
{
  return [a3 isEqualToString:@"photoslibrary"];
}

- (void)collectDatabaseAtPath:(id)a3 libraryPath:(id)a4 subdirectory:(id)a5
{
  id v33 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  if ([v10 fileExistsAtPath:v33])
  {
    if (self->_skipDBCopy)
    {
      incompleteTasks = self->incompleteTasks;
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Skipped collecting %@.",  v33));
      -[NSMutableArray addObject:](incompleteTasks, "addObject:", v12);
    }

    else
    {
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v10 attributesOfItemAtPath:v33 error:0]);
      id v14 = [v13 fileSize];

      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSByteCountFormatter stringFromByteCount:countStyle:]( &OBJC_CLASS___NSByteCountFormatter,  "stringFromByteCount:countStyle:",  v14,  0LL));
      if ((unint64_t)v14 >= 0x4B000001 && self->_skipBigDBCopy)
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSByteCountFormatter stringFromByteCount:countStyle:]( &OBJC_CLASS___NSByteCountFormatter,  "stringFromByteCount:countStyle:",  1258291200LL,  0LL));
        -[CPLCTLCommand printFormat:]( self,  "printFormat:",  @"- Skipping: The size of the database at %@ is bigger than the maximum allowed in this mode (%@): (%@) ",  v33,  v15,  v12);

        int v16 = self->incompleteTasks;
        id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Skipped collecting %@.",  v33));
        -[NSMutableArray addObject:](v16, "addObject:", v17);
      }

      else
      {
        id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        -[CPLCTLCommand printFormat:](self, "printFormat:", @"- Collecting database (%@) %@", v12, v33);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v8 pathExtension]);
        unsigned __int8 v19 = -[CPLDiagnoseCommand _isUBFExtension:](self, "_isUBFExtension:", v18);

        if ((v19 & 1) != 0)
        {
          if (v8)
          {
            __int128 v32 = v17;
            id v31 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByDeletingLastPathComponent]);
            unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v33,  "stringByReplacingOccurrencesOfString:withString:options:range:",  v31,  &stru_1000319D0,  8,  0,  objc_msgSend(v33, "length")));
            if (v9)
            {
              uint64_t v21 = objc_claimAutoreleasedReturnValue([v9 stringByAppendingPathComponent:v20]);

              unsigned __int8 v20 = (void *)v21;
            }

            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( -[NSURL URLByAppendingPathComponent:]( self->_outputFolder,  "URLByAppendingPathComponent:",  v20));
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 path]);

            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 stringByDeletingLastPathComponent]);
            id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
            [v25 createDirectoryAtPath:v24 withIntermediateDirectories:1 attributes:0 error:0];

            id v17 = v32;
            id v26 = v33;
          }

          else
          {
            -[CPLCTLCommand printError:]( self,  "printError:",  @"Unexpect nil libraryPath for UBF library. Filepath: %@",  v33);
            id v26 = v33;
            uint64_t v23 = 0LL;
          }
        }

        else
        {
          id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v33));
          id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 lastPathComponent]);
          uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( -[NSURL URLByAppendingPathComponent:]( self->_outputFolder,  "URLByAppendingPathComponent:",  v28));
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v29 path]);

          id v26 = v33;
        }

        -[CPLDiagnoseCommand copyDatabaseFromPath:toPath:](self, "copyDatabaseFromPath:toPath:", v26, v23);
        [v17 timeIntervalSinceNow];
        -[CPLCTLCommand printFormat:](self, "printFormat:", @"  elapsed time: %.2fs", fabs(v30));
      }
    }
  }

  else
  {
    -[CPLCTLCommand printFormat:](self, "printFormat:", @"- %@ does not exist", v33);
  }
}

- (id)interestingDatabasesForUBFLibraryPath:(id)a3 isSharingLibrary:(BOOL)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:@"Database"]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([v7 stringByAppendingPathComponent:@"apdb"]);
  unsigned __int8 v63 = 0;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v10 = [v9 fileExistsAtPath:v8 isDirectory:&v63];
  int v11 = v63;

  if (v10) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  __int128 v53 = self;
  if (v12)
  {
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:@"database"]);

    id v8 = v13;
    id v7 = v8;
  }

  uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:@"resources/moments"]);
  v68[0] = v50;
  v49 = (void *)objc_claimAutoreleasedReturnValue( [v5 stringByAppendingPathComponent:@"private/com.apple.Photos.Migration/appPrivateData.plist"]);
  v68[1] = v49;
  double v48 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:@"private/com.apple.photolibraryd"]);
  v68[2] = v48;
  v47 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:@"private/com.apple.assetsd"]);
  v68[3] = v47;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:@"private/com.apple.accountsd"]);
  v68[4] = v14;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( [v5 stringByAppendingPathComponent:@"private/com.apple.mediaanalysisd/MediaAnalysis/mediaanalysis.db"]);
  v68[5] = v15;
  int v16 = (void *)objc_claimAutoreleasedReturnValue( [v5 stringByAppendingPathComponent:@"private/com.apple.mediaanalysisd/caches/vision/VUIndex.sqlite"]);
  v68[6] = v16;
  id v17 = (void *)objc_claimAutoreleasedReturnValue( [v5 stringByAppendingPathComponent:@"private/com.apple.mediaanalysisd/caches/vision/PersonPromoter"]);
  v68[7] = v17;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingPathComponent:@"search/spotlightProgress.plist"]);
  v68[8] = v18;
  __int128 v54 = v8;
  unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingPathComponent:@"search/initialSuggestions.bplist"]);
  v68[9] = v19;
  unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v68, 10LL));
  -[NSMutableArray addObjectsFromArray:](v6, "addObjectsFromArray:", v20);

  if (!a4)
  {
    v67[0] = @"resources/cpl/cloudsync.noindex/storage/store.cloudphotodb";
    id v52 = (void *)objc_claimAutoreleasedReturnValue( [@"resources/cpl/cloudsync.noindex/" stringByAppendingPathComponent:@"mobileCPL.plist"]);
    v67[1] = v52;
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( [@"resources/cpl/cloudsync.noindex/" stringByAppendingPathComponent:@"initialsync_marker"]);
    v67[2] = v21;
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( [@"resources/cpl/cloudsync.noindex/storage/" stringByAppendingPathComponent:@"cpl-upgrade-events.log"]);
    v67[3] = v22;
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( [@"resources/cpl/cloudsync.noindex/" stringByAppendingPathComponent:@"cloudphotos-1.0.plist"]);
    v67[4] = v23;
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( [@"resources/cpl/cloudsync.noindex/" stringByAppendingPathComponent:@"syncstatus.plist"]);
    v67[5] = v24;
    id v25 = (void *)objc_claimAutoreleasedReturnValue( [@"resources/cpl/cloudsync.noindex/" stringByAppendingPathComponent:@"resetevents.plist"]);
    v67[6] = v25;
    id v26 = (void *)objc_claimAutoreleasedReturnValue( [@"resources/cpl/cloudsync.noindex/" stringByAppendingPathComponent:@"DownloadCounts.plist"]);
    v67[7] = v26;
    v67[8] = @"resources/cpl/cloudsync.noindex/State.plist";
    id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v67, 9LL));

    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    id v28 = v27;
    id v29 = [v28 countByEnumeratingWithState:&v59 objects:v66 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v60;
      do
      {
        for (i = 0LL; i != v30; i = (char *)i + 1)
        {
          if (*(void *)v60 != v31) {
            objc_enumerationMutation(v28);
          }
          id v33 = (void *)objc_claimAutoreleasedReturnValue( [v5 stringByAppendingPathComponent:*(void *)(*((void *)&v59 + 1) + 8 * (void)i)]);
          -[NSMutableArray addObject:](v6, "addObject:", v33);
        }

        id v30 = [v28 countByEnumeratingWithState:&v59 objects:v66 count:16];
      }

      while (v30);
    }

    __int128 v34 = (void *)objc_claimAutoreleasedReturnValue( [v5 stringByAppendingPathComponent:@"resources/derivatives/thumbs/thumbnailConfiguration"]);
    v65[0] = v34;
    __int128 v35 = (void *)objc_claimAutoreleasedReturnValue( [v5 stringByAppendingPathComponent:@"private/com.apple.photoanalysisd/vision"]);
    v65[1] = v35;
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue( [v5 stringByAppendingPathComponent:@"private/com.apple.photoanalysisd/GraphService/PhotoAnalysisServicePreferences.plist"]);
    v65[2] = v36;
    double v37 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:@"database/rebuildHistory"]);
    v65[3] = v37;
    BOOL v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v65, 4LL));
    -[NSMutableArray addObjectsFromArray:](v6, "addObjectsFromArray:", v38);
  }

  if (v53->_copyPlists)
  {
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    id v39 = [&off_1000373B8 countByEnumeratingWithState:&v55 objects:v64 count:16];
    if (v39)
    {
      id v40 = v39;
      uint64_t v41 = *(void *)v56;
      do
      {
        for (j = 0LL; j != v40; j = (char *)j + 1)
        {
          if (*(void *)v56 != v41) {
            objc_enumerationMutation(&off_1000373B8);
          }
          uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue( [v7 stringByAppendingPathComponent:*(void *)(*((void *)&v55 + 1) + 8 * (void)j)]);
          -[NSMutableArray addObject:](v6, "addObject:", v43);
        }

        id v40 = [&off_1000373B8 countByEnumeratingWithState:&v55 objects:v64 count:16];
      }

      while (v40);
    }
  }

  if (v53->_copyRecoverJournals)
  {
    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:@"resources/recovery"]);
    -[NSMutableArray addObject:](v6, "addObject:", v44);

    uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:@"resources/journals"]);
    -[NSMutableArray addObject:](v6, "addObject:", v45);
  }

  return v6;
}

- (id)prependPath:(id)a3 toStringsInArray:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000148C4;
  v12[3] = &unk_100031088;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v13 = v7;
  id v14 = v5;
  id v8 = v5;
  [v6 enumerateObjectsUsingBlock:v12];

  id v9 = v14;
  unsigned int v10 = v7;

  return v10;
}

- (void)collectFiles
{
  uid_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  unsigned int v4 = -[CPLDiagnoseCommand includeSyndication](self, "includeSyndication");
  id v5 = (_UNKNOWN **)&__NSArray0__struct;
  if (v4) {
    id v5 = &off_1000373D0;
  }
  id v6 = v5;
  __int128 v84 = (void *)objc_claimAutoreleasedReturnValue([&off_1000373E8 arrayByAddingObjectsFromArray:&off_100037400]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([&off_1000373E8 arrayByAddingObjectsFromArray:&off_100037418]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([@"Photos.sqlite" lastPathComponent]);
  v136[0] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([@"Photos.sqlite.aside" lastPathComponent]);
  v136[1] = v9;
  v136[2] = @"store.cloudphotodb";
  unsigned int v10 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v136, 3LL));
  databasesWithPIIData = self->_databasesWithPIIData;
  self->_databasesWithPIIData = v10;

  BOOL v12 = (NSArray *)objc_claimAutoreleasedReturnValue( -[NSArray arrayByAddingObjectsFromArray:]( self->_databasesWithPIIData,  "arrayByAddingObjectsFromArray:",  &off_100037448));
  __int128 v13 = self->_databasesWithPIIData;
  self->_databasesWithPIIData = v12;

  __int128 v83 = v7;
  if (-[CPLDiagnoseCommand includeSPL](self, "includeSPL"))
  {
    id v90 = (id)objc_claimAutoreleasedReturnValue( -[CPLDiagnoseCommand prependPath:toStringsInArray:]( self,  "prependPath:toStringsInArray:",  @"/var/mobile/Media/PhotoData",  v7));
    id v14 = (void *)objc_claimAutoreleasedReturnValue( [@"/var/mobile/Media/PhotoData/CPL/" stringByAppendingPathComponent:@"mobileCPL.plist"]);
    v135[0] = v14;
    id v15 = (void *)objc_claimAutoreleasedReturnValue( [@"/var/mobile/Media/PhotoData/CPL/" stringByAppendingPathComponent:@"initialsync_marker"]);
    v135[1] = v15;
    int v16 = (void *)objc_claimAutoreleasedReturnValue( [@"/var/mobile/Media/PhotoData/CPL/storage/" stringByAppendingPathComponent:@"cpl-upgrade-events.log"]);
    v135[2] = v16;
    id v17 = v6;
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( [@"/var/mobile/Media/PhotoData/CPL/" stringByAppendingPathComponent:@"cloudphotos-1.0.plist"]);
    v135[3] = v18;
    contexta = v3;
    unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue( [@"/var/mobile/Media/PhotoData/CPL/" stringByAppendingPathComponent:@"syncstatus.plist"]);
    v135[4] = v19;
    unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue( [@"/var/mobile/Media/PhotoData/CPL/" stringByAppendingPathComponent:@"resetevents.plist"]);
    v135[5] = v20;
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( [@"/var/mobile/Media/PhotoData/CPL/" stringByAppendingPathComponent:@"DownloadCounts.plist"]);
    v135[6] = v21;
    v135[7] = @"/var/mobile/Media/PhotoData/Thumbnails/thumbnailConfiguration";
    v135[8] = @"/var/mobile/Media/PhotoData/AlbumsMetadata";
    v135[9] = @"/var/mobile/Media/PhotoData/rebuildHistory";
    v135[10] = @"/var/mobile/Media/PhotoData/Caches/restoreContext.plist";
    v135[11] = @"/var/mobile/Media/PhotoData/Caches/datamigratorfinished";
    v135[12] = @"/var/mobile/Media/PhotoData/Caches/PLDataMigrationInfo.plist";
    v135[13] = @"/var/mobile/Media/PhotoData/Caches/GraphService/PhotoAnalysisServicePreferences.plist";
    v135[14] = @"/var/mobile/Media/PhotoData/Caches/GraphService/PhotoAnalysisMusicPreferences.plist";
    v135[15] = @"/var/mobile/Media/PhotoData/Caches/SmartSharing/camera_smart_sharing_metadata.plist";
    v135[16] = @"/var/mobile/Media/PhotoData/Caches/search/spotlightProgress.plist";
    v135[17] = @"/var/mobile/Media/PhotoData/Caches/search/initialSuggestions.bplist";
    v135[18] = @"/var/mobile/Media/PhotoData/Caches/Restore";
    v135[19] = @"/var/mobile/Media/PhotoData/private/com.apple.assetsd";
    v135[20] = @"/var/mobile/Media/PhotoData/private/com.apple.accountsd";
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v135, 21LL));

    id v6 = v17;
    id v7 = v83;

    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( [@"/var/mobile/Media/PhotoData" stringByAppendingPathComponent:@"Caches/GraphService"]);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( -[CPLDiagnoseCommand prependPath:toStringsInArray:]( self,  "prependPath:toStringsInArray:",  v23,  &off_100037430));
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v90 arrayByAddingObjectsFromArray:v24]);

    id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 arrayByAddingObject:@"/var/mobile/Media/MediaAnalysis/mediaanalysis.db"]);
    uid_t v3 = contexta;
    -[CPLDiagnoseCommand addFilesFromVisionCacheToDictionary:](self, "addFilesFromVisionCacheToDictionary:", contexta);
  }

  else
  {
    id v26 = 0LL;
    uint64_t v22 = 0LL;
  }

  libraryPath = self->_libraryPath;
  if (!libraryPath || self->_targetLibraryIsSPL || self->_targetLibraryIsSyndication)
  {
    __int128 v81 = 0LL;
  }

  else
  {
    unsigned int v75 = (void *)objc_claimAutoreleasedReturnValue( -[NSString stringByAppendingPathComponent:]( libraryPath,  "stringByAppendingPathComponent:",  @"database"));
    id v76 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDiagnoseCommand prependPath:toStringsInArray:](self, "prependPath:toStringsInArray:", v75, v84));
    contextb = v3;
    id v77 = (void *)objc_claimAutoreleasedReturnValue( -[CPLDiagnoseCommand interestingDatabasesForUBFLibraryPath:isSharingLibrary:]( self,  "interestingDatabasesForUBFLibraryPath:isSharingLibrary:",  self->_libraryPath,  0LL));
    BOOL v78 = (void *)objc_claimAutoreleasedReturnValue([v76 arrayByAddingObjectsFromArray:v77]);

    __int128 v79 = (void *)objc_claimAutoreleasedReturnValue( -[NSString stringByAppendingPathComponent:]( self->_libraryPath,  "stringByAppendingPathComponent:",  @"private/com.apple.photoanalysisd/caches/graph"));
    __int128 v80 = (void *)objc_claimAutoreleasedReturnValue( -[CPLDiagnoseCommand prependPath:toStringsInArray:]( self,  "prependPath:toStringsInArray:",  v79,  &off_100037430));
    __int128 v81 = (void *)objc_claimAutoreleasedReturnValue([v78 arrayByAddingObjectsFromArray:v80]);

    uid_t v3 = contextb;
  }

  __int128 v125 = 0u;
  __int128 v126 = 0u;
  __int128 v123 = 0u;
  __int128 v124 = 0u;
  id obj = v22;
  id v28 = [obj countByEnumeratingWithState:&v123 objects:v134 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v124;
    do
    {
      for (i = 0LL; i != v29; i = (char *)i + 1)
      {
        if (*(void *)v124 != v30) {
          objc_enumerationMutation(obj);
        }
        -[CPLDiagnoseCommand collectFileAtPath:]( self,  "collectFileAtPath:",  *(void *)(*((void *)&v123 + 1) + 8LL * (void)i));
      }

      id v29 = [obj countByEnumeratingWithState:&v123 objects:v134 count:16];
    }

    while (v29);
  }

  __int128 v121 = 0u;
  __int128 v122 = 0u;
  __int128 v119 = 0u;
  __int128 v120 = 0u;
  id v91 = v3;
  id v32 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v91,  "countByEnumeratingWithState:objects:count:",  &v119,  v133,  16LL);
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = *(void *)v120;
    do
    {
      for (j = 0LL; j != v33; j = (char *)j + 1)
      {
        if (*(void *)v120 != v34) {
          objc_enumerationMutation(v91);
        }
        uint64_t v36 = *(void *)(*((void *)&v119 + 1) + 8LL * (void)j);
        double v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v91, "objectForKeyedSubscript:", v36));
        -[CPLDiagnoseCommand collectFilePaths:toSubdirectory:](self, "collectFilePaths:toSubdirectory:", v37, v36);
      }

      id v33 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v91,  "countByEnumeratingWithState:objects:count:",  &v119,  v133,  16LL);
    }

    while (v33);
  }

  __int128 v117 = 0u;
  __int128 v118 = 0u;
  __int128 v115 = 0u;
  __int128 v116 = 0u;
  id v86 = v26;
  id v38 = [v86 countByEnumeratingWithState:&v115 objects:v132 count:16];
  if (v38)
  {
    id v39 = v38;
    uint64_t v40 = *(void *)v116;
    do
    {
      for (k = 0LL; k != v39; k = (char *)k + 1)
      {
        if (*(void *)v116 != v40) {
          objc_enumerationMutation(v86);
        }
        -[CPLDiagnoseCommand collectDatabaseAtPath:libraryPath:subdirectory:]( self,  "collectDatabaseAtPath:libraryPath:subdirectory:",  *(void *)(*((void *)&v115 + 1) + 8LL * (void)k),  0LL,  0LL);
      }

      id v39 = [v86 countByEnumeratingWithState:&v115 objects:v132 count:16];
    }

    while (v39);
  }

  if (v81)
  {
    __int128 v113 = 0u;
    __int128 v114 = 0u;
    __int128 v111 = 0u;
    __int128 v112 = 0u;
    id v42 = v81;
    id v43 = [v42 countByEnumeratingWithState:&v111 objects:v131 count:16];
    if (v43)
    {
      id v44 = v43;
      uint64_t v45 = *(void *)v112;
      do
      {
        for (m = 0LL; m != v44; m = (char *)m + 1)
        {
          if (*(void *)v112 != v45) {
            objc_enumerationMutation(v42);
          }
          -[CPLDiagnoseCommand collectDatabaseAtPath:libraryPath:subdirectory:]( self,  "collectDatabaseAtPath:libraryPath:subdirectory:",  *(void *)(*((void *)&v111 + 1) + 8LL * (void)m),  self->_libraryPath,  @"Library");
        }

        id v44 = [v42 countByEnumeratingWithState:&v111 objects:v131 count:16];
      }

      while (v44);
    }

    -[CPLDiagnoseCommand collectAdditionalInformationForDatabaseAtPath:toDirectory:]( self,  "collectAdditionalInformationForDatabaseAtPath:toDirectory:",  self->_libraryPath,  @"Library");
  }

  __int128 v109 = 0u;
  __int128 v110 = 0u;
  __int128 v107 = 0u;
  __int128 v108 = 0u;
  __int128 v85 = v6;
  id v89 = [v85 countByEnumeratingWithState:&v107 objects:v130 count:16];
  if (v89)
  {
    v47 = &CFDictionaryGetTypeID_ptr;
    uint64_t v48 = *(void *)v108;
    uint64_t v82 = *(void *)v108;
    do
    {
      for (n = 0LL; n != v89; n = (char *)n + 1)
      {
        if (*(void *)v108 != v48) {
          objc_enumerationMutation(v85);
        }
        uint64_t v50 = *(void **)(*((void *)&v107 + 1) + 8LL * (void)n);
        context = objc_autoreleasePoolPush();
        uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue([@"/var/mobile/Library" stringByAppendingPathComponent:v50]);
        id v52 = (void *)objc_claimAutoreleasedReturnValue([v47[50] defaultManager]);
        unsigned __int8 v53 = [v52 fileExistsAtPath:v51];

        if ((v53 & 1) != 0)
        {
          __int128 v54 = (void *)objc_claimAutoreleasedReturnValue([v51 lastPathComponent]);
          __int128 v55 = (void *)objc_claimAutoreleasedReturnValue([v54 stringByDeletingPathExtension]);
          __int128 v56 = (void *)objc_claimAutoreleasedReturnValue([v55 stringByAppendingString:@"Library"]);

          uint64_t v57 = objc_claimAutoreleasedReturnValue([v51 stringByAppendingPathComponent:@"database"]);
          __int128 v103 = 0u;
          __int128 v104 = 0u;
          __int128 v105 = 0u;
          __int128 v106 = 0u;
          __int128 v88 = (void *)v57;
          __int128 v58 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDiagnoseCommand prependPath:toStringsInArray:](self, "prependPath:toStringsInArray:"));
          id v59 = [v58 countByEnumeratingWithState:&v103 objects:v129 count:16];
          if (v59)
          {
            id v60 = v59;
            uint64_t v61 = *(void *)v104;
            do
            {
              for (ii = 0LL; ii != v60; ii = (char *)ii + 1)
              {
                if (*(void *)v104 != v61) {
                  objc_enumerationMutation(v58);
                }
                -[CPLDiagnoseCommand collectDatabaseAtPath:libraryPath:subdirectory:]( self,  "collectDatabaseAtPath:libraryPath:subdirectory:",  *(void *)(*((void *)&v103 + 1) + 8LL * (void)ii),  v51,  v56);
              }

              id v60 = [v58 countByEnumeratingWithState:&v103 objects:v129 count:16];
            }

            while (v60);
          }

          __int128 v101 = 0u;
          __int128 v102 = 0u;
          __int128 v99 = 0u;
          __int128 v100 = 0u;
          unsigned __int8 v63 = (void *)objc_claimAutoreleasedReturnValue( -[CPLDiagnoseCommand interestingDatabasesForUBFLibraryPath:isSharingLibrary:]( self,  "interestingDatabasesForUBFLibraryPath:isSharingLibrary:",  v51,  0LL));
          id v64 = [v63 countByEnumeratingWithState:&v99 objects:v128 count:16];
          if (v64)
          {
            id v65 = v64;
            uint64_t v66 = *(void *)v100;
            do
            {
              for (jj = 0LL; jj != v65; jj = (char *)jj + 1)
              {
                if (*(void *)v100 != v66) {
                  objc_enumerationMutation(v63);
                }
                -[CPLDiagnoseCommand collectDatabaseAtPath:libraryPath:subdirectory:]( self,  "collectDatabaseAtPath:libraryPath:subdirectory:",  *(void *)(*((void *)&v99 + 1) + 8LL * (void)jj),  v51,  v56);
              }

              id v65 = [v63 countByEnumeratingWithState:&v99 objects:v128 count:16];
            }

            while (v65);
          }

          v68 = (void *)objc_claimAutoreleasedReturnValue( [v51 stringByAppendingPathComponent:@"private/com.apple.photoanalysisd/caches/graph"]);
          __int128 v95 = 0u;
          __int128 v96 = 0u;
          __int128 v97 = 0u;
          __int128 v98 = 0u;
          uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue( -[CPLDiagnoseCommand prependPath:toStringsInArray:]( self,  "prependPath:toStringsInArray:",  v68,  &off_100037430));
          id v70 = [v69 countByEnumeratingWithState:&v95 objects:v127 count:16];
          if (v70)
          {
            id v71 = v70;
            uint64_t v72 = *(void *)v96;
            do
            {
              for (kk = 0LL; kk != v71; kk = (char *)kk + 1)
              {
                if (*(void *)v96 != v72) {
                  objc_enumerationMutation(v69);
                }
                -[CPLDiagnoseCommand collectDatabaseAtPath:libraryPath:subdirectory:]( self,  "collectDatabaseAtPath:libraryPath:subdirectory:",  *(void *)(*((void *)&v95 + 1) + 8LL * (void)kk),  v51,  v56);
              }

              id v71 = [v69 countByEnumeratingWithState:&v95 objects:v127 count:16];
            }

            while (v71);
          }

          if (([v50 isEqualToString:@"Photos/Libraries/Syndication.photoslibrary"] & 1) == 0)
          {
            v74 = (void *)objc_claimAutoreleasedReturnValue([v88 stringByAppendingPathComponent:@"rebuildHistory"]);
            -[CPLDiagnoseCommand collectFileAtPath:](self, "collectFileAtPath:", v74);
          }

          -[CPLDiagnoseCommand collectAdditionalInformationForDatabaseAtPath:toDirectory:]( self,  "collectAdditionalInformationForDatabaseAtPath:toDirectory:",  v51,  v56);

          uint64_t v48 = v82;
          id v7 = v83;
          v47 = &CFDictionaryGetTypeID_ptr;
        }

        else
        {
          -[CPLCTLCommand printFormat:](self, "printFormat:", @"- Well known library does not exist at: %@", v51);
        }

        objc_autoreleasePoolPop(context);
      }

      id v89 = [v85 countByEnumeratingWithState:&v107 objects:v130 count:16];
    }

    while (v89);
  }
}

- (void)collectAdditionalInformationForDatabaseAtPath:(id)a3 toDirectory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Getting %@ listing",  v7));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingPathComponent:@"listing.txt"]);
  -[CPLDiagnoseCommand collectFileListingAtPath:label:filename:extendedDetail:]( self,  "collectFileListingAtPath:label:filename:extendedDetail:",  v6,  v8,  v9,  1LL);

  if (self->_hasFullShellCommands && self->_isAppleInternal && !self->_skipLibraryPreprocessing)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000155A8;
    v10[3] = &unk_1000310B0;
    v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    -[CPLDiagnoseCommand runAsUser:](self, "runAsUser:", v10);
  }
}

- (void)collectLOFetchRecordings
{
  v20[0] = self->_photosctlCommand;
  v20[1] = @"lofr";
  v20[2] = @"list";
  v20[3] = @"-j";
  uid_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 4LL));
  unsigned int v4 = -[CPLDiagnoseCommand collectOutputOfCommandAndArguments:label:filename:outputIsStderr:timeout:]( self,  "collectOutputOfCommandAndArguments:label:filename:outputIsStderr:timeout:",  v3,  @"Finding fetch recordings",  @"fetch_recording_paths.json",  0LL,  1LL);

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSURL URLByAppendingPathComponent:]( self->_outputFolder,  "URLByAppendingPathComponent:",  @"fetch_recording_paths.json"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](&OBJC_CLASS___NSData, "dataWithContentsOfURL:", v5));
    if ([v6 length])
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v6,  0LL,  0LL));
      if ([v7 count])
      {
        __int128 v17 = 0u;
        __int128 v18 = 0u;
        __int128 v15 = 0u;
        __int128 v16 = 0u;
        id v14 = v7;
        id v8 = v7;
        id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v16;
          do
          {
            id v12 = 0LL;
            do
            {
              if (*(void *)v16 != v11) {
                objc_enumerationMutation(v8);
              }
              __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v15 + 1) + 8 * (void)v12) objectForKeyedSubscript:@"filePath"]);
              -[CPLCTLCommand printFormat:](self, "printFormat:", @"- ... Found recording at: %@", v13);
              if ([v13 length]) {
                -[CPLDiagnoseCommand collectFileAtPath:](self, "collectFileAtPath:", v13);
              }

              id v12 = (char *)v12 + 1;
            }

            while (v10 != v12);
            id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
          }

          while (v10);
        }

        id v7 = v14;
      }
    }

    else
    {
      -[CPLCTLCommand printFormat:](self, "printFormat:", @"- ... No data in path listing file.");
    }
  }

- (id)_photosSpotlightSearchAttributes
{
  return @"-a photosDonationTimestamp -a photosSceneAnalysisVersion -a photosFaceAnalysisVersion -a photosMediaAnalysisImageVersion -a photosMediaAnalysisVersion -a photosCharacterRecognitionAnalysisVersion -a photosPrivateEncryptedComputeAnalysisVersion -a photosLocationPrivateEncryptedComputeAnalysisVersion -a photosImageEmbeddingVersion -a photosVideoEmbeddingVersion -a kMDItemPhotosResultType -a photosEmbeddingCount";
}

- (id)_syndicationLibrarySpotlightSearchAttributes
{
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDiagnoseCommand _photosSpotlightSearchAttributes](self, "_photosSpotlightSearchAttributes"));
  uid_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingFormat:@" -a photosSavedFromAppBundleIdentifier"]);

  return v3;
}

- (void)_collectPhotosSearchDiagnostics
{
  v7[0] = self->_photosctlCommand;
  v7[1] = @"search";
  v7[2] = @"index";
  v7[3] = @"s";
  uid_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v7, 4LL));
  -[CPLDiagnoseCommand collectOutputOfCommandAndArguments:label:filename:outputIsStderr:timeout:]( self,  "collectOutputOfCommandAndArguments:label:filename:outputIsStderr:timeout:",  v3,  @"Collecting Photos Search index status",  @"search_photos_index_status.txt",  0LL,  1LL);

  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDiagnoseCommand _photosSpotlightSearchAttributes](self, "_photosSpotlightSearchAttributes"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"/usr/local/bin/search -b com.apple.mobileslideshow %@",  v4));

  -[CPLDiagnoseCommand collectOutputOfCommand:label:filename:]( self,  "collectOutputOfCommand:label:filename:",  v5,  @"Collecting Photos Search Spotlight index state",  @"search_photos_spotlight_details.txt");
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"/usr/local/bin/searchutil -s"));
  -[CPLDiagnoseCommand collectOutputOfCommand:label:filename:]( self,  "collectOutputOfCommand:label:filename:",  v6,  @"Collecting Spotlight index status",  @"search_photos_searchutil_status.txt");
  -[CPLDiagnoseCommand collectFileAtPath:]( self,  "collectFileAtPath:",  @"/var/MobileAsset/AssetsV2/com_apple_MobileAsset_SpotlightResources/com_apple_MobileAsset_SpotlightResources.xml");
  -[CPLDiagnoseCommand collectFileListingAtPath:label:filename:extendedDetail:]( self,  "collectFileListingAtPath:label:filename:extendedDetail:",  @"/var/MobileAsset/AssetsV2 /com_apple_MobileAsset_SpotlightResources/",  @"Collecting Spotlight Resources listing",  @"spotlightResourcesDirectory.txt",  1LL);
}

- (void)_collectUniversalSearchDiagnostics
{
  if (!-[CPLDiagnoseCommand includeSyndication](self, "includeSyndication"))
  {
    v9[0] = self->_photosctlCommand;
    v9[1] = @"search";
    v9[2] = @"index";
    v9[3] = @"s";
    v9[4] = @"-l";
    v9[5] = @"3";
    uid_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 6LL));
    -[CPLDiagnoseCommand collectOutputOfCommandAndArguments:label:filename:outputIsStderr:timeout:]( self,  "collectOutputOfCommandAndArguments:label:filename:outputIsStderr:timeout:",  v3,  @"Collecting Photos Search index status for Syndication Library",  @"search_syndication_index_status.txt",  0LL,  1LL);

    -[CPLDiagnoseCommand collectOutputOfCommand:label:filename:]( self,  "collectOutputOfCommand:label:filename:",  @"/usr/local/bin/searchutil -s",  @"Collecting Spotlight index status",  @"search_syndication_searchutil_status.txt");
    -[CPLDiagnoseCommand collectOutputOfCommand:label:filename:]( self,  "collectOutputOfCommand:label:filename:",  @"/usr/local/bin/search -l '_kMDItemEligibleForPhotosProcessing>0'",  @"Collecting Universal Search eligible CSSIDs",  @"search_syndication_eligible_items.txt");
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( -[CPLDiagnoseCommand _syndicationLibrarySpotlightSearchAttributes]( self,  "_syndicationLibrarySpotlightSearchAttributes"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"/usr/local/bin/search -l '_kMDItemEligibleForPhotosProcessing>0 && kMDItemPhotosDonationState>0' %@",  v4));

    -[CPLDiagnoseCommand collectOutputOfCommand:label:filename:]( self,  "collectOutputOfCommand:label:filename:",  v5,  @"Collecting Universal Search Spotlight index state",  @"search_syndication_spotlight_details.txt");
    id v6 = [(id)objc_opt_class(self) _syndicationLibraryPath];
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    id v8 = (void *)objc_claimAutoreleasedReturnValue( [@"jujubectl photos analysisSummary --oneline --photo-library " stringByAppendingString:v7]);

    -[CPLDiagnoseCommand collectOutputOfCommand:label:filename:]( self,  "collectOutputOfCommand:label:filename:",  v8,  @"Collecting Universal Search Media Analysis Summary",  @"search_syndication_mediaanalysis_summary.txt");
  }

- (void)_collectSearchEntityDonationDiagnostics
{
  v8[0] = self->_photosctlCommand;
  v8[1] = @"search-entity-donation";
  v8[2] = @"print-rankings";
  uid_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 3LL));
  -[CPLDiagnoseCommand collectOutputOfCommandAndArguments:label:filename:outputIsStderr:timeout:]( self,  "collectOutputOfCommandAndArguments:label:filename:outputIsStderr:timeout:",  v3,  @"Getting Search Entity Donation Rankings",  @"search_entity_donation_rankings.txt",  0LL,  1LL);

  v7[0] = self->_photosctlCommand;
  v7[1] = @"search-entity-donation";
  v7[2] = @"print-moment-info";
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v7, 3LL));
  -[CPLDiagnoseCommand collectOutputOfCommandAndArguments:label:filename:outputIsStderr:timeout:]( self,  "collectOutputOfCommandAndArguments:label:filename:outputIsStderr:timeout:",  v4,  @"Getting Search Entity Donation Per-Moment Info",  @"search_entity_donation_moment_info.txt",  0LL,  1LL);

  v6[0] = self->_photosctlCommand;
  v6[1] = @"search-entity-donation";
  v6[2] = @"print-person-relationships";
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v6, 3LL));
  -[CPLDiagnoseCommand collectOutputOfCommandAndArguments:label:filename:outputIsStderr:timeout:]( self,  "collectOutputOfCommandAndArguments:label:filename:outputIsStderr:timeout:",  v5,  @"Getting Search Entity Donation Person Relationships",  @"search_entity_donation_person_relationships.txt",  0LL,  1LL);
}

- (void)_collectSharedAlbumFilesAtPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSURL URLByAppendingPathComponent:]( self->_outputFolder,  "URLByAppendingPathComponent:",  @"SharedAlbums"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  [v6 createDirectoryAtURL:v5 withIntermediateDirectories:0 attributes:0 error:0];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v10 = (id)objc_claimAutoreleasedReturnValue([v7 contentsOfDirectoryAtPath:v4 error:0]);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100015F3C;
  v11[3] = &unk_1000310D8;
  id v12 = v4;
  __int128 v13 = self;
  id v14 = v5;
  id v8 = v5;
  id v9 = v4;
  [v10 enumerateObjectsUsingBlock:v11];
}

- (void)signalProcesses
{
  uid_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDiagnoseCommand processes](self, "processes"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000161CC;
  void v8[3] = &unk_100031100;
  id v7 = v3;
  id v9 = v7;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  if (-[NSMutableString length](v7, "length"))
  {
    id v5 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@ -INFO%@",  @"/usr/bin/killall",  v7);
    id v6 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Sending SIGINFO to%@",  v7);
    -[CPLDiagnoseCommand collectOutputOfCommand:label:filename:]( self,  "collectOutputOfCommand:label:filename:",  v5,  v6,  0LL);
  }
}

- (void)sampleProcesses
{
  uid_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  outputFolder = self->_outputFolder;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDiagnoseCommand processDetailPath:](self, "processDetailPath:", &stru_1000319D0));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:](outputFolder, "URLByAppendingPathComponent:", v5));
  [v3 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:0];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDiagnoseCommand processes](self, "processes"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100016348;
  v10[3] = &unk_100031100;
  v10[4] = self;
  [v7 enumerateKeysAndObjectsUsingBlock:v10];

  if (!self->_isRoot)
  {
    id v8 = [(id)objc_opt_class(self) toolName];
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[CPLCTLCommand printFormat:]( self,  "printFormat:",  @"- Can't sample root processes as %@ is not run with root permissions",  v9);
  }

- (void)collectDefaults
{
  uid_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDiagnoseCommand processes](self, "processes"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100016460;
  v4[3] = &unk_100031100;
  v4[4] = self;
  [v3 enumerateKeysAndObjectsUsingBlock:v4];

  -[CPLDiagnoseCommand collectOutputOfCommand:label:filename:]( self,  "collectOutputOfCommand:label:filename:",  @"/usr/bin/defaults read /var/mobile/Library/Preferences/com.apple.mediaanalysis.plist",  @"Getting defaults for com.apple.mediaanalysis",  @"com.apple.mediaanalysis-defaults.txt");
}

- (void)_printWrapperStatus:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 parameters]);
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 libraryIdentifier]);
  if ([v4 isOpened])
  {
LABEL_7:
    uint64_t v11 = -[NSString initWithFormat:]( [NSString alloc],  "initWithFormat:",  @" (%lu clients)",  [v4 clientCount]);
    goto LABEL_8;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 openError]);

  if (v7)
  {
    id v8 = objc_alloc(&OBJC_CLASS___NSString);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 openError]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedDescription]);
    uint64_t v11 = -[NSString initWithFormat:](v8, "initWithFormat:", @" (%@)", v10);

    if (v11) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

  if ([v4 clientCount])
  {
    uint64_t v11 = -[NSString initWithFormat:]( [NSString alloc],  "initWithFormat:",  @" (opening with %lu clients)",  [v4 clientCount]);
    if (v11) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

  uint64_t v11 = @" (opening)";
LABEL_8:
  uint64_t v34 = v4;
  uint64_t v31 = (__CFString *)v11;
  id v32 = (void *)v6;
  -[CPLCTLCommand printFormat:](self, "printFormat:", @"  * %@%@:", v6, v11);
  id v33 = v5;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 asPlist]);
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 allKeys]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 sortedArrayUsingSelector:"compare:"]);

  id v15 = [v14 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v15)
  {
    id v16 = v15;
    __int128 v17 = @"libraryIdentifier";
    uint64_t v18 = *(void *)v37;
    uint64_t v35 = *(void *)v37;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v37 != v18) {
          objc_enumerationMutation(v14);
        }
        unsigned __int8 v20 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
        if (([v20 isEqualToString:v17] & 1) == 0)
        {
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v20]);
          if ([v20 isEqualToString:@"options"])
          {
            uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSNumber);
            if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0)
            {
              uint64_t v23 = objc_claimAutoreleasedReturnValue( +[CPLLibraryManager descriptionForLibraryOptions:]( CPLLibraryManager,  "descriptionForLibraryOptions:",  [v21 integerValue]));
              goto LABEL_21;
            }
          }

          if ([v20 hasSuffix:@"Path"]
            && (uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v21, v24) & 1) != 0))
          {
            id v25 = v17;
            id v26 = v14;
            id v27 = v12;
            id v28 = self;
            id v29 = -[NSURL initFileURLWithPath:isDirectory:]( objc_alloc(&OBJC_CLASS___NSURL),  "initFileURLWithPath:isDirectory:",  v21,  1LL);
            uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDiagnoseCommand _simplifiedPathForURL:](v28, "_simplifiedPathForURL:", v29));

            self = v28;
            id v12 = v27;
            id v14 = v26;
            __int128 v17 = v25;
          }

          else
          {
            uint64_t v23 = objc_claimAutoreleasedReturnValue([v21 description]);
LABEL_21:
            uint64_t v30 = (void *)v23;
          }

          -[CPLCTLCommand printFormat:](self, "printFormat:", @"      %@: %@", v20, v30);

          uint64_t v18 = v35;
          continue;
        }
      }

      id v16 = [v14 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }

    while (v16);
  }
}

- (void)collectCloudPhotodGlobalStatus
{
  diagnosticLog = self->_diagnosticLog;
  if (diagnosticLog)
  {
    id v3 = objc_claimAutoreleasedReturnValue( -[NSURL URLByAppendingPathComponent:isDirectory:]( self->_outputFolder, "URLByAppendingPathComponent:isDirectory:", @"cloudphotod-status.log", 0LL));
    id v4 = fopen((const char *)[v3 fileSystemRepresentation], "a+");
    if (v4)
    {
      self->_diagnosticLog = v4;
      -[CPLCTLCommand setLogOutputFd:](self, "setLogOutputFd:", fileno(v4));
    }

    else
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDiagnoseCommand _simplifiedPathForURL:](self, "_simplifiedPathForURL:", v3));
      uint64_t v6 = __error();
      -[CPLCTLCommand printFormat:]( self,  "printFormat:",  @"  can't create cloudphotod status log at %@: %s",  v5,  strerror(*v6));

      diagnosticLog = 0LL;
    }
  }

  else
  {
    diagnosticLog = 0LL;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCTLCommand daemonConnection](self, "daemonConnection"));
  uint64_t v61 = 0LL;
  __int128 v62 = &v61;
  uint64_t v63 = 0x2020000000LL;
  char v64 = 1;
  v59[0] = 0LL;
  v59[1] = v59;
  v59[2] = 0x2020000000LL;
  char v60 = 0;
  v57[0] = 0LL;
  v57[1] = v57;
  v57[2] = 0x3032000000LL;
  v57[3] = sub_100016F14;
  v57[4] = sub_100016F24;
  id v58 = 0LL;
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472LL;
  v53[2] = sub_100016F2C;
  v53[3] = &unk_100030DD8;
  id v8 = (id)objc_claimAutoreleasedReturnValue([v7 queue]);
  id v54 = v8;
  __int128 v55 = v59;
  __int128 v56 = v57;
  id v9 = objc_retainBlock(v53);
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_100016F94;
  v46[3] = &unk_100031178;
  uint64_t v50 = v57;
  uint64_t v51 = v59;
  id v10 = v7;
  id v47 = v10;
  uint64_t v11 = v9;
  uint64_t v48 = self;
  id v49 = v11;
  id v52 = &v61;
  id v12 = objc_retainBlock(v46);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_100017164;
  v40[3] = &unk_1000311A0;
  id v44 = v57;
  id v13 = v8;
  id v41 = v13;
  id v14 = v11;
  id v42 = self;
  id v43 = v14;
  uint64_t v45 = &v61;
  id v15 = objc_retainBlock(v40);
  -[CPLCTLCommand printFormat:](self, "printFormat:", @"- Collecting daemon status");
  if (*((_BYTE *)v62 + 24))
  {
    uint64_t v16 = ((uint64_t (*)(void *))v12[2])(v12);
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_10001729C;
    v38[3] = &unk_1000311C8;
    v38[4] = self;
    __int128 v39 = v14;
    [v17 getDaemonStatusWithCompletionHandler:v38];

    ((void (*)(void *))v15[2])(v15);
  }

  else
  {
    -[CPLCTLCommand printFormat:](self, "printFormat:", @"  skipped");
  }

  -[CPLCTLCommand printFormat:](self, "printFormat:", @"- Collecting registered daemon engines");
  id v37 = 0LL;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[CPLDiagnoseCommand getEngineWrapperStatusesWithError:]( self,  "getEngineWrapperStatusesWithError:",  &v37));
  id v19 = v37;
  id v29 = v19;
  if (!v18)
  {
    id v20 = (id)objc_claimAutoreleasedReturnValue([v19 localizedDescription]);
    -[CPLCTLCommand printFormat:](self, "printFormat:", @"  failed: %@", v20);
LABEL_21:

    goto LABEL_23;
  }

  if ([v18 count])
  {
    -[CPLCTLCommand printFormat:](self, "printFormat:", &stru_1000319D0);
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id v20 = v18;
    id v21 = [v20 countByEnumeratingWithState:&v33 objects:v65 count:16];
    if (v21)
    {
      id v28 = v10;
      uint64_t v22 = *(void *)v34;
      do
      {
        for (i = 0LL; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v34 != v22) {
            objc_enumerationMutation(v20);
          }
          -[CPLDiagnoseCommand _printWrapperStatus:]( self,  "_printWrapperStatus:",  *(void *)(*((void *)&v33 + 1) + 8LL * (void)i));
          -[CPLCTLCommand printFormat:](self, "printFormat:", &stru_1000319D0);
        }

        id v21 = [v20 countByEnumeratingWithState:&v33 objects:v65 count:16];
      }

      while (v21);
      id v10 = v28;
    }

    goto LABEL_21;
  }

  -[CPLCTLCommand printFormat:](self, "printFormat:", @"    no registered engines");
LABEL_23:
  -[CPLCTLCommand printFormat:](self, "printFormat:", @"- Collecting connected librarymanagers");
  if (*((_BYTE *)v62 + 24))
  {
    uint64_t v24 = ((uint64_t (*)(void *))v12[2])(v12);
    id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_1000174DC;
    v31[3] = &unk_1000311F0;
    v31[4] = self;
    id v32 = v14;
    [v25 getDaemonLibraryManagerStatusesWithCompletionHandler:v31];

    ((void (*)(void *))v15[2])(v15);
  }

  if (diagnosticLog)
  {
    id v26 = self->_diagnosticLog;
    if (v26) {
      fclose(v26);
    }
    self->_diagnosticLog = diagnosticLog;
    -[CPLCTLCommand setLogOutputFd:](self, "setLogOutputFd:", fileno(diagnosticLog));
  }

  if (*((_BYTE *)v62 + 24)) {
    id v27 = @"- Collecting global status for cloudphotod: done";
  }
  else {
    id v27 = @"- Collecting global status for cloudphotod: failed";
  }
  -[CPLCTLCommand printFormat:](self, "printFormat:", v27);

  _Block_object_dispose(v57, 8);
  _Block_object_dispose(v59, 8);
  _Block_object_dispose(&v61, 8);
}

- (void)collectCloudPhotodStatusWithLibraryIdentifier:(id)a3 subdirectory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[CPLCTLCommand printFormat:](self, "printFormat:", @"- Collecting %@ status for %@", @"cloudphotod", v6);
  id v38 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCTLCommand openedLibraryManagerWithLibraryIdentifier:timeout:withTargetUserIdentifier:error:]( self,  "openedLibraryManagerWithLibraryIdentifier:timeout:withTargetUserIdentifier:error:",  v6,  1LL,  0LL,  &v38));
  id v9 = v38;
  id v10 = v9;
  if (v8)
  {
    dispatch_semaphore_t v11 = dispatch_semaphore_create(0LL);
    uint64_t v32 = 0LL;
    __int128 v33 = &v32;
    uint64_t v34 = 0x3032000000LL;
    __int128 v35 = sub_100016F14;
    __int128 v36 = sub_100016F24;
    id v37 = 0LL;
    uint64_t v26 = 0LL;
    id v27 = &v26;
    uint64_t v28 = 0x3032000000LL;
    id v29 = sub_100016F14;
    uint64_t v30 = sub_100016F24;
    id v31 = 0LL;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL lastPathComponent](self->_outputFile, "lastPathComponent"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Collecting CPL diagnostics in %@",  v12));
    [v8 addInfoToLog:v13];

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    void v22[2] = sub_100017A6C;
    v22[3] = &unk_100031218;
    uint64_t v24 = &v26;
    id v25 = &v32;
    id v14 = v11;
    uint64_t v23 = v14;
    [v8 getStatusForComponents:0 completionHandler:v22];
    dispatch_time_t v15 = dispatch_time(0LL, 40000000000LL);
    if (dispatch_semaphore_wait(v14, v15))
    {
      -[CPLCTLCommand printFormat:](self, "printFormat:", @"  took too long");
    }

    else
    {
      uint64_t v16 = (void *)v33[5];
      if (v16)
      {
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 localizedDescription]);
        -[CPLCTLCommand printFormat:](self, "printFormat:", @"  failed: %@", v17);
      }

      else
      {
        outputFolder = self->_outputFolder;
        if (v7) {
          id v19 = (NSURL *)objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:](outputFolder, "URLByAppendingPathComponent:", v7));
        }
        else {
          id v19 = outputFolder;
        }
        id v20 = v19;
        id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        [v21 createDirectoryAtURL:v20 withIntermediateDirectories:1 attributes:0 error:0];

        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSURL URLByAppendingPathComponent:isDirectory:]( v20,  "URLByAppendingPathComponent:isDirectory:",  @"cplstatus.txt",  0LL));
        [(id)v27[5] writeToURL:v17 atomically:0 encoding:4 error:0];
      }
    }

    -[CPLCTLCommand closeLibraryManager:](self, "closeLibraryManager:", v8);

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v32, 8);
  }

  else
  {
    id v14 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue([v9 localizedDescription]);
    -[CPLCTLCommand printFormat:](self, "printFormat:", @"  failed to contact %@: %@", @"cloudphotod", v14);
  }
}

- (void)collectAppLibraryIdentifiers
{
  unsigned int v2 = self;
  -[CPLCTLCommand printFormat:](self, "printFormat:", @"- Collecting Registered App Libraries");
  id v36 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCTLCommand getLibraryIdentifiersWithDomain:error:]( v2,  "getLibraryIdentifiersWithDomain:error:",  3LL,  &v36));
  id v4 = v36;
  id v5 = v4;
  if (v3)
  {
    -[CPLCTLCommand printFormat:](v2, "printFormat:", @"  found %lu libraries", [v3 count]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSURL URLByAppendingPathComponent:isDirectory:]( v2->_outputFolder,  "URLByAppendingPathComponent:isDirectory:",  @"AppLibraries.txt",  0LL));
    if ([v3 count])
    {
      uint64_t v26 = v6;
      id v27 = v2;
      uint64_t v28 = v5;
      id v7 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v3 count]);
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      id v29 = v3;
      id obj = v3;
      id v8 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v33;
        do
        {
          dispatch_semaphore_t v11 = 0LL;
          do
          {
            if (*(void *)v33 != v10) {
              objc_enumerationMutation(obj);
            }
            id v12 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)v11);
            id v13 = objc_alloc(&OBJC_CLASS___NSString);
            id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 name]);
            dispatch_time_t v15 = (void *)objc_claimAutoreleasedReturnValue([v12 uuid]);
            uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v12 containerIdentifier]);
            __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v12 path]);
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 stringByAbbreviatingWithTildeInPath]);
            id v19 = -[NSString initWithFormat:]( v13,  "initWithFormat:",  @"* %@ / %@ - %@\n    path: %@",  v14,  v15,  v16,  v18);
            -[NSMutableArray addObject:](v7, "addObject:", v19);

            dispatch_semaphore_t v11 = (char *)v11 + 1;
          }

          while (v9 != v11);
          id v9 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
        }

        while (v9);
      }

      id v20 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v7, "componentsJoinedByString:", @"\n"));
      id v5 = v28;
      id v3 = v29;
      id v6 = v26;
      unsigned int v2 = v27;
    }

    else
    {
      id v20 = @"* No App Libraries registered";
    }

    -[CPLCTLCommand printFormat:](v2, "printFormat:", @"%@", v20);
    id v21 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Registered App Libraries:\n%@\n",  v20);

    id v31 = 0LL;
    unsigned __int8 v22 = -[NSString writeToURL:atomically:encoding:error:]( v21,  "writeToURL:atomically:encoding:error:",  v6,  1LL,  4LL,  &v31);
    id v23 = v31;
    if ((v22 & 1) == 0)
    {
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v6 lastPathComponent]);
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v23 localizedDescription]);
      -[CPLCTLCommand printFormat:](v2, "printFormat:", @"  failed to write to %@: %@", v24, v25);
    }
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedDescription]);
    -[CPLCTLCommand printFormat:](v2, "printFormat:", @"  failed: %@", v6);
  }
}

- (void)collectAccountStatus
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  id v4 = objc_alloc_init(&OBJC_CLASS___ACAccountStore);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccountStore aa_primaryAppleAccount](v4, "aa_primaryAppleAccount"));

  if (!v5)
  {
    uint64_t v10 = @"Unable to read accounts\n";
    goto LABEL_13;
  }

  unsigned int v6 = [v5 isEnabledForDataclass:kAccountDataclassCloudPhotos];
  unsigned int v7 = [v5 isEnabledForDataclass:kAccountDataclassMediaStream];
  unsigned int v8 = [v5 isEnabledForDataclass:kAccountDataclassSharedStreams];
  unsigned int v9 = [v5 isEnabledForDataclass:@"com.apple.Dataclass.ImagePlayground"];
  if ((v6 & 1) == 0 && (v7 & 1) == 0 && !v8)
  {
    uint64_t v10 = @"No accounts enabled\n";
    goto LABEL_13;
  }

  -[NSMutableString appendString:](v3, "appendString:", @"Enabled accounts: ");
  if (v6)
  {
    -[NSMutableString appendString:](v3, "appendString:", @"CPL ");
    if (!v7)
    {
LABEL_9:
      if (!v8) {
        goto LABEL_10;
      }
LABEL_18:
      -[NSMutableString appendString:](v3, "appendString:", @"SharedAlbum ");
      if (!v9) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }

  else if (!v7)
  {
    goto LABEL_9;
  }

  -[NSMutableString appendString:](v3, "appendString:", @"MPS ");
  if (v8) {
    goto LABEL_18;
  }
LABEL_10:
  if (v9) {
LABEL_11:
  }
    -[NSMutableString appendString:](v3, "appendString:", @"ImagePlayground ");
LABEL_12:
  uint64_t v10 = @"\n";
LABEL_13:
  -[NSMutableString appendString:](v3, "appendString:", v10);
  dispatch_semaphore_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSURL URLByAppendingPathComponent:isDirectory:]( self->_outputFolder,  "URLByAppendingPathComponent:isDirectory:",  @"account_status.txt",  0LL));
  id v15 = 0LL;
  unsigned __int8 v12 = -[NSMutableString writeToURL:atomically:encoding:error:]( v3,  "writeToURL:atomically:encoding:error:",  v11,  0LL,  4LL,  &v15);
  id v13 = v15;
  id v14 = v13;
  if ((v12 & 1) == 0) {
    -[CPLCTLCommand printFormat:]( self,  "printFormat:",  @"- Failed to write account_status.txt: %@, error: %@",  v11,  v13);
  }
}

- (void)collectDuetInfo
{
  if (self->_hasFullShellCommands && self->_isAppleInternal)
  {
    -[CPLDiagnoseCommand collectOutputOfCommand:label:filename:]( self,  "collectOutputOfCommand:label:filename:",  @"/usr/local/bin/cdattrhist2 -name com.apple.coreduet.attribute.screenLock -t i -q",  @"Getting screen lock/unlock events",  @"screenlocks.txt");
    -[CPLDiagnoseCommand collectOutputOfCommand:label:filename:]( self,  "collectOutputOfCommand:label:filename:",  @"/usr/local/bin/cdattrhist2 -name com.apple.coreduet.attribute.sleepWake -t i -q",  @"Getting sleep/wake events",  @"sleepwake.txt");
  }

- (void)collectLocalLibraryMetadataInfo
{
  if (self->_isAppleInternal)
  {
    if (!self->_skipLibraryPreprocessing)
    {
      v16[0] = self->_photosctlCommand;
      v16[1] = @"allmomentsmetadata";
      v16[2] = @"all_moments_details.plist";
      id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 3LL));
      -[CPLDiagnoseCommand collectOutputOfCommandAndArguments:label:filename:outputIsStderr:timeout:]( self,  "collectOutputOfCommandAndArguments:label:filename:outputIsStderr:timeout:",  v3,  @"Dumping all moments metadata",  0LL,  0LL,  1LL);

      v15[0] = self->_photosctlCommand;
      v15[1] = @"printchangestore";
      id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));
      -[CPLDiagnoseCommand collectOutputOfCommandAndArguments:label:filename:outputIsStderr:timeout:]( self,  "collectOutputOfCommandAndArguments:label:filename:outputIsStderr:timeout:",  v4,  @"Getting the changestore",  @"changestore.txt",  1LL,  1LL);

      v14[0] = self->_photosctlCommand;
      v14[1] = @"listnonsharedphotouuids";
      id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 2LL));
      -[CPLDiagnoseCommand collectOutputOfCommandAndArguments:label:filename:outputIsStderr:timeout:]( self,  "collectOutputOfCommandAndArguments:label:filename:outputIsStderr:timeout:",  v5,  @"Getting local photo GUIDs",  @"local_photo_guids.txt",  0LL,  1LL);

      v13[0] = self->_photosctlCommand;
      v13[1] = @"hascompletedrestore";
      unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 2LL));
      -[CPLDiagnoseCommand collectOutputOfCommandAndArguments:label:filename:outputIsStderr:timeout:]( self,  "collectOutputOfCommandAndArguments:label:filename:outputIsStderr:timeout:",  v6,  @"Getting assetsd restoring state",  0LL,  0LL,  1LL);

      v12[0] = self->_photosctlCommand;
      v12[1] = @"incompleterestoreprocesses";
      unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
      -[CPLDiagnoseCommand collectOutputOfCommandAndArguments:label:filename:outputIsStderr:timeout:]( self,  "collectOutputOfCommandAndArguments:label:filename:outputIsStderr:timeout:",  v7,  @"Getting assetsd incomplete restore processes",  0LL,  0LL,  1LL);

      v11[0] = self->_photosctlCommand;
      v11[1] = @"listincomplete";
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
      -[CPLDiagnoseCommand collectOutputOfCommandAndArguments:label:filename:outputIsStderr:timeout:]( self,  "collectOutputOfCommandAndArguments:label:filename:outputIsStderr:timeout:",  v8,  @"Getting assetsd incomplete list",  @"incompletelist.txt",  0LL,  1LL);
    }

    v10[0] = self->_photosctlCommand;
    v10[1] = @"cpl";
    v10[2] = @"status";
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 3LL));
    -[CPLDiagnoseCommand collectOutputOfCommandAndArguments:label:filename:outputIsStderr:timeout:]( self,  "collectOutputOfCommandAndArguments:label:filename:outputIsStderr:timeout:",  v9,  @"Getting cpl state",  @"cplstate.txt",  0LL,  1LL);
  }

- (void)collectTaskInfo
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDiagnoseCommand processes](self, "processes"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000183F4;
  v4[3] = &unk_100031100;
  v4[4] = self;
  [v3 enumerateKeysAndObjectsUsingBlock:v4];
}

- (void)collectPreferences
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSURL URLByAppendingPathComponent:]( self->_outputFolder,  "URLByAppendingPathComponent:",  @"Preferences"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  [v4 createDirectoryAtURL:v3 withIntermediateDirectories:0 attributes:0 error:0];

  -[CPLDiagnoseCommand writePreferenceInDomain:withKey:toDirectory:currentUser:]( self,  "writePreferenceInDomain:withKey:toDirectory:currentUser:",  0LL,  @"AppleLanguages",  v3,  1LL);
  -[CPLDiagnoseCommand writePreferenceInDomain:withKey:toDirectory:currentUser:]( self,  "writePreferenceInDomain:withKey:toDirectory:currentUser:",  0LL,  @"AppleLocale",  v3,  1LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDiagnoseCommand processes](self, "processes"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000185F4;
  void v7[3] = &unk_100031240;
  void v7[4] = self;
  id v8 = v3;
  id v6 = v3;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

- (void)collectSysdiagnose:(id)a3
{
  id v4 = (dispatch_group_s *)a3;
  if (!self->_skipSysdiagnose)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    [v5 setObject:&__kCFBooleanFalse forKeyedSubscript:@"coSysdiagnose"];
    [v5 setObject:&__kCFBooleanFalse forKeyedSubscript:@"shouldDisplayTarBall"];
    [v5 setObject:&__kCFBooleanFalse forKeyedSubscript:@"shouldCreateTarBall"];
    -[CPLCTLCommand printFormat:](self, "printFormat:", @"- Collecting sysdiagnose (background)");
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    uint64_t v7 = v6;
    if (self->_fullSysdiagnoseLogArchive)
    {
      [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:@"capOverrideFullLogarchive"];
      -[CPLCTLCommand printFormat:](self, "printFormat:", @"  collect full system log archive");
    }

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    unsigned int v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000187DC;
    block[3] = &unk_100031268;
    uint64_t v14 = v7;
    id v12 = v5;
    id v13 = self;
    id v10 = v5;
    dispatch_group_async(v4, v9, block);
  }
}

- (void)collectSilentMover
{
  id v15 = (id)objc_claimAutoreleasedReturnValue( [@"/var/mobile/Media/PhotoData/private/com.apple.assetsd" stringByAppendingPathComponent:@"cplprivateengines.plist"]);
  +[CPLPrivateEngineAlias setOverridePrivateEngineAliasPath:]( &OBJC_CLASS___CPLPrivateEngineAlias,  "setOverridePrivateEngineAliasPath:");
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[CPLPrivateEngineAlias privateEngineAliasWithName:]( &OBJC_CLASS___CPLPrivateEngineAlias,  "privateEngineAliasWithName:",  @"silent-mover"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[CPLPrivateEngineAlias privateEngineAliasWithName:]( &OBJC_CLASS___CPLPrivateEngineAlias,  "privateEngineAliasWithName:",  @"per-device-silent-mover"));
  if (v3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 cplDirectoryURL]);
    if ([v5 checkResourceIsReachableAndReturnError:0])
    {
      -[CPLDiagnoseCommand collectFileAtURL:suffix:destinationDirectory:]( self,  "collectFileAtURL:suffix:destinationDirectory:",  v5,  0LL,  self->_outputFolder);
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  @"/AppleInternal/Library/Photos/Backend/CPL/silent-mover.py",  0LL));
      outputFolder = self->_outputFolder;
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 lastPathComponent]);
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:](outputFolder, "URLByAppendingPathComponent:", v8));
      -[CPLDiagnoseCommand collectFileAtURL:suffix:destinationDirectory:]( self,  "collectFileAtURL:suffix:destinationDirectory:",  v6,  0LL,  v9);
    }
  }

  if (v4)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 cplDirectoryURL]);
    if ([v10 checkResourceIsReachableAndReturnError:0])
    {
      -[CPLDiagnoseCommand collectFileAtURL:suffix:destinationDirectory:]( self,  "collectFileAtURL:suffix:destinationDirectory:",  v10,  0LL,  self->_outputFolder);
      dispatch_semaphore_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  @"/AppleInternal/Library/Photos/Backend/CPL/silent-mover.py",  0LL));
      id v12 = self->_outputFolder;
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 lastPathComponent]);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:](v12, "URLByAppendingPathComponent:", v13));
      -[CPLDiagnoseCommand collectFileAtURL:suffix:destinationDirectory:]( self,  "collectFileAtURL:suffix:destinationDirectory:",  v11,  0LL,  v14);
    }
  }

  -[CPLDiagnoseCommand revertToRootMode:](self, "revertToRootMode:", 1LL);
}

+ (id)_syndicationLibraryPath
{
  return @"/var/mobile/Library/Photos/Libraries/Syndication.photoslibrary";
}

- (void)determineLibraryPaths
{
  if (sub_100002AD8((uint64_t)self, self->_libraryPath, @"/var/mobile/Media"))
  {
    -[CPLCTLCommand printFormat:](self, "printFormat:", @"  specified library path is the System Library");
    self->_targetLibraryIsSPL = 1;
  }

  libraryPath = self->_libraryPath;
  id v4 = [(id)objc_opt_class(self) _syndicationLibraryPath];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  LODWORD(libraryPath) = sub_100002AD8((uint64_t)self, libraryPath, v5);

  if ((_DWORD)libraryPath)
  {
    -[CPLCTLCommand printFormat:](self, "printFormat:", @"  specified library path is the Syndication library");
    self->_targetLibraryIsSyndication = 1;
  }

- (void)startDiagnostic
{
  id v3 = dispatch_group_create();
  -[CPLCTLCommand printFormat:](self, "printFormat:", @"Diagnostics for %s", self->host);
  uint64_t v4 = __CPLEnvironmentDictionary(-[CPLCTLCommand printFormat:](self, "printFormat:", @"============================"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 sortedArrayUsingSelector:"compare:"]);

  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)i);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v12]);
        -[CPLCTLCommand printFormat:](self, "printFormat:", @"  %@:\t%@", v12, v13);
      }

      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v9);
  }

  -[CPLDiagnoseCommand printDiskCapacity:](self, "printDiskCapacity:", @"start");
  -[CPLDiagnoseCommand collectPreferences](self, "collectPreferences");
  -[CPLDiagnoseCommand collectSysdiagnose:](self, "collectSysdiagnose:", v3);
  if (self->_hasFullShellCommands)
  {
    -[CPLDiagnoseCommand sampleProcesses](self, "sampleProcesses");
    if (self->_isRoot) {
      -[CPLDiagnoseCommand collectTaskInfo](self, "collectTaskInfo");
    }
    -[CPLDiagnoseCommand signalProcesses](self, "signalProcesses");
    if (self->_isAppleInternal)
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_100019060;
      void v16[3] = &unk_100030B88;
      v16[4] = self;
      -[CPLDiagnoseCommand runAsUser:](self, "runAsUser:", v16);
    }
  }

  -[CPLDiagnoseCommand determineLibraryPaths](self, "determineLibraryPaths");
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  void v15[2] = sub_100019080;
  v15[3] = &unk_100030B88;
  v15[4] = self;
  -[CPLDiagnoseCommand runAsUser:](self, "runAsUser:", v15);
  -[CPLDiagnoseCommand collectFiles](self, "collectFiles");
  -[CPLDiagnoseCommand collectDuetInfo](self, "collectDuetInfo");
  -[CPLDiagnoseCommand collectDiagnosticLogs](self, "collectDiagnosticLogs");
  if (self->_hasFullShellCommands)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    void v14[2] = sub_1000191D4;
    v14[3] = &unk_100030B88;
    v14[4] = self;
    -[CPLDiagnoseCommand runAsUser:](self, "runAsUser:", v14);
  }

  if (-[CPLDiagnoseCommand includeSPL](self, "includeSPL"))
  {
    -[CPLDiagnoseCommand collectFileListingAtPath:label:filename:extendedDetail:]( self,  "collectFileListingAtPath:label:filename:extendedDetail:",  @"/var/mobile/Media/DCIM",  @"Getting DCIM contents",  @"DCIM_contents.txt",  0LL);
    -[CPLDiagnoseCommand collectFileListingAtPath:label:filename:extendedDetail:]( self,  "collectFileListingAtPath:label:filename:extendedDetail:",  @"/var/mobile/Media/PhotoData",  @"Getting PhotoData contents",  @"PhotoData_contents.txt",  0LL);
    -[CPLDiagnoseCommand collectFileListingAtPath:label:filename:extendedDetail:]( self,  "collectFileListingAtPath:label:filename:extendedDetail:",  @"/var/mobile/Media/Photos",  @"Getting Photos contents",  @"Photos_contents.txt",  0LL);
    -[CPLDiagnoseCommand collectFileListingAtPath:label:filename:extendedDetail:]( self,  "collectFileListingAtPath:label:filename:extendedDetail:",  @"/var/mobile/Media/PhotoStreamsData",  @"Getting PhotoStreamsData contents",  @"PhotoStreamsData_contents.txt",  0LL);
    -[CPLDiagnoseCommand collectFileListingAtPath:label:filename:extendedDetail:]( self,  "collectFileListingAtPath:label:filename:extendedDetail:",  @"/var/mobile/Media/Deferred",  @"Getting Deferred contents",  @"Deferred_contents.txt",  0LL);
  }

  -[CPLDiagnoseCommand collectFileListingAtPath:label:filename:extendedDetail:]( self,  "collectFileListingAtPath:label:filename:extendedDetail:",  @"/var/MobileAsset/AssetsV2/com_apple_MobileAsset_LinguisticData",  @"Getting Asset Linguistic Data contents",  @"MobileAssetLinguisticData_contents.txt",  0LL);
  if (!self->_skipSysdiagnose) {
    -[CPLCTLCommand printFormat:](self, "printFormat:", @"- Wait for sysdiagnose");
  }
  dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  if (!self->_skipSysdiagnose && self->_sysdiagnoseFailed) {
    -[CPLCTLCommand printError:](self, "printError:", @"- sysdiagnose failed: see earlier error");
  }
}

- (void)collectFilePaths:(id)a3 toSubdirectory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSURL URLByAppendingPathComponent:isDirectory:]( self->_outputFolder,  "URLByAppendingPathComponent:isDirectory:",  v7,  1LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
  id v25 = 0LL;
  unsigned __int8 v11 = [v9 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:&v25];
  id v12 = v25;

  if ((v11 & 1) != 0)
  {
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v13 = v6;
    id v14 = [v13 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v14)
    {
      id v15 = v14;
      id v20 = v6;
      uint64_t v16 = *(void *)v22;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v13);
          }
          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  *(void *)(*((void *)&v21 + 1) + 8LL * (void)i)));
          -[CPLDiagnoseCommand collectFileAtURL:suffix:destinationDirectory:]( self,  "collectFileAtURL:suffix:destinationDirectory:",  v18,  0LL,  v8);
        }

        id v15 = [v13 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }

      while (v15);
      id v6 = v20;
    }
  }

  else
  {
    -[CPLCTLCommand printError:](self, "printError:", @"Failed to create subdirectory %@: %@", v7, v12);
    incompleteTasks = self->incompleteTasks;
    id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed collecting %@.",  v6));
    -[NSMutableArray addObject:](incompleteTasks, "addObject:", v13);
  }
}

- (id)interestingFilesInDirectoryPath:(id)a3 withPredicate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v14 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 contentsOfDirectoryAtPath:v6 error:&v14]);
  id v10 = v14;

  if (v9)
  {
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v9 filteredArrayUsingPredicate:v7]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDiagnoseCommand prependPath:toStringsInArray:](self, "prependPath:toStringsInArray:", v6, v11));
  }

  else
  {
    -[CPLCTLCommand printError:](self, "printError:", @"Failed to get contents of %@: %@", v6, v10);
    id v12 = &__NSArray0__struct;
  }

  return v12;
}

- (void)addFilesFromVisionCacheToDictionary:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SELF IN %@",  &off_100037460));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SELF like %@",  @"*.cmap"));
  v10[0] = v5;
  v10[1] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 2LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate orPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "orPredicateWithSubpredicates:",  v7));

  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[CPLDiagnoseCommand interestingFilesInDirectoryPath:withPredicate:]( self,  "interestingFilesInDirectoryPath:withPredicate:",  @"/var/mobile/Media/PhotoData/Caches/VisionService",  v8));
  [v4 setObject:v9 forKeyedSubscript:@"VisionService"];
}

+ (id)supportedFeatureAreas
{
  id v3 = @"universalsearch";
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v3,  1LL));
}

- (void)collectFeatureAreaDiagnostics
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v3 = self->_featureAreas;
  id v4 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend( *(id *)(*((void *)&v8 + 1) + 8 * (void)v7),  "isEqualToString:",  @"universalsearch",  (void)v8)) {
          -[CPLDiagnoseCommand _collectUniversalSearchFeatureAreaDiagnostics]( self,  "_collectUniversalSearchFeatureAreaDiagnostics");
        }
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
    }

    while (v5);
  }
}

- (void)_collectUniversalSearchFeatureAreaDiagnostics
{
  v4[0] = self->_photosctlCommand;
  v4[1] = @"search";
  v4[2] = @"universalsearchstatus";
  v4[3] = @"details";
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v4, 4LL));
  -[CPLDiagnoseCommand collectOutputOfCommandAndArguments:label:filename:outputIsStderr:timeout:]( self,  "collectOutputOfCommandAndArguments:label:filename:outputIsStderr:timeout:",  v3,  @"Getting Universal Search status details",  @"universalSearchStatus.txt",  0LL,  1LL);
}

- (void).cxx_destruct
{
}

@end