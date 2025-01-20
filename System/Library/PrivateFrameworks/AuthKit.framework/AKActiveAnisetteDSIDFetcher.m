@interface AKActiveAnisetteDSIDFetcher
+ (unint64_t)_activeAnisetteDSIDWithEnvironment:(unint64_t)a3;
+ (unint64_t)activeAnisettDSIDFromCurrentIDMSEnvironment;
+ (unint64_t)activeAnisettDSIDFromLastKnownIDMSEnvironment;
@end

@implementation AKActiveAnisetteDSIDFetcher

+ (unint64_t)activeAnisettDSIDFromLastKnownIDMSEnvironment
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLBag bagForAltDSID:](&OBJC_CLASS___AKURLBag, "bagForAltDSID:", 0LL));
  id v4 = [v3 lastKnownIDMSEnvironment];

  return (unint64_t)_[a1 _activeAnisetteDSIDWithEnvironment:v4];
}

+ (unint64_t)activeAnisettDSIDFromCurrentIDMSEnvironment
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLBag bagForAltDSID:](&OBJC_CLASS___AKURLBag, "bagForAltDSID:", 0LL));
  id v4 = [v3 IDMSEnvironment];

  return (unint64_t)_[a1 _activeAnisetteDSIDWithEnvironment:v4];
}

+ (unint64_t)_activeAnisetteDSIDWithEnvironment:(unint64_t)a3
{
  if (!a3) {
    return -2LL;
  }
  uint64_t v4 = _AKTrafficLogSubsystem(a1);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (a3 > 3)
  {
    if (v6) {
      sub_100139C50(v5, v7, v8, v9, v10, v11, v12, v13);
    }
    unint64_t v14 = -5LL;
  }

  else
  {
    if (v6) {
      sub_100139C1C(v5, v7, v8, v9, v10, v11, v12, v13);
    }
    unint64_t v14 = -3LL;
  }

  return v14;
}

@end