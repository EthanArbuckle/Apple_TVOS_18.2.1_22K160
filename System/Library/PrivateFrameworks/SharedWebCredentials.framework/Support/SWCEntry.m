@interface SWCEntry
+ (BOOL)_shouldIncludeServiceWithDomain:(id)a3 fromBundleRecord:(id)a4 applicationIdentifier:(id)a5 developerModeEnabled:(BOOL)a6 enterpriseContext:(id)a7;
+ (BOOL)supportsSecureCoding;
+ (id)_associatedDomainsFromEntitlementForBundleRecord:(id)a3 applicationIdentifier:(id)a4 developerModeEnabled:(BOOL)a5 enterpriseContext:(id)a6;
+ (id)_deduplicateServicesByMode:(id)a3;
+ (id)_entriesFromBuiltInJSONForBundleRecord:(id)a3 applicationIdentifier:(id)a4;
+ (id)additionalServiceDetailsDirectoryURLForApplicationIdentifier:(id)a3 createParentIfNeeded:(BOOL)a4 error:(id *)a5;
+ (id)entriesForBundleRecord:(id)a3 enterpriseContext:(id)a4 developerModeEnabled:(BOOL)a5;
+ (id)entriesForJSONObject:(id)a3 domain:(id)a4;
+ (id)new;
+ (void)_addEntriesToOrderedSet:(id)a3 forService:(id)a4 fromAppsArray:(id)a5 domain:(id)a6;
+ (void)_addEntriesToOrderedSet:(id)a3 forUniversalLinksFromDetailsArray:(id)a4 domain:(id)a5 substitutionVariables:(id)a6 defaults:(id)a7 maximum:(unint64_t)a8;
+ (void)_addEntriesToOrderedSet:(id)a3 forUniversalLinksFromDetailsDictionary:(id)a4 domain:(id)a5 substitutionVariables:(id)a6 defaults:(id)a7 maximum:(unint64_t)a8;
+ (void)_addEntryToOrderedSet:(id)a3 forUniversalLinksFromSingleDetailsDictionary:(id)a4 domain:(id)a5 substitutionVariables:(id)a6 defaults:(id)a7;
+ (void)_enumerateJSONFilesForBundleRecord:(id)a3 applicationIdentifier:(id)a4 block:(id)a5;
+ (void)canonicalizeEntries:(id)a3;
+ (void)enumerateJSONResourceURLsForBundleURL:(id)a3 block:(id)a4;
+ (void)enumerateJSONResourceURLsForDirectoryAtURL:(id)a3 block:(id)a4;
- (BOOL)isDownloadable;
- (BOOL)isEqual:(id)a3;
- (BOOL)needsFirstDownload;
- (NSData)applicationPersistentIdentifier;
- (NSDate)lastCheckedDate;
- (NSDate)nextCheckDate;
- (NSError)lastError;
- (NSNumber)retryCount;
- (NSString)applicationVersion;
- (NSString)serviceType;
- (SWCEntry)init;
- (SWCEntry)initWithApplicationIdentifier:(id)a3 service:(id)a4 domain:(id)a5;
- (SWCEntry)initWithCoder:(id)a3;
- (SWCEntry)initWithServiceSpecifier:(id)a3;
- (SWCFields)fields;
- (_SWCApplicationIdentifier)applicationIdentifier;
- (_SWCDomain)domain;
- (_SWCPatternList)patterns;
- (_SWCServiceSpecifier)serviceSpecifier;
- (_SWCSubstitutionVariableList)substitutionVariables;
- (id)debugDescription;
- (id)description;
- (id)redactedDescription;
- (unint64_t)evaluateWithURLComponents:(id)a3 auditToken:(id *)a4 matchingPattern:(id *)a5;
- (unint64_t)hash;
- (void)canonicalizeObjectAtAddress:(id *)a3 objectCache:(id)a4;
- (void)canonicalizeWithObjectCache:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)logToFile:(__sFILE *)a3 verbosity:(unsigned __int8)a4;
- (void)setApplicationPersistentIdentifier:(id)a3;
- (void)setApplicationVersion:(id)a3;
- (void)setLastCheckedDate:(id)a3;
- (void)setLastError:(id)a3;
- (void)setPatterns:(id)a3;
- (void)setRetryCount:(id)a3;
- (void)setSubstitutionVariables:(id)a3;
@end

@implementation SWCEntry

+ (id)new
{
}

- (SWCEntry)init
{
}

- (SWCEntry)initWithApplicationIdentifier:(id)a3 service:(id)a4 domain:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___SWCEntry;
  v11 = -[SWCEntry init](&v22, "init");
  if (v11)
  {
    uint64_t v12 = _SWCServiceTypeCanonicalize(v9);
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    serviceType = v11->_serviceType;
    v11->_serviceType = (NSString *)v13;

    v15 = (_SWCDomain *)[v10 copy];
    domain = v11->_domain;
    v11->_domain = v15;

    v17 = (_SWCApplicationIdentifier *)[v8 copy];
    applicationIdentifier = v11->_applicationIdentifier;
    v11->_applicationIdentifier = v17;

    uint64_t v19 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
    lastCheckedDate = v11->_lastCheckedDate;
    v11->_lastCheckedDate = (NSDate *)v19;
  }

  return v11;
}

- (SWCEntry)initWithServiceSpecifier:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 isFullySpecified])
  {
    v6 = (SWCEntry *)objc_claimAutoreleasedReturnValue([v5 SWCApplicationIdentifier]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 serviceType]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 SWCDomain]);
    id v9 = -[SWCEntry initWithApplicationIdentifier:service:domain:]( self,  "initWithApplicationIdentifier:service:domain:",  v6,  v7,  v8);

    self = v6;
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

- (void)logToFile:(__sFILE *)a3 verbosity:(unsigned __int8)a4
{
  int v4 = a4;
  v7 = objc_autoreleasePoolPush();
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry serviceType](self, "serviceType"));
  _SWCLogValueForKey(a3, @"Service", v8, 0xFFFFFFFFLL, 0xFFFFFFFFLL);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry applicationIdentifier](self, "applicationIdentifier"));
  _SWCLogValueForKey(a3, @"App ID", v9, 0xFFFFFFFFLL, 0xFFFFFFFFLL);

  if (v4)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry applicationVersion](self, "applicationVersion"));
    _SWCLogValueForKey(a3, @"App Version", v10, 0xFFFFFFFFLL, 0xFFFFFFFFLL);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry applicationPersistentIdentifier](self, "applicationPersistentIdentifier"));
    uint64_t DebugDescription = _LSPersistentIdentifierGetDebugDescription();
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(DebugDescription);
    _SWCLogValueForKey(a3, @"App PI", v13, 0xFFFFFFFFLL, 0xFFFFFFFFLL);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry domain](self, "domain"));
  _SWCLogValueForKey(a3, @"Domain", v14, 0xFFFFFFFFLL, 0xFFFFFFFFLL);

  if (v4)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry patterns](self, "patterns"));

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry patterns](self, "patterns"));
      _SWCLogValueForKey(a3, @"Patterns", v16, 0xFFFFFFFFLL, 0xFFFFFFFFLL);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry substitutionVariables](self, "substitutionVariables"));

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry substitutionVariables](self, "substitutionVariables"));
      _SWCLogValueForKey(a3, @"Variables", v18, 0xFFFFFFFFLL, 0xFFFFFFFFLL);
    }
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry domain](self, "domain"));
  unsigned int v20 = [v19 modeOfOperation];

  if (v20 == 1)
  {
    v21 = @"developer";
  }

  else
  {
    if (v20 != 2)
    {
      objc_super v22 = 0LL;
      goto LABEL_14;
    }

    v21 = @"managed";
  }

  objc_super v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v21));
