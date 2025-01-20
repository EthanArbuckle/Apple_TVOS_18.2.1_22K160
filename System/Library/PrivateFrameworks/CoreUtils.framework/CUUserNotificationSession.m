@interface CUUserNotificationSession
- (BOOL)_runInit:(id *)a3;
- (BOOL)_runRequestAddStart:(id *)a3;
- (BOOL)_runResponse:(id)a3 error:(id *)a4;
- (CUUserNotificationSession)init;
- (NSArray)bodyArguments;
- (NSArray)subtitleArguments;
- (NSArray)titleArguments;
- (NSDictionary)userInfo;
- (NSString)bodyKey;
- (NSString)bundleID;
- (NSString)categoryID;
- (NSString)description;
- (NSString)header;
- (NSString)iconAppIdentifier;
- (NSString)iconName;
- (NSString)iconPath;
- (NSString)iconSystemName;
- (NSString)identifier;
- (NSString)label;
- (NSString)subtitleKey;
- (NSString)titleKey;
- (OS_dispatch_queue)dispatchQueue;
- (UNNotificationSound)sound;
- (double)timeoutSeconds;
- (id)actionHandler;
- (int)interruptionLevel;
- (int64_t)soundAlertType;
- (unsigned)flags;
- (void)_invalidate;
- (void)_invalidated;
- (void)_reportError:(id)a3;
- (void)_reportTimeout;
- (void)_run;
- (void)_runAuthorizeCheckStart;
- (void)_runAuthorizeRequestStart;
- (void)_updateActionCategories;
- (void)activate;
- (void)addActionWithIdentifier:(id)a3 title:(id)a4 flags:(unsigned int)a5 handler:(id)a6;
- (void)dealloc;
- (void)invalidate;
- (void)removeActionWithIdentifier:(id)a3;
- (void)removeAllActions;
- (void)setActionHandler:(id)a3;
- (void)setBodyArguments:(id)a3;
- (void)setBodyKey:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setCategoryID:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setHeader:(id)a3;
- (void)setIconAppIdentifier:(id)a3;
- (void)setIconName:(id)a3;
- (void)setIconPath:(id)a3;
- (void)setIconSystemName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInterruptionLevel:(int)a3;
- (void)setLabel:(id)a3;
- (void)setSound:(id)a3;
- (void)setSoundAlertType:(int64_t)a3;
- (void)setSubtitleArguments:(id)a3;
- (void)setSubtitleKey:(id)a3;
- (void)setTimeoutSeconds:(double)a3;
- (void)setTitleArguments:(id)a3;
- (void)setTitleKey:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation CUUserNotificationSession

- (CUUserNotificationSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CUUserNotificationSession;
  v2 = -[CUUserNotificationSession init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v3->_ucat = (LogCategory *)&gLogCategory_CUUserNotificationSession;
    v4 = v3;
  }

  return v3;
}

- (void)dealloc
{
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CUUserNotificationSession;
  -[CUUserNotificationSession dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)NSPrintF();
}

- (void)setLabel:(id)a3
{
  id v5 = a3;
  [v5 UTF8String];
  LogCategoryReplaceF((uint64_t *)&self->_ucat);
}

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __37__CUUserNotificationSession_activate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __39__CUUserNotificationSession_invalidate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  v16[1] = *MEMORY[0x1895F89C0];
  v3 = self->_unCenter;
  v8 = self->_requestIdentifier;
  if (v8)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUUserNotificationSession _invalidate]",  0x1Eu,  (uint64_t)"Removing request: %@\n",  v4,  v5,  v6,  v7,  (char)v8);
    }

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    v3 = _Block_copy(self->_actionHandler);
    uint64_t v4 = v3;
    if (v3) {
      (*((void (**)(void *, uint64_t, void))v3 + 2))(v3, 3LL, 0LL);
    }

    id actionHandler = self->_actionHandler;
    self->_id actionHandler = 0LL;

    self->_invalidateDone = 1;
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_7:
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUUserNotificationSession _invalidated]",  0x1Eu,  (uint64_t)"Invalidated\n",  v6,  v7,  v8,  v9,  v11);
        return;
      }

      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_7;
      }
    }
  }

