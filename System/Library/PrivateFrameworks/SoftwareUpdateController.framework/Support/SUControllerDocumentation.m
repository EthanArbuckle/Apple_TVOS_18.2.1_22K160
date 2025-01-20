@interface SUControllerDocumentation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)licenseAgreement;
- (NSData)releaseNotes;
- (NSData)releaseNotesSummary;
- (NSData)serverAssetMeasurement;
- (NSString)currentLanguage;
- (NSString)humanReadableUpdateName;
- (NSString)serverAssetAlgorithm;
- (NSURL)localBundleURL;
- (NSURL)serverAssetURL;
- (SUControllerDocumentation)initWithCoder:(id)a3;
- (SUControllerDocumentation)initWithDocumentationBundleURL:(id)a3 serverAssetURL:(id)a4 serverAssetMeasurement:(id)a5 serverAssetAlgorithm:(id)a6 serverAssetChunkSize:(int64_t)a7;
- (id)_resourceFromBundle:(__CFBundle *)a3 forKey:(id)a4;
- (id)description;
- (int64_t)serverAssetChunkSize;
- (void)_loadBundleResources;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrentLanguage:(id)a3;
- (void)setHumanReadableUpdateName:(id)a3;
- (void)setLicenseAgreement:(id)a3;
- (void)setLocalBundleURL:(id)a3;
- (void)setReleaseNotes:(id)a3;
- (void)setReleaseNotesSummary:(id)a3;
- (void)setServerAssetAlgorithm:(id)a3;
- (void)setServerAssetChunkSize:(int64_t)a3;
- (void)setServerAssetMeasurement:(id)a3;
- (void)setServerAssetURL:(id)a3;
@end

@implementation SUControllerDocumentation

- (SUControllerDocumentation)initWithDocumentationBundleURL:(id)a3 serverAssetURL:(id)a4 serverAssetMeasurement:(id)a5 serverAssetAlgorithm:(id)a6 serverAssetChunkSize:(int64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___SUControllerDocumentation;
  v17 = -[SUControllerDocumentation init](&v20, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_localBundleURL, a3);
    objc_storeStrong((id *)&v18->_serverAssetURL, a4);
    objc_storeStrong((id *)&v18->_serverAssetMeasurement, a5);
    objc_storeStrong((id *)&v18->_serverAssetAlgorithm, a6);
    v18->_serverAssetChunkSize = a7;
  }

  return v18;
}

- (SUControllerDocumentation)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___SUControllerDocumentation;
  v5 = -[SUControllerDocumentation init](&v28, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSURL) forKey:@"localBundleURL"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    localBundleURL = v5->_localBundleURL;
    v5->_localBundleURL = (NSURL *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSURL) forKey:@"serverAssetURL"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    serverAssetURL = v5->_serverAssetURL;
    v5->_serverAssetURL = (NSURL *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"serverAssetMeasurement"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    serverAssetMeasurement = v5->_serverAssetMeasurement;
    v5->_serverAssetMeasurement = (NSData *)v13;

    id v15 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"serverAssetAlgorithm"];
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    serverAssetAlgorithm = v5->_serverAssetAlgorithm;
    v5->_serverAssetAlgorithm = (NSString *)v16;

    v5->_serverAssetChunkSize = (int64_t)[v4 decodeInt64ForKey:@"serverAssetChunkSize"];
    id v18 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"releaseNotesSummary"];
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
    releaseNotesSummary = v5->_releaseNotesSummary;
    v5->_releaseNotesSummary = (NSData *)v19;

    id v21 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"releaseNotes"];
    uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);
    releaseNotes = v5->_releaseNotes;
    v5->_releaseNotes = (NSData *)v22;

    id v24 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"licenseAgreement"];
    uint64_t v25 = objc_claimAutoreleasedReturnValue(v24);
    licenseAgreement = v5->_licenseAgreement;
    v5->_licenseAgreement = (NSData *)v25;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDocumentation localBundleURL](self, "localBundleURL"));
  [v4 encodeObject:v5 forKey:@"localBundleURL"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDocumentation serverAssetURL](self, "serverAssetURL"));
  [v4 encodeObject:v6 forKey:@"serverAssetURL"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDocumentation serverAssetMeasurement](self, "serverAssetMeasurement"));
  [v4 encodeObject:v7 forKey:@"serverAssetMeasurement"];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDocumentation serverAssetAlgorithm](self, "serverAssetAlgorithm"));
  [v4 encodeObject:v8 forKey:@"serverAssetAlgorithm"];

  objc_msgSend( v4,  "encodeInt64:forKey:",  -[SUControllerDocumentation serverAssetChunkSize](self, "serverAssetChunkSize"),  @"serverAssetChunkSize");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDocumentation releaseNotesSummary](self, "releaseNotesSummary"));
  [v4 encodeObject:v9 forKey:@"releaseNotesSummary"];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDocumentation releaseNotes](self, "releaseNotes"));
  [v4 encodeObject:v10 forKey:@"releaseNotes"];

  id v11 = (id)objc_claimAutoreleasedReturnValue(-[SUControllerDocumentation licenseAgreement](self, "licenseAgreement"));
  [v4 encodeObject:v11 forKey:@"licenseAgreement"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)humanReadableUpdateName
{
  return self->_humanReadableUpdateName;
}

