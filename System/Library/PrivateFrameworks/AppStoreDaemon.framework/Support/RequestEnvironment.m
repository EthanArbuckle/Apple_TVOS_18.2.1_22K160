@interface RequestEnvironment
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation RequestEnvironment

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = -[RequestEnvironment init]( +[RequestEnvironment allocWithZone:](&OBJC_CLASS___RequestEnvironment, "allocWithZone:"),  "init");
  v6 = (AMSProcessInfo *)-[AMSProcessInfo copyWithZone:](self->_clientInfo, "copyWithZone:", a3);
  clientInfo = v5->_clientInfo;
  v5->_clientInfo = v6;

  objc_storeStrong((id *)&v5->_logKey, self->_logKey);
  id v8 = [self->_reconfigureRequestHandler copyWithZone:a3];
  id reconfigureRequestHandler = v5->_reconfigureRequestHandler;
  v5->_id reconfigureRequestHandler = v8;

  objc_storeStrong((id *)&v5->_requestPresenter, self->_requestPresenter);
  return v5;
}

- (void).cxx_destruct
{
}

@end