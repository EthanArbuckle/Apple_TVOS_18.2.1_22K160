@interface CSDarwinPreventSystemSleepManager
- (CSDarwinPreventSystemSleepManager)initWithTimeout:(double)a3;
- (CSDarwinPreventSystemSleepManager)initWithTimeout:(double)a3 preferences:(id)a4;
- (CSFPreferences)preferences;
- (CSPreventSystemSleepPowerAssertion)preventSystemSleepPowerAssertion;
- (double)assertionTimeoutInterval;
- (int64_t)currentState;
- (void)_acquirePreventSystemSleepAssertionWithTimeout:(id)a3;
- (void)acquireAssertion;
- (void)acquireAssertionForActiveUser;
- (void)acquireAssertionForIdleUser;
- (void)dealloc;
- (void)releasePreventSystemSleepAssertion;
- (void)setCurrentState:(int64_t)a3;
- (void)setPreferences:(id)a3;
- (void)setPreventSystemSleepPowerAssertion:(id)a3;
@end

@implementation CSDarwinPreventSystemSleepManager

- (CSDarwinPreventSystemSleepManager)initWithTimeout:(double)a3 preferences:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CSDarwinPreventSystemSleepManager;
  v8 = -[CSDarwinPreventSystemSleepManager init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_assertionTimeoutInterval = a3;
    objc_storeStrong((id *)&v8->_preferences, a4);
  }

  return v9;
}

- (CSDarwinPreventSystemSleepManager)initWithTimeout:(double)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  v6 = -[CSDarwinPreventSystemSleepManager initWithTimeout:preferences:](self, "initWithTimeout:preferences:", v5, a3);

  return v6;
}

- (void)_acquirePreventSystemSleepAssertionWithTimeout:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc(&OBJC_CLASS___CSPreventSystemSleepPowerAssertion);
  id v6 = [v4 unsignedLongLongValue];

  id v7 = -[CSPreventSystemSleepPowerAssertion initWithTimeOut:](v5, "initWithTimeOut:", (double)(unint64_t)v6);
  v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    objc_super v11 = "-[CSDarwinPreventSystemSleepManager _acquirePreventSystemSleepAssertionWithTimeout:]";
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s Releasing old assertion",  (uint8_t *)&v10,  0xCu);
  }

  -[CSDarwinPreventSystemSleepManager releasePreventSystemSleepAssertion](self, "releasePreventSystemSleepAssertion");
  preventSystemSleepPowerAssertion = self->_preventSystemSleepPowerAssertion;
  self->_preventSystemSleepPowerAssertion = v7;
}

- (void)releasePreventSystemSleepAssertion
{
  preventSystemSleepPowerAssertion = self->_preventSystemSleepPowerAssertion;
  self->_preventSystemSleepPowerAssertion = 0LL;
}

- (void)acquireAssertion
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_assertionTimeoutInterval));
  -[CSDarwinPreventSystemSleepManager _acquirePreventSystemSleepAssertionWithTimeout:]( self,  "_acquirePreventSystemSleepAssertionWithTimeout:",  v3);
}

- (void)acquireAssertionForActiveUser
{
  id v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[CSDarwinPreventSystemSleepManager acquireAssertionForActiveUser]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s Acquiring assertion for active user",  (uint8_t *)&v5,  0xCu);
  }

  -[CSFPreferences setIdleUserPreventSleepAssertionAcquitionDate:]( self->_preferences,  "setIdleUserPreventSleepAssertionAcquitionDate:",  0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  self->_assertionTimeoutInterval));
  -[CSDarwinPreventSystemSleepManager _acquirePreventSystemSleepAssertionWithTimeout:]( self,  "_acquirePreventSystemSleepAssertionWithTimeout:",  v4);
}

- (void)acquireAssertionForIdleUser
{
  id v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136315138;
    v18 = "-[CSDarwinPreventSystemSleepManager acquireAssertionForIdleUser]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v17, 0xCu);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[CSFPreferences getIdleUserPreventSleepAssertionAcquitionDate]( self->_preferences,  "getIdleUserPreventSleepAssertionAcquitionDate"));
  if (v4)
  {
    int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v5 timeIntervalSinceReferenceDate];
    double v7 = v6;
    [v4 timeIntervalSinceReferenceDate];
    double v9 = v7 - v8;
    int v10 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315906;
      v18 = "-[CSDarwinPreventSystemSleepManager acquireAssertionForIdleUser]";
      __int16 v19 = 2112;
      v20 = v4;
      __int16 v21 = 2112;
      v22 = v5;
      __int16 v23 = 2048;
      double v24 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s current date: %@, last assertion acquired date: %@, time difference: %f seconds",  (uint8_t *)&v17,  0x2Au);
    }

    if (v9 <= 0.0 || (double assertionTimeoutInterval = self->_assertionTimeoutInterval, v9 >= assertionTimeoutInterval))
    {
      v13 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136315138;
        v18 = "-[CSDarwinPreventSystemSleepManager acquireAssertionForIdleUser]";
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s The user is idle beyond the timeout interval. Ignoring acquiring assertion",  (uint8_t *)&v17,  0xCu);
      }

      -[CSDarwinPreventSystemSleepManager releasePreventSystemSleepAssertion]( self,  "releasePreventSystemSleepAssertion");
    }

    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  assertionTimeoutInterval - v9));
      -[CSDarwinPreventSystemSleepManager _acquirePreventSystemSleepAssertionWithTimeout:]( self,  "_acquirePreventSystemSleepAssertionWithTimeout:",  v12);
    }
  }

  else
  {
    v14 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315138;
      v18 = "-[CSDarwinPreventSystemSleepManager acquireAssertionForIdleUser]";
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s last assertion acquired date is nil. Acquiring asssertion",  (uint8_t *)&v17,  0xCu);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  self->_assertionTimeoutInterval));
    -[CSDarwinPreventSystemSleepManager _acquirePreventSystemSleepAssertionWithTimeout:]( self,  "_acquirePreventSystemSleepAssertionWithTimeout:",  v15);

    preferences = self->_preferences;
    int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[CSFPreferences setIdleUserPreventSleepAssertionAcquitionDate:]( preferences,  "setIdleUserPreventSleepAssertionAcquitionDate:",  v5);
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSDarwinPreventSystemSleepManager;
  -[CSDarwinPreventSystemSleepManager dealloc](&v3, "dealloc");
}

- (double)assertionTimeoutInterval
{
  return self->_assertionTimeoutInterval;
}

- (CSPreventSystemSleepPowerAssertion)preventSystemSleepPowerAssertion
{
  return self->_preventSystemSleepPowerAssertion;
}

- (void)setPreventSystemSleepPowerAssertion:(id)a3
{
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(int64_t)a3
{
  self->_currentState = a3;
}

- (CSFPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
}

- (void).cxx_destruct
{
}

@end