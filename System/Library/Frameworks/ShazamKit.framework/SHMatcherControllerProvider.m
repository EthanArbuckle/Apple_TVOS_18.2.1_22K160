@interface SHMatcherControllerProvider
- (SHAttribution)attribution;
- (SHAudioTapProvider)audioTapProvider;
- (SHMatcherControllerProvider)initWithAudioTapProvider:(id)a3 attribution:(id)a4 clientType:(int64_t)a5;
- (SHMatcherFactory)matcherFactory;
- (SHServiceDelegate)delegate;
- (id)associatedMatcherControllerForRequest:(id)a3;
- (id)catalogForRequest:(id)a3;
- (id)matcherControllerForRequest:(id)a3;
- (int64_t)clientType;
- (void)setDelegate:(id)a3;
@end

@implementation SHMatcherControllerProvider

- (SHMatcherControllerProvider)initWithAudioTapProvider:(id)a3 attribution:(id)a4 clientType:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___SHMatcherControllerProvider;
  v11 = -[SHMatcherControllerProvider init](&v16, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_audioTapProvider, a3);
    objc_storeStrong((id *)&v12->_attribution, a4);
    v12->_clientType = a5;
    v13 = -[SHMatcherFactory initWithAudioTapProvider:]( objc_alloc(&OBJC_CLASS___SHMatcherFactory),  "initWithAudioTapProvider:",  v12->_audioTapProvider);
    matcherFactory = v12->_matcherFactory;
    v12->_matcherFactory = v13;
  }

  return v12;
}

- (id)matcherControllerForRequest:(id)a3
{
  id v4 = a3;
  v5 = (char *)[v4 type] - 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHMatcherControllerProvider delegate](self, "delegate"));
  v7 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  @"9846B3A1-6769-4363-8AA2-214973BD05A0");
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 registeredWorkerForWorkerID:v7]);

  if ((unint64_t)v5 <= 2
    && v8
    && (uint64_t v9 = objc_opt_class(&OBJC_CLASS___SHPreRecordingWorker), v10 = objc_opt_isKindOfClass(v8, v9), (v10 & 1) == 0))
  {
    uint64_t v43 = sh_log_object(v10);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v46 = 138412290;
      id v47 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Unable to create matcher for request %@, there is already a recording matcher with an associate matcher controller running",  (uint8_t *)&v46,  0xCu);
    }

    v42 = 0LL;
  }

  else
  {
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[SHMatcherControllerProvider associatedMatcherControllerForRequest:]( self,  "associatedMatcherControllerForRequest:",  v4));
    if ([v4 type] == (id)2
      && (v12 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s matcher](v11, "matcher")),
          unsigned int v13 = [v12 conformsToProtocol:&OBJC_PROTOCOL___SHParentMatcher],
          v12,
          v13))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s matcher](v11, "matcher"));
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 childMatcher]);
    }

    else
    {
      v15 = 0LL;
    }

    uint64_t v16 = objc_opt_class(&OBJC_CLASS___SHPreRecordingWorker);
    char isKindOfClass = objc_opt_isKindOfClass(v8, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v8 taskID]);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v4 requestID]);
    unsigned int v20 = [v18 isEqual:v19];

    uint64_t v21 = objc_claimAutoreleasedReturnValue(-[SHMatcherControllerProvider catalogForRequest:](self, "catalogForRequest:", v4));
    v22 = (void *)v21;
    if ((isKindOfClass & 1) != 0 && v20)
    {
      uint64_t v23 = sh_log_object(v21);
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v46) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEBUG,  "Starting recording with buffer from pre recording",  (uint8_t *)&v46,  2u);
      }

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[SHMatcherControllerProvider matcherFactory](self, "matcherFactory"));
      v26 = (void *)objc_claimAutoreleasedReturnValue([v8 buffers]);
      uint64_t v27 = objc_claimAutoreleasedReturnValue([v25 matcherForRequest:v4 catalog:v22 initialBuffers:v26]);

      [v8 stopAfterTransferingBuffers];
      v15 = (void *)v27;
    }

    if (v15
      || (v28 = (void *)objc_claimAutoreleasedReturnValue(-[SHMatcherControllerProvider matcherFactory](self, "matcherFactory")),
          v15 = (void *)objc_claimAutoreleasedReturnValue([v28 matcherForRequest:v4 catalog:v22]),
          v28,
          v15))
    {
      if ([v4 type] == (id)3)
      {
        uint64_t v30 = objc_opt_class(&OBJC_CLASS___SHAppIntentMatcher);
        if ((objc_opt_isKindOfClass(v15, v30) & 1) != 0)
        {
          id v31 = v15;
          v32 = (void *)objc_claimAutoreleasedReturnValue( +[SHMatcherRequest requestOnceWithNotifications:]( SHMatcherRequest,  "requestOnceWithNotifications:",  [v4 sendNotifications]));
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[SHMatcherControllerProvider matcherFactory](self, "matcherFactory"));
          v34 = (void *)objc_claimAutoreleasedReturnValue([v33 matcherForRequest:v32 catalog:v22]);
          [v31 setChildMatcher:v34];

          uint64_t v36 = sh_log_object(v35);
          v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          {
            v38 = (void *)objc_claimAutoreleasedReturnValue([v31 childMatcher]);
            int v46 = 138412546;
            id v47 = v38;
            __int16 v48 = 2112;
            id v49 = v31;
            _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEBUG,  "Associating child matcher %@ with parent matcher %@",  (uint8_t *)&v46,  0x16u);
          }
        }
      }

      v39 = objc_alloc(&OBJC_CLASS___SHMatchResultNotificationScheduler);
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[SHMatcherControllerProvider attribution](self, "attribution"));
      v41 = -[SHMatchResultNotificationScheduler initWithAttribution:](v39, "initWithAttribution:", v40);

      v42 = -[SHMatcherController initWithMatcher:notificationScheduler:]( objc_alloc(&OBJC_CLASS___SHMatcherController),  "initWithMatcher:notificationScheduler:",  v15,  v41);
      if ([v4 type] == (id)2 && v11)
      {
        -[os_log_s setAssociatedMatcherController:](v11, "setAssociatedMatcherController:", v42);
        -[SHMatcherController setAssociatedMatcherController:](v42, "setAssociatedMatcherController:", v11);
      }
    }

    else
    {
      uint64_t v45 = sh_log_object(v29);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
      {
        int v46 = 138412290;
        id v47 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v15,  OS_LOG_TYPE_ERROR,  "Unable to create matcher for request %@",  (uint8_t *)&v46,  0xCu);
      }

      v42 = 0LL;
    }
  }

  return v42;
}

