@interface APSTopicFilterPolicy
- (APSTopicFilterPolicy)initWithDelegate:(id)a3;
- (APSTopicFilterPolicyDelegate)delegate;
- (id)topicChosenByPolicyFromTopics:(id)a3;
- (int64_t)filterChosenByPolicyForTopic:(id)a3;
- (void)filtersWillPotentiallyBeChangedBy:(id)a3;
- (void)logFilterPolicyInformation;
- (void)setDelegate:(id)a3;
@end

@implementation APSTopicFilterPolicy

- (APSTopicFilterPolicy)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___APSTopicFilterPolicy;
  v5 = -[APSTopicFilterPolicy init](&v8, "init");
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)filtersWillPotentiallyBeChangedBy:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    v7 = self;
    __int16 v8 = 2112;
    id v9 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@: Filter will potentially be changed by %@",  (uint8_t *)&v6,  0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained filtersWillPotentiallyBeChangedByPolicy:self];
}

- (int64_t)filterChosenByPolicyForTopic:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(a2);
  int v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"You must override %@ in a subclass",  v6));
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v7,  0LL));

  objc_exception_throw(v8);
  return (int64_t)-[APSTopicFilterPolicy topicChosenByPolicyFromTopics:](v9, v10, v11);
}

- (id)topicChosenByPolicyFromTopics:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(a2);
  int v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"You must override %@ in a subclass",  v6));
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v7,  0LL));

  objc_exception_throw(v8);
  -[APSTopicFilterPolicy logFilterPolicyInformation](v9, v10);
  return result;
}

- (void)logFilterPolicyInformation
{
  v2 = NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"You must override %@ in a subclass",  v3));
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v4,  0LL));

  objc_exception_throw(v5);
  -[APSTopicFilterPolicy delegate](v6, v7);
}

- (APSTopicFilterPolicyDelegate)delegate
{
  return (APSTopicFilterPolicyDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end