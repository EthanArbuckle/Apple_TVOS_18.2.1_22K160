@interface ArcadeRepair
+ (BOOL)shouldAttemptToRepairApplication:(id)a3 options:(id)a4 logKey:(id)a5;
- (ApplicationRepairDelegate)delegate;
- (BOOL)repairApplication:(id)a3 error:(id *)a4;
- (NSArray)repairedBundleIDs;
- (NSString)repairType;
- (_TtC9appstored6LogKey)logKey;
- (int)fairPlayStatus;
- (void)setDelegate:(id)a3;
- (void)setLogKey:(id)a3;
@end

@implementation ArcadeRepair

- (ApplicationRepairDelegate)delegate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0x10000LL);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);
  return (ApplicationRepairDelegate *)WeakRetained;
}

- (int)fairPlayStatus
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0x10000LL);
  LODWORD(v2) = v2->_discoveredFairPlayStatus;
  os_unfair_lock_unlock(p_lock);
  return (int)v2;
}

- (_TtC9appstored6LogKey)logKey
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0x10000LL);
  v4 = self->lock_logKey;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setLogKey:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options(p_lock, 0x10000LL);
  v6 = (_TtC9appstored6LogKey *)objc_claimAutoreleasedReturnValue([v5 prependingCategory:@"Arcade"]);

  lock_logKey = self->lock_logKey;
  self->lock_logKey = v6;

  os_unfair_lock_unlock(p_lock);
}

- (NSArray)repairedBundleIDs
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0x10000LL);
  id v4 = -[NSArray copy](self->_repairedBundleIDs, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSString)repairType
{
  return (NSString *)@"Arcade";
}

+ (BOOL)shouldAttemptToRepairApplication:(id)a3 options:(id)a4 logKey:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ams_activeiTunesAccount"));
  if (v11)
  {
  }

  else
  {
    unsigned int v12 = [v7 isArcade];

    if (v12)
    {
      uint64_t v13 = ASDLogHandleForCategory(28LL);
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 138412290;
        id v24 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[Arcade/%@] Will start arcade recovery to sign in",  (uint8_t *)&v23,  0xCu);
      }

      BOOL v15 = 1;
      goto LABEL_20;
    }
  }

  if (![v7 isArcade])
  {
LABEL_19:
    BOOL v15 = 0;
    goto LABEL_20;
  }

  unsigned int v16 = sub_1001BC1E8((uint64_t)&OBJC_CLASS___ArcadeRepair, v7, v8);
  unsigned int v17 = v16;
  if (v16 + 42587 <= 3 && v16 != -42586 || v16 == -42110 || v16 == -42112)
  {
    uint64_t v18 = ASDLogHandleForCategory(28LL);
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    int v23 = 138412546;
    id v24 = v9;
    __int16 v25 = 1024;
    unsigned int v26 = v17;
    v20 = "[Arcade/%@] Will start arcade fairplay recovery with fairplayStatus: %d";
    goto LABEL_14;
  }

  uint64_t v22 = ASDLogHandleForCategory(28LL);
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412546;
    id v24 = v9;
    __int16 v25 = 1024;
    unsigned int v26 = v17;
    v20 = "[Arcade/%@] Will not attempt arcade recovery with fairplayStatus: %d";
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v23, 0x12u);
  }

- (BOOL)repairApplication:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date", a3, a4));
  [v5 timeIntervalSinceReferenceDate];
  self->_double startTime = v6;

  uint64_t v7 = ASDLogHandleForCategory(28LL);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ArcadeRepair logKey](self, "logKey"));
    int v19 = 138412290;
    v20 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[%@] Started arcade fairplay recovery",  (uint8_t *)&v19,  0xCu);
  }

  int v10 = sub_1001BC480((uint64_t)self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v11 timeIntervalSinceReferenceDate];
  double v13 = v12;
  double startTime = self->_startTime;

  uint64_t v15 = ASDLogHandleForCategory(28LL);
  unsigned int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(-[ArcadeRepair logKey](self, "logKey"));
    int v19 = 138412802;
    v20 = v17;
    __int16 v21 = 1024;
    int v22 = v10;
    __int16 v23 = 2048;
    double v24 = v13 - startTime;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "[%@] Arcade fairplay recovery complete with result: %d elapsedTime: %f",  (uint8_t *)&v19,  0x1Cu);
  }

  return v10;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end