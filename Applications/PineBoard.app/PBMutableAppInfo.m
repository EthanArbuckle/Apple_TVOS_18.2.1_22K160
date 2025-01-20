@interface PBMutableAppInfo
+ (int64_t)_mapApplicationGenreID:(id)a3;
+ (int64_t)_mapApplicationType:(unint64_t)a3;
+ (int64_t)_mapApplicationTypeString:(id)a3;
+ (int64_t)_mapInstallFailureReason:(id)a3;
+ (int64_t)_mapInstallType:(unint64_t)a3;
+ (int64_t)_mapProgressState:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPBAppInfo;
- (NSString)description;
- (PBApplicationInfo)applicationInfo;
- (PBApplicationPlaceholder)applicationPlaceholder;
- (PBMutableAppInfo)initWithAppInfo:(id)a3;
- (PBMutableAppInfo)initWithApplicationInfo:(id)a3;
- (PBMutableAppInfo)initWithApplicationPlaceholder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setApplicationInfo:(id)a3;
- (void)setApplicationPlaceholder:(id)a3;
@end

@implementation PBMutableAppInfo

- (PBMutableAppInfo)initWithApplicationInfo:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___PBMutableAppInfo;
  v5 = -[PBMutableAppInfo init](&v21, "init");
  v6 = v5;
  if (v5)
  {
    -[PBMutableAppInfo setApplicationInfo:](v5, "setApplicationInfo:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
    -[PBMutableAppInfo setBundleIdentifier:](v6, "setBundleIdentifier:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleURL]);
    -[PBMutableAppInfo setBundleURL:](v6, "setBundleURL:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedName]);
    -[PBMutableAppInfo setLocalizedName:](v6, "setLocalizedName:", v9);

    [v4 lastModifiedDate];
    -[PBMutableAppInfo setLastModifiedDate:](v6, "setLastModifiedDate:");
    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 alternateIconName]);
    -[PBMutableAppInfo setAlternateIconName:](v6, "setAlternateIconName:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 iconFile]);
    -[PBMutableAppInfo setIconFile:](v6, "setIconFile:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue([v4 primaryIconName]);
    -[PBMutableAppInfo setPrimaryIconName:](v6, "setPrimaryIconName:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue([v4 liveIconName]);
    -[PBMutableAppInfo setLiveIconName:](v6, "setLiveIconName:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue([v4 tags]);
    -[PBMutableAppInfo setTags:](v6, "setTags:", v14);

    -[PBMutableAppInfo setApplicationType:]( v6,  "setApplicationType:",  objc_msgSend((id)objc_opt_class(v6), "_mapApplicationType:", objc_msgSend(v4, "type")));
    -[PBMutableAppInfo setPlaceholder:](v6, "setPlaceholder:", 0LL);
    -[PBMutableAppInfo setBetaApp:](v6, "setBetaApp:", [v4 isBeta]);
    -[PBMutableAppInfo setXcodeApp:](v6, "setXcodeApp:", [v4 isXcodeApp]);
    -[PBMutableAppInfo setUsingCloudKit:](v6, "setUsingCloudKit:", [v4 isUsingCloudKit]);
    -[PBMutableAppInfo setSupportsSharePlay:](v6, "setSupportsSharePlay:", [v4 supportsSharePlay]);
    -[PBMutableAppInfo setCloudDemoted:](v6, "setCloudDemoted:", [v4 isCloudDemoted]);
    -[PBMutableAppInfo setRatingRank:](v6, "setRatingRank:", [v4 ratingRank]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v4 itemID]);
    -[PBMutableAppInfo setItemID:](v6, "setItemID:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue([v4 purchaserDSID]);
    -[PBMutableAppInfo setPurchaserDSID:](v6, "setPurchaserDSID:", v16);

    v17 = (void *)objc_opt_class(v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v4 genreID]);
    -[PBMutableAppInfo setGenre:](v6, "setGenre:", [v17 _mapApplicationGenreID:v18]);

    -[PBMutableAppInfo setInstallState:](v6, "setInstallState:", 0LL);
    -[PBMutableAppInfo setInstallPercentage:](v6, "setInstallPercentage:", 0.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v4 topShelfStaticImageName]);
    -[PBMutableAppInfo setTopShelfStaticImageName:](v6, "setTopShelfStaticImageName:", v19);
  }

  return v6;
}

- (PBMutableAppInfo)initWithApplicationPlaceholder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___PBMutableAppInfo;
  v5 = -[PBMutableAppInfo init](&v20, "init");
  v6 = v5;
  if (v5)
  {
    -[PBMutableAppInfo setPlaceholder:](v5, "setPlaceholder:", v4 != 0LL);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
    -[PBMutableAppInfo setBundleIdentifier:](v6, "setBundleIdentifier:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleURL]);
    -[PBMutableAppInfo setBundleURL:](v6, "setBundleURL:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 displayName]);
    -[PBMutableAppInfo setLocalizedName:](v6, "setLocalizedName:", v9);

    -[PBMutableAppInfo setPlaceholder:](v6, "setPlaceholder:", 1LL);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 iconFile]);
    -[PBMutableAppInfo setIconFile:](v6, "setIconFile:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 primaryIconName]);
    -[PBMutableAppInfo setPrimaryIconName:](v6, "setPrimaryIconName:", v11);

    -[PBMutableAppInfo setInstallType:]( v6,  "setInstallType:",  objc_msgSend((id)objc_opt_class(v6), "_mapInstallType:", objc_msgSend(v4, "installType")));
    v12 = (void *)objc_opt_class(v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v4 installFailureReason]);
    -[PBMutableAppInfo setInstallFailureReason:]( v6,  "setInstallFailureReason:",  [v12 _mapInstallFailureReason:v13]);

    v14 = (void *)objc_opt_class(v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v4 applicationType]);
    -[PBMutableAppInfo setApplicationType:]( v6,  "setApplicationType:",  [v14 _mapApplicationTypeString:v15]);

    -[PBMutableAppInfo setCloudDemoted:](v6, "setCloudDemoted:", [v4 isCloudDemoted]);
    v16 = (void *)objc_opt_class(v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v4 genreID]);
    -[PBMutableAppInfo setGenre:](v6, "setGenre:", [v16 _mapApplicationGenreID:v17]);

    v18 = (void *)objc_claimAutoreleasedReturnValue([v4 progress]);
    -[PBMutableAppInfo setInstallState:]( v6,  "setInstallState:",  objc_msgSend((id)objc_opt_class(v6), "_mapProgressState:", objc_msgSend(v18, "state")));
    [v18 percentComplete];
    -[PBMutableAppInfo setInstallPercentage:](v6, "setInstallPercentage:");
  }

  return v6;
}

