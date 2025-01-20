@interface SCATMenuItemElement
- (BOOL)allowsDwellScanningToAbortAfterTimeout;
- (BOOL)scatIndicatesOwnFocus;
- (BOOL)scatPerformAction:(int)a3;
- (BOOL)scatShouldActivateDirectly;
- (BOOL)scatShouldSuppressAudioOutput;
- (BOOL)scatSupportsAction:(int)a3;
- (SCATMenuItemElement)initWithMenuItem:(id)a3;
- (SCATModernMenuItem)menuItem;
- (id)accessibilityLabel;
- (id)scatSpeakableDescription;
- (void)setMenuItem:(id)a3;
@end

@implementation SCATMenuItemElement

- (SCATMenuItemElement)initWithMenuItem:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SCATMenuItemElement;
  v5 = -[SCATMenuItemElement init](&v8, "init");
  v6 = v5;
  if (v5) {
    -[SCATMenuItemElement setMenuItem:](v5, "setMenuItem:", v4);
  }

  return v6;
}

- (BOOL)scatSupportsAction:(int)a3
{
  return a3 == 2010;
}

- (BOOL)scatPerformAction:(int)a3
{
  if (a3 != 2010) {
    return 0;
  }
  v3 = self;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemElement menuItem](self, "menuItem"));
  LOBYTE(v3) = [v4 handleActivateWithElement:v3];

  return (char)v3;
}

- (BOOL)scatShouldActivateDirectly
{
  return 1;
}

- (BOOL)scatIndicatesOwnFocus
{
  return 1;
}

- (id)scatSpeakableDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemElement menuItem](self, "menuItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 accessibilityLabel]);

  return v3;
}

- (BOOL)scatShouldSuppressAudioOutput
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemElement menuItem](self, "menuItem"));
  unsigned __int8 v3 = [v2 shouldSuppressAudioOutput];

  return v3;
}

- (id)accessibilityLabel
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemElement menuItem](self, "menuItem"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 accessibilityLabel]);

  return v3;
}

- (BOOL)allowsDwellScanningToAbortAfterTimeout
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemElement menuItem](self, "menuItem"));
  unsigned __int8 v3 = [v2 allowsDwellScanningToAbortAfterTimeout];

  return v3;
}

- (SCATModernMenuItem)menuItem
{
  return (SCATModernMenuItem *)objc_loadWeakRetained((id *)&self->_menuItem);
}

- (void)setMenuItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end