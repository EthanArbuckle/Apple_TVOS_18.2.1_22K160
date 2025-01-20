@interface WiFiLocaleManagerUser
- (BOOL)isDefaultCountryCode:(id)a3;
- (WiFiLocaleManagerUser)initWithContext:(__WiFiManager *)a3;
- (double)getLocaleLastUpdatedTime;
- (id)get80211dCountryCodes:(unint64_t *)a3;
- (id)getCompanionCountryCode;
- (id)getCountryCodeFromUserDefaults;
- (id)getDeviceCountryCode;
- (id)getLocaleCountryCode;
- (id)getPeerCountryCode;
- (int)getLocaleSource;
- (unsigned)setDeviceCountryCode:(id)a3;
- (unsigned)setUserDefaultCountryCode:(id)a3;
- (unsigned)suspendLocaleCheck;
- (void)dealloc;
- (void)determineAndSetLocale:(unsigned __int8)a3;
- (void)setLocaleTestParams:(id)a3;
- (void)update80211dCountryCodes:(id)a3;
- (void)updatePeerCountryCode:(id)a3;
@end

@implementation WiFiLocaleManagerUser

- (WiFiLocaleManagerUser)initWithContext:(__WiFiManager *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___WiFiLocaleManagerUser;
  v4 = -[WiFiLocaleManagerUser init](&v9, "init");
  v5 = v4;
  if (v4
    && (v4->_manager = a3, v6 = objc_alloc_init(&OBJC_CLASS___WiFiLocaleManager), (v5->_localeManager = v6) != 0LL))
  {
    -[WiFiLocaleManager setDelegate:](v6, "setDelegate:", v5);
    v7 = -[NSCountedSet initWithCapacity:](objc_alloc(&OBJC_CLASS___NSCountedSet), "initWithCapacity:", 0LL);
    v5->_countryCodeIECount = 0LL;
    v5->_peerCountryCode = 0LL;
    v5->_countryCodeList = v7;
  }

  else
  {

    return 0LL;
  }

  return v5;
}

- (void)dealloc
{
  self->_countryCodeList = 0LL;
  self->_localeManager = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___WiFiLocaleManagerUser;
  -[WiFiLocaleManagerUser dealloc](&v3, "dealloc");
}

- (void)determineAndSetLocale:(unsigned __int8)a3
{
}

- (int)getLocaleSource
{
  return -[WiFiLocaleManager getLocaleSource](self->_localeManager, "getLocaleSource");
}

- (double)getLocaleLastUpdatedTime
{
  return result;
}

- (id)getLocaleCountryCode
{
  return -[WiFiLocaleManager getLocaleCountryCode](self->_localeManager, "getLocaleCountryCode");
}

- (BOOL)isDefaultCountryCode:(id)a3
{
  return -[WiFiLocaleManager isDefaultCountryCode:](self->_localeManager, "isDefaultCountryCode:", a3);
}

- (void)update80211dCountryCodes:(id)a3
{
  id v4 = [a3 objectForKey:@"scanResults"];
  if ([v4 count])
  {
    -[NSCountedSet removeAllObjects](self->_countryCodeList, "removeAllObjects");
    self->_countryCodeIECount = 0LL;
  }

  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = objc_msgSend( objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v8), "objectForKey:", @"80211D_IE"),  "objectForKey:",  @"IE_KEY_80211D_COUNTRY_CODE");
        if (v9)
        {
          -[NSCountedSet addObject:](self->_countryCodeList, "addObject:", [v9 uppercaseString]);
          ++self->_countryCodeIECount;
        }

        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v6);
  }

- (void)updatePeerCountryCode:(id)a3
{
  self->_peerCountryCode = (NSString *)[a3 copy];
  unsigned int v5 = -[WiFiLocaleManager isDefaultCountryCode:]( self->_localeManager,  "isDefaultCountryCode:",  -[WiFiLocaleManager getLocaleCountryCode](self->_localeManager, "getLocaleCountryCode"));
  if (self->_peerCountryCode) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6) {
    -[WiFiLocaleManager determineAndSetLocale:](self->_localeManager, "determineAndSetLocale:", 1LL);
  }
}