- (NSData)releaseNotesSummary
{
  return self->_releaseNotesSummary;
}

- (NSData)releaseNotes
{
  return self->_releaseNotes;
}

- (NSData)licenseAgreement
{
  return self->_licenseAgreement;
}

- (id)_resourceFromBundle:(__CFBundle *)a3 forKey:(id)a4
{
  CFURLRef v4 = CFBundleCopyResourceURL(a3, (CFStringRef)a4, @"html", 0LL);
  if (v4) {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](&OBJC_CLASS___NSData, "dataWithContentsOfURL:", v4));
  }
  else {
    v5 = 0LL;
  }

  return v5;
}

- (void)_loadBundleResources
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDocumentation localBundleURL](self, "localBundleURL"));

  if (v3)
  {
    CFURLRef v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](&OBJC_CLASS___NSLocale, "preferredLanguages"));
    v5 = v4;
    if (v4 && [v4 count]) {
      id v6 = (const __CFString *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:0]);
    }
    else {
      id v6 = @"en";
    }
    id v15 = (__CFString *)v6;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDocumentation currentLanguage](self, "currentLanguage"));
    unsigned __int8 v8 = -[__CFString isEqualToString:](v15, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
    {
      -[SUControllerDocumentation setCurrentLanguage:](self, "setCurrentLanguage:", v15);
      -[SUControllerDocumentation setHumanReadableUpdateName:](self, "setHumanReadableUpdateName:", 0LL);
      -[SUControllerDocumentation setReleaseNotesSummary:](self, "setReleaseNotesSummary:", 0LL);
      -[SUControllerDocumentation setReleaseNotes:](self, "setReleaseNotes:", 0LL);
      -[SUControllerDocumentation setLicenseAgreement:](self, "setLicenseAgreement:", 0LL);
      id v9 = (const __CFURL *)objc_claimAutoreleasedReturnValue(-[SUControllerDocumentation localBundleURL](self, "localBundleURL"));
      uint64_t v10 = CFBundleCreate(kCFAllocatorDefault, v9);

      if (v10)
      {
        id v11 = (__CFString *)CFBundleCopyLocalizedString( v10,  @"HumanReadableUpdateName",  0LL,  @"documentation");
        id v12 = (void *)objc_claimAutoreleasedReturnValue( -[SUControllerDocumentation _resourceFromBundle:forKey:]( self,  "_resourceFromBundle:forKey:",  v10,  @"ReadMeSummary"));
        -[SUControllerDocumentation setReleaseNotesSummary:](self, "setReleaseNotesSummary:", v12);

        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[SUControllerDocumentation _resourceFromBundle:forKey:]( self,  "_resourceFromBundle:forKey:",  v10,  @"ReadMe"));
        -[SUControllerDocumentation setReleaseNotes:](self, "setReleaseNotes:", v13);

        id v14 = (void *)objc_claimAutoreleasedReturnValue( -[SUControllerDocumentation _resourceFromBundle:forKey:]( self,  "_resourceFromBundle:forKey:",  v10,  @"License"));
        -[SUControllerDocumentation setLicenseAgreement:](self, "setLicenseAgreement:", v14);

        CFRelease(v10);
      }
    }
  }

