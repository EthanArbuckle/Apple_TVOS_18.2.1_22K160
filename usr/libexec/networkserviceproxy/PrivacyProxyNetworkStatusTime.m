@interface PrivacyProxyNetworkStatusTime
+ (BOOL)supportsSecureCoding;
- (PrivacyProxyNetworkStatusTime)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PrivacyProxyNetworkStatusTime

- (id)description
{
  if (self)
  {
    v3 = -[NSMutableString initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableString), "initWithCapacity:", 0LL);
    sub_100043E90(v3, self->_networkStatus, @"Network Status", 0, 14LL);
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:]( &OBJC_CLASS___NSDateFormatter,  "localizedStringFromDate:dateStyle:timeStyle:",  self->_networkStatusStartTime,  1LL,  2LL));
    sub_100043E90(v3, v4, @"Network Status Start Time", 0, 14LL);

    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:]( &OBJC_CLASS___NSDateFormatter,  "localizedStringFromDate:dateStyle:timeStyle:",  self->_networkStatusEndTime,  1LL,  2LL));
    sub_100043E90(v3, v5, @"Network Status End Time", 0, 14LL);
  }

  else
  {
    v3 = 0LL;
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = -[PrivacyProxyNetworkStatusTime init]( +[PrivacyProxyNetworkStatusTime allocWithZone:]( &OBJC_CLASS___PrivacyProxyNetworkStatusTime,  "allocWithZone:",  a3),  "init");
  v5 = v4;
  if (self)
  {
    sub_100011668((uint64_t)v4, self->_networkStatus);
    sub_10003ED60((uint64_t)v5, self->_networkStatusStartTime);
    networkStatusEndTime = self->_networkStatusEndTime;
  }

  else
  {
    sub_100011668((uint64_t)v4, 0LL);
    sub_10003ED60((uint64_t)v5, 0LL);
    networkStatusEndTime = 0LL;
  }

  sub_10000E01C((uint64_t)v5, networkStatusEndTime);
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PrivacyProxyNetworkStatusTime)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___PrivacyProxyNetworkStatusTime;
  v7 = -[PrivacyProxyNetworkStatusTime init](&v22, "init");
  if (v7)
  {
    id v8 = [v4 decodeObjectOfClass:objc_opt_class(PrivacyProxyNetworkStatus) forKey:@"PrivacyProxyNetworkStatusTimeNetworkStatus"];
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    networkStatus = v7->_networkStatus;
    v7->_networkStatus = (PrivacyProxyNetworkStatus *)v9;

    id v11 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"PrivacyProxyNetworkStatusTimeNetworkStartTime"];
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    networkStatusStartTime = v7->_networkStatusStartTime;
    v7->_networkStatusStartTime = (NSDate *)v12;

    id v14 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"PrivacyProxyNetworkStatusTimeNetworkEndTime"];
    uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
    networkStatusEndTime = v7->_networkStatusEndTime;
    v7->_networkStatusEndTime = (NSDate *)v15;

    v17 = v7;
  }

  else
  {
    uint64_t v19 = nplog_obj(0LL, v5, v6);
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "[super init] failed", v21, 2u);
    }
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  if (self)
  {
    [v5 encodeObject:self->_networkStatus forKey:@"PrivacyProxyNetworkStatusTimeNetworkStatus"];
    [v5 encodeObject:self->_networkStatusStartTime forKey:@"PrivacyProxyNetworkStatusTimeNetworkStartTime"];
    networkStatusEndTime = self->_networkStatusEndTime;
  }

  else
  {
    [v5 encodeObject:0 forKey:@"PrivacyProxyNetworkStatusTimeNetworkStatus"];
    [v5 encodeObject:0 forKey:@"PrivacyProxyNetworkStatusTimeNetworkStartTime"];
    networkStatusEndTime = 0LL;
  }

  [v5 encodeObject:networkStatusEndTime forKey:@"PrivacyProxyNetworkStatusTimeNetworkEndTime"];
}

- (void).cxx_destruct
{
}

@end