- (void)setLocaleTestParams:(id)a3
{
}

- (unsigned)suspendLocaleCheck
{
  objc_super v3 = (dispatch_queue_s *)sub_10006B4D8((uint64_t)self->_manager);
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 0;
  if (self->_manager) {
    BOOL v4 = v3 == 0LL;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    unsigned __int8 v5 = 0;
  }

  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10013D674;
    v7[3] = &unk_1001E5AA0;
    v7[4] = self;
    v7[5] = &v8;
    dispatch_sync(v3, v7);
    unsigned __int8 v5 = *((_BYTE *)v9 + 24);
  }

  _Block_object_dispose(&v8, 8);
  return v5;
}

- (id)getDeviceCountryCode
{
  objc_super v3 = (dispatch_queue_s *)sub_10006B4D8((uint64_t)self->_manager);
  uint64_t v12 = 0LL;
  __int128 v13 = &v12;
  uint64_t v14 = 0x3052000000LL;
  v15 = sub_10013D89C;
  v16 = sub_10013D8AC;
  v17 = (NSMutableString *)0xAAAAAAAAAAAAAAAALL;
  v17 = -[NSMutableString initWithString:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithString:",  &stru_1001EB6E0);
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 0;
  if (self->_manager && v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10013D8B8;
    block[3] = &unk_1001E68B0;
    block[4] = self;
    block[5] = &v8;
    block[6] = &v12;
    dispatch_sync(v3, block);
    if (*((_BYTE *)v9 + 24))
    {
      if (![(id)v13[5] caseInsensitiveCompare:@"XZ"]
        || ![(id)v13[5] caseInsensitiveCompare:@"X0"]
        || ![(id)v13[5] caseInsensitiveCompare:@"X2"]
        || ![(id)v13[5] caseInsensitiveCompare:@"X3"])
      {
        [(id)v13[5] setString:&stru_1001EB6E0];
      }
    }

    else
    {
      BOOL v6 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [(id)qword_100219F60 WFLog:3 message:"Error: Unable to get locale in use"];
      }
      objc_autoreleasePoolPop(v6);
    }
  }

  id v4 = (id)v13[5];
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v4;
}

- (unsigned)setUserDefaultCountryCode:(id)a3
{
  unsigned __int8 v5 = (dispatch_queue_s *)sub_10006B4D8((uint64_t)self->_manager);
  manager = self->_manager;
  if (manager) {
    BOOL v7 = v5 == 0LL;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    sub_10006DC84((uint64_t)manager);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10013D988;
    v9[3] = &unk_1001E2778;
    v9[4] = a3;
    v9[5] = self;
    dispatch_sync(v5, v9);
  }

  return 1;
}

- (unsigned)setDeviceCountryCode:(id)a3
{
  unsigned __int8 v5 = (dispatch_queue_s *)sub_10006B4D8((uint64_t)self->_manager);
  unsigned __int8 v6 = -[WiFiLocaleManager isDefaultCountryCode:](self->_localeManager, "isDefaultCountryCode:", a3);
  uint64_t v12 = 0LL;
  __int128 v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 0;
  if (self->_manager) {
    BOOL v7 = v5 == 0LL;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    unsigned __int8 v8 = 0;
  }

  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10013DB64;
    v10[3] = &unk_1001E68D8;
    v10[5] = a3;
    v10[6] = &v12;
    v10[4] = self;
    char v11 = v6 ^ 1;
    dispatch_sync(v5, v10);
    unsigned __int8 v8 = *((_BYTE *)v13 + 24);
  }

  _Block_object_dispose(&v12, 8);
  return v8;
}

