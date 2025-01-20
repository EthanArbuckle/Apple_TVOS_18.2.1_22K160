@interface AppleIDAuthorizationRequestInfo
- (AppleIDAuthorizationRequestInfo)initWithClientID:(id)a3 teamID:(id)a4 serviceID:(id)a5;
- (NSString)clientID;
- (NSString)serviceID;
- (NSString)teamID;
@end

@implementation AppleIDAuthorizationRequestInfo

- (AppleIDAuthorizationRequestInfo)initWithClientID:(id)a3 teamID:(id)a4 serviceID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    if (qword_10032DCA8 != -1) {
      dispatch_once(&qword_10032DCA8, &stru_1002E6990);
    }
    v15 = (os_log_s *)qword_10032DC60;
    if (os_log_type_enabled((os_log_t)qword_10032DC60, OS_LOG_TYPE_ERROR)) {
      sub_10025B10C((uint64_t)self, v15, v16, v17, v18, v19, v20, v21);
    }
    goto LABEL_14;
  }

  if (!v10)
  {
    if (qword_10032DCA8 != -1) {
      dispatch_once(&qword_10032DCA8, &stru_1002E6990);
    }
    v22 = (os_log_s *)qword_10032DC60;
    if (os_log_type_enabled((os_log_t)qword_10032DC60, OS_LOG_TYPE_ERROR)) {
      sub_10025B174((uint64_t)self, v22, v23, v24, v25, v26, v27, v28);
    }
LABEL_14:
    v14 = 0LL;
    goto LABEL_15;
  }

  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___AppleIDAuthorizationRequestInfo;
  v12 = -[AppleIDAuthorizationRequestInfo init](&v30, "init");
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_clientID, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
  }

  self = p_isa;
  v14 = self;
LABEL_15:

  return v14;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (NSString)teamID
{
  return self->_teamID;
}

- (NSString)serviceID
{
  return self->_serviceID;
}

- (void).cxx_destruct
{
}

@end