- (id)catalogForRequest:(id)a3
{
  id v4 = a3;
  v5 = (char *)[v4 type];
  if ((unint64_t)(v5 - 2) < 2 || v5 == 0LL)
  {
    v7 = objc_alloc(&OBJC_CLASS___SHShazamKitServerCatalog);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHMatcherControllerProvider attribution](self, "attribution"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 containingAppBundleIdentifier]);
    int64_t v10 = -[SHMatcherControllerProvider clientType](self, "clientType");
    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 installationID]);
    self = -[SHShazamKitServerCatalog initWithClientIdentifier:clientType:installationID:]( v7,  "initWithClientIdentifier:clientType:installationID:",  v9,  v10,  v11);
  }

  else if (v5 == (char *)1)
  {
    self = objc_alloc_init(&OBJC_CLASS___SHCustomCatalog);
  }

  return self;
}

- (id)associatedMatcherControllerForRequest:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHMatcherControllerProvider delegate](self, "delegate", a3));
  id v4 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  @"89EAC1CA-426C-48AA-97CE-386AEDDCCC4C");
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 registeredWorkerForWorkerID:v4]);

  uint64_t v6 = objc_opt_class(&OBJC_CLASS___SHMatcherController);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0) {
    v7 = v5;
  }
  else {
    v7 = 0LL;
  }
  id v8 = v7;

  return v8;
}

- (SHServiceDelegate)delegate
{
  return (SHServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (SHMatcherFactory)matcherFactory
{
  return self->_matcherFactory;
}

- (SHAudioTapProvider)audioTapProvider
{
  return self->_audioTapProvider;
}

- (SHAttribution)attribution
{
  return self->_attribution;
}

- (int64_t)clientType
{
  return self->_clientType;
}

- (void).cxx_destruct
{
}

@end