- (BOOL)isEqual:(id)a3
{
  CFURLRef v4 = (SUControllerDocumentation *)a3;
  if (v4 == self)
  {
    unsigned __int8 v8 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___SUControllerDocumentation);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDocumentation localBundleURL](v4, "localBundleURL"));
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDocumentation localBundleURL](self, "localBundleURL"));
      unsigned __int8 v8 = [v6 isEqual:v7];
    }

    else
    {
      unsigned __int8 v8 = 0;
    }
  }

  return v8;
}

- (id)description
{
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDocumentation localBundleURL](self, "localBundleURL"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDocumentation serverAssetURL](self, "serverAssetURL"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDocumentation serverAssetMeasurement](self, "serverAssetMeasurement"));
  v3 = @"absent";
  if (v19) {
    CFURLRef v4 = @"present";
  }
  else {
    CFURLRef v4 = @"absent";
  }
  uint64_t v16 = v4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDocumentation serverAssetAlgorithm](self, "serverAssetAlgorithm"));
  int64_t v6 = -[SUControllerDocumentation serverAssetChunkSize](self, "serverAssetChunkSize");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDocumentation releaseNotesSummary](self, "releaseNotesSummary"));
  if (v7) {
    unsigned __int8 v8 = @"present";
  }
  else {
    unsigned __int8 v8 = @"absent";
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDocumentation releaseNotes](self, "releaseNotes"));
  if (v9) {
    uint64_t v10 = @"present";
  }
  else {
    uint64_t v10 = @"absent";
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDocumentation licenseAgreement](self, "licenseAgreement"));
  if (v11) {
    v3 = @"present";
  }
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDocumentation humanReadableUpdateName](self, "humanReadableUpdateName"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerDocumentation currentLanguage](self, "currentLanguage"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\nLocalBundleURL: %@\nServerAssetURL: %@\nServerAssetMeasurement: %@\nServerAssetAlgorithm: %@\nServerAssetChunkSize: %lld\nReleaseNotesSummary: %@\nReleaseNotes: %@\nLicenseAgreement: %@\nHumanReadableUpdateName: %@\ncurrentLanguage: %@\n",  v18,  v17,  v16,  v5,  v6,  v8,  v10,  v3,  v12,  v13));

  return v14;
}

- (void)setReleaseNotesSummary:(id)a3
{
}

- (void)setReleaseNotes:(id)a3
{
}

- (void)setLicenseAgreement:(id)a3
{
}

- (void)setHumanReadableUpdateName:(id)a3
{
}

- (NSURL)localBundleURL
{
  return self->_localBundleURL;
}

- (void)setLocalBundleURL:(id)a3
{
}

- (NSURL)serverAssetURL
{
  return self->_serverAssetURL;
}

- (void)setServerAssetURL:(id)a3
{
}

- (NSData)serverAssetMeasurement
{
  return self->_serverAssetMeasurement;
}

- (void)setServerAssetMeasurement:(id)a3
{
}

- (NSString)serverAssetAlgorithm
{
  return self->_serverAssetAlgorithm;
}

- (void)setServerAssetAlgorithm:(id)a3
{
}

- (int64_t)serverAssetChunkSize
{
  return self->_serverAssetChunkSize;
}

- (void)setServerAssetChunkSize:(int64_t)a3
{
  self->_serverAssetChunkSize = a3;
}

- (NSString)currentLanguage
{
  return self->_currentLanguage;
}

- (void)setCurrentLanguage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end