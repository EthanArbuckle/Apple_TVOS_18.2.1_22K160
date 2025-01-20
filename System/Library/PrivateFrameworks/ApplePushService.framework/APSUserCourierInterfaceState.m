@interface APSUserCourierInterfaceState
- (APSUserCourierInterfaceState)init;
- (id)aps_prettyDescription;
- (id)description;
- (unint64_t)filterMode;
- (unint64_t)trackingState;
- (unint64_t)userState;
- (void)setFilterMode:(unint64_t)a3;
- (void)setTrackingState:(unint64_t)a3;
- (void)setUserState:(unint64_t)a3;
@end

@implementation APSUserCourierInterfaceState

- (APSUserCourierInterfaceState)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___APSUserCourierInterfaceState;
  result = -[APSUserCourierInterfaceState init](&v3, "init");
  if (result)
  {
    result->_trackingState = 0LL;
    result->_filterMode = 0LL;
    result->_userState = 3LL;
  }

  return result;
}

- (void)setUserState:(unint64_t)a3
{
  if (self->_userState != a3)
  {
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = objc_opt_class(self, v6);
      unint64_t userState = self->_userState;
      int v9 = 138413058;
      uint64_t v10 = v7;
      __int16 v11 = 2048;
      v12 = self;
      __int16 v13 = 2048;
      unint64_t v14 = userState;
      __int16 v15 = 2048;
      unint64_t v16 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "<%@: %p> Setting user state from: %llu to: %llu",  (uint8_t *)&v9,  0x2Au);
    }

    self->_unint64_t userState = a3;
  }

- (id)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  unint64_t userState = self->_userState;
  v5 = @"<unknown>";
  uint64_t v6 = @"<unknown>";
  if (userState <= 4) {
    uint64_t v6 = off_10011DC98[userState];
  }
  uint64_t v7 = @"Sent";
  unint64_t trackingState = self->_trackingState;
  unint64_t filterMode = self->_filterMode;
  if (trackingState != 1) {
    uint64_t v7 = @"<unknown>";
  }
  if (!trackingState) {
    uint64_t v7 = @"NotSent";
  }
  if (filterMode <= 2) {
    v5 = off_10011DCC0[filterMode];
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p; userState: %@; trackingState: %@; filterMode: %@>",
           v3,
           self,
           v6,
           v7,
           v5);
}

- (id)aps_prettyDescription
{
  unint64_t userState = self->_userState;
  uint64_t v3 = @"<unknown>";
  v4 = @"<unknown>";
  if (userState <= 4) {
    v4 = off_10011DC98[userState];
  }
  unint64_t trackingState = self->_trackingState;
  unint64_t filterMode = self->_filterMode;
  if (trackingState == 1) {
    uint64_t v7 = @"Sent";
  }
  else {
    uint64_t v7 = @"<unknown>";
  }
  if (!trackingState) {
    uint64_t v7 = @"NotSent";
  }
  if (filterMode <= 2) {
    uint64_t v3 = off_10011DCC0[filterMode];
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<userState: %@; trackingState: %@; filterMode: %@>",
           v4,
           v7,
           v3);
}

- (unint64_t)userState
{
  return self->_userState;
}

- (unint64_t)trackingState
{
  return self->_trackingState;
}

- (void)setTrackingState:(unint64_t)a3
{
  self->_unint64_t trackingState = a3;
}

- (unint64_t)filterMode
{
  return self->_filterMode;
}

- (void)setFilterMode:(unint64_t)a3
{
  self->_unint64_t filterMode = a3;
}

@end