LABEL_14:
  v23 = self;
  v24 = -[SWCEntry fields](v23, "fields");
  _SWCFieldsLogDebugDescription(*(_WORD *)v24 | ((unint64_t)v24->relativeOrder << 16), a3, v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry lastCheckedDate](v23, "lastCheckedDate"));
  v26 = v25;
  if (v25)
  {
    [v25 timeIntervalSince1970];
    if (fabs(v27) < 1.0e10) {
      _SWCLogValueForKey(a3, @"Last Checked", v26, 0xFFFFFFFFLL, 0xFFFFFFFFLL);
    }
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry nextCheckDate](v23, "nextCheckDate"));
  v29 = v28;
  if (v28)
  {
    [v28 timeIntervalSince1970];
    if (fabs(v30) < 1.0e10) {
      _SWCLogValueForKey(a3, @"Next Check", v29, 0xFFFFFFFFLL, 0xFFFFFFFFLL);
    }
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry lastError](v23, "lastError"));
  if (v31)
  {
    if (v4)
    {
      _SWCLogValueForKey(a3, @"Error", v31, 0LL, 220LL);
    }

    else
    {
      v32 = objc_alloc(&OBJC_CLASS___NSString);
      v33 = (void *)objc_claimAutoreleasedReturnValue([v31 domain]);
      v34 = -[NSString initWithFormat:](v32, "initWithFormat:", @"%@ %lli", v33, [v31 code]);
      _SWCLogValueForKey(a3, @"Error", v34, 0LL, 220LL);
    }
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry retryCount](v23, "retryCount"));
  if (v35) {
    _SWCLogValueForKey(a3, @"Retries", v35, 0LL, 220LL);
  }

  objc_autoreleasePoolPop(v7);
}

- (_SWCServiceSpecifier)serviceSpecifier
{
  v3 = objc_alloc(&OBJC_CLASS____SWCServiceSpecifier);
  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry serviceType](self, "serviceType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry applicationIdentifier](self, "applicationIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry domain](self, "domain"));
  id v7 = -[_SWCServiceSpecifier _initWithServiceType:applicationIdentifier:domain:]( v3,  "_initWithServiceType:applicationIdentifier:domain:",  v4,  v5,  v6);

  return (_SWCServiceSpecifier *)v7;
}

+ (void)canonicalizeEntries:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 count] >= 2)
  {
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___SWCEntry);
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    id v5 = v3;
    v6 = 0LL;
    id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v12;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
          if ((objc_opt_isKindOfClass(v10, v4) & 1) != 0)
          {
            if (!v6) {
              v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
            }
            objc_msgSend(v10, "canonicalizeWithObjectCache:", v6, (void)v11);
          }
        }

        id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }

      while (v7);
    }
  }
}

- (void)canonicalizeObjectAtAddress:(id *)a3 objectCache:(id)a4
{
  id v6 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 member:*a3]);
  if (v5)
  {
    objc_storeStrong(a3, v5);
  }

  else if (*a3)
  {
    objc_msgSend(v6, "addObject:");
  }
}

- (void)canonicalizeWithObjectCache:(id)a3
{
  id v4 = a3;
  -[SWCEntry canonicalizeObjectAtAddress:objectCache:]( self,  "canonicalizeObjectAtAddress:objectCache:",  &self->_applicationIdentifier);
  -[SWCEntry canonicalizeObjectAtAddress:objectCache:]( self,  "canonicalizeObjectAtAddress:objectCache:",  &self->_domain,  v4);
  -[SWCEntry canonicalizeObjectAtAddress:objectCache:]( self,  "canonicalizeObjectAtAddress:objectCache:",  &self->_patterns,  v4);
  -[SWCEntry canonicalizeObjectAtAddress:objectCache:]( self,  "canonicalizeObjectAtAddress:objectCache:",  &self->_substitutionVariables,  v4);
}

- (unint64_t)evaluateWithURLComponents:(id)a3 auditToken:(id *)a4 matchingPattern:(id *)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry patterns](self, "patterns"));
  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry substitutionVariables](self, "substitutionVariables"));
    unint64_t v11 = (unint64_t)[v9 evaluateWithURLComponents:v8 substitutionVariables:v10 auditToken:a4 matchingPattern:a5 index:0];
  }

  else
  {
    unint64_t v11 = 200LL;
  }

  return v11;
}

- (SWCFields)fields
{
  return &self->_fields;
}

- (BOOL)isDownloadable
{
  return (*(_WORD *)&self->_fields & 0x700) == 0;
}

- (BOOL)needsFirstDownload
{
  if ((*(_WORD *)&self->_fields & 0xC) != 0) {
    return 0;
  }
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry retryCount](self, "retryCount"));
  BOOL v2 = v3 == 0LL;

  return v2;
}

- (NSDate)nextCheckDate
{
  id v3 = objc_autoreleasePoolPush();
  id v4 = self;
  int v5 = *(_WORD *)-[SWCEntry fields](v4, "fields") & 0xC;
  if (v5) {
    goto LABEL_5;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry retryCount](v4, "retryCount"));
  id v7 = v6;
  if (!v6
    || (id v8 = [v6 unsignedIntegerValue],
        id v9 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCPrefs sharedPrefs](&OBJC_CLASS____SWCPrefs, "sharedPrefs")),
        id v10 = [v9 maximumRetryCount],
        v9,
        v8 < v10))
  {

LABEL_5:
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCPrefs sharedPrefs](&OBJC_CLASS____SWCPrefs, "sharedPrefs"));
    [v11 retryIntervalAfterSuccess:v5 != 0];
    double v13 = v12;

    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry lastCheckedDate](v4, "lastCheckedDate"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 dateByAddingTimeInterval:v13]);

    goto LABEL_6;
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCPrefs sharedPrefs](&OBJC_CLASS____SWCPrefs, "sharedPrefs"));
  objc_msgSend(v17, "retryIntervalAfterReachLimitWithFailure:", objc_msgSend(v7, "unsignedIntegerValue"));
  double v19 = v18;

  unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry lastCheckedDate](v4, "lastCheckedDate"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v20 dateByAddingTimeInterval:v19]);

  if (qword_10002E840 != -1) {
    dispatch_once(&qword_10002E840, &stru_100028A88);
  }
  v21 = (os_log_s *)(id)qword_10002E838;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    objc_super v22 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCPrefs sharedPrefs](&OBJC_CLASS____SWCPrefs, "sharedPrefs"));
    int v23 = 138413058;
    v24 = v4;
    __int16 v25 = 2112;
    v26 = v15;
    __int16 v27 = 2114;
    v28 = v7;
    __int16 v29 = 2048;
    id v30 = [v22 maximumRetryCount];
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "nextCheckDate for '%@' will be %@ because it is at its retry limit (%{public}@ of %llu)",  (uint8_t *)&v23,  0x2Au);
  }

  if (!v15) {
    goto LABEL_5;
  }