- (void)addActionWithIdentifier:(id)a3 title:(id)a4 flags:(unsigned int)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = -[objc_class actionWithIdentifier:title:options:]( getUNNotificationActionClass(),  "actionWithIdentifier:title:options:",  v10,  v11,  a5 & 7);
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v19[0] = MEMORY[0x1895F87A8];
  v19[1] = 3221225472LL;
  v19[2] = __73__CUUserNotificationSession_addActionWithIdentifier_title_flags_handler___block_invoke;
  v19[3] = &unk_189F32C10;
  id v23 = v11;
  id v24 = v12;
  id v20 = v13;
  v21 = self;
  id v22 = v10;
  unsigned int v25 = a5;
  id v15 = v11;
  id v16 = v10;
  id v17 = v12;
  id v18 = v13;
  dispatch_async(dispatchQueue, v19);
}

- (void)removeActionWithIdentifier:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __56__CUUserNotificationSession_removeActionWithIdentifier___block_invoke;
  v7[3] = &unk_189F33088;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)removeAllActions
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __45__CUUserNotificationSession_removeAllActions__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_updateActionCategories
{
  if (self->_actionsChanged)
  {
    categoryID = self->_categoryID;
    if (categoryID)
    {
      id v4 = (objc_class *)MEMORY[0x189603FA8];
      uint64_t v5 = categoryID;
      id v6 = objc_alloc_init(v4);
      actions = self->_actions;
      v10[0] = MEMORY[0x1895F87A8];
      v10[1] = 3221225472LL;
      v10[2] = __52__CUUserNotificationSession__updateActionCategories__block_invoke;
      v10[3] = &unk_189F32C38;
      v10[4] = v6;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](actions, "enumerateKeysAndObjectsUsingBlock:", v10);
      -[objc_class categoryWithIdentifier:actions:intentIdentifiers:options:]( getUNNotificationCategoryClass(),  "categoryWithIdentifier:actions:intentIdentifiers:options:",  v5,  v6,  MEMORY[0x189604A58],  1LL);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      id v8 = (void *)[objc_alloc(MEMORY[0x189604010]) initWithObjects:&v9 count:1];
      -[UNUserNotificationCenter setNotificationCategories:](self->_unCenter, "setNotificationCategories:", v8);
      self->_actionsChanged = 0;
    }
  }

- (void)_reportError:(id)a3
{
  id v13 = a3;
  ucat = self->_ucat;
  if (ucat->var0 <= 90)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      uint64_t state = self->_state;
      else {
        id v10 = off_189F32D68[state];
      }
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUUserNotificationSession _reportError:]",  0x5Au,  (uint64_t)"### Failed: %s, %{error}\n",  v4,  v5,  v6,  v7,  (char)v10);
      goto LABEL_9;
    }

    if (_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }

- (void)_reportTimeout
{
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUUserNotificationSession _reportTimeout]",  0x1Eu,  (uint64_t)"Timeout\n",  v2,  v3,  v4,  v5,  v10);
      goto LABEL_5;
    }

    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }

- (void)_run
{
  while (2)
  {
    if (!self->_invalidateCalled)
    {
      int state = self->_state;
      switch(state)
      {
        case 0:
          id v10 = 0LL;
          -[CUUserNotificationSession _runInit:](self, "_runInit:", &v10);
          id v4 = v10;
          if (v4) {
            goto LABEL_26;
          }
          self->_int state = 10;
          goto LABEL_27;
        case 10:
          -[CUUserNotificationSession _runAuthorizeCheckStart](self, "_runAuthorizeCheckStart");
          goto LABEL_23;
        case 11:
          if (self->_stepError) {
            -[CUUserNotificationSession _reportError:](self, "_reportError:");
          }
          int stepState = self->_stepState;
          if (stepState == 1) {
            goto LABEL_28;
          }
          if (stepState != 2) {
            goto LABEL_23;
          }
          self->_int state = 14;
          goto LABEL_28;
        case 12:
          -[CUUserNotificationSession _runAuthorizeRequestStart](self, "_runAuthorizeRequestStart");
          goto LABEL_23;
        case 13:
          if (self->_stepError) {
            -[CUUserNotificationSession _reportError:](self, "_reportError:");
          }
          int v6 = self->_stepState;
          if (v6 == 1) {
            goto LABEL_28;
          }
          if (v6 == 4) {
            goto LABEL_23;
          }
          uint64_t v7 = 4294896150LL;
          goto LABEL_25;
        case 14:
          id v9 = 0LL;
          -[CUUserNotificationSession _runRequestAddStart:](self, "_runRequestAddStart:", &v9);
          id v4 = v9;
          if (v4) {
            goto LABEL_26;
          }
          ++self->_state;
          goto LABEL_27;
        case 15:
          if (self->_stepError) {
            -[CUUserNotificationSession _reportError:](self, "_reportError:");
          }
          int v8 = self->_stepState;
          if (v8 == 1) {
            goto LABEL_28;
          }
          if (v8 == 4)
          {
LABEL_23:
            ++self->_state;
          }

          else
          {
            uint64_t v7 = 4294960596LL;
LABEL_25:
            NSErrorWithOSStatusF((const char *)v7);
            id v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:
            -[CUUserNotificationSession _reportError:](self, "_reportError:", v4);
LABEL_27:
          }

- (BOOL)_runInit:(id *)a3
{
  uint64_t v5 = self->_bundleID;
  if (v5)
  {
    int v6 = self->_categoryID;
    if (v6)
    {
      uint64_t v7 = (void *)[objc_alloc(getUNUserNotificationCenterClass()) initWithBundleIdentifier:v5];
      BOOL v8 = v7 != 0LL;
      if (v7)
      {
        objc_storeStrong((id *)&self->_unCenter, v7);
        [v7 setDelegate:self];
        [v7 setWantsNotificationResponsesDelivered];
        -[CUUserNotificationSession _updateActionCategories](self, "_updateActionCategories");
      }

      else if (a3)
      {
        NSErrorWithOSStatusF((const char *)0xFFFFE5CFLL);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

    else if (a3)
    {
      NSErrorWithOSStatusF((const char *)0xFFFFE5CFLL);
      BOOL v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      BOOL v8 = 0;
    }
  }

  else if (a3)
  {
    NSErrorWithOSStatusF((const char *)0xFFFFE5CFLL);
    BOOL v8 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)_runAuthorizeCheckStart
{
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUUserNotificationSession _runAuthorizeCheckStart]",  0x1Eu,  (uint64_t)"Authorization status request\n",  v2,  v3,  v4,  v5,  v11[0]);
  }

- (void)_runAuthorizeRequestStart
{
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUUserNotificationSession _runAuthorizeRequestStart]",  0x1Eu,  (uint64_t)"Authorize request\n",  v2,  v3,  v4,  v5,  v11[0]);
  }

- (BOOL)_runRequestAddStart:(id *)a3
{
  stepError = self->_stepError;
  self->_stepError = 0LL;

  self->_int stepState = 1;
  int v6 = self->_bundleID;
  if (v6)
  {
    [NSString stringWithFormat:@"/System/Library/UserNotifications/Bundles/%@.bundle", v6];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x1896077F8] bundleWithPath:v7];
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (![v8 _cfBundle])
    {
      if (a3)
      {
        NSErrorWithOSStatusF((const char *)0xFFFFE5CFLL);
        BOOL v11 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        BOOL v11 = 0;
      }

      goto LABEL_49;
    }

    id v9 = objc_alloc_init(getUNMutableNotificationContentClass());
    id v10 = self->_categoryID;
    BOOL v11 = v10 != 0LL;
    if (!v10)
    {
      if (a3)
      {
        NSErrorWithOSStatusF((const char *)0xFFFFE5CFLL);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_48;
    }

    v61 = v6;
    [v9 setCategoryIdentifier:v10];
    id v12 = self->_header;
    if (v12) {
      [v9 setHeader:v12];
    }
    v59 = v8;
    v57 = v12;
    id v13 = self->_iconAppIdentifier;
    if (v13)
    {
      [(Class)getUNNotificationIconClass() iconForApplicationIdentifier:v13];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 setIcon:v14];
    }

    id v15 = self->_iconName;
    if (v15)
    {
      [(Class)getUNNotificationIconClass() iconNamed:v15];
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 setIcon:v16];
    }

    v64 = v15;
    id v17 = self->_iconPath;
    if (v17)
    {
      [(Class)getUNNotificationIconClass() iconAtPath:v17];
      id v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 setIcon:v18];
    }

    v19 = self->_iconSystemName;
    if (v19)
    {
      [(Class)getUNNotificationIconClass() iconForSystemImageNamed:v19];
      id v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 setIcon:v20];
    }

    v63 = v19;
    v21 = self->_titleKey;
    if (v21)
    {
      [NSString localizedUserNotificationStringForKey:v21 arguments:self->_titleArguments];
      id v22 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 setTitle:v22];
    }

    BOOL v58 = v10 != 0LL;
    id v23 = self->_subtitleKey;
    if (v23)
    {
      [NSString localizedUserNotificationStringForKey:v23 arguments:self->_subtitleArguments];
      id v24 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 setSubtitle:v24];
    }

    unsigned int v25 = self->_bodyKey;
    v26 = v63;
    v53 = v25;
    if (v25)
    {
      [NSString localizedUserNotificationStringForKey:v25 arguments:self->_bodyArguments];
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 setBody:v27];
    }

    v54 = v23;
    v28 = v64;
    if ((self->_flags & 1) != 0) {
      [v9 setShouldAuthenticateDefaultAction:1];
    }
    [v9 setShouldBackgroundDefaultAction:1];
    unsigned int flags = self->_flags;
    if ((flags & 8) != 0)
    {
      [v9 setShouldSuppressDefaultAction:1];
      unsigned int flags = self->_flags;
      if ((flags & 0x10) == 0)
      {
LABEL_26:
        if ((flags & 0x40) == 0) {
          goto LABEL_28;
        }
        goto LABEL_27;
      }
    }

    else if ((flags & 0x10) == 0)
    {
      goto LABEL_26;
    }

    [v9 setShouldIgnoreDoNotDisturb:1];
    if ((self->_flags & 0x40) == 0)
    {
LABEL_28:
      if (self->_sound) {
        objc_msgSend(v9, "setSound:");
      }
      v62 = v10;
      int64_t soundAlertType = self->_soundAlertType;
      if (soundAlertType)
      {
        v31 = -[objc_class soundWithAlertType:](getUNNotificationSoundClass(), "soundWithAlertType:", soundAlertType);
        [v9 setSound:v31];
      }

      v60 = v7;
      v32 = self->_userInfo;
      if (v32) {
        [v9 setUserInfo:v32];
      }
      v37 = self->_identifier;
      v56 = v13;
      if (!v37)
      {
        [MEMORY[0x189607AB8] UUID];
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        [v38 UUIDString];
        v37 = (NSString *)objc_claimAutoreleasedReturnValue();

        objc_storeStrong((id *)&self->_identifier, v37);
      }

      v55 = v21;
      ucat = self->_ucat;
      if (ucat->var0 > 30) {
        goto LABEL_43;
      }
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUUserNotificationSession _runRequestAddStart:]",  0x1Eu,  (uint64_t)"Request add start: Category %@, ID %@\n",  v33,  v34,  v35,  v36,  (char)v62);
LABEL_43:
      objc_storeStrong((id *)&self->_requestIdentifier, v37);
      v40 = -[objc_class requestWithIdentifier:content:trigger:]( getUNNotificationRequestClass(),  "requestWithIdentifier:content:trigger:",  v37,  v9,  0LL);
      v41 = self->_unCenter;
      uint64_t v42 = MEMORY[0x1895F87A8];
      v66[0] = MEMORY[0x1895F87A8];
      v66[1] = 3221225472LL;
      v66[2] = __49__CUUserNotificationSession__runRequestAddStart___block_invoke;
      v66[3] = &unk_189F32E40;
      v66[4] = self;
      v66[5] = v41;
      v43 = v37;
      v67 = v43;
      -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:]( v41,  "addNotificationRequest:withCompletionHandler:",  v40,  v66);
      if (self->_timeoutSeconds > 0.0)
      {
        v44 = v17;
        timer = self->_timer;
        if (timer)
        {
          v46 = timer;
          dispatch_source_cancel(v46);
          v47 = self->_timer;
          self->_timer = 0LL;
        }

        v48 = (OS_dispatch_source *)dispatch_source_create( MEMORY[0x1895F8B78],  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
        v49 = self->_timer;
        self->_timer = v48;
        v50 = v48;

        handler[0] = v42;
        handler[1] = 3221225472LL;
        handler[2] = __49__CUUserNotificationSession__runRequestAddStart___block_invoke_3;
        handler[3] = &unk_189F33088;
        handler[4] = v50;
        handler[5] = self;
        dispatch_source_set_event_handler(v50, handler);
        dispatch_time_t v51 = dispatch_time(0LL, (unint64_t)(self->_timeoutSeconds * 1000000000.0));
        dispatch_source_set_timer(v50, v51, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        dispatch_activate(v50);

        id v17 = v44;
        v26 = v63;
        v28 = v64;
      }

      uint64_t v7 = v60;
      int v6 = v61;
      BOOL v8 = v59;
      BOOL v11 = v58;
      id v10 = v62;
LABEL_48:

LABEL_49:
      goto LABEL_50;
    }

- (BOOL)_runResponse:(id)a3 error:(id *)a4
{
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    uint64_t v7 = self->_requestIdentifier;
    if (v7)
    {
      getUNNotificationDefaultActionIdentifier();
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
      int v9 = [v6 isEqual:v8];

      if (v9)
      {
        ucat = self->_ucat;
        if (ucat->var0 > 30) {
          goto LABEL_16;
        }
        if (ucat->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
          {
LABEL_16:
            v29 = (void (**)(void))_Block_copy(self->_actionHandler);
            v30 = v29;
            if (v29)
            {
              v31 = v29[2];
LABEL_21:
              v31();
              goto LABEL_22;
            }

            goto LABEL_22;
          }

          ucat = self->_ucat;
        }

        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUUserNotificationSession _runResponse:error:]",  0x1Eu,  (uint64_t)"Request action default: %@\n",  v10,  v11,  v12,  v13,  (char)v7);
        goto LABEL_16;
      }

      getUNNotificationDismissActionIdentifier();
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      int v16 = [v6 isEqual:v15];

      if (v16)
      {
        v21 = self->_ucat;
        if (v21->var0 > 30) {
          goto LABEL_19;
        }
        if (v21->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v21, 0x1Eu))
          {
LABEL_19:
            v32 = (void (**)(void))_Block_copy(self->_actionHandler);
            v30 = v32;
            if (v32)
            {
              v31 = v32[2];
              goto LABEL_21;
            }

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __105__CUUserNotificationSession_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke;
  v15[3] = &unk_189F32D28;
  id v16 = v8;
  uint64_t v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(dispatchQueue, v15);
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
}

- (NSString)bodyKey
{
  return self->_bodyKey;
}

- (void)setBodyKey:(id)a3
{
}

- (NSArray)bodyArguments
{
  return self->_bodyArguments;
}

- (void)setBodyArguments:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)categoryID
{
  return self->_categoryID;
}

- (void)setCategoryID:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_unsigned int flags = a3;
}