- (id)getCompanionCountryCode
{
  objc_super v3 = (dispatch_queue_s *)sub_10006B4D8((uint64_t)self->_manager);
  uint64_t v12 = 0LL;
  __int128 v13 = &v12;
  uint64_t v14 = 0x3052000000LL;
  char v15 = sub_10013D89C;
  v16 = sub_10013D8AC;
  v17 = (NSMutableString *)0xAAAAAAAAAAAAAAAALL;
  v17 = -[NSMutableString initWithString:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithString:",  &stru_1001EB6E0);
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 0;
  if (self->_manager && v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10013DDA0;
    block[3] = &unk_1001E68B0;
    block[4] = self;
    block[5] = &v8;
    block[6] = &v12;
    dispatch_sync(v3, block);
    if (*((_BYTE *)v9 + 24))
    {
      if (![(id)v13[5] caseInsensitiveCompare:@"XZ"]
        || ![(id)v13[5] caseInsensitiveCompare:@"X0"]
        || ![(id)v13[5] caseInsensitiveCompare:@"X2"]
        || ![(id)v13[5] caseInsensitiveCompare:@"X3"])
      {
        [(id)v13[5] setString:&stru_1001EB6E0];
      }
    }

    else
    {
      unsigned __int8 v6 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [(id)qword_100219F60 WFLog:3 message:"Error: Unable to get companion country code"];
      }
      objc_autoreleasePoolPop(v6);
    }
  }

  id v4 = (id)v13[5];
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v4;
}

- (id)get80211dCountryCodes:(unint64_t *)a3
{
  unsigned __int8 v5 = (dispatch_queue_s *)sub_10006B4D8((uint64_t)self->_manager);
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x3052000000LL;
  v18 = sub_10013D89C;
  v19 = sub_10013D8AC;
  unint64_t v20 = 0xAAAAAAAAAAAAAAAALL;
  unsigned __int8 v6 = -[NSCountedSet initWithCapacity:](objc_alloc(&OBJC_CLASS___NSCountedSet), "initWithCapacity:", 0LL);
  unint64_t v7 = 0LL;
  unint64_t v20 = (unint64_t)v6;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  uint64_t v14 = 0LL;
  if (self->_manager && v5)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10013DF30;
    block[3] = &unk_1001E68B0;
    block[4] = self;
    block[5] = &v15;
    block[6] = &v11;
    dispatch_sync(v5, block);
    unint64_t v7 = v12[3];
  }

  *a3 = v7;
  id v8 = (id)v16[5];
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  return v8;
}

- (id)getPeerCountryCode
{
  return self->_peerCountryCode;
}

- (id)getCountryCodeFromUserDefaults
{
  objc_super v3 = (dispatch_queue_s *)sub_10006B4D8((uint64_t)self->_manager);
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3052000000LL;
  uint64_t v15 = sub_10013D89C;
  v16 = sub_10013D8AC;
  uint64_t v17 = (NSMutableString *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v17 = -[NSMutableString initWithString:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithString:",  &stru_1001EB6E0);
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 0;
  if (self->_manager && v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10013E1A4;
    block[3] = &unk_1001E68B0;
    block[4] = self;
    block[5] = &v8;
    block[6] = &v12;
    dispatch_sync(v3, block);
    if (*((_BYTE *)v9 + 24))
    {
      if (![(id)v13[5] caseInsensitiveCompare:@"XZ"]
        || ![(id)v13[5] caseInsensitiveCompare:@"X0"]
        || ![(id)v13[5] caseInsensitiveCompare:@"X2"]
        || ![(id)v13[5] caseInsensitiveCompare:@"X3"])
      {
        [(id)v13[5] setString:&stru_1001EB6E0];
      }

      id v4 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [(id)qword_100219F60 WFLog:3, "%s WiFiCC : country code from user defaults [%@]", "-[WiFiLocaleManagerUser getCountryCodeFromUserDefaults]", v13[5] message];
      }
    }

    else
    {
      id v4 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [(id)qword_100219F60 WFLog:3 message:"Error: Unable to get recently used country code"];
      }
    }

    objc_autoreleasePoolPop(v4);
  }

  id v5 = (id)v13[5];
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v5;
}

@end