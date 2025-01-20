@interface DMDConfigurationSourceController
- (CATSerialOperationQueue)queue;
- (DMDConfigurationSourceController)initWithConfigurationSource:(id)a3 delegate:(id)a4;
- (DMDConfigurationSourceControllerDelegate)delegate;
- (DMDConfigurationSourceRepresentation)source;
- (DMFConfigurationSource)configurationSource;
- (NSString)displayName;
- (NSString)identifier;
- (NSString)organizationIdentifier;
- (id)debugDescription;
- (id)description;
- (void)eventsForSourceDidChange:(id)a3;
- (void)reportEvents;
- (void)reportEventsTimeout;
- (void)reportStatus;
- (void)reportStatusTimeout;
- (void)resolveAssetWithContext:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSource:(id)a3;
- (void)statusForSourceDidChange:(id)a3;
- (void)updateStatusChangeListener;
- (void)updateWithConfigurationSource:(id)a3;
@end

@implementation DMDConfigurationSourceController

- (DMDConfigurationSourceController)initWithConfigurationSource:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v16 handleFailureInMethod:a2, self, @"DMDConfigurationSourceController.m", 36, @"Invalid parameter not satisfying: %@", @"source" object file lineNumber description];
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);

  if (!v9)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v17 handleFailureInMethod:a2, self, @"DMDConfigurationSourceController.m", 37, @"Invalid parameter not satisfying: %@", @"source.identifier" object file lineNumber description];
  }

  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___DMDConfigurationSourceController;
  v10 = -[DMDConfigurationSourceController init](&v18, "init");
  if (v10)
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v7 identifier]);
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    objc_storeWeak((id *)&v10->_delegate, v8);
    v13 = objc_opt_new(&OBJC_CLASS___CATSerialOperationQueue);
    queue = v10->_queue;
    v10->_queue = v13;

    -[DMDConfigurationSourceController updateWithConfigurationSource:](v10, "updateWithConfigurationSource:", v7);
  }

  return v10;
}

- (id)description
{
  v7[0] = @"identifier";
  v7[1] = @"displayName";
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v7, 2LL));
  uint64_t v4 = DMFObjectDescriptionWithProperties(self, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

- (id)debugDescription
{
  v7[0] = @"source";
  v7[1] = @"queue";
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v7, 2LL));
  uint64_t v4 = DMFObjectDescriptionWithProperties(self, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

- (NSString)organizationIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceController source](self, "source"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 organizationIdentifier]);

  return (NSString *)v3;
}

- (NSString)displayName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceController source](self, "source"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 displayName]);

  return (NSString *)v3;
}

- (void)updateWithConfigurationSource:(id)a3
{
  id v10 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceController identifier](self, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
  unsigned __int8 v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v9 handleFailureInMethod:a2, self, @"DMDConfigurationSourceController.m", 75, @"Invalid parameter not satisfying: %@", @"[self.identifier isEqualToString:source.identifier]" object file lineNumber description];
  }

  id v8 = -[DMDConfigurationSourceRepresentation initWithConfigurationSource:]( objc_alloc(&OBJC_CLASS___DMDConfigurationSourceRepresentation),  "initWithConfigurationSource:",  v10);
  -[DMDConfigurationSourceController setSource:](self, "setSource:", v8);

  -[DMDConfigurationSourceController updateStatusChangeListener](self, "updateStatusChangeListener");
  -[DMDConfigurationSourceController statusForSourceDidChange:](self, "statusForSourceDidChange:", 0LL);
}

- (DMFConfigurationSource)configurationSource
{
  v3 = objc_opt_new(&OBJC_CLASS___DMFConfigurationSource);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceController source](self, "source"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  -[DMFConfigurationSource setIdentifier:](v3, "setIdentifier:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceController source](self, "source"));
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 displayName]);
  -[DMFConfigurationSource setDisplayName:](v3, "setDisplayName:", v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceController source](self, "source"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 machServiceName]);
  -[DMFConfigurationSource setMachServiceName:](v3, "setMachServiceName:", v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceController source](self, "source"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 reportingRequirements]);
  -[DMFConfigurationSource setReportingRequirements:](v3, "setReportingRequirements:", v11);

  return v3;
}

- (void)updateStatusChangeListener
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 addObserver:self selector:"statusForSourceDidChange:" name:@"DMDConfigurationSourceStatusDidChange" object:0];

  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 addObserver:self selector:"eventsForSourceDidChange:" name:@"DMDConfigurationSourceEventsDidChange" object:0];
}

