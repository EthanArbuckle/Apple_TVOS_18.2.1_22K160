@interface DMDFetchSecurityInformationOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDFetchSecurityInformationOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFFetchSecurityInformationRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5880;
}

- (void)runWithRequest:(id)a3
{
  id v17 = (id)objc_claimAutoreleasedReturnValue(+[MCDeviceCapabilities currentDevice](&OBJC_CLASS___MCDeviceCapabilities, "currentDevice", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  id v4 = objc_alloc(&OBJC_CLASS___DMFSecurityInformation);
  id v5 = [v17 supportsBlockLevelEncryption];
  id v6 = [v17 supportsFileLevelEncryption];
  id v7 = [v3 isPasscodeSet];
  id v8 = [v3 currentPasscodeIsCompliantWithGlobalRestrictionsOutError:0];
  id v9 = [v3 currentPasscodeIsCompliantWithProfileRestrictionsOutError:0];
  uint64_t v10 = MCFeaturePasscodeLockGraceTime;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v3 effectiveValueForSetting:MCFeaturePasscodeLockGraceTime]);
  id v12 = [v11 unsignedIntegerValue];
  v13 = (void *)objc_claimAutoreleasedReturnValue([v3 userValueForSetting:v10]);
  id v14 = objc_msgSend( v4,  "initWithSupportsBlockLevelEncryption:supportsFileLevelEncryption:passcodeIsSet:passcodeIsCompliantWithGlobalRe strictions:passcodeIsCompliantWithProfileRestrictions:passcodeLockGracePeriodEnforced:passcodeLockGracePeriod:",  v5,  v6,  v7,  v8,  v9,  v12,  objc_msgSend(v13, "unsignedIntegerValue"));

  id v15 = [[DMFFetchSecurityInformationResultObject alloc] initWithSecurityInformation:v14];
  -[DMDFetchSecurityInformationOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v15);
}

@end