@interface CTXPCContextInfo
+ (id)csd_unknownContextInfoForAccountID:(id)a3;
- (BOOL)csd_isTelephony;
- (BOOL)csd_isThumper;
- (BOOL)csd_isUnknown;
@end

@implementation CTXPCContextInfo

+ (id)csd_unknownContextInfoForAccountID:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "csd_UUIDv5"));
  if (v4) {
    v5 = -[CTXPCContextInfo initWithUUID:andAccountID:andSlot:]( objc_alloc(&OBJC_CLASS___CTXPCContextInfo),  "initWithUUID:andAccountID:andSlot:",  v4,  v3,  0LL);
  }
  else {
    v5 = 0LL;
  }

  return v5;
}

- (BOOL)csd_isTelephony
{
  return -[CTXPCContextInfo slotID](self, "slotID") != 0LL;
}

- (BOOL)csd_isThumper
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CTXPCContextInfo accountID](self, "accountID"));
  if ([v3 length]) {
    BOOL v4 = -[CTXPCContextInfo slotID](self, "slotID") == 0LL;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)csd_isUnknown
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CTXPCContextInfo accountID](self, "accountID"));
  BOOL v7 = [v3 length]
    && (BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "csd_UUIDv5")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[CTXPCContextInfo uuid](self, "uuid")),
        unsigned int v6 = [v4 isEqual:v5],
        v5,
        v4,
        v6)
    && -[CTXPCContextInfo slotID](self, "slotID") == 0LL;

  return v7;
}

@end