LABEL_6:
  objc_autoreleasePoolPop(v3);
  return (NSDate *)v15;
}

- (NSError)lastError
{
  if (self->_lastErrorJSON)
  {
    id v3 = objc_autoreleasePoolPush();
    uint64_t v4 = objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  self->_lastErrorJSON,  0LL,  0LL));
    int v5 = (void *)v4;
    if (v4 && _NSIsNSDictionary(v4))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"d"]);
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"c"]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"u"]);
      if (_NSIsNSString(v6)
        && _NSIsNSNumber(v7)
        && (!v8 || _NSIsNSDictionary(v8)))
      {
        id v9 = -[NSError initWithDomain:code:userInfo:]( [NSError alloc],  "initWithDomain:code:userInfo:",  v6,  [v7 integerValue],  v8);
      }

      else
      {
        id v9 = 0LL;
      }
    }

    else
    {
      id v9 = 0LL;
    }

    objc_autoreleasePoolPop(v3);
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

- (void)setLastError:(id)a3
{
  id v14 = a3;
  if (v14)
  {
    uint64_t v4 = objc_autoreleasePoolPush();
    int v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v14 domain]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v6, @"d");

    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v14 code]));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v7, @"c");

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v14 userInfo]);
    id v9 = v8;
    if (v8 && [v8 count])
    {
      v15 = _NSConcreteStackBlock;
      uint64_t v16 = 3221225472LL;
      v17 = sub_100007BA0;
      double v18 = &unk_1000288E8;
      id v10 =  -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v9 count]);
      double v19 = v10;
      [v9 enumerateKeysAndObjectsUsingBlock:&v15];
      -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v10, @"u");
    }

    unint64_t v11 = (NSData *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v5,  8LL,  0LL,  v14,  v15,  v16,  v17,  v18));
    lastErrorJSON = self->_lastErrorJSON;
    self->_lastErrorJSON = v11;

    objc_autoreleasePoolPop(v4);
  }

  else
  {
    double v13 = self->_lastErrorJSON;
    self->_lastErrorJSON = 0LL;
  }
}

- (unint64_t)hash
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry applicationIdentifier](self, "applicationIdentifier"));
  unint64_t v4 = (unint64_t)[v3 hash];
  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry serviceType](self, "serviceType"));
  unint64_t v6 = (unint64_t)[v5 hash];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry domain](self, "domain"));
  unint64_t v8 = v6 ^ v4 ^ (unint64_t)[v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (SWCEntry *)a3;
  if (v4 == self)
  {
    unsigned __int8 v13 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___SWCEntry);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      unint64_t v6 = v4;
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry applicationIdentifier](self, "applicationIdentifier"));
      unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry applicationIdentifier](v6, "applicationIdentifier"));
      if ([v7 isEqual:v8])
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry serviceType](self, "serviceType"));
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry serviceType](v6, "serviceType"));
        if ([v9 isEqual:v10])
        {
          unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry domain](self, "domain"));
          double v12 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry domain](v6, "domain"));
          unsigned __int8 v13 = [v11 isEqual:v12];
        }

        else
        {
          unsigned __int8 v13 = 0;
        }
      }

      else
      {
        unsigned __int8 v13 = 0;
      }
    }

    else
    {
      unsigned __int8 v13 = 0;
    }
  }

  return v13;
}

- (id)description
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry patterns](self, "patterns"));

  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry patterns](self, "patterns"));
    -[NSMutableString appendFormat:](v3, "appendFormat:", @", patternCount = %llu", [v5 count]);
  }

  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry substitutionVariables](self, "substitutionVariables"));

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry substitutionVariables](self, "substitutionVariables"));
    -[NSMutableString appendFormat:](v3, "appendFormat:", @", subVarCount = %llu", [v7 count]);
  }

  unint64_t v8 = objc_alloc(&OBJC_CLASS___NSString);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry serviceType](self, "serviceType"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry applicationIdentifier](self, "applicationIdentifier"));
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry domain](self, "domain"));
  double v12 = self;
  uint64_t DebugDescription = _SWCServiceApprovalStateGetDebugDescription(*(_WORD *)-[SWCEntry fields](v12, "fields") & 3);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(DebugDescription);
  uint64_t v15 = _SWCServiceApprovalStateGetDebugDescription((*(unsigned __int8 *)-[SWCEntry fields]( v12, "fields") >> 2) & 3);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = -[NSString initWithFormat:]( v8,  "initWithFormat:",  @"{ s = %@, a = %@, d = %@, ua = %@, sa = %@%@ }",  v9,  v10,  v11,  v14,  v16,  v3);

  return v17;
}

- (id)debugDescription
{
  id v3 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v4 = objc_opt_class(self);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry description](self, "description"));
  unint64_t v6 = -[NSString initWithFormat:](v3, "initWithFormat:", @"<%@ %p> %@", v4, self, v5);

  return v6;
}

- (id)redactedDescription
{
  id v3 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry serviceType](self, "serviceType"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry applicationIdentifier](self, "applicationIdentifier"));
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 redactedDescription]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry domain](self, "domain"));
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 redactedDescription]);
  id v9 = self;
  uint64_t DebugDescription = _SWCServiceApprovalStateGetDebugDescription(*(_WORD *)-[SWCEntry fields](v9, "fields") & 3);
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(DebugDescription);
  uint64_t v12 = _SWCServiceApprovalStateGetDebugDescription((*(unsigned __int8 *)-[SWCEntry fields]( v9, "fields") >> 2) & 3);
  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"{ s = %@, a = %@, d = %@, ua = %@, sa = %@ }",  v4,  v6,  v8,  v11,  v13);

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_applicationIdentifier forKey:@"appID"];
  [v4 encodeObject:self->_serviceType forKey:@"service"];
  [v4 encodeObject:self->_domain forKey:@"domain"];
  [v4 encodeObject:self->_applicationVersion forKey:@"applicationVersion"];
  [v4 encodeObject:self->_applicationPersistentIdentifier forKey:@"applicationPersistentIdentifier"];
  _SWCFieldsEncodeWithCoder( *(_WORD *)&self->_fields | ((unint64_t)self->_fields.relativeOrder << 16),  v4,  @"fields");
  [v4 encodeObject:self->_patterns forKey:@"patternList"];
  [v4 encodeObject:self->_substitutionVariables forKey:@"substitutionVariableList"];
  [v4 encodeObject:self->_lastCheckedDate forKey:@"lastCheckedDate"];
  [v4 encodeObject:self->_lastErrorJSON forKey:@"lastErrorJSON"];
  [v4 encodeObject:self->_retryCount forKey:@"retryCount"];
}

