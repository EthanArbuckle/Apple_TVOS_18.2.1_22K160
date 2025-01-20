@interface IDSAccount
- (BOOL)_validateIDSAccount;
- (BOOL)isBizAccount;
- (unsigned)serviceType;
@end

@implementation IDSAccount

- (BOOL)_validateIDSAccount
{
  return -[IDSAccount canSend](self, "canSend");
}

- (unsigned)serviceType
{
  id v3 = -[IDSAccount serviceName](self, "serviceName");
  id v5 = -[IDSAccount serviceName](self, "serviceName");
  id v6 = [v5 isEqualToString:IDSServiceNameiMessageForBusiness];
  unsigned int result = IMOSLoggingEnabled(v6, v7);
  if (result)
  {
    v8 = (os_log_s *)OSLogHandleForIMFoundationCategory("Warning");
    unsigned int result = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if (result)
    {
      *(_WORD *)v9 = 0;
      _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_INFO,  "IDSAccount (iMessageAdditions) -serviceType - Did not find serviceType. Using default.",  v9,  2u);
      return 0;
    }
  }

  return result;
}

- (BOOL)isBizAccount
{
  id v2 = -[IDSAccount serviceName](self, "serviceName");
  return [v2 isEqualToString:IDSServiceNameiMessageForBusiness];
}

@end