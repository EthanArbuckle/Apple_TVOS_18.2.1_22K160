@interface AccessoryPresenceController
- (AccessoryPresenceInputs)inputs;
- (BOOL)isDeviceDocked;
- (BOOL)isHeadsetPluggedIn;
- (void)setInputs:(id)a3;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
@end

@implementation AccessoryPresenceController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
}

- (void)start
{
  v28[0] = @"USB";
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100002C60;
  v23[3] = &unk_100004150;
  v23[4] = self;
  v3 = objc_retainBlock(v23);
  v29[0] = v3;
  v28[1] = @"MiniJack";
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100002C68;
  v22[3] = &unk_100004150;
  v22[4] = self;
  v4 = objc_retainBlock(v22);
  v29[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v29,  v28,  2LL));

  uint64_t v6 = DiagnosticLogHandleForCategory(3LL);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPresenceController inputs](self, "inputs"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPresenceController inputs](self, "inputs"));
    id v11 = [v10 timeout];
    *(_DWORD *)buf = 138412546;
    v25 = v9;
    __int16 v26 = 2048;
    id v27 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Check accessory %@ with time out of %lu seconds",  buf,  0x16u);
  }

  if ((-[AccessoryPresenceController isCancelled](self, "isCancelled") & 1) != 0)
  {
    v12 = &off_100004288;
  }

  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPresenceController inputs](self, "inputs"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
    v15 = (unsigned int (**)(void))objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v14]);

    if (v15)
    {
      unint64_t v16 = 0LL;
      v12 = &off_100004288;
      do
      {
        if (v15[2](v15)) {
          v12 = &off_1000042A0;
        }
        if ([v12 isEqualToNumber:&off_100004288])
        {
          +[NSThread sleepForTimeInterval:](&OBJC_CLASS___NSThread, "sleepForTimeInterval:", 1.0);
          ++v16;
        }

        v17 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPresenceController inputs](self, "inputs"));
        id v18 = [v17 timeout];
      }

      while (v16 < (unint64_t)v18);
    }

    else
    {
      uint64_t v19 = DiagnosticLogHandleForCategory(3LL);
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_100003074(self, v20);
      }

      v12 = &off_1000042B8;
    }
  }

  if ((-[AccessoryPresenceController isCancelled](self, "isCancelled") & 1) == 0)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPresenceController result](self, "result"));
    [v21 setStatusCode:v12];
  }

  -[AccessoryPresenceController setFinished:](self, "setFinished:", 1LL);
}

- (BOOL)isHeadsetPluggedIn
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentRoute]);

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  unint64_t v16 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 outputs]);
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    int v7 = 0;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        uint64_t v11 = DiagnosticLogHandleForCategory(3LL);
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          sub_100003120(v21, v10, &v22, v12);
        }

        v13 = (void *)objc_claimAutoreleasedReturnValue([v10 portType]);
        if ([v13 isEqualToString:AVAudioSessionPortHeadphones])
        {
          int v7 = 1;
        }

        else
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue([v10 portType]);
          v7 |= [v14 isEqualToString:AVAudioSessionPortLineOut];
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }

    while (v6);
  }

  else
  {
    LOBYTE(v7) = 0;
  }

  return v7 & 1;
}

- (BOOL)isDeviceDocked
{
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[EAAccessoryManager sharedAccessoryManager]( &OBJC_CLASS___EAAccessoryManager,  "sharedAccessoryManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 connectedAccessories]);

  id obj = v4;
  id v5 = [v4 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v5)
  {
    id v6 = v5;
    char v7 = 0;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPresenceController inputs](self, "inputs"));
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 modelNumbers]);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v10 modelNumber]);
        unsigned int v14 = [v12 containsObject:v13];

        if (v14)
        {
          __int16 v26 = @"dockModel";
          v15 = (void *)objc_claimAutoreleasedReturnValue([v10 modelNumber]);
          id v16 = stringOrNull(v15);
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
          id v27 = v17;
          char v7 = 1;
          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v27,  &v26,  1LL));
          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryPresenceController result](self, "result"));
          [v19 setData:v18];
        }
      }

      id v6 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
    }

    while (v6);
  }

  else
  {
    char v7 = 0;
  }

  return v7 & 1;
}

- (AccessoryPresenceInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end