@interface ADDictationOnDeviceSampling
+ (id)_readDictationSampledPlist;
+ (id)sharedManager;
- (ADDictationOnDeviceSampling)init;
- (BOOL)isRequestConsideredForSampling;
- (BOOL)isRequestSelectedForSampling;
- (BOOL)isSamplingDateCurrent;
- (NSDate)currentSamplingDate;
- (NSMutableDictionary)dictationSamplingVaribles;
- (OS_dispatch_queue)fileQueue;
- (int64_t)numberOfRequestsTillNow;
- (void)_createDictationSampledPlistIfItDoesNotExist;
- (void)_writeDictationSamplingVariablesToFile:(id)a3;
- (void)createDictationSampledPlistIfItDoesNotExist;
- (void)decrementRequestCount;
- (void)incrementRequestCount;
- (void)resetRequestCount;
- (void)setCurrentSamplingDate:(id)a3;
- (void)setDictationSamplingVaribles:(id)a3;
- (void)setFileQueue:(id)a3;
- (void)setIsRequestConsideredForSampling:(BOOL)a3;
- (void)setNumberOfRequestsTillNow:(int64_t)a3;
- (void)setRequestCount:(int64_t)a3;
- (void)updateDateToCurrent;
- (void)updateRequestCountWithFlag:(BOOL)a3;
@end

@implementation ADDictationOnDeviceSampling

- (ADDictationOnDeviceSampling)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___ADDictationOnDeviceSampling;
  v2 = -[ADDictationOnDeviceSampling init](&v16, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("ADDictationOnDeviceSampling file queue", v4);
    fileQueue = v2->_fileQueue;
    v2->_fileQueue = (OS_dispatch_queue *)v5;

    id v7 = [(id)objc_opt_class(v2) _readDictationSampledPlist];
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    dictationSamplingVaribles = v2->_dictationSamplingVaribles;
    v2->_dictationSamplingVaribles = (NSMutableDictionary *)v8;

    if (-[NSMutableDictionary count](v2->_dictationSamplingVaribles, "count"))
    {
      v10 = v2->_dictationSamplingVaribles;
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[AFDictationSamplingUtilities sampledCurrentSamplingDateKey]( &OBJC_CLASS___AFDictationSamplingUtilities,  "sampledCurrentSamplingDateKey"));
      uint64_t v12 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v10, "objectForKey:", v11));
      currentSamplingDate = v2->_currentSamplingDate;
      v2->_currentSamplingDate = (NSDate *)v12;

      v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( v2->_dictationSamplingVaribles,  "objectForKey:",  @"numberOfRequestsTillNow"));
      v2->_numberOfRequestsTillNow = (int64_t)[v14 integerValue];
    }

    else
    {
      -[ADDictationOnDeviceSampling updateDateToCurrent](v2, "updateDateToCurrent");
      -[ADDictationOnDeviceSampling resetRequestCount](v2, "resetRequestCount");
    }
  }

  return v2;
}

- (void)resetRequestCount
{
}

- (void)incrementRequestCount
{
}

- (void)updateRequestCountWithFlag:(BOOL)a3
{
  self->_isRequestConsideredForSampling = a3;
  if (a3) {
    -[ADDictationOnDeviceSampling incrementRequestCount](self, "incrementRequestCount");
  }
}

- (void)decrementRequestCount
{
  if (self->_isRequestConsideredForSampling)
  {
    int64_t numberOfRequestsTillNow = self->_numberOfRequestsTillNow;
    if (numberOfRequestsTillNow >= 1)
    {
      self->_int64_t numberOfRequestsTillNow = numberOfRequestsTillNow - 1;
      -[ADDictationOnDeviceSampling setRequestCount:](self, "setRequestCount:");
      dispatch_queue_attr_t v3 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v4 = 136315138;
        dispatch_queue_t v5 = "-[ADDictationOnDeviceSampling decrementRequestCount]";
        _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s Dictation Sampling: Done decrementing total number of dictation requests by 1, for the current sampling date.",  (uint8_t *)&v4,  0xCu);
      }
    }
  }

- (void)setRequestCount:(int64_t)a3
{
  self->_int64_t numberOfRequestsTillNow = a3;
  int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_dictationSamplingVaribles,  "setObject:forKeyedSubscript:",  v4,  @"numberOfRequestsTillNow");

  -[ADDictationOnDeviceSampling createDictationSampledPlistIfItDoesNotExist]( self,  "createDictationSampledPlistIfItDoesNotExist");
}

