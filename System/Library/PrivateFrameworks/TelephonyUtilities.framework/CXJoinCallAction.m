@interface CXJoinCallAction
- (BOOL)isValidScreenSharingRequest;
- (TUScreenSharingRequest)tuScreenSharingRequest;
@end

@implementation CXJoinCallAction

- (TUScreenSharingRequest)tuScreenSharingRequest
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CXJoinCallAction remoteMembers](self, "remoteMembers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 anyObject]);

  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 tuHandle]);
  v6 = 0LL;
  if (-[CXJoinCallAction isValidScreenSharingRequest](self, "isValidScreenSharingRequest") && v5)
  {
    id v7 = -[CXJoinCallAction screenShareRequestType](self, "screenShareRequestType");
    if (v7 == (id)1)
    {
      uint64_t v8 = 0LL;
    }

    else
    {
      if (v7 != (id)2)
      {
        v6 = 0LL;
        goto LABEL_9;
      }

      uint64_t v8 = 1LL;
    }

    v6 = -[TUScreenSharingRequest initWithHandle:shareMyScreen:originType:shouldSendLegacyInvite:]( objc_alloc(&OBJC_CLASS___TUScreenSharingRequest),  "initWithHandle:shareMyScreen:originType:shouldSendLegacyInvite:",  v5,  v8,  1LL,  -[CXJoinCallAction shouldSendLegacyScreenSharingInvite](self, "shouldSendLegacyScreenSharingInvite"));
  }

- (BOOL)isValidScreenSharingRequest
{
  if (!-[CXJoinCallAction screenShareRequestType](self, "screenShareRequestType")) {
    return 1;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CXJoinCallAction remoteMembers](self, "remoteMembers"));
  id v4 = [v3 count];

  if (v4 == (id)1) {
    return 1;
  }
  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_1002B9A64((uint64_t)self, v7);
  }

  return 0;
}

@end