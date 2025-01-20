@interface CSDCallHistoryController
- (CSDCallHistoryController)init;
- (CSDCallHistoryControllerDelegate)delegate;
- (void)allCallHistoryDeleted;
- (void)recentCallsDeleted:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CSDCallHistoryController

- (CSDCallHistoryController)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSDCallHistoryController;
  return -[CSDCallHistoryController init](&v3, "init");
}

- (void)recentCallsDeleted:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Recent calls deleted: %@",  (uint8_t *)&v10,  0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallHistoryController delegate](self, "delegate"));
  char v8 = objc_opt_respondsToSelector(v7, "recentCallsDeleted:");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallHistoryController delegate](self, "delegate"));
    [v9 recentCallsDeleted:v4];
  }
}

- (void)allCallHistoryDeleted
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallHistoryController delegate](self, "delegate"));
  char v4 = objc_opt_respondsToSelector(v3, "allCallHistoryDeleted");

  if ((v4 & 1) != 0)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[CSDCallHistoryController delegate](self, "delegate"));
    [v5 allCallHistoryDeleted];
  }

- (CSDCallHistoryControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end