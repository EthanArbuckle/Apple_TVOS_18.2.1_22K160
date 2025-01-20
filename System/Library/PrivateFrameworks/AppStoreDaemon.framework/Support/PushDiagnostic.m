@interface PushDiagnostic
- (void)pushService:(id)a3 didReceiveMessage:(id)a4 completionHandler:(id)a5;
- (void)pushService:(id)a3 recoverFromDroppedMessagesOfActionType:(unint64_t)a4 completionHandler:(id)a5;
@end

@implementation PushDiagnostic

- (void)pushService:(id)a3 didReceiveMessage:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  v8 = (void (**)(id, void))a5;
  uint64_t v9 = ASDLogHandleForCategory(14LL);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    int v13 = 138412546;
    id v14 = (id)objc_opt_class(self, v11);
    __int16 v15 = 2112;
    id v16 = v7;
    id v12 = v14;
    _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "[%@]: ** RECEIVED CONNECTION TEST: %@ **",  (uint8_t *)&v13,  0x16u);
  }

  v8[2](v8, 0LL);
}

- (void)pushService:(id)a3 recoverFromDroppedMessagesOfActionType:(unint64_t)a4 completionHandler:(id)a5
{
}

@end