- (NSString)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (NSString)iconAppIdentifier
{
  return self->_iconAppIdentifier;
}

- (void)setIconAppIdentifier:(id)a3
{
}

- (NSString)iconName
{
  return self->_iconName;
}

- (void)setIconName:(id)a3
{
}

- (NSString)iconPath
{
  return self->_iconPath;
}

- (void)setIconPath:(id)a3
{
}

- (NSString)iconSystemName
{
  return self->_iconSystemName;
}

- (void)setIconSystemName:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int)interruptionLevel
{
  return self->_interruptionLevel;
}

- (void)setInterruptionLevel:(int)a3
{
  self->_interruptionLevel = a3;
}

- (NSString)label
{
  return self->_label;
}

- (UNNotificationSound)sound
{
  return self->_sound;
}

- (void)setSound:(id)a3
{
}

- (int64_t)soundAlertType
{
  return self->_soundAlertType;
}

- (void)setSoundAlertType:(int64_t)a3
{
  self->_int64_t soundAlertType = a3;
}

- (NSString)subtitleKey
{
  return self->_subtitleKey;
}

- (void)setSubtitleKey:(id)a3
{
}

- (NSArray)subtitleArguments
{
  return self->_subtitleArguments;
}

- (void)setSubtitleArguments:(id)a3
{
}