- (PBMutableAppInfo)initWithAppInfo:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PBMutableAppInfo;
  v5 = -[PBMutableAppInfo initWithAppInfo:](&v11, "initWithAppInfo:", v4);
  if (v5 && [v4 isPBAppInfo])
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 applicationInfo]);
    applicationInfo = v5->_applicationInfo;
    v5->_applicationInfo = (PBApplicationInfo *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 applicationPlaceholder]);
    applicationPlaceholder = v5->_applicationPlaceholder;
    v5->_applicationPlaceholder = (PBApplicationPlaceholder *)v8;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___PBAppInfo);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0) {
    goto LABEL_5;
  }
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___PBMutableAppInfo;
  if (!-[PBMutableAppInfo isEqual:](&v17, "isEqual:", v4)) {
    goto LABEL_5;
  }
  applicationInfo = self->_applicationInfo;
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 applicationInfo]);
  if (applicationInfo == (PBApplicationInfo *)v7)
  {
  }

  else
  {
    uint64_t v8 = (void *)v7;
    v9 = self->_applicationInfo;
    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 applicationInfo]);
    LODWORD(v9) = -[PBApplicationInfo isEqual:](v9, "isEqual:", v10);

    if (!(_DWORD)v9)
    {
LABEL_5:
      unsigned __int8 v11 = 0;
      goto LABEL_6;
    }
  }

  applicationPlaceholder = self->_applicationPlaceholder;
  v14 = (PBApplicationPlaceholder *)objc_claimAutoreleasedReturnValue([v4 applicationPlaceholder]);
  if (applicationPlaceholder == v14)
  {
    unsigned __int8 v11 = 1;
  }

  else
  {
    v15 = self->_applicationPlaceholder;
    v16 = (void *)objc_claimAutoreleasedReturnValue([v4 applicationPlaceholder]);
    unsigned __int8 v11 = -[PBApplicationPlaceholder isEqual:](v15, "isEqual:", v16);
  }