- (void)updateDateToCurrent
{
  dispatch_queue_attr_t v3 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  currentSamplingDate = self->_currentSamplingDate;
  self->_currentSamplingDate = v3;

  dispatch_queue_t v5 = self->_currentSamplingDate;
  dictationSamplingVaribles = self->_dictationSamplingVaribles;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[AFDictationSamplingUtilities sampledCurrentSamplingDateKey]( &OBJC_CLASS___AFDictationSamplingUtilities,  "sampledCurrentSamplingDateKey"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](dictationSamplingVaribles, "setObject:forKeyedSubscript:", v5, v7);

  -[ADDictationOnDeviceSampling createDictationSampledPlistIfItDoesNotExist]( self,  "createDictationSampledPlistIfItDoesNotExist");
}

- (BOOL)isSamplingDateCurrent
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 components:28 fromDate:self->_currentSamplingDate]);
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  unsigned __int8 v6 = [v3 date:v5 matchesComponents:v4];

  return v6;
}

- (BOOL)isRequestSelectedForSampling
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned int v4 = [v3 isDictationHIPAACompliant];

  if (v4)
  {
    dispatch_queue_t v5 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v18 = 136315138;
      v19 = "-[ADDictationOnDeviceSampling isRequestSelectedForSampling]";
      unsigned __int8 v6 = "%s Dictation Sampling: HIPAA Device, Sampling is DISABLED.";
LABEL_15:
      objc_super v16 = v5;
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, v6, (uint8_t *)&v18, 0xCu);
    }
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    unsigned int v8 = [v7 isDictationOnDeviceSamplingDisabled];

    if (v8)
    {
      dispatch_queue_t v5 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v18 = 136315138;
        v19 = "-[ADDictationOnDeviceSampling isRequestSelectedForSampling]";
        unsigned __int8 v6 = "%s Dictation Sampling: Sampling is DISABLED.";
        goto LABEL_15;
      }
    }

    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
      id v10 = [v9 siriDataSharingOptInStatus];

      if (v10 == (id)1)
      {
        if (self->_numberOfRequestsTillNow)
        {
          if (-[ADDictationOnDeviceSampling isSamplingDateCurrent](self, "isSamplingDateCurrent"))
          {
            signed int v11 = arc4random_uniform(LODWORD(self->_numberOfRequestsTillNow) + 1) + 1;
            uint64_t v12 = (os_log_s *)AFSiriLogContextConnection;
            BOOL v13 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO);
            if (v11 > 1)
            {
              if (!v13) {
                return 0;
              }
              int v18 = 136315138;
              v19 = "-[ADDictationOnDeviceSampling isRequestSelectedForSampling]";
              unsigned __int8 v6 = "%s Dictation Sampling: NOT Selected for sampling";
              objc_super v16 = v12;
              goto LABEL_16;
            }

            if (!v13) {
              return 1;
            }
            int v18 = 136315138;
            v19 = "-[ADDictationOnDeviceSampling isRequestSelectedForSampling]";
            v14 = "%s Dictation Sampling: Selected for sampling.";
            BOOL v15 = 1;
          }

          else
          {
            -[ADDictationOnDeviceSampling setRequestCount:](self, "setRequestCount:", 0LL);
            -[ADDictationOnDeviceSampling updateDateToCurrent](self, "updateDateToCurrent");
            uint64_t v12 = (os_log_s *)AFSiriLogContextConnection;
            BOOL v15 = 1;
            if (!os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO)) {
              return v15;
            }
            int v18 = 136315138;
            v19 = "-[ADDictationOnDeviceSampling isRequestSelectedForSampling]";
            v14 = "%s Dictation Sampling: Selected for sampling - Sampling Date has been changed.";
          }
        }

        else
        {
          uint64_t v12 = (os_log_s *)AFSiriLogContextConnection;
          BOOL v15 = 1;
          if (!os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO)) {
            return v15;
          }
          int v18 = 136315138;
          v19 = "-[ADDictationOnDeviceSampling isRequestSelectedForSampling]";
          v14 = "%s Dictation Sampling: Selected for sampling - number of requests was 0.";
        }

        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v18, 0xCu);
        return v15;
      }

      dispatch_queue_t v5 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v18 = 136315138;
        v19 = "-[ADDictationOnDeviceSampling isRequestSelectedForSampling]";
        unsigned __int8 v6 = "%s Dictation Sampling: User is NOT opted in.";
        goto LABEL_15;
      }
    }
  }

  return 0;
}

- (void)createDictationSampledPlistIfItDoesNotExist
{
  fileQueue = (dispatch_queue_s *)self->_fileQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100229EB4;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(fileQueue, block);
}