- (double)timeoutSeconds
{
  return self->_timeoutSeconds;
}

- (void)setTimeoutSeconds:(double)a3
{
  self->_timeoutSeconds = a3;
}

- (NSString)titleKey
{
  return self->_titleKey;
}

- (void)setTitleKey:(id)a3
{
}

- (NSArray)titleArguments
{
  return self->_titleArguments;
}

- (void)setTitleArguments:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

void __105__CUUserNotificationSession_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  if (v9 != *(void *)(v10 + 64))
  {
    uint64_t v11 = *(int **)(v10 + 72);
    if (*v11 <= 30)
    {
      if (*v11 == -1)
      {
        uint64_t v9 = *(void *)(a1 + 32);
        uint64_t v11 = *(int **)(*(void *)(a1 + 40) + 72LL);
      }

      LogPrintF( (uint64_t)v11,  (uint64_t)"-[CUUserNotificationSession userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]_block_invoke",  0x1Eu,  (uint64_t)"Response wrong center: %{ptr} vs %{ptr}\n",  a5,  a6,  a7,  a8,  v9);
    }

void __49__CUUserNotificationSession__runRequestAddStart___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[1] = 3221225472LL;
  int8x16_t v4 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  uint64_t v5 = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x1895F87A8];
  v8[2] = __49__CUUserNotificationSession__runRequestAddStart___block_invoke_2;
  v8[3] = &unk_189F32D00;
  int v6 = *(dispatch_queue_s **)(v5 + 128);
  int8x16_t v9 = v4;
  id v10 = *(id *)(a1 + 48);
  id v11 = v3;
  id v7 = v3;
  dispatch_async(v6, v8);
}

