@interface FAMarqueeUpdateHandler
- (void)updateMarqueeCache;
@end

@implementation FAMarqueeUpdateHandler

- (void)updateMarqueeCache
{
  uint64_t v2 = _FALogSystem(self, a2);
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Requesting image marquee creation", v5, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v4 setBool:1 forKey:FAFamilyMarqueeHasEverBeenCalled];
}

@end