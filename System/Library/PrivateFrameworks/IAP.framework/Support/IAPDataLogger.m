@interface IAPDataLogger
+ (id)sanitizeString:(id)a3;
+ (unint64_t)sanitizeData:(unint64_t)a3;
+ (void)AggAccAttach:(id)a3 WithManufacturer:(id)a4;
+ (void)AggAccDetach:(id)a3 WithManufacturer:(id)a4 AndConnectionTime:(unint64_t)a5;
+ (void)PowerlogAccAttach:(id)a3;
+ (void)PowerlogAccDetach:(id)a3 AndConnectionTime:(unint64_t)a4;
+ (void)PowerlogEASession:(id)a3 forAccessory:(id)a4 forProtocolID:(unsigned __int8)a5 forPortType:(unsigned __int8)a6 isSessionOpen:(BOOL)a7;
@end

@implementation IAPDataLogger

+ (id)sanitizeString:(id)a3
{
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableCharacterSet);
  -[NSMutableCharacterSet formUnionWithCharacterSet:]( v4,  "formUnionWithCharacterSet:",  +[NSCharacterSet letterCharacterSet](&OBJC_CLASS___NSCharacterSet, "letterCharacterSet"));
  -[NSMutableCharacterSet formUnionWithCharacterSet:]( v4,  "formUnionWithCharacterSet:",  +[NSCharacterSet decimalDigitCharacterSet](&OBJC_CLASS___NSCharacterSet, "decimalDigitCharacterSet"));
  -[NSMutableCharacterSet addCharactersInString:](v4, "addCharactersInString:", @"_-.!");
  v5 = -[NSString initWithData:encoding:]( [NSString alloc],  "initWithData:encoding:",  [a3 dataUsingEncoding:1 allowLossyConversion:1],  1);
  v6 = -[NSArray componentsJoinedByString:]( -[NSString componentsSeparatedByCharactersInSet:]( v5,  "componentsSeparatedByCharactersInSet:",  -[NSMutableCharacterSet invertedSet](v4, "invertedSet")),  "componentsJoinedByString:",  &stru_10010A828);

  return v6;
}

+ (unint64_t)sanitizeData:(unint64_t)a3
{
  return 100 * (a3 / 0x64);
}

+ (void)AggAccAttach:(id)a3 WithManufacturer:(id)a4
{
}

+ (void)AggAccDetach:(id)a3 WithManufacturer:(id)a4 AndConnectionTime:(unint64_t)a5
{
  v7 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"accessory.usage.%@.%@",  [a1 sanitizeString:a4],  objc_msgSend(a1, "sanitizeString:", a3));
  v8.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&v8.tv_usec = 0xAAAAAAAAAAAAAAAALL;
  gettimeofday(&v8, 0LL);
  if (v8.tv_sec < a5) {
    __break(0x5515u);
  }
  else {
    ADClientPushValueForDistributionKey(v7, (double)(unint64_t)[a1 sanitizeData:v8.tv_sec - a5]);
  }
}

+ (void)PowerlogAccAttach:(id)a3
{
  v16[0] = IAPAppAccessoryNameKey;
  v16[1] = IAPAppAccessoryManufacturerKey;
  v16[2] = IAPAppAccessoryModelNumberKey;
  v16[3] = IAPAppAccessoryFirmwareRevisionKey;
  v16[4] = IAPAppAccessoryHardwareRevisionKey;
  v16[5] = IAPAppAccessoryProtocolsKey;
  v16[6] = IAPAppAccessoryPreferredAppKey;
  v16[7] = IAPAppAccessoryConnectionTimeInSecKey;
  v4 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 8LL);
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8LL * (void)i);
        if ([a3 objectForKey:v10]) {
          -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", [a3 objectForKey:v10], v10);
        }
      }

      id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v7);
  }

  -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", &__kCFBooleanTrue, IAPAppAccessoryConnectedKey);
  PLLogRegisteredEvent(37LL, @"iAPAccessoryEvent", v5, 0LL);
}