- (SWCEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_autoreleasePoolPush();
  id v6 = objc_msgSend( v4,  "swc_decodeObjectOfClass:forKey:",  objc_opt_class(_SWCApplicationIdentifier),  @"appID");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = objc_msgSend(v4, "swc_decodeObjectOfClass:forKey:", objc_opt_class(NSString), @"service");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = objc_msgSend(v4, "swc_decodeObjectOfClass:forKey:", objc_opt_class(_SWCDomain), @"domain");
  uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = (void *)v11;
  if (v7 && v9 && v11)
  {
    unsigned __int8 v13 = -[SWCEntry initWithApplicationIdentifier:service:domain:]( self,  "initWithApplicationIdentifier:service:domain:",  v7,  v9,  v11);
    if (v13)
    {
      id v14 = objc_msgSend( v4,  "swc_decodeObjectOfClass:forKey:",  objc_opt_class(NSString),  @"applicationVersion");
      uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
      applicationVersion = v13->_applicationVersion;
      v13->_applicationVersion = (NSString *)v15;

      id v17 = objc_msgSend( v4,  "swc_decodeObjectOfClass:forKey:",  objc_opt_class(NSData),  @"applicationPersistentIdentifier");
      uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
      applicationPersistentIdentifier = v13->_applicationPersistentIdentifier;
      v13->_applicationPersistentIdentifier = (NSData *)v18;

      uint64_t v20 = _SWCFieldsMakeWithCoder(v4, @"fields");
      *(_WORD *)&v13->_fields = v20;
      v13->_fields.relativeOrder = BYTE2(v20);
      id v21 = objc_msgSend( v4,  "swc_decodeObjectOfClass:forKey:",  objc_opt_class(_SWCPatternList),  @"patternList");
      uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);
      patterns = v13->_patterns;
      v13->_patterns = (_SWCPatternList *)v22;

      id v24 = objc_msgSend( v4,  "swc_decodeObjectOfClass:forKey:",  objc_opt_class(_SWCSubstitutionVariableList),  @"substitutionVariableList");
      uint64_t v25 = objc_claimAutoreleasedReturnValue(v24);
      substitutionVariables = v13->_substitutionVariables;
      v13->_substitutionVariables = (_SWCSubstitutionVariableList *)v25;

      id v27 = objc_msgSend( v4,  "swc_decodeObjectOfClass:forKey:",  objc_opt_class(NSDate),  @"lastCheckedDate");
      uint64_t v28 = objc_claimAutoreleasedReturnValue(v27);
      lastCheckedDate = v13->_lastCheckedDate;
      v13->_lastCheckedDate = (NSDate *)v28;

      if (!v13->_lastCheckedDate)
      {
        uint64_t v30 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
        v31 = v13->_lastCheckedDate;
        v13->_lastCheckedDate = (NSDate *)v30;
      }

      id v32 = objc_msgSend( v4,  "swc_decodeObjectOfClass:forKey:",  objc_opt_class(NSData),  @"lastErrorJSON");
      uint64_t v33 = objc_claimAutoreleasedReturnValue(v32);
      lastErrorJSON = v13->_lastErrorJSON;
      v13->_lastErrorJSON = (NSData *)v33;

      id v35 = objc_msgSend( v4,  "swc_decodeObjectOfClass:forKey:",  objc_opt_class(NSNumber),  @"retryCount");
      uint64_t v36 = objc_claimAutoreleasedReturnValue(v35);
      retryCount = v13->_retryCount;
      v13->_retryCount = (NSNumber *)v36;
    }
  }

  else
  {
    v38 = objc_alloc(&OBJC_CLASS___NSError);
    v43[0] = @"Line";
    v43[1] = @"Function";
    v44[0] = &off_10002A528;
    v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCEntry initWithCoder:]"));
    v44[1] = v39;
    v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v44,  v43,  2LL));
    v41 = -[NSError initWithDomain:code:userInfo:]( v38,  "initWithDomain:code:userInfo:",  NSCocoaErrorDomain,  4865LL,  v40);
    [v4 failWithError:v41];

    unsigned __int8 v13 = 0LL;
  }

  objc_autoreleasePoolPop(v5);
  return v13;
}

