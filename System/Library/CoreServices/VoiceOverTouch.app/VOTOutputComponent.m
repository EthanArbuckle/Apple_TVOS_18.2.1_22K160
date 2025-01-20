@interface VOTOutputComponent
- (AXVoiceOverActivity)lastUsedActivity;
- (BOOL)determineOutputMutedForActivity:(id)a3;
- (BOOL)stringIsInSupportedCharacters:(id)a3;
- (VOTOutputComponent)init;
- (double)lastUsedActivityTime;
- (double)outputMutedActivityLastToggleTime;
- (id)determineActivityForAction:(id)a3;
- (id)determineLanguageForAction:(id)a3 overrideLanguage:(id)a4 targetLanguage:(id)a5;
- (id)determineLanguageForEvent:(id)a3;
- (id)outputMutedActivityValue:(id)a3;
- (void)notifyActionComplete:(id)a3;
- (void)notifyRangeWillOutput:(_NSRange)a3 container:(id)a4;
- (void)performAction:(id)a3 owner:(id)a4;
- (void)setCurrentOutputActionID:(unint64_t)a3;
- (void)setLastUsedActivity:(id)a3;
- (void)setLastUsedActivityTime:(double)a3;
@end

@implementation VOTOutputComponent

- (VOTOutputComponent)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___VOTOutputComponent;
  v2 = -[VOTOutputComponent init](&v6, "init");
  v3 = (SCRCThreadKey *)[objc_allocWithZone(SCRCThreadKey) initWithObject:v2];
  threadKey = v2->_threadKey;
  v2->_threadKey = v3;

  return v2;
}

- (void)performAction:(id)a3 owner:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[VOTOutputComponent preprocessAction:](self, "preprocessAction:", v7);
  -[VOTOutputComponent setCurrentOutputActionID:](self, "setCurrentOutputActionID:", [v7 outputActionID]);
  id v11 = [objc_allocWithZone(NSNumber) initWithUnsignedInt:6];
  id v8 = [objc_allocWithZone(AXIndexMap) init];
  [v8 setObject:v11 forIndex:1];
  [v8 setObject:v7 forIndex:14];
  [v8 setObject:v6 forIndex:13];

  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 outputRequest]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 language]);
  [v8 setObject:v10 forIndex:15];

  -[VOTOutputComponent performSelector:withThreadKey:waitTime:cancelMask:count:objects:]( self,  "performSelector:withThreadKey:waitTime:cancelMask:count:objects:",  "handleEvent:",  self->_threadKey,  0LL,  1LL,  v8,  kSCRCThreadNoWait);
}

- (BOOL)determineOutputMutedForActivity:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputComponent determineActivityForAction:](self, "determineActivityForAction:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputComponent outputMutedActivityValue:](self, "outputMutedActivityValue:", v4));

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputComponent lastUsedActivity](self, "lastUsedActivity"));
    unsigned __int8 v7 = [v4 isEqual:v6];

    if ((v7 & 1) == 0)
    {
      -[VOTOutputComponent setLastUsedActivity:](self, "setLastUsedActivity:", v4);
      -[VOTOutputComponent setLastUsedActivityTime:](self, "setLastUsedActivityTime:", CFAbsoluteTimeGetCurrent());
    }

    -[VOTOutputComponent outputMutedActivityLastToggleTime](self, "outputMutedActivityLastToggleTime");
    double v9 = v8;
    id v10 = -[VOTOutputComponent lastUsedActivityTime](self, "lastUsedActivityTime");
    if (v9 <= v11)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputComponent outputMutedActivityValue:](self, "outputMutedActivityValue:", v4));
      unsigned __int8 v14 = [v15 BOOLValue];

      goto LABEL_11;
    }

    uint64_t v12 = VOTLogCommon(v10);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Not using activity speech mute because we toggled speech muted more recently",  v17,  2u);
    }
  }

  else
  {
    -[VOTOutputComponent setLastUsedActivity:](self, "setLastUsedActivity:", 0LL);
  }

  unsigned __int8 v14 = 0;
LABEL_11:

  return v14;
}

