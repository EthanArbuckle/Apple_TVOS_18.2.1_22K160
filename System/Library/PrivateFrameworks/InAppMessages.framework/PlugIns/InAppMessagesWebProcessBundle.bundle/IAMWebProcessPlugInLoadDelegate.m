@interface IAMWebProcessPlugInLoadDelegate
- (IAMWebProcessDelegate)webProcessDelegate;
- (IAMWebProcessJSO)webProcessJSO;
- (JSContext)currentJSContext;
- (void)setCurrentJSContext:(id)a3;
- (void)setWebProcessDelegate:(id)a3;
- (void)setWebProcessJSO:(id)a3;
- (void)setWebProcessJSOContentPages:(id)a3;
- (void)setWebProcessJSOState:(int64_t)a3;
- (void)webProcessJSODidCallClose;
- (void)webProcessJSODidCallOpen:(id)a3 options:(id)a4;
- (void)webProcessJSODidCallPerformAction:(id)a3 options:(id)a4;
- (void)webProcessJSODidReportEvent:(id)a3;
- (void)webProcessPlugInBrowserContextController:(id)a3 globalObjectIsAvailableForFrame:(id)a4 inScriptWorld:(id)a5;
@end

@implementation IAMWebProcessPlugInLoadDelegate

- (void)webProcessPlugInBrowserContextController:(id)a3 globalObjectIsAvailableForFrame:(id)a4 inScriptWorld:(id)a5
{
  id v17 = a4;
  id v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IAMWebProcessPlugInLoadDelegate currentJSContext](self, "currentJSContext"));

  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v17 jsContextForWorld:v7]);
    -[IAMWebProcessPlugInLoadDelegate setCurrentJSContext:](self, "setCurrentJSContext:", v9);

    v10 = objc_opt_new(&OBJC_CLASS___IAMWebProcessJSO);
    -[IAMWebProcessPlugInLoadDelegate setWebProcessJSO:](self, "setWebProcessJSO:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[IAMWebProcessPlugInLoadDelegate webProcessJSO](self, "webProcessJSO"));
    [v11 setDelegate:self];

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[IAMWebProcessPlugInLoadDelegate webProcessJSO](self, "webProcessJSO"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[IAMWebProcessPlugInLoadDelegate currentJSContext](self, "currentJSContext"));
    [v13 setObject:v12 forKeyedSubscript:@"inappmessages"];

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[IAMWebProcessPlugInLoadDelegate webProcessJSO](self, "webProcessJSO"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[IAMWebProcessPlugInLoadDelegate currentJSContext](self, "currentJSContext"));
    [v14 initializeInContext:v15];

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[IAMWebProcessPlugInLoadDelegate webProcessDelegate](self, "webProcessDelegate"));
    [v16 webProcessPlugInBrowserContextControllerGlobalObjectIsAvailableForFrame];
  }
}

- (void)webProcessJSODidReportEvent:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[IAMWebProcessPlugInLoadDelegate webProcessDelegate](self, "webProcessDelegate"));
  [v5 webProcessJSODidReportEvent:v4];
}

- (void)webProcessJSODidCallPerformAction:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[IAMWebProcessPlugInLoadDelegate webProcessDelegate](self, "webProcessDelegate"));
  [v8 webProcessJSODidCallPerformAction:v7 options:v6];
}

- (void)webProcessJSODidCallOpen:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[IAMWebProcessPlugInLoadDelegate webProcessDelegate](self, "webProcessDelegate"));
  [v8 webProcessJSODidCallOpen:v7 options:v6];
}

- (void)webProcessJSODidCallClose
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[IAMWebProcessPlugInLoadDelegate webProcessDelegate](self, "webProcessDelegate"));
  [v2 webProcessJSODidCallClose];
}

- (void)setWebProcessJSOContentPages:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IAMWebProcessPlugInLoadDelegate webProcessJSO](self, "webProcessJSO"));

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IAMWebProcessPlugInLoadDelegate webProcessJSO](self, "webProcessJSO"));
    [v5 setContentPages:v6];
  }
}

- (void)setWebProcessJSOState:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IAMWebProcessPlugInLoadDelegate webProcessJSO](self, "webProcessJSO"));

  if (v5)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[IAMWebProcessPlugInLoadDelegate webProcessJSO](self, "webProcessJSO"));
    [v6 setState:a3];
  }

- (IAMWebProcessDelegate)webProcessDelegate
{
  return self->_webProcessDelegate;
}

- (void)setWebProcessDelegate:(id)a3
{
}

- (JSContext)currentJSContext
{
  return self->_currentJSContext;
}

- (void)setCurrentJSContext:(id)a3
{
}

- (IAMWebProcessJSO)webProcessJSO
{
  return self->_webProcessJSO;
}

- (void)setWebProcessJSO:(id)a3
{
}

- (void).cxx_destruct
{
}

@end