- (void)statusForSourceDidChange:(id)a3
{
  id v15 = a3;
  if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    if (v15) {
      uint64_t v5 = objc_claimAutoreleasedReturnValue([v15 object]);
    }
    else {
      uint64_t v5 = objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceController organizationIdentifier](self, "organizationIdentifier"));
    }
    v6 = (void *)v5;
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceController organizationIdentifier](self, "organizationIdentifier"));
    unsigned int v8 = [v7 isEqualToString:v6];

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceController source](self, "source"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 reportingRequirements]);

      double v11 = 10.0;
      double v12 = 3.0;
      if (v10)
      {
        [v10 updateCoalescenceInterval];
        if (v13 > DMFReportingRequirementsUpdateCoalescenceIntervalDefault)
        {
          [v10 updateCoalescenceInterval];
          double v12 = v14;
          double v11 = v14;
        }
      }

      +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "reportStatus",  0LL);
      -[DMDConfigurationSourceController performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "reportStatus",  0LL,  v12);
      if (v11 > v12) {
        -[DMDConfigurationSourceController performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "reportStatusTimeout",  0LL,  v11);
      }
    }
  }

  else
  {
    -[DMDConfigurationSourceController performSelectorOnMainThread:withObject:waitUntilDone:]( self,  "performSelectorOnMainThread:withObject:waitUntilDone:",  a2,  v15,  0LL);
  }
}

- (void)reportStatusTimeout
{
}

- (void)reportStatus
{
  uint64_t v3 = DMFConfigurationEngineLog( +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "reportStatusTimeout",  0LL));
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100063200(self);
  }

  uint64_t v5 = -[DMDConfigurationSourceTaskOperation initWithController:]( objc_alloc(&OBJC_CLASS___DMDConfigurationSourceStatusUpdateOperation),  "initWithController:",  self);
  -[DMDConfigurationSourceTaskOperation setController:](v5, "setController:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceController queue](self, "queue"));
  [v6 addOperation:v5];
}

- (void)eventsForSourceDidChange:(id)a3
{
  id v15 = a3;
  if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    if (v15) {
      uint64_t v5 = objc_claimAutoreleasedReturnValue([v15 object]);
    }
    else {
      uint64_t v5 = objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceController organizationIdentifier](self, "organizationIdentifier"));
    }
    v6 = (void *)v5;
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceController organizationIdentifier](self, "organizationIdentifier"));
    unsigned int v8 = [v7 isEqualToString:v6];

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceController source](self, "source"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 reportingRequirements]);

      double v11 = 10.0;
      double v12 = 3.0;
      if (v10)
      {
        [v10 updateCoalescenceInterval];
        if (v13 > DMFReportingRequirementsUpdateCoalescenceIntervalDefault)
        {
          [v10 updateCoalescenceInterval];
          double v12 = v14;
          double v11 = v14;
        }
      }

      +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "reportEvents",  0LL);
      -[DMDConfigurationSourceController performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "reportEvents",  0LL,  3.0);
      if (v11 > v12) {
        -[DMDConfigurationSourceController performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "reportEventsTimeout",  0LL,  10.0);
      }
    }
  }

  else
  {
    -[DMDConfigurationSourceController performSelectorOnMainThread:withObject:waitUntilDone:]( self,  "performSelectorOnMainThread:withObject:waitUntilDone:",  a2,  v15,  0LL);
  }
}

- (void)reportEventsTimeout
{
}

- (void)reportEvents
{
  uint64_t v3 = DMFConfigurationEngineLog( +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "reportEventsTimeout",  0LL));
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10006327C(self);
  }

  uint64_t v5 = -[DMDConfigurationSourceTaskOperation initWithController:]( objc_alloc(&OBJC_CLASS___DMDConfigurationSourceEventsOperation),  "initWithController:",  self);
  -[DMDConfigurationSourceTaskOperation setController:](v5, "setController:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceController queue](self, "queue"));
  [v6 addOperation:v5];
}

- (void)resolveAssetWithContext:(id)a3
{
  id v4 = a3;
  v6 = -[DMDConfigurationSourceTaskOperation initWithController:]( objc_alloc(&OBJC_CLASS___DMDConfigurationSourceAssetResolveOperation),  "initWithController:",  self);
  -[DMDConfigurationSourceAssetResolveOperation setContext:](v6, "setContext:", v4);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceController queue](self, "queue"));
  [v5 addOperation:v6];
}

- (DMDConfigurationSourceControllerDelegate)delegate
{
  return (DMDConfigurationSourceControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (CATSerialOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (DMDConfigurationSourceRepresentation)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end