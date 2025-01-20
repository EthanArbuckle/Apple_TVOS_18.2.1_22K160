@interface SHMatcherFactory
- (SHAudioTapProvider)audioTapProvider;
- (SHMatcherFactory)initWithAudioTapProvider:(id)a3;
- (id)buildConcurrentMatcherWithInitialBuffers:(id)a3 callback:(id)a4;
- (id)matcherForRequest:(id)a3 catalog:(id)a4;
- (id)matcherForRequest:(id)a3 catalog:(id)a4 initialBuffers:(id)a5;
@end

@implementation SHMatcherFactory

- (SHMatcherFactory)initWithAudioTapProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SHMatcherFactory;
  v6 = -[SHMatcherFactory init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_audioTapProvider, a3);
  }

  return v7;
}

- (id)matcherForRequest:(id)a3 catalog:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if ([v6 type] == (id)1 || objc_msgSend(v6, "type") == (id)2)
  {
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHMatcherFactory audioTapProvider](self, "audioTapProvider", 0LL));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 tapsForAvailableSources]);

    id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        v14 = 0LL;
        do
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = -[SHRecordingBuffer initWithTap:]( objc_alloc(&OBJC_CLASS___SHRecordingBuffer),  "initWithTap:",  *(void *)(*((void *)&v19 + 1) + 8LL * (void)v14));
          [v8 addObject:v15];

          v14 = (char *)v14 + 1;
        }

        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }

      while (v12);
    }
  }

  id v16 = [v8 copy];
  v17 = (void *)objc_claimAutoreleasedReturnValue( -[SHMatcherFactory matcherForRequest:catalog:initialBuffers:]( self,  "matcherForRequest:catalog:initialBuffers:",  v6,  v7,  v16));

  return v17;
}

- (id)matcherForRequest:(id)a3 catalog:(id)a4 initialBuffers:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  switch((unint64_t)[a3 type])
  {
    case 0uLL:
      id v11 = (SHAppIntentMatcher *)objc_claimAutoreleasedReturnValue([v8 _createMatcher]);
      break;
    case 1uLL:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_100022920;
      v20[3] = &unk_10006D700;
      id v21 = v8;
      __int128 v22 = self;
      id v11 = (SHAppIntentMatcher *)objc_claimAutoreleasedReturnValue( -[SHMatcherFactory buildConcurrentMatcherWithInitialBuffers:callback:]( self,  "buildConcurrentMatcherWithInitialBuffers:callback:",  v9,  v20));
      id v12 = v21;
      goto LABEL_8;
    case 2uLL:
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_100022710;
      v23[3] = &unk_10006D700;
      id v24 = v8;
      v25 = self;
      id v11 = (SHAppIntentMatcher *)objc_claimAutoreleasedReturnValue( -[SHMatcherFactory buildConcurrentMatcherWithInitialBuffers:callback:]( self,  "buildConcurrentMatcherWithInitialBuffers:callback:",  v9,  v23));
      id v12 = v24;
LABEL_8:

      break;
    case 3uLL:
      uint64_t v13 = objc_opt_class(&OBJC_CLASS___SHShazamKitServerCatalog, v10);
      if ((objc_opt_isKindOfClass(v8, v13) & 1) != 0)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue([v8 clientIdentifier]);
        unsigned int v15 = [v14 isEqualToString:@"com.apple.assistant_service"];

        uint64_t v16 = v15;
      }

      else
      {
        uint64_t v16 = 0LL;
      }

      v17 = objc_alloc(&OBJC_CLASS___SHAppIntentMatcher);
      v18 = -[SHAppIntentRunnerMatcher initWithSource:]( objc_alloc(&OBJC_CLASS___SHAppIntentRunnerMatcher),  "initWithSource:",  v16);
      id v11 = -[SHAppIntentMatcher initWithRunnerMatcher:](v17, "initWithRunnerMatcher:", v18);

      break;
    default:
      id v11 = 0LL;
      break;
  }

  return v11;
}

- (id)buildConcurrentMatcherWithInitialBuffers:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = (uint64_t (**)(id, void))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v6 count]));
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = v7[2](v7, *(void *)(*((void *)&v22 + 1) + 8LL * (void)v13));
        unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        objc_msgSend(v8, "addObject:", v15, (void)v22);

        uint64_t v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v11);
  }

  if ((unint64_t)[v8 count] > 1)
  {
    v17 = objc_alloc(&OBJC_CLASS___SHMultipleConcurrentMatcher);
    id v18 = [v8 copy];
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[SHMatcherFactory audioTapProvider](self, "audioTapProvider"));
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 audioRecordingManager]);
    uint64_t v16 = -[SHMultipleConcurrentMatcher initWithMatchers:audioRecordingManager:]( v17,  "initWithMatchers:audioRecordingManager:",  v18,  v20);
  }

  else
  {
    uint64_t v16 = (SHMultipleConcurrentMatcher *)objc_claimAutoreleasedReturnValue([v8 firstObject]);
  }

  return v16;
}

- (SHAudioTapProvider)audioTapProvider
{
  return self->_audioTapProvider;
}

- (void).cxx_destruct
{
}

@end