- (void)_createDictationSampledPlistIfItDoesNotExist
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[AFDictationSamplingUtilities createSamplingDirectory]( &OBJC_CLASS___AFDictationSamplingUtilities,  "createSamplingDirectory"));
  if (v3)
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[AFDictationSamplingUtilities sampledPlistFileName]( &OBJC_CLASS___AFDictationSamplingUtilities,  "sampledPlistFileName"));
    dispatch_queue_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:v4]);

    char v11 = 0;
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned int v7 = [v6 fileExistsAtPath:v5 isDirectory:&v11];

    if (v7 && v11)
    {
      unsigned int v8 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        BOOL v13 = "-[ADDictationOnDeviceSampling _createDictationSampledPlistIfItDoesNotExist]";
        __int16 v14 = 2112;
        BOOL v15 = v5;
        _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s Dictation Sampling: Error while creating plist file. The dictationSampledPlistPath - %@ - is returned as Di rectory. Should not happen.",  buf,  0x16u);
      }
    }

    else
    {
      -[ADDictationOnDeviceSampling _writeDictationSamplingVariablesToFile:]( self,  "_writeDictationSamplingVariablesToFile:",  v5);
    }
  }

  else
  {
    v9 = (void *)AFSiriLogContextSpeech;
    if (!os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    dispatch_queue_t v5 = v9;
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[AFDictationSamplingUtilities sampledLibraryDirectoryPath]( &OBJC_CLASS___AFDictationSamplingUtilities,  "sampledLibraryDirectoryPath"));
    *(_DWORD *)buf = 136315394;
    BOOL v13 = "-[ADDictationOnDeviceSampling _createDictationSampledPlistIfItDoesNotExist]";
    __int16 v14 = 2112;
    BOOL v15 = v10;
    _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%s Dictation Sampling: Error while creating directory - %@",  buf,  0x16u);
  }

LABEL_9:
}

- (void)_writeDictationSamplingVariablesToFile:(id)a3
{
  id v4 = a3;
  if ((-[NSMutableDictionary writeToFile:atomically:]( self->_dictationSamplingVaribles,  "writeToFile:atomically:",  v4,  1LL) & 1) == 0)
  {
    dispatch_queue_t v5 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      unsigned int v7 = "-[ADDictationOnDeviceSampling _writeDictationSamplingVariablesToFile:]";
      __int16 v8 = 2112;
      id v9 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%s Dictation Sampling: Error while writing _dictationSamplingVaribles to plist - %@",  (uint8_t *)&v6,  0x16u);
    }
  }
}

- (int64_t)numberOfRequestsTillNow
{
  return self->_numberOfRequestsTillNow;
}

- (void)setNumberOfRequestsTillNow:(int64_t)a3
{
  self->_int64_t numberOfRequestsTillNow = a3;
}

- (NSDate)currentSamplingDate
{
  return self->_currentSamplingDate;
}

- (void)setCurrentSamplingDate:(id)a3
{
}

- (NSMutableDictionary)dictationSamplingVaribles
{
  return self->_dictationSamplingVaribles;
}

- (void)setDictationSamplingVaribles:(id)a3
{
}

- (BOOL)isRequestConsideredForSampling
{
  return self->_isRequestConsideredForSampling;
}

- (void)setIsRequestConsideredForSampling:(BOOL)a3
{
  self->_isRequestConsideredForSampling = a3;
}

- (OS_dispatch_queue)fileQueue
{
  return self->_fileQueue;
}

- (void)setFileQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)sharedManager
{
  if (qword_1005781E0 != -1) {
    dispatch_once(&qword_1005781E0, &stru_1004F6ED8);
  }
  return (id)qword_1005781D8;
}

+ (id)_readDictationSampledPlist
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[AFDictationSamplingUtilities sampledLibraryDirectoryPath]( &OBJC_CLASS___AFDictationSamplingUtilities,  "sampledLibraryDirectoryPath"));
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[AFDictationSamplingUtilities sampledPlistFileName]( &OBJC_CLASS___AFDictationSamplingUtilities,  "sampledPlistFileName"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@/%@", v2, v3));

  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v4));
  id v12 = 0LL;
  int v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithContentsOfURL:error:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithContentsOfURL:error:",  v5,  &v12));
  id v7 = v12;
  if (v7)
  {
    __int16 v8 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v14 = "+[ADDictationOnDeviceSampling _readDictationSampledPlist]";
      __int16 v15 = 2112;
      objc_super v16 = v4;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s Dictation Sampling: Error while reading plist at location %@ - %@",  buf,  0x20u);
    }

    id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  }

  else
  {
    id v9 = [v6 mutableCopy];
  }

  id v10 = v9;

  return v10;
}

@end