void *__49__CUUserNotificationSession__runRequestAddStart___block_invoke_3(uint64_t a1)
{
  id v3 = *(void **)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v3 == (void *)result[7])
  {
    if (v3)
    {
      int8x16_t v4 = v3;
      dispatch_source_cancel(v4);
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = *(void **)(v5 + 56);
      *(void *)(v5 + 56) = 0LL;

      result = *(void **)(a1 + 40);
    }

    return (void *)[result _reportTimeout];
  }

  return result;
}

uint64_t __49__CUUserNotificationSession__runRequestAddStart___block_invoke_2( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 40);
  if (*(void *)(result + 32) != *(void *)(v8 + 64)) {
    return result;
  }
  uint64_t v9 = result;
  id v10 = *(int **)(v8 + 72);
  if (*v10 <= 30)
  {
    if (*v10 == -1)
    {
      BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      uint64_t v8 = *(void *)(v9 + 40);
      if (!v11) {
        goto LABEL_6;
      }
      id v10 = *(int **)(v8 + 72);
    }

    LogPrintF( (uint64_t)v10,  (uint64_t)"-[CUUserNotificationSession _runRequestAddStart:]_block_invoke_2",  0x1Eu,  (uint64_t)"Request added: %@, %{error}\n",  a5,  a6,  a7,  a8,  *(void *)(v9 + 48));
    uint64_t v8 = *(void *)(v9 + 40);
  }

void __54__CUUserNotificationSession__runAuthorizeRequestStart__block_invoke( int8x16_t *a1,  char a2,  void *a3)
{
  id v5 = a3;
  v10[1] = 3221225472LL;
  int8x16_t v6 = vextq_s8(a1[2], a1[2], 8uLL);
  uint64_t v7 = a1[2].i64[0];
  v10[0] = MEMORY[0x1895F87A8];
  v10[2] = __54__CUUserNotificationSession__runAuthorizeRequestStart__block_invoke_2;
  v10[3] = &unk_189F32CB0;
  uint64_t v8 = *(dispatch_queue_s **)(v7 + 128);
  int8x16_t v11 = v6;
  char v13 = a2;
  id v12 = v5;
  id v9 = v5;
  dispatch_async(v8, v10);
}

uint64_t __54__CUUserNotificationSession__runAuthorizeRequestStart__block_invoke_2( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 40);
  if (*(void *)(result + 32) != *(void *)(v8 + 64)) {
    return result;
  }
  uint64_t v9 = result;
  id v10 = *(int **)(v8 + 72);
  if (*v10 <= 30)
  {
    if (*v10 != -1)
    {
LABEL_4:
      int8x16_t v11 = "yes";
      if (!*(_BYTE *)(v9 + 56)) {
        int8x16_t v11 = "no";
      }
      LogPrintF( (uint64_t)v10,  (uint64_t)"-[CUUserNotificationSession _runAuthorizeRequestStart]_block_invoke_2",  0x1Eu,  (uint64_t)"Authorize response: Granted %s, %{error}\n",  a5,  a6,  a7,  a8,  (char)v11);
      uint64_t v8 = *(void *)(v9 + 40);
      goto LABEL_8;
    }

    BOOL v12 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
    uint64_t v8 = *(void *)(v9 + 40);
    if (v12)
    {
      id v10 = *(int **)(v8 + 72);
      goto LABEL_4;
    }
  }