+ (void)PowerlogAccDetach:(id)a3 AndConnectionTime:(unint64_t)a4
{
  v20[0] = IAPAppAccessoryNameKey;
  v20[1] = IAPAppAccessoryManufacturerKey;
  v20[2] = IAPAppAccessoryModelNumberKey;
  v20[3] = IAPAppAccessoryFirmwareRevisionKey;
  v20[4] = IAPAppAccessoryHardwareRevisionKey;
  v20[5] = IAPAppAccessoryProtocolsKey;
  v20[6] = IAPAppAccessoryPreferredAppKey;
  v20[7] = IAPAppAccessoryConnectionTimeInSecKey;
  id v6 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 8LL);
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)i);
        if ([a3 objectForKey:v12]) {
          -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", [a3 objectForKey:v12], v12);
        }
      }

      id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    }

    while (v9);
  }

  v14.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&v14.tv_usec = 0xAAAAAAAAAAAAAAAALL;
  gettimeofday(&v14, 0LL);
  if (v14.tv_sec < a4) {
    __break(0x5515u);
  }
  __int128 v13 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", v14.tv_sec - a4);
  -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v13, IAPAppAccessoryUsageTimeInSecsKey);
  -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", &__kCFBooleanFalse, IAPAppAccessoryConnectedKey);
  PLLogRegisteredEvent(37LL, @"iAPAccessoryEvent", v7, 0LL);
}

+ (void)PowerlogEASession:(id)a3 forAccessory:(id)a4 forProtocolID:(unsigned __int8)a5 forPortType:(unsigned __int8)a6 isSessionOpen:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v8 = a6;
  uint64_t v9 = a5;
  uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (a3) {
    __int128 v13 = (const __CFString *)a3;
  }
  else {
    __int128 v13 = @"Unknown process";
  }
  v32 = v12;
  -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v13, IAPEASessionAppBundleIDKey);
  id v14 = [a4 objectForKey:IAPAppAccessoryProtocolsKey];
  id v15 = [v14 keyEnumerator];
  while (1)
  {
    id v16 = [v15 nextObject];
    if (!v16) {
      break;
    }
    id v17 = v16;
    if (objc_msgSend( objc_msgSend(v14, "objectForKey:", v16),  "isEqualToNumber:",  +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v9)))
    {
      -[NSMutableDictionary setObject:forKey:](v32, "setObject:forKey:", v17, IAPEASessionProtocolKey);
      __int128 v18 = +[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v17);
      goto LABEL_9;
    }
  }

  __int128 v18 = 0LL;
LABEL_9:
  -[NSMutableDictionary setObject:forKey:]( v32,  "setObject:forKey:",  [a4 objectForKey:IAPAppAccessoryNameKey],  IAPAppAccessoryNameKey);
  v19 = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v8);
  -[NSMutableDictionary setObject:forKey:](v32, "setObject:forKey:", v19, IAPAccessoryPortTypeKey);
  if (v7)
  {
    -[NSMutableDictionary setObject:forKey:](v32, "setObject:forKey:", &__kCFBooleanTrue, IAPEASessionIsSessionOpenKey);
    if (!a4 || !v18) {
      goto LABEL_21;
    }
    v33.__darwin_time_t tv_sec = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&v33.tv_usec = 0xAAAAAAAAAAAAAAAALL;
    gettimeofday(&v33, 0LL);
    uint64_t v20 = IAPEASessionOpenedTimesKey;
    v21 = (NSMutableDictionary *)[a4 objectForKey:IAPEASessionOpenedTimesKey];
    if (!v21)
    {
      v31 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      -[NSMutableDictionary setObject:forKey:]( v31,  "setObject:forKey:",  +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", v33.tv_sec),  v18);
      [a4 setObject:v31 forKey:v20];

      goto LABEL_21;
    }

    v22 = v21;
    v23 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", v33.tv_sec);
    v24 = v22;
    v25 = v18;
LABEL_20:
    -[NSMutableDictionary setObject:forKey:](v24, "setObject:forKey:", v23, v25);
LABEL_21:
    PLLogRegisteredEvent(37LL, @"AppAccessoryEvent", v32, 0LL);

    return;
  }

  -[NSMutableDictionary setObject:forKey:](v32, "setObject:forKey:", &__kCFBooleanFalse, IAPEASessionIsSessionOpenKey);
  id v26 = [a4 objectForKey:IAPEASessionOpenedTimesKey];
  if (v26) {
    BOOL v27 = v18 == 0LL;
  }
  else {
    BOOL v27 = 1;
  }
  if (v27) {
    goto LABEL_21;
  }
  v28 = v26;
  v33.__darwin_time_t tv_sec = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&v33.tv_usec = 0xAAAAAAAAAAAAAAAALL;
  gettimeofday(&v33, 0LL);
  __darwin_time_t tv_sec = v33.tv_sec;
  id v30 = objc_msgSend(objc_msgSend(v28, "objectForKey:", v18), "longValue");
  if (!__OFSUB__(tv_sec, v30))
  {
    v23 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", tv_sec - (void)v30);
    v25 = (NSString *)IAPEASessionUsageTimeInSecsKey;
    v24 = v32;
    goto LABEL_20;
  }

  __break(0x5515u);
}

@end