@interface GCTVSettingsCopilotFusedControllerWrapper
- (BOOL)controllerIsCopilot;
- (GCTVSettingsControllerRepresentedObject)representedObject;
- (GCTVSettingsCopilotFusedControllerWrapper)initWithCopilot:(id)a3 controllerIsCopilot:(BOOL)a4 representedObject:(id)a5;
- (id)copilot;
- (id)description;
- (void)save;
- (void)setControllerIsCopilot:(BOOL)a3;
- (void)setCopilot:(id)a3;
@end

@implementation GCTVSettingsCopilotFusedControllerWrapper

- (GCTVSettingsCopilotFusedControllerWrapper)initWithCopilot:(id)a3 controllerIsCopilot:(BOOL)a4 representedObject:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = &OBJC_CLASS___GCTVSettingsCopilotFusedControllerWrapper;
  v11 = -[GCTVSettingsCopilotFusedControllerWrapper init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_representedObject, v10);
    v12->_controllerIsCopilot = a4;
    objc_storeStrong(&v12->_copilot, a3);
  }

  return v12;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<GCTVSettingsCopilotFusedControllerWrapper copilot=%@ controllerIsCopilot=%d>",  self->_copilot,  self->_controllerIsCopilot);
}

- (void)setCopilot:(id)a3
{
  id v4 = a3;
  if (self->_copilot != v4)
  {
    id v7 = v4;
    if (v4) {
      v5 = (GCSNilCopilot *)v4;
    }
    else {
      v5 = objc_opt_new(&OBJC_CLASS___GCSNilCopilot);
    }
    id copilot = self->_copilot;
    self->_id copilot = v5;

    -[GCTVSettingsCopilotFusedControllerWrapper save](self, "save");
    id v4 = v7;
  }
}

- (void)save
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsCopilotFusedControllerWrapper representedObject](self, "representedObject"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 controller]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 persistentIdentifier]);

  if (v5 && !self->_controllerIsCopilot)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_representedObject);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained prefsStore]);

    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 copilotFusedControllers]);
    id v9 = [v8 countByEnumeratingWithState:&v48 objects:v52 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v49;
      v47 = v7;
      while (2)
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v49 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v48 + 1) + 8LL * (void)i);
          objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v13 copilotIdentifier]);
          if ([v14 isEqualToString:v5])
          {

LABEL_15:
            id v17 = v13;
            id v7 = v47;
            goto LABEL_16;
          }

          v15 = (void *)objc_claimAutoreleasedReturnValue([v13 pilotIdentifier]);
          unsigned int v16 = [v15 isEqualToString:v5];

          if (v16) {
            goto LABEL_15;
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v48 objects:v52 count:16];
        id v17 = 0LL;
        id v7 = v47;
        if (v10) {
          continue;
        }
        break;
      }
    }

    else
    {
      id v17 = 0LL;
    }

- (id)copilot
{
  return self->_copilot;
}

- (BOOL)controllerIsCopilot
{
  return self->_controllerIsCopilot;
}

- (void)setControllerIsCopilot:(BOOL)a3
{
  self->_controllerIsCopilot = a3;
}

- (GCTVSettingsControllerRepresentedObject)representedObject
{
  return (GCTVSettingsControllerRepresentedObject *)objc_loadWeakRetained((id *)&self->_representedObject);
}

- (void).cxx_destruct
{
}

@end