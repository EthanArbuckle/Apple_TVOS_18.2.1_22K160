@interface SCATAlternateKeysManager
- (BOOL)canBeActiveElementManager;
- (BOOL)handleInputAction:(id)a3 withElement:(id)a4;
- (CGPoint)_fingerControllerPointForKeyboardKey:(id)a3;
- (NSArray)alternateKeys;
- (SCATAlternateKeysManagerDelegate)delegate;
- (SCATElement)currentKeyForAlternates;
- (id)_fingerController;
- (id)allElements;
- (void)_cleanUpAlternateKeyOperations;
- (void)_releaseLastShownKey;
- (void)_selectAlternateKey:(id)a3;
- (void)_updateAlternateKeys;
- (void)accessibilityManager:(id)a3 didReceiveEvent:(int64_t)a4 data:(id)a5;
- (void)dealloc;
- (void)didFetchElements:(id)a3 foundNewElements:(BOOL)a4 currentFocusContext:(id)a5 didChangeActiveElementManager:(BOOL)a6;
- (void)setAlternateKeys:(id)a3;
- (void)setCurrentKeyForAlternates:(id)a3;
- (void)setDelegate:(id)a3;
- (void)showAlternateKeysForKey:(id)a3;
@end

@implementation SCATAlternateKeysManager

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SCATAlternateKeysManager;
  -[SCATAlternateKeysManager dealloc](&v4, "dealloc");
}

- (BOOL)canBeActiveElementManager
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAlternateKeysManager currentKeyForAlternates](self, "currentKeyForAlternates"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (void)_updateAlternateKeys
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SCATAlternateKeysManager currentKeyForAlternates](self, "currentKeyForAlternates"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v4 scatAlternateKeys]);
  -[SCATAlternateKeysManager setAlternateKeys:](self, "setAlternateKeys:", v3);
}

- (id)_fingerController
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 fingerController]);

  return v3;
}

- (CGPoint)_fingerControllerPointForKeyboardKey:(id)a3
{
  double Center = AX_CGRectGetCenter([a3 scatFrame]);
  double v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAlternateKeysManager _fingerController](self, "_fingerController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 fingerContainerView]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 fingerContainerView]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 window]);
  objc_msgSend(v10, "convertPoint:fromWindow:", 0, Center, v6);
  objc_msgSend(v8, "convertPoint:fromView:", 0);
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.y = v16;
  result.x = v15;
  return result;
}

- (void)showAlternateKeysForKey:(id)a3
{
  id v4 = a3;
  -[SCATAlternateKeysManager _fingerControllerPointForKeyboardKey:](self, "_fingerControllerPointForKeyboardKey:", v4);
  double v6 = v5;
  double v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAlternateKeysManager _fingerController](self, "_fingerController"));
  objc_msgSend(v9, "performDownAtPoint:", v6, v8);

  -[SCATAlternateKeysManager setCurrentKeyForAlternates:](self, "setCurrentKeyForAlternates:", v4);
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  [v10 endScanning];
}

- (void)_cleanUpAlternateKeyOperations
{
}

- (void)_selectAlternateKey:(id)a3
{
  id v4 = a3;
  -[SCATAlternateKeysManager _fingerControllerPointForKeyboardKey:](self, "_fingerControllerPointForKeyboardKey:", v4);
  double v6 = v5;
  double v8 = v7;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[SCATAlternateKeysManager _fingerController](self, "_fingerController"));
  objc_msgSend(v10, "performMoveToPoint:", v6, v8);
  objc_msgSend(v10, "performUpAtPoint:", v6, v8);
  -[SCATAlternateKeysManager _cleanUpAlternateKeyOperations](self, "_cleanUpAlternateKeyOperations");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAlternateKeysManager delegate](self, "delegate"));
  [v9 alternateKeysManager:self didSelectAlternateKey:v4];
}

- (void)_releaseLastShownKey
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAlternateKeysManager currentKeyForAlternates](self, "currentKeyForAlternates"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAlternateKeysManager _fingerController](self, "_fingerController"));
    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAlternateKeysManager currentKeyForAlternates](self, "currentKeyForAlternates"));
    -[SCATAlternateKeysManager _fingerControllerPointForKeyboardKey:](self, "_fingerControllerPointForKeyboardKey:", v5);
    objc_msgSend(v4, "performUpAtPoint:");
  }

  -[SCATAlternateKeysManager _cleanUpAlternateKeyOperations](self, "_cleanUpAlternateKeyOperations");
}

- (id)allElements
{
  return -[SCATAlternateKeysManager alternateKeys](self, "alternateKeys");
}

- (void)didFetchElements:(id)a3 foundNewElements:(BOOL)a4 currentFocusContext:(id)a5 didChangeActiveElementManager:(BOOL)a6
{
  id v9 = a3;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstKeyboardItem]);

  if (!v8)
  {
    -[SCATAlternateKeysManager _releaseLastShownKey](self, "_releaseLastShownKey");
    [v9 beginScanningWithFocusContext:0];
  }
}

- (BOOL)handleInputAction:(id)a3 withElement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 action] == (id)100
    || [v6 action] == (id)103
    || [v6 action] == (id)109)
  {
    -[SCATAlternateKeysManager _selectAlternateKey:](self, "_selectAlternateKey:", v7);
    BOOL v8 = 1;
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)accessibilityManager:(id)a3 didReceiveEvent:(int64_t)a4 data:(id)a5
{
  if (a4 == 9)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAlternateKeysManager currentKeyForAlternates](self, "currentKeyForAlternates", a3, 9LL, a5));

    if (v6)
    {
      -[SCATAlternateKeysManager _updateAlternateKeys](self, "_updateAlternateKeys");
      id v7 = (id)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
      [v7 beginScanningWithFocusContext:0];
    }
  }

- (SCATAlternateKeysManagerDelegate)delegate
{
  return (SCATAlternateKeysManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (SCATElement)currentKeyForAlternates
{
  return self->_currentKeyForAlternates;
}

- (void)setCurrentKeyForAlternates:(id)a3
{
}

- (NSArray)alternateKeys
{
  return self->_alternateKeys;
}

- (void)setAlternateKeys:(id)a3
{
}

- (void).cxx_destruct
{
}

@end