@interface PETMetadata
+ (id)getCountryCode;
- (void)setMetadataWithConfigVersion:(unint64_t)a3;
@end

@implementation PETMetadata

- (void)setMetadataWithConfigVersion:(unint64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v5 timeIntervalSince1970];
  -[PETMetadata setUploadTime:](self, "setUploadTime:", (unint64_t)v6);

  -[PETMetadata setPlatform:](self, "setPlatform:", @"tvOS");
  if (uname(&v18)) {
    v7 = 0LL;
  }
  else {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v18.machine));
  }
  -[PETMetadata setDevice:](self, "setDevice:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_PASDeviceState currentOsBuild](&OBJC_CLASS____PASDeviceState, "currentOsBuild"));
  -[PETMetadata setBuild:](self, "setBuild:", v8);

  -[PETMetadata setIsInternal:]( self,  "setIsInternal:",  +[_PASDeviceInfo isInternalBuild](&OBJC_CLASS____PASDeviceInfo, "isInternalBuild"));
  -[PETMetadata setIsSeed:](self, "setIsSeed:", 0LL);
  unsigned __int8 v9 = -[PETMetadata isInternal](self, "isInternal");
  uint64_t v10 = 0LL;
  if ((v9 & 1) == 0) {
    uint64_t v10 = -[PETMetadata isSeed](self, "isSeed", 0LL) ^ 1;
  }
  -[PETMetadata setIsGm:](self, "setIsGm:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[PETMetadata getCountryCode](&OBJC_CLASS___PETMetadata, "getCountryCode"));
  -[PETMetadata setCountry:](self, "setCountry:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](&OBJC_CLASS___NSLocale, "preferredLanguages"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 firstObject]);

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale componentsFromLocaleIdentifier:]( &OBJC_CLASS___NSLocale,  "componentsFromLocaleIdentifier:",  v13));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:kCFLocaleLanguageCode]);
    -[PETMetadata setLanguage:](self, "setLanguage:", v15);
  }

  -[PETMetadata setConfigVersion:](self, "setConfigVersion:", a3);
  -[PETMetadata setIsInternalCarry:](self, "setIsInternalCarry:", 0LL);
  if (-[PETMetadata isInternal](self, "isInternal"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 UUIDString]);
    -[PETMetadata setUploadIdentifier:](self, "setUploadIdentifier:", v17);
  }
}

+ (id)getCountryCode
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 countryCode]);

  return v3;
}

@end