- (_SWCApplicationIdentifier)applicationIdentifier
{
  return (_SWCApplicationIdentifier *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSString)serviceType
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (_SWCDomain)domain
{
  return (_SWCDomain *)objc_getProperty(self, a2, 40LL, 1);
}

- (NSString)applicationVersion
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setApplicationVersion:(id)a3
{
}

- (NSData)applicationPersistentIdentifier
{
  return (NSData *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setApplicationPersistentIdentifier:(id)a3
{
}

- (_SWCPatternList)patterns
{
  return (_SWCPatternList *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setPatterns:(id)a3
{
}

- (_SWCSubstitutionVariableList)substitutionVariables
{
  return (_SWCSubstitutionVariableList *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setSubstitutionVariables:(id)a3
{
}

- (NSDate)lastCheckedDate
{
  return (NSDate *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setLastCheckedDate:(id)a3
{
}

- (NSNumber)retryCount
{
  return (NSNumber *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setRetryCount:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)entriesForBundleRecord:(id)a3 enterpriseContext:(id)a4 developerModeEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v41 = a4;
  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  id v10 = -[_SWCApplicationIdentifier initForBundleRecord:]( objc_alloc(&OBJC_CLASS____SWCApplicationIdentifier),  "initForBundleRecord:",  v8);
  if (v10)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 entitlements]);
    id v12 = [v11 objectForKey:@"com.apple.private.swc.system-app" ofClass:objc_opt_class(NSNumber)];
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    unsigned int v14 = [v13 isEqual:&__kCFBooleanTrue];

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( [a1 _associatedDomainsFromEntitlementForBundleRecord:v8 applicationIdentifier:v10 developerModeEnabled:v5 enterpriseContext:v41]);
    if ([v15 count])
    {
      if (qword_10002E840 != -1) {
        dispatch_once(&qword_10002E840, &stru_100028A88);
      }
      uint64_t v16 = (os_log_s *)(id)qword_10002E838;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleVersion]);
        *(_DWORD *)buf = 138412546;
        id v61 = v8;
        __int16 v62 = 2114;
        v63 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "Adding bundle record %@ (version %{public}@)",  buf,  0x16u);
      }

      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472LL;
      v54[2] = sub_100009008;
      v54[3] = &unk_100028910;
      id v55 = v10;
      v56 = v9;
      [v15 enumerateKeysAndObjectsUsingBlock:v54];
    }

    else
    {
      if (qword_10002E840 != -1) {
        dispatch_once(&qword_10002E840, &stru_100028A88);
      }
      double v19 = (os_log_s *)qword_10002E838;
      if (os_log_type_enabled((os_log_t)qword_10002E838, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v61 = v8;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "No associated domains for bundle record %@",  buf,  0xCu);
      }
    }

    if (v15) {
      unsigned int v20 = v14;
    }
    else {
      unsigned int v20 = 0;
    }
    if (v20 == 1)
    {
      id v21 = objc_autoreleasePoolPush();
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([a1 _entriesFromBuiltInJSONForBundleRecord:v8 applicationIdentifier:v10]);
      if (v22)
      {
        if (qword_10002E840 != -1) {
          dispatch_once(&qword_10002E840, &stru_100028A88);
        }
        int v23 = (os_log_s *)qword_10002E838;
        if (os_log_type_enabled((os_log_t)qword_10002E838, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          id v61 = v8;
          __int16 v62 = 2112;
          v63 = v22;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  "App %@ had on-disk JSON, adding it to the pile: %@",  buf,  0x16u);
        }

        -[NSMutableOrderedSet unionOrderedSet:](v9, "unionOrderedSet:", v22);
      }

      objc_autoreleasePoolPop(v21);
    }

    if (-[NSMutableOrderedSet count](v9, "count"))
    {
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleVersion]);
      if (v24)
      {
        __int128 v52 = 0u;
        __int128 v53 = 0u;
        __int128 v50 = 0u;
        __int128 v51 = 0u;
        uint64_t v25 = v9;
        id v26 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v50,  v59,  16LL);
        if (v26)
        {
          uint64_t v27 = *(void *)v51;
          do
          {
            for (i = 0LL; i != v26; i = (char *)i + 1)
            {
              if (*(void *)v51 != v27) {
                objc_enumerationMutation(v25);
              }
              [*(id *)(*((void *)&v50 + 1) + 8 * (void)i) setApplicationVersion:v24];
            }

            id v26 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v50,  v59,  16LL);
          }

          while (v26);
        }
      }

      __int16 v29 = (void *)objc_claimAutoreleasedReturnValue([v8 persistentIdentifier]);
      if (v29)
      {
        __int128 v48 = 0u;
        __int128 v49 = 0u;
        __int128 v46 = 0u;
        __int128 v47 = 0u;
        uint64_t v30 = v9;
        id v31 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v30,  "countByEnumeratingWithState:objects:count:",  &v46,  v58,  16LL);
        if (v31)
        {
          uint64_t v32 = *(void *)v47;
          do
          {
            for (j = 0LL; j != v31; j = (char *)j + 1)
            {
              if (*(void *)v47 != v32) {
                objc_enumerationMutation(v30);
              }
              [*(id *)(*((void *)&v46 + 1) + 8 * (void)j) setApplicationPersistentIdentifier:v29];
            }

            id v31 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v30,  "countByEnumeratingWithState:objects:count:",  &v46,  v58,  16LL);
          }

          while (v31);
        }
      }

      __int128 v44 = 0u;
      __int128 v45 = 0u;
      __int128 v42 = 0u;
      __int128 v43 = 0u;
      v34 = v9;
      id v35 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v34,  "countByEnumeratingWithState:objects:count:",  &v42,  v57,  16LL);
      if (v35)
      {
        uint64_t v36 = *(void *)v43;
        do
        {
          for (k = 0LL; k != v35; k = (char *)k + 1)
          {
            if (*(void *)v43 != v36) {
              objc_enumerationMutation(v34);
            }
            v38 = [*(id *)(*((void *)&v42 + 1) + 8 * (void)k) fields];
            if (v14)
            {
              __int16 v39 = *(_WORD *)v38 & 0xFFD3 | 0x24;
            }

            else
            {
              v38[2] = 0;
              __int16 v39 = *(_WORD *)v38 & 0xFF3F;
            }

            *(_WORD *)v38 = v39;
          }

          id v35 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v34,  "countByEnumeratingWithState:objects:count:",  &v42,  v57,  16LL);
        }

        while (v35);
      }
    }
  }

  else
  {
    if (qword_10002E840 != -1) {
      dispatch_once(&qword_10002E840, &stru_100028A88);
    }
    uint64_t v18 = (os_log_s *)qword_10002E838;
    if (os_log_type_enabled((os_log_t)qword_10002E838, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v61 = v8;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "### Add bundle record %@ failed because of missing app identifier entitlement",  buf,  0xCu);
    }
  }

  +[SWCEntry canonicalizeEntries:](&OBJC_CLASS___SWCEntry, "canonicalizeEntries:", v9);
  return v9;
}

+ (id)entriesForJSONObject:(id)a3 domain:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  id v9 = objc_autoreleasePoolPush();
  if (_NSIsNSDictionary(v6))
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100009394;
    v11[3] = &unk_100028938;
    id v14 = a1;
    id v12 = v8;
    id v13 = v7;
    [v6 enumerateKeysAndObjectsUsingBlock:v11];
  }

  objc_autoreleasePoolPop(v9);

  return v8;
}

+ (void)enumerateJSONResourceURLsForBundleURL:(id)a3 block:(id)a4
{
  id v14 = a3;
  id v7 = a4;
  id v8 = objc_autoreleasePoolPush();
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v14 URLByAppendingPathComponent:@"Contents" isDirectory:1]);
  id v10 = v9;
  if (!v9 || ([v9 checkResourceIsReachableAndReturnError:0] & 1) == 0)
  {
    id v11 = v14;

    id v10 = v11;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue( [v10 URLByAppendingPathComponent:@"Library/SharedWebCredentials" isDirectory:1]);

  objc_autoreleasePoolPop(v8);
  if (!v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v13 handleFailureInMethod:a2, a1, @"SWCEntry.mm", 706, @"Unexpected failure to allocate URL for [Contents/]Library/SharedWebCredentials directory relative to bundle URL %@.", v14 object file lineNumber description];
  }

  [a1 enumerateJSONResourceURLsForDirectoryAtURL:v12 block:v7];
}

