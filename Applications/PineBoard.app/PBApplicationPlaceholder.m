@interface PBApplicationPlaceholder
+ (id)_infoDictionaryKeys;
- (BOOL)isCloudDemoted;
- (NSNumber)genreID;
- (NSNumber)installFailureReason;
- (NSString)applicationType;
- (NSString)iconFile;
- (NSString)primaryIconName;
- (void)_reloadFromProxy:(id)a3;
@end

@implementation PBApplicationPlaceholder

- (void)_reloadFromProxy:(id)a3
{
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___PBApplicationPlaceholder;
  id v4 = a3;
  -[PBApplicationPlaceholder _reloadFromProxy:](&v24, "_reloadFromProxy:", v4);
  v5 = (void *)objc_opt_class(self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_infoDictionaryKeys", v24.receiver, v24.super_class));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectsForInfoDictionaryKeys:v6]);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringForKey:@"CFBundleIconFile"]);
  v9 = (NSString *)[v8 copy];
  iconFile = self->_iconFile;
  self->_iconFile = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue([v4 iconsDictionary]);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bs_safeStringForKey:", @"CFBundlePrimaryIcon"));
  v13 = (NSString *)[v12 copy];
  primaryIconName = self->_primaryIconName;
  self->_primaryIconName = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue([v4 installFailureReason]);
  v16 = (NSNumber *)[v15 copy];
  installFailureReason = self->_installFailureReason;
  self->_installFailureReason = v16;

  v18 = (void *)objc_claimAutoreleasedReturnValue([v4 applicationType]);
  v19 = (NSString *)[v18 copy];
  applicationType = self->_applicationType;
  self->_applicationType = v19;

  self->_cloudDemoted = FBSInstallTypeIsCloudDemoted([v4 installType]);
  v21 = (void *)objc_claimAutoreleasedReturnValue([v4 genreID]);

  v22 = (NSNumber *)[v21 copy];
  genreID = self->_genreID;
  self->_genreID = v22;
}

+ (id)_infoDictionaryKeys
{
  if (qword_1004702B0 != -1) {
    dispatch_once(&qword_1004702B0, &stru_1003D3290);
  }
  return (id)qword_1004702A8;
}

- (NSString)iconFile
{
  return self->_iconFile;
}

- (NSString)primaryIconName
{
  return self->_primaryIconName;
}

- (NSNumber)installFailureReason
{
  return self->_installFailureReason;
}

- (NSString)applicationType
{
  return self->_applicationType;
}

- (BOOL)isCloudDemoted
{
  return self->_cloudDemoted;
}

- (NSNumber)genreID
{
  return self->_genreID;
}

- (void).cxx_destruct
{
}

@end