LABEL_6:
  return v11;
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = [v3 appendSuper];
  id v5 = [v3 appendObject:self->_applicationInfo withName:@"applicationInfo" skipIfNil:1];
  id v6 =  [v3 appendObject:self->_applicationPlaceholder withName:@"applicationPlaceholder" skipIfNil:1];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return (NSString *)v7;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder"));
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PBMutableAppInfo;
  id v4 = objc_msgSend(v3, "appendUnsignedInteger:", -[PBMutableAppInfo hash](&v11, "hash"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBMutableAppInfo applicationInfo](self, "applicationInfo"));
  id v6 = [v3 appendObject:v5];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBMutableAppInfo applicationPlaceholder](self, "applicationPlaceholder"));
  id v8 = [v3 appendObject:v7];

  id v9 = [v3 hash];
  return (unint64_t)v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PBAppInfo initWithAppInfo:]( +[PBAppInfo allocWithZone:](&OBJC_CLASS___PBAppInfo, "allocWithZone:", a3),  "initWithAppInfo:",  self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[PBMutableAppInfo initWithAppInfo:]( +[PBMutableAppInfo allocWithZone:](&OBJC_CLASS___PBMutableAppInfo, "allocWithZone:", a3),  "initWithAppInfo:",  self);
}

- (BOOL)isPBAppInfo
{
  return 1;
}

+ (int64_t)_mapApplicationType:(unint64_t)a3
{
  if (a3 >= 3) {
    return -1LL;
  }
  else {
    return a3;
  }
}

+ (int64_t)_mapApplicationGenreID:(id)a3
{
  v3 = (char *)[a3 unsignedIntegerValue];
  else {
    return qword_1002EC658[(void)(v3 - 6000)];
  }
}

+ (int64_t)_mapProgressState:(int64_t)a3
{
  else {
    return a3;
  }
}

+ (int64_t)_mapInstallType:(unint64_t)a3
{
  return a3 == 10;
}

+ (int64_t)_mapInstallFailureReason:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3) {
    goto LABEL_6;
  }
  id v5 = [v3 integerValue];
  if (v5 == (id)11)
  {
    int64_t v6 = 3LL;
    goto LABEL_9;
  }

  if (v5 == (id)10)
  {
    int64_t v6 = 1LL;
    goto LABEL_9;
  }

  if (v5 == (id)1) {
    int64_t v6 = 2LL;
  }
  else {
LABEL_6:
  }
    int64_t v6 = 0LL;
LABEL_9:

  return v6;
}

+ (int64_t)_mapApplicationTypeString:(id)a3
{
  id v3 = a3;
  if (([v3 isEqual:LSSystemApplicationType] & 1) != 0
    || ([v3 isEqual:LSHiddenAppType] & 1) != 0)
  {
    int64_t v4 = 1LL;
  }

  else if ([v3 isEqual:LSInternalApplicationType])
  {
    int64_t v4 = 0LL;
  }

  else
  {
    int64_t v4 = 2LL;
  }

  return v4;
}

- (PBApplicationInfo)applicationInfo
{
  return self->_applicationInfo;
}

- (void)setApplicationInfo:(id)a3
{
}

- (PBApplicationPlaceholder)applicationPlaceholder
{
  return self->_applicationPlaceholder;
}

- (void)setApplicationPlaceholder:(id)a3
{
}

- (void).cxx_destruct
{
}

@end