+ (void)enumerateJSONResourceURLsForDirectoryAtURL:(id)a3 block:(id)a4
{
  BOOL v5 = (const __CFURL *)a3;
  __int128 v53 = (void (**)(id, void *, void *))a4;
  context = objc_autoreleasePoolPush();
  CFURLRef bundleURL = v5;
  CFArrayRef v52 = CFBundleCopyResourceURLsOfTypeInDirectory(v5, @"json", 0LL);
  if (!v52)
  {
    obj = 0LL;
    goto LABEL_51;
  }

  if (qword_10002E840 != -1) {
    dispatch_once(&qword_10002E840, &stru_100028A88);
  }
  id v6 = (os_log_s *)(id)qword_10002E838;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    __int128 v49 = (const __CFString *)-[__CFArray count](v52, "count", context);
    __int128 v50 = (_SWCDomain *)objc_claimAutoreleasedReturnValue(-[__CFURL path](bundleURL, "path"));
    *(_DWORD *)buf = 134218498;
    v75 = v49;
    __int16 v76 = 2112;
    v77 = v50;
    __int16 v78 = 2112;
    v79 = v52;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "Found %llu JSON URLs (must filter) in directory %@: %@",  buf,  0x20u);
  }

  obj = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  id v7 = v52;
  id v8 = -[__CFArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v67,  v73,  16LL);
  if (!v8)
  {

LABEL_33:
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    uint64_t v25 = v7;
    id v26 = -[__CFArray countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v63,  v72,  16LL);
    if (v26)
    {
      uint64_t v27 = *(void *)v64;
      do
      {
        uint64_t v28 = 0LL;
        do
        {
          if (*(void *)v64 != v27) {
            objc_enumerationMutation(v25);
          }
          __int16 v29 = *(void **)(*((void *)&v63 + 1) + 8LL * (void)v28);
          uint64_t v30 = objc_autoreleasePoolPush();
          id v31 = (void *)objc_claimAutoreleasedReturnValue([v29 lastPathComponent]);
          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v31 stringByDeletingPathExtension]);

          if (v32)
          {
            uint64_t v33 = -[_SWCDomain initWithString:](objc_alloc(&OBJC_CLASS____SWCDomain), "initWithString:", v32);
            v34 = v33;
            if (v33 && -[_SWCDomain isValid](v33, "isValid"))
            {
              if (qword_10002E840 != -1) {
                dispatch_once(&qword_10002E840, &stru_100028A88);
              }
              id v35 = (os_log_s *)(id)qword_10002E838;
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
              {
                id v55 = (__CFString *)objc_claimAutoreleasedReturnValue([v29 lastPathComponent]);
                uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(-[__CFURL path](bundleURL, "path"));
                *(_DWORD *)buf = 138412802;
                v75 = v55;
                __int16 v76 = 2112;
                v77 = v34;
                __int16 v78 = 2112;
                v79 = v36;
                _os_log_debug_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEBUG,  "Found JSON file %@ for domain %@ in directory %@ (nothing model-specific)",  buf,  0x20u);
              }

              v53[2](v53, v34, v29);
            }
          }

          objc_autoreleasePoolPop(v30);
          uint64_t v28 = (char *)v28 + 1;
        }

        while (v26 != v28);
        id v26 = -[__CFArray countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v63,  v72,  16LL);
      }

      while (v26);
    }

    uint64_t v22 = (os_log_s *)obj;
    obj = 0LL;
    goto LABEL_50;
  }

  char v54 = 0;
  uint64_t v9 = *(void *)v68;
  do
  {
    id v10 = 0LL;
    do
    {
      if (*(void *)v68 != v9) {
        objc_enumerationMutation(v7);
      }
      id v11 = *(void **)(*((void *)&v67 + 1) + 8LL * (void)v10);
      id v12 = objc_autoreleasePoolPush();
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 lastPathComponent]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 stringByDeletingPathExtension]);

      if (v14)
      {
        id v15 = [v14 rangeOfString:@"." options:4];
        id v16 = [v14 rangeOfString:@"~" options:4];
        if (v16 == (id)0x7FFFFFFFFFFFFFFFLL || (v15 != (id)0x7FFFFFFFFFFFFFFFLL ? (BOOL v17 = v15 >= v16) : (BOOL v17 = 0), v17))
        {
          uint64_t v18 = v14;
        }

        else
        {
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v14 substringToIndex:v16]);

          id v19 = [v18 rangeOfString:@"-macos" options:13];
          if (v19 == (id)0x7FFFFFFFFFFFFFFFLL)
          {
            char v54 = 1;
          }

          else
          {
            uint64_t v20 = objc_claimAutoreleasedReturnValue([v18 substringToIndex:v19]);

            char v54 = 1;
            uint64_t v18 = (void *)v20;
          }
        }

        -[NSMutableSet addObject:](obj, "addObject:", v18, context);
      }

      else
      {
        uint64_t v18 = 0LL;
      }

      objc_autoreleasePoolPop(v12);
      id v10 = (char *)v10 + 1;
    }

    while (v8 != v10);
    id v21 = -[__CFArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v67,  v73,  16LL);
    id v8 = v21;
  }

  while (v21);

  if ((v54 & 1) == 0) {
    goto LABEL_33;
  }
  if (qword_10002E840 != -1) {
    dispatch_once(&qword_10002E840, &stru_100028A88);
  }
  uint64_t v22 = (os_log_s *)(id)qword_10002E838;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    int v23 = (const __CFString *)-[NSMutableSet count](obj, "count");
    id v24 = (_SWCDomain *)objc_claimAutoreleasedReturnValue(-[__CFURL path](bundleURL, "path"));
    *(_DWORD *)buf = 134218498;
    v75 = v23;
    __int16 v76 = 2112;
    v77 = v24;
    __int16 v78 = 2112;
    v79 = obj;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "Found %llu JSON filenames (filtered) in directory %@: %@",  buf,  0x20u);
  }

+ (id)additionalServiceDetailsDirectoryURLForApplicationIdentifier:(id)a3 createParentIfNeeded:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCPrefs sharedPrefs](&OBJC_CLASS____SWCPrefs, "sharedPrefs"));
  id v26 = 0LL;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 containerURLReturningError:&v26]);
  id v10 = (NSError *)v26;

  if (v9)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 URLByAppendingPathComponent:@"AdditionalServiceDetails" isDirectory:1]);
    if (v11)
    {
      if (v6)
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        uint64_t v25 = v10;
        unsigned int v13 = [v12 createDirectoryAtURL:v11 withIntermediateDirectories:1 attributes:0 error:&v25];
        id v14 = v25;

        if (!v13)
        {
          uint64_t v18 = 0LL;
          goto LABEL_13;
        }

        id v10 = v14;
      }

      id v15 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDRepresentation]);
      id v16 = v15;
      if (v15)
      {
        BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v15 UUIDString]);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v11 URLByAppendingPathComponent:v17 isDirectory:1]);
LABEL_12:

        id v14 = v10;
LABEL_13:

        id v10 = v14;
        goto LABEL_14;
      }

      uint64_t v22 = objc_alloc(&OBJC_CLASS___NSError);
      v30[0] = &off_10002A540;
      v29[0] = @"Line";
      v29[1] = @"Function";
      BOOL v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "+[SWCEntry(JSONParsing) additionalServiceDetailsDirectoryURLForApplicationIdentifier:createParen tIfNeeded:error:]"));
      v29[2] = NSDebugDescriptionErrorKey;
      v30[1] = v17;
      v30[2] = @"Could not generate a UUID for the specified application identifier.";
      id v21 = (NSError *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  3LL));
      int v23 = -[NSError initWithDomain:code:userInfo:](v22, "initWithDomain:code:userInfo:", _SWCErrorDomain, -1LL, v21);

      id v16 = 0LL;
      id v10 = v23;
    }

    else
    {
      id v19 = objc_alloc(&OBJC_CLASS___NSError);
      v28[0] = &off_10002A558;
      v27[0] = @"Line";
      v27[1] = @"Function";
      id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "+[SWCEntry(JSONParsing) additionalServiceDetailsDirectoryURLForApplicationIdentifier:createParen tIfNeeded:error:]"));
      v27[2] = NSDebugDescriptionErrorKey;
      v28[1] = v16;
      v28[2] = @"Could not create additional service details storage directory.";
      BOOL v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  v27,  3LL));
      uint64_t v20 = -[NSError initWithDomain:code:userInfo:](v19, "initWithDomain:code:userInfo:", _SWCErrorDomain, -1LL, v17);
      id v21 = v10;
      id v10 = v20;
    }

    uint64_t v18 = 0LL;
    goto LABEL_12;
  }

  uint64_t v18 = 0LL;
