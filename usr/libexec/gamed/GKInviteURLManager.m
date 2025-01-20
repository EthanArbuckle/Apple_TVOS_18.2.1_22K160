@interface GKInviteURLManager
+ (id)sharedManager;
- (BOOL)isRecordEqualToMostRecentInviteShare:(id)a3;
- (CKRecordID)mostRecentInviteShareRootRecordID;
- (GKInviteURLManager)init;
- (NSMutableSet)acceptingInProgressRecordIDs;
- (OS_dispatch_queue)inviteManagerQueue;
- (void)setAcceptingInProgressRecordIDs:(id)a3;
- (void)setInviteManagerQueue:(id)a3;
- (void)setMostRecentInviteShareRootRecordID:(id)a3;
@end

@implementation GKInviteURLManager

+ (id)sharedManager
{
  if (!os_log_GKGeneral) {
    id v2 = (id)GKOSLoggers(a1, a2);
  }
  v3 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "GKInviteURLManager sharedManager", v5, 2u);
  }

  if (qword_1002BB4F8 != -1) {
    dispatch_once(&qword_1002BB4F8, &stru_1002700A0);
  }
  return (id)qword_1002BB4F0;
}

- (GKInviteURLManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___GKInviteURLManager;
  id v2 = -[GKInviteURLManager init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    -[GKInviteURLManager setAcceptingInProgressRecordIDs:](v2, "setAcceptingInProgressRecordIDs:", v3);

    dispatch_queue_t v4 = dispatch_queue_create("com.apple.gamecenter.inviteurlmanager", &_dispatch_queue_attr_concurrent);
    -[GKInviteURLManager setInviteManagerQueue:](v2, "setInviteManagerQueue:", v4);
  }

  return v2;
}

- (BOOL)isRecordEqualToMostRecentInviteShare:(id)a3
{
  if (!a3) {
    return 0;
  }
  dispatch_queue_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 recordID]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKInviteURLManager mostRecentInviteShareRootRecordID](self, "mostRecentInviteShareRootRecordID"));
  unsigned __int8 v6 = [v4 isEqual:v5];

  return v6;
}

- (CKRecordID)mostRecentInviteShareRootRecordID
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100097928;
  v11 = sub_100097938;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[GKInviteURLManager inviteManagerQueue](self, "inviteManagerQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100097940;
  v6[3] = &unk_10026E058;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CKRecordID *)v4;
}

- (void)setMostRecentInviteShareRootRecordID:(id)a3
{
  id v4 = (CKRecordID *)a3;
  if (self->_mostRecentInviteShareRootRecordID != v4)
  {
    v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[GKInviteURLManager inviteManagerQueue](self, "inviteManagerQueue"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000979F8;
    v6[3] = &unk_10026BDB0;
    v6[4] = self;
    uint64_t v7 = v4;
    dispatch_barrier_async(v5, v6);
  }
}

- (NSMutableSet)acceptingInProgressRecordIDs
{
  return self->_acceptingInProgressRecordIDs;
}

- (void)setAcceptingInProgressRecordIDs:(id)a3
{
}

- (OS_dispatch_queue)inviteManagerQueue
{
  return self->_inviteManagerQueue;
}

- (void)setInviteManagerQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end