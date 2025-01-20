@interface IAPWorkspaceObserver
- (IAPWorkspaceObserverDelegate)delegate;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)applicationsWillInstall:(id)a3;
- (void)applicationsWillUninstall:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startObserving;
- (void)stopObserving;
@end

@implementation IAPWorkspaceObserver

- (void)startObserving
{
}

- (void)stopObserving
{
}

- (IAPWorkspaceObserverDelegate)delegate
{
  return self;
}

- (void)setDelegate:(id)a3
{
  else {
    self->_delegate = (LSApplicationWorkspaceObserverProtocol *)a3;
  }
}

- (void)applicationsWillInstall:(id)a3
{
  if (!self || (p_delegate = &self->_delegate, ((unint64_t)&self->_delegate & 7) != 0))
  {
    __break(0x5516u);
    -[IAPWorkspaceObserver applicationsWillInstall:](self, "applicationsWillInstall:", a3);
  }

  else if ((objc_opt_respondsToSelector(*p_delegate, "applicationsWillInstall:") & 1) != 0)
  {
    -[LSApplicationWorkspaceObserverProtocol applicationsWillInstall:](*p_delegate, "applicationsWillInstall:", a3);
  }

- (void)applicationsDidInstall:(id)a3
{
  if (!self || (p_delegate = &self->_delegate, ((unint64_t)&self->_delegate & 7) != 0))
  {
    __break(0x5516u);
    -[IAPWorkspaceObserver applicationsDidInstall:](self, "applicationsDidInstall:", a3);
  }

  else if ((objc_opt_respondsToSelector(*p_delegate, "applicationsDidInstall:") & 1) != 0)
  {
    -[LSApplicationWorkspaceObserverProtocol applicationsDidInstall:](*p_delegate, "applicationsDidInstall:", a3);
  }

- (void)applicationsWillUninstall:(id)a3
{
  if (!self || (p_delegate = &self->_delegate, ((unint64_t)&self->_delegate & 7) != 0))
  {
    __break(0x5516u);
    -[IAPWorkspaceObserver applicationsWillUninstall:](self, "applicationsWillUninstall:", a3);
  }

  else if ((objc_opt_respondsToSelector(*p_delegate, "applicationsWillUninstall:") & 1) != 0)
  {
    -[LSApplicationWorkspaceObserverProtocol applicationsWillUninstall:](*p_delegate, "applicationsWillUninstall:", a3);
  }

- (void)applicationsDidUninstall:(id)a3
{
  if (!self || (p_delegate = &self->_delegate, ((unint64_t)&self->_delegate & 7) != 0))
  {
    __break(0x5516u);
    -[IAPWorkspaceObserver applicationsDidUninstall:](self, "applicationsDidUninstall:", a3);
  }

  else if ((objc_opt_respondsToSelector(*p_delegate, "applicationsDidUninstall:") & 1) != 0)
  {
    -[LSApplicationWorkspaceObserverProtocol applicationsDidUninstall:](*p_delegate, "applicationsDidUninstall:", a3);
  }

@end