- (id)determineActivityForAction:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForVariant:81]);

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForVariant:81]);
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedActivity]);
    if (!v5)
    {
      uint64_t v6 = objc_claimAutoreleasedReturnValue([v3 objectForVariant:79]);
      if (!v6) {
        goto LABEL_6;
      }
      unsigned __int8 v7 = (void *)v6;
      double v8 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace activities]);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_10000C690;
      v19[3] = &unk_100176CF0;
      v19[4] = v7;
      double v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ax_filteredArrayUsingBlock:", v19));
      v5 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);

      if (!v5)
      {
LABEL_6:
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForVariant:43]);
        if (v10)
        {
          double v11 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace activities]);
          unsigned __int8 v14 = _NSConcreteStackBlock;
          uint64_t v15 = 3221225472LL;
          v16 = sub_10000C6D0;
          v17 = &unk_100176CF0;
          id v18 = v10;
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ax_filteredArrayUsingBlock:", &v14));
          v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject", v14, v15, v16, v17));
        }

        else
        {
          v5 = 0LL;
        }
      }
    }

    [v3 setObject:v5 forVariant:81];
  }

  return v5;
}

- (void)setCurrentOutputActionID:(unint64_t)a3
{
  self->_currentOutputActionID = a3;
}

- (void)notifyRangeWillOutput:(_NSRange)a3 container:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v10 = a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForIndex:13]);
  if (v6)
  {
    id v7 = [objc_allocWithZone(NSNumber) initWithUnsignedInt:22];
    id v8 = [objc_allocWithZone(NSNumber) initWithUnsignedInt:5];
    double v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithRange:](&OBJC_CLASS___NSValue, "valueWithRange:", location, length));
    [v10 setObject:v9 forIndex:14];

    [v10 setObject:v7 forIndex:10];
    [v10 setObject:v8 forIndex:1];
    [v6 performSelector:"handleEvent:" withThreadKey:v6 count:1 objects:v10];
  }
}

- (void)notifyActionComplete:(id)a3
{
  id v8 = a3;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForIndex:13]);
  if (v3)
  {
    id v4 = v8;
    if (!v8) {
      id v4 = [objc_allocWithZone(AXIndexMap) init];
    }
    id v8 = v4;
    id v5 = [objc_allocWithZone(NSNumber) initWithUnsignedInt:19];
    id v6 = [objc_allocWithZone(NSNumber) initWithUnsignedInt:5];
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForIndex:11]);
    [v8 setObject:v7 forIndex:14];

    [v8 setObject:v5 forIndex:10];
    [v8 setObject:v6 forIndex:1];
    [v3 performSelector:"handleEvent:" withThreadKey:v3 count:1 objects:v8];
  }
}

- (id)determineLanguageForAction:(id)a3 overrideLanguage:(id)a4 targetLanguage:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = objc_claimAutoreleasedReturnValue([a4 stringByReplacingOccurrencesOfString:@"_" withString:@"-"]);
  if (v9)
  {
    id v10 = (id)v9;
    char v11 = 1;
LABEL_9:
    v17 = (void *)objc_claimAutoreleasedReturnValue([v7 string]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 currentLanguageMap]);
    v20 = sub_10004A27C(v10, v17, v11, v7, v19);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v20);

    goto LABEL_10;
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);

  if (!v12)
  {
LABEL_6:
    id v10 = v8;
    if (!v10) {
      id v10 = (id)objc_claimAutoreleasedReturnValue([v7 objectForVariant:15]);
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    char v11 = [v16 voiceOverLanguageDetectionEnabled] ^ 1;

    goto LABEL_9;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);
  uint64_t v14 = AXLanguageConvertToCanonicalForm(v13);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  if (![v15 length])
  {

    goto LABEL_6;
  }

- (id)determineLanguageForEvent:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForIndex:14]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForVariant:16]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForVariant:15]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[VOTOutputComponent determineLanguageForAction:overrideLanguage:targetLanguage:]( self,  "determineLanguageForAction:overrideLanguage:targetLanguage:",  v4,  v5,  v6));

  return v7;
}

- (BOOL)stringIsInSupportedCharacters:(id)a3
{
  return 1;
}

- (AXVoiceOverActivity)lastUsedActivity
{
  return self->_lastUsedActivity;
}

- (void)setLastUsedActivity:(id)a3
{
}

- (double)lastUsedActivityTime
{
  return self->_lastUsedActivityTime;
}

- (void)setLastUsedActivityTime:(double)a3
{
  self->_lastUsedActivityTime = a3;
}

- (void).cxx_destruct
{
}

- (id)outputMutedActivityValue:(id)a3
{
  uint64_t v3 = sub_10000CB80();
  sub_10000CB70(v3);
  return 0LL;
}

- (double)outputMutedActivityLastToggleTime
{
  uint64_t v2 = sub_10000CB80();
  sub_10000CB70(v2);
  return 0.0;
}

@end