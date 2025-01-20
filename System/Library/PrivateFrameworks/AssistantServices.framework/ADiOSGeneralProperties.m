@interface ADiOSGeneralProperties
- (BOOL)_getHasPairedAppleWatch;
- (BOOL)_getHasTvOSDeviceInHome;
- (id)getODDiOSGeneralProperties;
@end

@implementation ADiOSGeneralProperties

- (id)getODDiOSGeneralProperties
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315138;
    v7 = "-[ADiOSGeneralProperties getODDiOSGeneralProperties]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v6, 0xCu);
  }

  id v4 = objc_alloc_init(&OBJC_CLASS___ODDSiriSchemaODDiOSGeneralProperties);
  objc_msgSend( v4,  "setHasTvOSDeviceInHome:",  -[ADiOSGeneralProperties _getHasTvOSDeviceInHome](self, "_getHasTvOSDeviceInHome"));
  objc_msgSend( v4,  "setHasPairedAppleWatch:",  -[ADiOSGeneralProperties _getHasPairedAppleWatch](self, "_getHasPairedAppleWatch"));
  return v4;
}

- (BOOL)_getHasTvOSDeviceInHome
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned __int8 v3 = [v2 deviceHasAtvOrHomepodInHome];

  return v3;
}

- (BOOL)_getHasPairedAppleWatch
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned __int8 v3 = [v2 deviceHasPairedWatches];

  return v3;
}

@end