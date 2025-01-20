@interface PBConferenceRoomDisplayOpenAppRestrictionTransaction
- (PBConferenceRoomDisplayOpenAppRestrictionTransaction)initWithRequest:(id)a3;
- (PBOpenApplicationRequest)request;
- (void)_begin;
@end

@implementation PBConferenceRoomDisplayOpenAppRestrictionTransaction

- (PBConferenceRoomDisplayOpenAppRestrictionTransaction)initWithRequest:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    v7 = v6;
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___PBConferenceRoomDisplayOpenAppRestrictionTransaction;
    v8 = -[PBConferenceRoomDisplayOpenAppRestrictionTransaction init](&v12, "init");
    v9 = v8;
    if (v8) {
      objc_storeStrong((id *)&v8->_request, a3);
    }

    return v9;
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"request != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002819CC(a2, (uint64_t)self, (uint64_t)v11);
    }
    result = (PBConferenceRoomDisplayOpenAppRestrictionTransaction *)_bs_set_crash_log_message( [v11 UTF8String]);
    __break(0);
  }

  return result;
}

- (void)_begin
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PBConferenceRoomDisplayOpenAppRestrictionTransaction;
  -[PBConferenceRoomDisplayOpenAppRestrictionTransaction _begin](&v11, "_begin");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBOpenApplicationRequest toAppInfo](self->_request, "toAppInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[PBConferenceRoomDisplayManager sharedInstance]( &OBJC_CLASS___PBConferenceRoomDisplayManager,  "sharedInstance"));
  if (([v5 isPresenting] & 1) == 0)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[PBScreenSaverManager sharedInstance](&OBJC_CLASS___PBScreenSaverManager, "sharedInstance"));
    if (([v6 isPresenting] & 1) == 0
      || ([v4 isEqualToString:@"com.apple.TVConferenceRoomDisplay"] & 1) != 0)
    {
      goto LABEL_9;
    }

    unsigned __int8 v7 = -[PBOpenApplicationRequest isForeground](self->_request, "isForeground");

    if ((v7 & 1) == 0) {
      goto LABEL_10;
    }
LABEL_8:
    -[PBConferenceRoomDisplayOpenAppRestrictionTransaction addMilestone:]( self,  "addMilestone:",  @"MilestoneCRDRestrictionCheckComplete");
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10010D2A4;
    v8[3] = &unk_1003D63D8;
    id v9 = v5;
    v10 = self;
    [v9 canStopCRDWithResult:v8];
    id v6 = v9;
LABEL_9:

    goto LABEL_10;
  }

  if (([v4 isEqualToString:@"com.apple.TVConferenceRoomDisplay"] & 1) == 0
    && -[PBOpenApplicationRequest isForeground](self->_request, "isForeground"))
  {
    goto LABEL_8;
  }

- (PBOpenApplicationRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
}

@end