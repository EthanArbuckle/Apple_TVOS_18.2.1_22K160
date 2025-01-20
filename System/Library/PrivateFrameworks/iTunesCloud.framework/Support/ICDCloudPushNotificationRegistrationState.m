@interface ICDCloudPushNotificationRegistrationState
- (ICDCloudPushNotificationRegistrationState)initWithDictionaryRepresentation:(id)a3;
- (id)dictionaryRepresentation;
- (id)registrationStateForAccountDSID:(id)a3;
- (void)setRegistrationState:(id)a3 forAccountDSID:(id)a4;
@end

@implementation ICDCloudPushNotificationRegistrationState

- (ICDCloudPushNotificationRegistrationState)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = -[ICDCloudPushNotificationRegistrationState init](self, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ic_dictionaryValueForKey:", @"accountStates"));
    v7 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v6 count]);
    accountRegistrationStates = v5->_accountRegistrationStates;
    v5->_accountRegistrationStates = v7;

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000E7C6C;
    v10[3] = &unk_1001A6A30;
    v11 = v5;
    [v6 enumerateKeysAndObjectsUsingBlock:v10];
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  1LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  -[NSMutableDictionary count](self->_accountRegistrationStates, "count")));
  accountRegistrationStates = self->_accountRegistrationStates;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000E7BF0;
  v8[3] = &unk_1001A5E88;
  id v9 = v4;
  id v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( accountRegistrationStates,  "enumerateKeysAndObjectsUsingBlock:",  v8);
  [v3 setObject:v6 forKey:@"accountStates"];

  return v3;
}

- (id)registrationStateForAccountDSID:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:]( self->_accountRegistrationStates,  "objectForKeyedSubscript:",  a3);
}

- (void)setRegistrationState:(id)a3 forAccountDSID:(id)a4
{
}

- (void).cxx_destruct
{
}

@end