void __52__CUUserNotificationSession__runAuthorizeCheckStart__block_invoke(int8x16_t *a1, void *a2)
{
  uint64_t v3 = [a2 authorizationStatus];
  block[1] = 3221225472LL;
  int8x16_t v4 = vextq_s8(a1[2], a1[2], 8uLL);
  uint64_t v5 = a1[2].i64[0];
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __52__CUUserNotificationSession__runAuthorizeCheckStart__block_invoke_2;
  block[3] = &unk_189F32C60;
  int8x16_t v6 = *(dispatch_queue_s **)(v5 + 128);
  int8x16_t v8 = v4;
  uint64_t v9 = v3;
  dispatch_async(v6, block);
}

uint64_t __52__CUUserNotificationSession__runAuthorizeCheckStart__block_invoke_2( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 40);
  if (*(void *)(result + 32) == *(void *)(v8 + 64))
  {
    uint64_t v9 = result;
    id v10 = *(int **)(v8 + 72);
    if (*v10 > 30) {
      goto LABEL_10;
    }
    if (*v10 == -1)
    {
      id v10 = *(int **)(*(void *)(v9 + 40) + 72LL);
    }

    unint64_t v11 = *(void *)(v9 + 48);
    if (v11 > 3) {
      BOOL v12 = "?";
    }
    else {
      BOOL v12 = off_189F32DF0[v11];
    }
    LogPrintF( (uint64_t)v10,  (uint64_t)"-[CUUserNotificationSession _runAuthorizeCheckStart]_block_invoke_2",  0x1Eu,  (uint64_t)"Authorization status response: %s\n",  a5,  a6,  a7,  a8,  (char)v12);
LABEL_10:
    uint64_t v13 = *(void *)(v9 + 48);
    if ((unint64_t)(v13 - 2) < 2)
    {
      uint64_t v14 = *(void *)(v9 + 40);
      int v15 = 2;
    }

    else
    {
      if (v13 == 1)
      {
        *(_DWORD *)(*(void *)(v9 + 40) + 48LL) = 3;
        uint64_t v16 = NSErrorWithOSStatusF((const char *)0xFFFEEA16LL);
        uint64_t v17 = *(void *)(v9 + 40);
        uint64_t v18 = *(void **)(v17 + 40);
        *(void *)(v17 + 40) = v16;

        return [*(id *)(v9 + 40) _run];
      }

      uint64_t v14 = *(void *)(v9 + 40);
      int v15 = 4;
    }

    *(_DWORD *)(v14 + 48) = v15;
    return [*(id *)(v9 + 40) _run];
  }

  return result;
}

void __52__CUUserNotificationSession__updateActionCategories__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  [a3 action];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 addObject:v4];
}

void *__45__CUUserNotificationSession_removeAllActions__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(int **)(v2 + 72);
  if (*v3 > 30) {
    goto LABEL_5;
  }
  if (*v3 != -1) {
    goto LABEL_3;
  }
  BOOL v9 = _LogCategory_Initialize(*(void *)(v2 + 72), 0x1Eu);
  uint64_t v2 = *(void *)(a1 + 32);
  if (v9)
  {
    uint64_t v3 = *(int **)(v2 + 72);
LABEL_3:
    char v4 = [*(id *)(v2 + 8) count];
    LogPrintF( (uint64_t)v3,  (uint64_t)"-[CUUserNotificationSession removeAllActions]_block_invoke",  0x1Eu,  (uint64_t)"Remove all actions: %d total\n",  v5,  v6,  v7,  v8,  v4);
    uint64_t v2 = *(void *)(a1 + 32);
  }

void __56__CUUserNotificationSession_removeActionWithIdentifier___block_invoke(uint64_t a1)
{
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(a1 + 32) + 8) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
  *(_BYTE *)(*(void *)(a1 + 32) + 16LL) = 1;
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = (int *)v2[9];
  if (*v3 <= 30)
  {
    if (*v3 != -1)
    {
LABEL_3:
      uint64_t v4 = *(void *)(a1 + 40);
      [v12 action];
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 title];
      unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF( (uint64_t)v3,  (uint64_t)"-[CUUserNotificationSession removeActionWithIdentifier:]_block_invoke",  0x1Eu,  (uint64_t)"Remove action: %@, '%@'\n",  v6,  v7,  v8,  v9,  v4);

      uint64_t v2 = *(void **)(a1 + 32);
      goto LABEL_5;
    }

    BOOL v10 = _LogCategory_Initialize(v2[9], 0x1Eu);
    uint64_t v2 = *(void **)(a1 + 32);
    if (v10)
    {
      uint64_t v3 = (int *)v2[9];
      goto LABEL_3;
    }
  }