LABEL_14:

  if (a5 && !v18) {
    *a5 = v10;
  }

  return v18;
}

+ (BOOL)_shouldIncludeServiceWithDomain:(id)a3 fromBundleRecord:(id)a4 applicationIdentifier:(id)a5 developerModeEnabled:(BOOL)a6 enterpriseContext:(id)a7
{
  BOOL v8 = a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if ([v11 modeOfOperation])
  {
    if (!v8)
    {
      if (qword_10002E840 != -1) {
        dispatch_once(&qword_10002E840, &stru_100028A88);
      }
      uint64_t v23 = qword_10002E838;
      if (!os_log_type_enabled((os_log_t)qword_10002E838, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_24;
      }
      *(_DWORD *)buf = 138412290;
      id v29 = v11;
      BOOL v17 = "Skipping domain %@ because developer mode is disabled";
LABEL_22:
      uint64_t v18 = (os_log_s *)v23;
      uint32_t v19 = 12;
LABEL_23:
      _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, v17, buf, v19);
      goto LABEL_24;
    }

    if ((objc_msgSend(v12, "swc_isBuiltForDevelopment") & 1) == 0)
    {
      if (qword_10002E840 != -1) {
        dispatch_once(&qword_10002E840, &stru_100028A88);
      }
      uint64_t v16 = qword_10002E838;
      if (!os_log_type_enabled((os_log_t)qword_10002E838, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_24;
      }
      *(_DWORD *)buf = 138412546;
      id v29 = v11;
      __int16 v30 = 2112;
      id v31 = v12;
      BOOL v17 = "Skipping domain %@ because bundle %@ is not developer-signed";
      uint64_t v18 = (os_log_s *)v16;
      uint32_t v19 = 22;
      goto LABEL_23;
    }
  }

  if (([v11 modeOfOperation] & 2) != 0)
  {
    if (v14)
    {
      id v27 = 0LL;
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v14 isApplicationIdentifierEligibleForManagedMode:v13 error:&v27]);
      id v21 = v27;
      if (v20)
      {
        unsigned __int8 v22 = [v20 BOOLValue];

        if ((v22 & 1) != 0)
        {
          BOOL v15 = 1;
LABEL_34:

          goto LABEL_35;
        }
      }

      else
      {
        if (qword_10002E840 != -1) {
          dispatch_once(&qword_10002E840, &stru_100028A88);
        }
        id v24 = (os_log_s *)qword_10002E838;
        if (os_log_type_enabled((os_log_t)qword_10002E838, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v29 = v11;
          __int16 v30 = 2112;
          id v31 = v21;
          _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "Failed to check if the MDM profile allows direct connections for %@: %@",  buf,  0x16u);
        }
      }

      if (qword_10002E840 != -1) {
        dispatch_once(&qword_10002E840, &stru_100028A88);
      }
      uint64_t v25 = (os_log_s *)qword_10002E838;
      if (os_log_type_enabled((os_log_t)qword_10002E838, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v29 = v11;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEBUG,  "Skipping domain %@ because the MDM profile does not allow directly connecting to it",  buf,  0xCu);
      }

      BOOL v15 = 0;
      goto LABEL_34;
    }

    if (qword_10002E840 != -1) {
      dispatch_once(&qword_10002E840, &stru_100028A88);
    }
    uint64_t v23 = qword_10002E838;
    if (!os_log_type_enabled((os_log_t)qword_10002E838, OS_LOG_TYPE_DEBUG))
    {
LABEL_24:
      BOOL v15 = 0;
      goto LABEL_35;
    }

    *(_DWORD *)buf = 138412290;
    id v29 = v11;
    BOOL v17 = "Skipping domain %@ because no MDM profile is active";
    goto LABEL_22;
  }

  BOOL v15 = 1;
LABEL_35:

  return v15;
}

+ (id)_deduplicateServicesByMode:(id)a3
{
  id v3 = a3;
  id v4 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v3 count]);
  BOOL v5 = objc_autoreleasePoolPush();
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000A8F8;
  v9[3] = &unk_100028988;
  BOOL v6 = v4;
  id v10 = v6;
  [v3 enumerateKeysAndObjectsUsingBlock:v9];

  objc_autoreleasePoolPop(v5);
  id v7 = -[NSMutableDictionary copy](v6, "copy");

  return v7;
}

+ (id)_associatedDomainsFromEntitlementForBundleRecord:(id)a3 applicationIdentifier:(id)a4 developerModeEnabled:(BOOL)a5 enterpriseContext:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v33 = a4;
  id v11 = a6;
  context = objc_autoreleasePoolPush();
  id v12 = objc_autoreleasePoolPush();
  uint64_t v32 = v10;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 entitlements]);
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSArray);
  id v15 = [v13 objectForKey:@"com.apple.developer.associated-domains" ofClass:v14 valuesOfClass:objc_opt_class(NSString)];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  if (v16) {
    __int16 v30 = (void *)objc_claimAutoreleasedReturnValue( +[_SWCServiceSpecifier serviceSpecifiersWithEntitlementValue:error:]( &OBJC_CLASS____SWCServiceSpecifier,  "serviceSpecifiersWithEntitlementValue:error:",  v16,  0LL,  context));
  }
  else {
    __int16 v30 = 0LL;
  }

  objc_autoreleasePoolPop(v12);
  if (v30)
  {
    BOOL v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    id obj = v30;
    id v18 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v37;
      do
      {
        for (i = 0LL; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v37 != v19) {
            objc_enumerationMutation(obj);
          }
          id v21 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
          unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "SWCDomain", context));
          if ([a1 _shouldIncludeServiceWithDomain:v22 fromBundleRecord:v32 applicationIdentifier:v33 developerModeEnabl ed:v7 enterpriseContext:v11])
          {
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v21 serviceType]);
            id v24 = (NSMutableSet *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v17,  "objectForKeyedSubscript:",  v23));
            if (!v24)
            {
              id v24 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
              -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v24, v23);
            }

            -[NSMutableSet addObject:](v24, "addObject:", v22);
          }
        }

        id v18 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
      }

      while (v18);
    }

    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([a1 _deduplicateServicesByMode:v17]);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_10000B0A4;
    v34[3] = &unk_100028988;
    id v26 =  -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v25 count]);
    id v35 = v26;
    [v25 enumerateKeysAndObjectsUsingBlock:v34];
    id v27 = -[NSMutableDictionary copy](v26, "copy");
  }

  else
  {
    id v27 = 0LL;
  }

  objc_autoreleasePoolPop(context);
  return v27;
}

