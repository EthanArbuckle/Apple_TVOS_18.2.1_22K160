@interface SWCDatabaseStorage
+ (BOOL)supportsSecureCoding;
- (NSData)enterpriseState;
- (NSDictionary)settings;
- (NSNumber)launchServicesDatabaseGeneration;
- (NSOrderedSet)entries;
- (SWCDatabaseStorage)initWithCoder:(id)a3;
- (int64_t)databaseVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setDatabaseVersion:(int64_t)a3;
- (void)setEnterpriseState:(id)a3;
- (void)setEntries:(id)a3;
- (void)setLaunchServicesDatabaseGeneration:(id)a3;
- (void)setSettings:(id)a3;
@end

@implementation SWCDatabaseStorage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (SWCDatabaseStorage)initWithCoder:(id)a3
{
  context = objc_autoreleasePoolPush();
  v51.receiver = self;
  v51.super_class = (Class)&OBJC_CLASS___SWCDatabaseStorage;
  v5 = -[SWCDatabaseStorage init](&v51, "init");
  if (!v5) {
    goto LABEL_25;
  }
  v5->_databaseVersion = (int64_t)[a3 decodeInt64ForKey:@"databaseVersion"];
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___SWCEntry);
  uint64_t v39 = objc_opt_class(&OBJC_CLASS____SWCServiceSpecifier);
  v7 = objc_alloc(&OBJC_CLASS___NSSet);
  v58[0] = objc_opt_class(&OBJC_CLASS___NSOrderedSet);
  v58[1] = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v58, 2LL));
  v9 = -[NSSet initWithArray:](v7, "initWithArray:", v8);

  v10 = objc_alloc(&OBJC_CLASS___NSSet);
  v57[0] = objc_opt_class(&OBJC_CLASS___NSDictionary);
  v57[1] = objc_opt_class(&OBJC_CLASS___NSArray);
  v57[2] = objc_opt_class(&OBJC_CLASS___NSString);
  v57[3] = objc_opt_class(&OBJC_CLASS___NSNumber);
  v57[4] = objc_opt_class(&OBJC_CLASS___NSData);
  v57[5] = objc_opt_class(&OBJC_CLASS___NSDate);
  v57[6] = v39;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v57, 7LL));
  v40 = -[NSSet initWithArray:](v10, "initWithArray:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "swc_decodeObjectOfClasses:forKey:", v9, @"entries"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "swc_decodeObjectOfClasses:forKey:", v40, @"settings"));
  id v14 = objc_msgSend( a3,  "swc_decodeObjectOfClass:forKey:",  objc_opt_class(NSNumber),  @"launchServicesDatabaseGeneration");
  v15 = (NSNumber *)objc_claimAutoreleasedReturnValue(v14);
  id v16 = objc_msgSend( a3,  "swc_decodeObjectOfClass:forKey:",  objc_opt_class(NSData),  @"enterpriseState");
  uint64_t v38 = objc_claimAutoreleasedReturnValue(v16);
  if (v12)
  {
    uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSOrderedSet);
    if ((objc_opt_isKindOfClass(v12, v17) & 1) == 0)
    {
LABEL_16:
      v24 = objc_alloc(&OBJC_CLASS___NSError);
      v54[0] = @"Line";
      v54[1] = @"Function";
      v55[0] = &off_10002A570;
      entries = (NSOrderedSet *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCDatabaseStorage initWithCoder:]"));
      v55[1] = entries;
      v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v55,  v54,  2LL));
      v26 = -[NSError initWithDomain:code:userInfo:]( v24,  "initWithDomain:code:userInfo:",  NSCocoaErrorDomain,  4864LL,  v25);
      [a3 failWithError:v26];

      goto LABEL_17;
    }

    +[SWCEntry canonicalizeEntries:](&OBJC_CLASS___SWCEntry, "canonicalizeEntries:", v12);
    v37 = v9;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    id v18 = v12;
    id v19 = [v18 countByEnumeratingWithState:&v47 objects:v56 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v48;
      while (2)
      {
        for (i = 0LL; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v48 != v20) {
            objc_enumerationMutation(v18);
          }
          if ((objc_opt_isKindOfClass(*(void *)(*((void *)&v47 + 1) + 8LL * (void)i), v6) & 1) == 0)
          {

            v9 = v37;
            goto LABEL_16;
          }
        }

        id v19 = [v18 countByEnumeratingWithState:&v47 objects:v56 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }

    v9 = v37;
    v22 = (NSOrderedSet *)v18;
  }

  else
  {
    v22 = objc_alloc_init(&OBJC_CLASS___NSOrderedSet);
  }

  entries = v5->_entries;
  v5->_entries = v22;
LABEL_17:

  if (v13)
  {
    uint64_t v43 = 0LL;
    v44 = &v43;
    uint64_t v45 = 0x2020000000LL;
    char v46 = _NSIsNSDictionary(v13);
    if (*((_BYTE *)v44 + 24)
      && (v42[0] = _NSConcreteStackBlock,
          v42[1] = 3221225472LL,
          v42[2] = sub_100016E78,
          v42[3] = &unk_100028F18,
          v42[4] = &v43,
          v42[5] = v39,
          [v13 enumerateKeysAndObjectsUsingBlock:v42],
          *((_BYTE *)v44 + 24)))
    {
      v27 = v13;
      settings = v5->_settings;
      v5->_settings = v27;
    }

    else
    {
      v29 = objc_alloc(&OBJC_CLASS___NSError);
      v52[0] = @"Line";
      v52[1] = @"Function";
      v53[0] = &off_10002A588;
      settings = (NSDictionary *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCDatabaseStorage initWithCoder:]"));
      v53[1] = settings;
      v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v53,  v52,  2LL));
      v31 = -[NSError initWithDomain:code:userInfo:]( v29,  "initWithDomain:code:userInfo:",  NSCocoaErrorDomain,  4864LL,  v30);
      [a3 failWithError:v31];
    }

    _Block_object_dispose(&v43, 8);
  }

  else
  {
    v32 = v5->_settings;
    v5->_settings = (NSDictionary *)&__NSDictionary0__struct;
  }

  launchServicesDatabaseGeneration = v5->_launchServicesDatabaseGeneration;
  v5->_launchServicesDatabaseGeneration = v15;
  v34 = v15;

  enterpriseState = v5->_enterpriseState;
  v5->_enterpriseState = (NSData *)v38;

LABEL_25:
  objc_autoreleasePoolPop(context);
  return v5;
}

- (int64_t)databaseVersion
{
  return self->_databaseVersion;
}

- (void)setDatabaseVersion:(int64_t)a3
{
  self->_databaseVersion = a3;
}

- (NSOrderedSet)entries
{
  return (NSOrderedSet *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setEntries:(id)a3
{
}

- (NSDictionary)settings
{
  return (NSDictionary *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setSettings:(id)a3
{
}

- (NSNumber)launchServicesDatabaseGeneration
{
  return (NSNumber *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setLaunchServicesDatabaseGeneration:(id)a3
{
}

- (NSData)enterpriseState
{
  return (NSData *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setEnterpriseState:(id)a3
{
}

- (void).cxx_destruct
{
}

@end