void __73__CUUserNotificationSession_addActionWithIdentifier_title_flags_handler___block_invoke(void *a1)
{
  uint64_t v13 = objc_alloc_init(&OBJC_CLASS___CUUserNotificationCustomAction);
  -[CUUserNotificationCustomAction setAction:](v13, "setAction:", a1[4]);
  -[CUUserNotificationCustomAction setHandler:](v13, "setHandler:", a1[8]);
  uint64_t v2 = *(void **)(a1[5] + 8LL);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
    uint64_t v4 = a1[5];
    uint64_t v5 = *(void **)(v4 + 8);
    *(void *)(v4 + 8) = v3;

    uint64_t v2 = *(void **)(a1[5] + 8LL);
  }

  [v2 setObject:v13 forKeyedSubscript:a1[6]];
  *(_BYTE *)(a1[5] + 16LL) = 1;
  BOOL v10 = (void *)a1[5];
  if (v10[8])
  {
    unint64_t v11 = (int *)v10[9];
    if (*v11 <= 30)
    {
      if (*v11 == -1)
      {
        BOOL v12 = _LogCategory_Initialize((uint64_t)v11, 0x1Eu);
        BOOL v10 = (void *)a1[5];
        if (!v12) {
          goto LABEL_8;
        }
        unint64_t v11 = (int *)v10[9];
      }

      LogPrintF( (uint64_t)v11,  (uint64_t)"-[CUUserNotificationSession addActionWithIdentifier:title:flags:handler:]_block_invoke",  0x1Eu,  (uint64_t)"Add action: %@, '%@', %#{flags}\n",  v6,  v7,  v8,  v9,  a1[6]);
      BOOL v10 = (void *)a1[5];
    }

uint64_t __39__CUUserNotificationSession_invalidate__block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 32);
  if (!*(_BYTE *)(v8 + 18))
  {
    uint64_t v9 = result;
    *(_BYTE *)(v8 + 18) = 1;
    BOOL v10 = *(uint64_t **)(result + 32);
    unint64_t v11 = (int *)v10[9];
    if (*v11 <= 30)
    {
      if (*v11 == -1)
      {
        BOOL v12 = _LogCategory_Initialize(v10[9], 0x1Eu);
        BOOL v10 = *(uint64_t **)(v9 + 32);
        if (!v12) {
          return [v10 _invalidate];
        }
        unint64_t v11 = (int *)v10[9];
      }

      LogPrintF( (uint64_t)v11,  (uint64_t)"-[CUUserNotificationSession invalidate]_block_invoke",  0x1Eu,  (uint64_t)"Invalidate: BundleID %@, Category %@\n",  a5,  a6,  a7,  a8,  v10[14]);
      BOOL v10 = *(uint64_t **)(v9 + 32);
    }

    return [v10 _invalidate];
  }

  return result;
}

uint64_t __37__CUUserNotificationSession_activate__block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 32);
  if (!*(_BYTE *)(v8 + 17))
  {
    uint64_t v9 = result;
    *(_BYTE *)(v8 + 17) = 1;
    BOOL v10 = *(uint64_t **)(result + 32);
    unint64_t v11 = (int *)v10[9];
    if (*v11 <= 30)
    {
      if (*v11 == -1)
      {
        BOOL v12 = _LogCategory_Initialize(v10[9], 0x1Eu);
        BOOL v10 = *(uint64_t **)(v9 + 32);
        if (!v12) {
          return [v10 _run];
        }
        unint64_t v11 = (int *)v10[9];
      }

      LogPrintF( (uint64_t)v11,  (uint64_t)"-[CUUserNotificationSession activate]_block_invoke",  0x1Eu,  (uint64_t)"Activate: BundleID %@, Category %@\n",  a5,  a6,  a7,  a8,  v10[14]);
      BOOL v10 = *(uint64_t **)(v9 + 32);
    }

    return [v10 _run];
  }

  return result;
}

@end