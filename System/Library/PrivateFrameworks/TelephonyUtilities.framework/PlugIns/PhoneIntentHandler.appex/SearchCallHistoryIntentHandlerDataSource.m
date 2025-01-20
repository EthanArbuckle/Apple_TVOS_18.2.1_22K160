@interface SearchCallHistoryIntentHandlerDataSource
- (CNContactStore)contactStore;
- (CallHistoryDataSource)callHistoryDataSource;
- (CoreTelephonyDataSource)coreTelephonyDataSource;
- (TUCallProviderManager)providerManager;
- (TUContactsDataSource)contactsDataSource;
- (unint64_t)restrictedCallTypes;
@end

@implementation SearchCallHistoryIntentHandlerDataSource

- (CallHistoryDataSource)callHistoryDataSource
{
  callHistoryDataSource = self->_callHistoryDataSource;
  if (!callHistoryDataSource)
  {
    id v4 = +[CHManager siriManagerForIntentType:]( &OBJC_CLASS___CHManager,  "siriManagerForIntentType:",  objc_opt_class(&OBJC_CLASS___INSearchCallHistoryIntent));
    v5 = (CallHistoryDataSource *)objc_claimAutoreleasedReturnValue(v4);
    v6 = self->_callHistoryDataSource;
    self->_callHistoryDataSource = v5;

    callHistoryDataSource = self->_callHistoryDataSource;
  }

  return callHistoryDataSource;
}

- (TUContactsDataSource)contactsDataSource
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 contactStore]);

  return (TUContactsDataSource *)v3;
}

- (CoreTelephonyDataSource)coreTelephonyDataSource
{
  return (CoreTelephonyDataSource *)+[DefaultCoreTelephonyDataSource sharedInstance]( &OBJC_CLASS___DefaultCoreTelephonyDataSource,  "sharedInstance");
}

- (TUCallProviderManager)providerManager
{
  providerManager = self->_providerManager;
  if (!providerManager)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___TUCallProviderManager);
    v5 = self->_providerManager;
    self->_providerManager = v4;

    providerManager = self->_providerManager;
  }

  return providerManager;
}

- (unint64_t)restrictedCallTypes
{
  return 0LL;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void).cxx_destruct
{
}

@end