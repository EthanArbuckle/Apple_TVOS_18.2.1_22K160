@interface StoreKitMessageInfo
- (BOOL)allowDeveloperControl;
- (NSNumber)status;
- (NSNumber)userID;
- (NSString)bundleID;
- (StoreKitMessageInfo)initWithUserID:(id)a3 bundleID:(id)a4 status:(id)a5 allowDeveloperControl:(BOOL)a6 messageType:(int64_t)a7;
- (int64_t)type;
@end

@implementation StoreKitMessageInfo

- (StoreKitMessageInfo)initWithUserID:(id)a3 bundleID:(id)a4 status:(id)a5 allowDeveloperControl:(BOOL)a6 messageType:(int64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if (!v13)
  {
    if (qword_10032EFA0 != -1) {
      dispatch_once(&qword_10032EFA0, &stru_1002E9F90);
    }
    v19 = (os_log_s *)qword_10032EF58;
    if (os_log_type_enabled((os_log_t)qword_10032EF58, OS_LOG_TYPE_ERROR)) {
      sub_100263DE4(v19, v20, v21, v22, v23, v24, v25, v26);
    }
    goto LABEL_14;
  }

  if (!v14)
  {
    if (qword_10032EFA0 != -1) {
      dispatch_once(&qword_10032EFA0, &stru_1002E9F90);
    }
    v27 = (os_log_s *)qword_10032EF58;
    if (os_log_type_enabled((os_log_t)qword_10032EF58, OS_LOG_TYPE_ERROR)) {
      sub_100263E18(v27, v28, v29, v30, v31, v32, v33, v34);
    }
LABEL_14:
    v18 = 0LL;
    goto LABEL_15;
  }

  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___StoreKitMessageInfo;
  v16 = -[StoreKitMessageInfo init](&v36, "init");
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_userID, a3);
    objc_storeStrong((id *)&v17->_bundleID, a4);
    objc_storeStrong((id *)&v17->_status, a5);
    v17->_allowDeveloperControl = a6;
    v17->_type = a7;
  }

  self = v17;
  v18 = self;
LABEL_15:

  return v18;
}

- (NSNumber)userID
{
  return self->_userID;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSNumber)status
{
  return self->_status;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)allowDeveloperControl
{
  return self->_allowDeveloperControl;
}

- (void).cxx_destruct
{
}

@end