+ (void)_enumerateJSONFilesForBundleRecord:(id)a3 applicationIdentifier:(id)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 URL]);
  if (v11)
  {
    uint64_t v25 = 0LL;
    id v26 = &v25;
    uint64_t v27 = 0x2020000000LL;
    char v28 = 1;
    uint64_t v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472LL;
    id v21 = sub_10000B468;
    unsigned __int8 v22 = &unk_1000289F0;
    id v23 = v10;
    id v24 = &v25;
    id v12 = objc_retainBlock(&v19);
    objc_msgSend(a1, "enumerateJSONResourceURLsForBundleURL:block:", v11, v12, v19, v20, v21, v22);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 entitlements]);
    id v14 = [v13 objectForKey:@"com.apple.private.swc.additional-service-details-consumer" ofClass:objc_opt_class(NSNumber)];
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    unsigned __int8 v16 = [v15 isEqual:&__kCFBooleanTrue];

    char v17 = v16 ^ 1;
    if (!v9) {
      char v17 = 1;
    }
    if ((v17 & 1) == 0)
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue( [a1 additionalServiceDetailsDirectoryURLForApplicationIdentifier:v9 createParentIfNeeded:0 error:0]);
      if ([v18 checkResourceIsReachableAndReturnError:0])
      {
        *((_BYTE *)v26 + 24) = 3;
        [a1 enumerateJSONResourceURLsForDirectoryAtURL:v18 block:v12];
      }
    }

    _Block_object_dispose(&v25, 8);
  }
}

+ (id)_entriesFromBuiltInJSONForBundleRecord:(id)a3 applicationIdentifier:(id)a4
{
  uint64_t v22 = 0LL;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  uint64_t v25 = sub_10000B938;
  id v26 = sub_10000B948;
  id v27 = 0LL;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10000B950;
  v18[3] = &unk_100028A18;
  uint64_t v20 = &v22;
  id v21 = a1;
  id v5 = a4;
  id v19 = v5;
  [v21 _enumerateJSONFilesForBundleRecord:a3 applicationIdentifier:v5 block:v18];
  if (v23[5])
  {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v7 = (id)v23[5];
    id v8 = [v7 countByEnumeratingWithState:&v14 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v15;
      do
      {
        id v10 = 0LL;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)v10), "setLastCheckedDate:", v6, (void)v14);
          id v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = [v7 countByEnumeratingWithState:&v14 objects:v28 count:16];
      }

      while (v8);
    }

    id v11 = (void *)v23[5];
  }

  else
  {
    id v11 = 0LL;
  }

  id v12 = objc_msgSend(v11, "copy", (void)v14);

  _Block_object_dispose(&v22, 8);
  return v12;
}

+ (void)_addEntryToOrderedSet:(id)a3 forUniversalLinksFromSingleDetailsDictionary:(id)a4 domain:(id)a5 substitutionVariables:(id)a6 defaults:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v30 = a7;
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", @"appIDs", v11));
  id v31 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"appID"]);
  char v28 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"relativeOrder"]);
  LOBYTE(a7) = _SWCEnabledConfigurationGetFromDetails(v12);
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[_SWCPatternList patternListWithDetailsDictionary:defaults:]( &OBJC_CLASS____SWCPatternList,  "patternListWithDetailsDictionary:defaults:",  v12,  v30));
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_10000C004;
  v37[3] = &unk_100028A40;
  id v16 = v13;
  id v38 = v16;
  id v29 = v15;
  id v39 = v29;
  id v17 = v14;
  id v40 = v17;
  char v43 = (char)a7;
  id v18 = v28;
  id v41 = v18;
  id v19 = v11;
  id v42 = v19;
  uint64_t v20 = objc_retainBlock(v37);
  if (v32 && _NSIsNSArray(v32))
  {
    if (qword_10002E840 != -1) {
      dispatch_once(&qword_10002E840, &stru_100028A88);
    }
    id v21 = (os_log_s *)(id)qword_10002E838;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      id v22 = [v32 count];
      *(_DWORD *)buf = 134218242;
      id v46 = v22;
      __int16 v47 = 2112;
      __int128 v48 = v32;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "JSON entry had %llu appIDs: %@", buf, 0x16u);
    }

    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id v23 = v32;
    id v24 = [v23 countByEnumeratingWithState:&v33 objects:v44 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v34;
      do
      {
        for (i = 0LL; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v34 != v25) {
            objc_enumerationMutation(v23);
          }
          ((void (*)(void *, void))v20[2])(v20, *(void *)(*((void *)&v33 + 1) + 8LL * (void)i));
        }

        id v24 = [v23 countByEnumeratingWithState:&v33 objects:v44 count:16];
      }

      while (v24);
    }
  }

  else
  {
    if (qword_10002E840 != -1) {
      dispatch_once(&qword_10002E840, &stru_100028A88);
    }
    id v27 = (os_log_s *)qword_10002E838;
    if (os_log_type_enabled((os_log_t)qword_10002E838, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v46 = v31;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "JSON entry had one appID: %@", buf, 0xCu);
    }

    ((void (*)(void *, void *))v20[2])(v20, v31);
  }
}

+ (void)_addEntriesToOrderedSet:(id)a3 forUniversalLinksFromDetailsArray:(id)a4 domain:(id)a5 substitutionVariables:(id)a6 defaults:(id)a7 maximum:(unint64_t)a8
{
  id v23 = a3;
  id v14 = a4;
  id v24 = a5;
  id v15 = a6;
  id v16 = a7;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v17 = v14;
  id v18 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v18)
  {
    uint64_t v19 = 0LL;
    uint64_t v20 = *(void *)v26;
LABEL_3:
    uint64_t v21 = 0LL;
    while (1)
    {
      if (*(void *)v26 != v20) {
        objc_enumerationMutation(v17);
      }
      uint64_t v22 = *(void *)(*((void *)&v25 + 1) + 8 * v21);
      if (_NSIsNSDictionary(v22))
      {
        [a1 _addEntryToOrderedSet:v23 forUniversalLinksFromSingleDetailsDictionary:v22 domain:v24 substitutionVariables:v15 defaults:v16];
        if (++v19 >= a8) {
          break;
        }
      }

      if (v18 == (id)++v21)
      {
        id v18 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v18) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

+ (void)_addEntriesToOrderedSet:(id)a3 forUniversalLinksFromDetailsDictionary:(id)a4 domain:(id)a5 substitutionVariables:(id)a6 defaults:(id)a7 maximum:(unint64_t)a8
{
  v26[0] = 0LL;
  v26[1] = v26;
  v26[2] = 0x2020000000LL;
  v26[3] = 0LL;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10000C49C;
  v18[3] = &unk_100028A68;
  id v19 = a3;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = v26;
  id v24 = a1;
  unint64_t v25 = a8;
  id v14 = v22;
  id v15 = v21;
  id v16 = v20;
  id v17 = v19;
  [a4 enumerateKeysAndObjectsUsingBlock:v18];

  _Block_object_dispose(v26, 8);
}

+ (void)_addEntriesToOrderedSet:(id)a3 forService:(id)a4 fromAppsArray:(id)a5 domain:(id)a6
{
  id v19 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v12 = v10;
  id v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)i);
        if (_NSIsNSString(v16))
        {
          id v17 = -[_SWCApplicationIdentifier initWithString:]( objc_alloc(&OBJC_CLASS____SWCApplicationIdentifier),  "initWithString:",  v16);
          id v18 = -[SWCEntry initWithApplicationIdentifier:service:domain:]( objc_alloc(&OBJC_CLASS___SWCEntry),  "initWithApplicationIdentifier:service:domain:",  v17,  v9,  v11);
          [v19 addObject:v18];
        }
      }

      id v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v13);
  }
}

@end