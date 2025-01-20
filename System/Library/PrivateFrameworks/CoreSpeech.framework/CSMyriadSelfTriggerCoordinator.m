@interface CSMyriadSelfTriggerCoordinator
- (CSMyriadSelfTriggerCoordinatorDelegate)delegate;
- (void)selfTriggerDetector:(id)a3 didDetectSelfTrigger:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation CSMyriadSelfTriggerCoordinator

- (void)selfTriggerDetector:(id)a3 didDetectSelfTrigger:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](&OBJC_CLASS___NSMutableData, "dataWithCapacity:", 13LL));
  __int16 v19 = 0;
  __int16 v18 = 0;
  char v17 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kVTEItriggerEndMachTime]);

  id v8 = [v7 unsignedIntegerValue];
  objc_msgSend(v6, "appendBytes:length:", &v19, 2, v8);
  [v6 appendBytes:&v18 length:1];
  [v6 appendBytes:(char *)&v18 + 1 length:1];
  [v6 appendBytes:&v16 length:8];
  [v6 appendBytes:&v17 length:1];
  v9 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[CSMyriadSelfTriggerCoordinator selfTriggerDetector:didDetectSelfTrigger:]";
    __int16 v22 = 2114;
    v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Advert data: %{public}@", buf, 0x16u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 myriadHashFilePath]);

  if (([v6 writeToFile:v11 atomically:0] & 1) == 0)
  {
    v12 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[CSMyriadSelfTriggerCoordinator selfTriggerDetector:didDetectSelfTrigger:]";
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s advert data write failed", buf, 0xCu);
    }
  }

  notify_post("com.apple.siri.corespeech.selftrigger");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v14 = objc_opt_respondsToSelector( WeakRetained,  "CSMyriadSelfTriggerCoordinator:didGenerateMyriadPHashForSelfTrigger:");

  if ((v14 & 1) != 0)
  {
    id v15 = objc_loadWeakRetained((id *)&self->_delegate);
    [v15 CSMyriadSelfTriggerCoordinator:self didGenerateMyriadPHashForSelfTrigger:v6];
  }
}

- (CSMyriadSelfTriggerCoordinatorDelegate)delegate
{
  return (CSMyriadSelfTriggerCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end