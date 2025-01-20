@interface PBUserProfilePictureServiceListener
- (void)activate;
- (void)dealloc;
- (void)invalidate;
@end

@implementation PBUserProfilePictureServiceListener

- (void)dealloc
{
  if (self->_listener)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Lifecycle error, invalidate must be called before releasing."));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027F340(a2, (uint64_t)self, (uint64_t)v4);
    }
    _bs_set_crash_log_message([v4 UTF8String]);
    __break(0);
  }

  else
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___PBUserProfilePictureServiceListener;
    -[PBUserProfilePictureServiceListener dealloc](&v5, "dealloc");
  }

- (void)activate
{
  if (!self->_listener)
  {
    int v3 = _os_feature_enabled_impl("UserProfiles", "loreto");
    v4 = off_1003CDA40;
    if (!v3) {
      v4 = off_1003CDA28;
    }
    id v5 = objc_alloc_init(*v4);
    [v5 activate];
    listener = self->_listener;
    self->_listener = (BSInvalidatable *)v5;
  }

- (void)invalidate
{
  listener = self->_listener;
  self->_listener = 0LL;
}

- (void).cxx_destruct
{
}

@end