@interface SUCoreErrorAttributes
+ (id)descriptionForIndication:(int64_t)a3;
+ (id)nameForIndication:(int64_t)a3;
- (NSDictionary)keyMatchTrueMap;
- (NSString)codeName;
- (NSString)domain;
- (NSString)keyMatchTrue;
- (id)description;
- (id)initForDomain:(id)a3 withCode:(int64_t)a4 ofCodeName:(id)a5 indicating:(int64_t)a6 ifKeyTrue:(id)a7 keyMatchTrueMap:(id)a8;
- (int64_t)code;
- (int64_t)indications;
- (void)setIndications:(int64_t)a3;
- (void)setKeyMatchTrue:(id)a3;
- (void)setKeyMatchTrueMap:(id)a3;
@end

@implementation SUCoreErrorAttributes

- (id)initForDomain:(id)a3 withCode:(int64_t)a4 ofCodeName:(id)a5 indicating:(int64_t)a6 ifKeyTrue:(id)a7 keyMatchTrueMap:(id)a8
{
  id v21 = a3;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___SUCoreErrorAttributes;
  v18 = -[SUCoreErrorAttributes init](&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_domain, a3);
    v19->_code = a4;
    objc_storeStrong((id *)&v19->_codeName, a5);
    v19->_indications = a6;
    objc_storeStrong((id *)&v19->_keyMatchTrue, a7);
    objc_storeStrong((id *)&v19->_keyMatchTrueMap, a8);
  }

  return v19;
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  v4 = -[SUCoreErrorAttributes domain](self, "domain");
  int64_t v5 = -[SUCoreErrorAttributes code](self, "code");
  v6 = -[SUCoreErrorAttributes codeName](self, "codeName");
  int64_t v7 = -[SUCoreErrorAttributes indications](self, "indications");
  v8 = -[SUCoreErrorAttributes keyMatchTrue](self, "keyMatchTrue");
  if (v8)
  {
    -[SUCoreErrorAttributes keyMatchTrue](self, "keyMatchTrue");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v9 = @"NONE";
  }
  v10 = -[SUCoreErrorAttributes keyMatchTrueMap](self, "keyMatchTrueMap");
  v11 = @"DEFINED";
  if (!v10) {
    v11 = @"NONE";
  }
  v12 = (void *)[v3 initWithFormat:@"domain(%@),code(%d),codeName(%@),indications(0x%08llX),keyMatchTrue(%@),keyMatchTrueMap(%@)", v4, v5, v6, v7, v9, v11];

  if (v8) {
  return v12;
  }
}

+ (id)nameForIndication:(int64_t)a3
{
  if (a3 > 15)
  {
    if (a3 <= 63)
    {
      if (a3 == 16) {
        return @"TATSUDeclinedAuthorization";
      }
      if (a3 == 32) {
        return @"PallasNoPMVMatchFound";
      }
    }

    else
    {
      switch(a3)
      {
        case 64LL:
          return @"PallasNoBuildVersionMatchFound";
        case 128LL:
          return @"DownloadTimedOut";
        case 255LL:
          return @"All";
      }
    }

    return @"Unknown Error Indication";
  }

  else
  {
    id result = @"None";
    switch(a3)
    {
      case 0LL:
        return result;
      case 1LL:
        id result = @"NetworkRequired";
        break;
      case 2LL:
        id result = @"FullReplacementRequired";
        break;
      case 4LL:
        id result = @"FilesystemSpaceRequired";
        break;
      case 8LL:
        id result = @"AlternateInstallerRecommended";
        break;
      default:
        return @"Unknown Error Indication";
    }
  }

  return result;
}

+ (id)descriptionForIndication:(int64_t)a3
{
  if (a3 > 15)
  {
    if (a3 <= 63)
    {
      if (a3 == 16) {
        return @"TATSU declined to authorize this user for this install.";
      }
      if (a3 == 32) {
        return @"Pallas returned no match found for requested PMV (HTTP 422).";
      }
    }

    else
    {
      switch(a3)
      {
        case 64LL:
          return @"Pallas returned no match found for requested Build Version.";
        case 128LL:
          return @"Download has timedout.";
        case 255LL:
          return @"All possible error indications.";
      }
    }

    return @"Unknown Error Indication";
  }

  else
  {
    id result = @"No indications associated with error attributes";
    switch(a3)
    {
      case 0LL:
        return result;
      case 1LL:
        id result = @"Network access is required.";
        break;
      case 2LL:
        id result = @"Full replacement is required [as opposed to incremental patch].";
        break;
      case 4LL:
        id result = @"Additional filesystem space is required.";
        break;
      case 8LL:
        id result = @"Current device configuration requires an alternate installer to perform the update.";
        break;
      default:
        return @"Unknown Error Indication";
    }
  }

  return result;
}

- (NSString)domain
{
  return self->_domain;
}

- (int64_t)code
{
  return self->_code;
}

- (NSString)codeName
{
  return self->_codeName;
}

- (int64_t)indications
{
  return self->_indications;
}

- (void)setIndications:(int64_t)a3
{
  self->_indications = a3;
}

- (NSString)keyMatchTrue
{
  return self->_keyMatchTrue;
}

- (void)setKeyMatchTrue:(id)a3
{
}

- (NSDictionary)keyMatchTrueMap
{
  return self->_keyMatchTrueMap;
}

- (void)setKeyMatchTrueMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end