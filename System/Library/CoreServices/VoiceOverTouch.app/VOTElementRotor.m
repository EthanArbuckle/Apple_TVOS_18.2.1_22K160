@interface VOTElementRotor
- (BOOL)_customPublicRotorInRotor:(id)a3;
- (BOOL)customActionsAreDragDrop:(id)a3;
- (BOOL)customActionsAreValid:(id)a3;
- (BOOL)ignoreDefaultTypeAutofill;
- (BOOL)rotorTypeIsValid:(int64_t)a3 eventOrigin:(int64_t)a4;
- (BOOL)showsWebSearchResults;
- (VOTElementRotor)init;
- (id)_currentAvailableRotorItems;
- (id)_currentEnabledWebRotorItems;
- (id)updatedWebRotorItemsCallback;
- (int64_t)_firstNonGesturedTextInputRotorTypeWithFallback:(int64_t)a3;
- (void)_updateWebRotorItems;
- (void)dealloc;
- (void)nanoUpdateRotorForElement:(id)a3;
- (void)setIgnoreDefaultTypeAutofill:(BOOL)a3;
- (void)setShowsWebSearchResults:(BOOL)a3;
- (void)setUpdatedWebRotorItemsCallback:(id)a3;
- (void)updateRotorForElement:(id)a3 shouldPreserveRotorNavigation:(BOOL)a4;
- (void)updateRotorForElement:(id)a3 shouldPreserveRotorNavigation:(BOOL)a4 firstResponder:(id)a5;
@end

@implementation VOTElementRotor

- (VOTElementRotor)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___VOTElementRotor;
  v2 = -[VOTRotor init](&v14, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("vot-web-rotor-item-access-queue", 0LL);
    enabledWebRotorItemsQueue = v2->_enabledWebRotorItemsQueue;
    v2->_enabledWebRotorItemsQueue = (OS_dispatch_queue *)v3;

    -[VOTElementRotor _updateWebRotorItems](v2, "_updateWebRotorItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[VOTConfiguration rootConfiguration](&OBJC_CLASS___VOTConfiguration, "rootConfiguration"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 preferenceForKey:@"CurrentRotorTypeSimple"]);
    uint64_t v7 = (int)[v6 intValue];

    if (sub_1000D3070(v7)) {
      uint64_t v7 = -[VOTElementRotor _firstNonGesturedTextInputRotorTypeWithFallback:]( v2,  "_firstNonGesturedTextInputRotorTypeWithFallback:",  v7);
    }
    -[VOTRotor setCurrentRotorType:saveToPreferences:userInitiated:]( v2,  "setCurrentRotorType:saveToPreferences:userInitiated:",  v7,  1LL,  0LL);
    objc_initWeak(&location, v2);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10009A4F4;
    v11[3] = &unk_100176F08;
    objc_copyWeak(&v12, &location);
    [v8 registerUpdateBlock:v11 forRetrieveSelector:"voiceOverRotorItems" withListener:v2];

    objc_destroyWeak(&v12);
    v9 = v2;
    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)dealloc
{
  enabledWebRotorItemsQueue = self->_enabledWebRotorItemsQueue;
  self->_enabledWebRotorItemsQueue = 0LL;

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___VOTElementRotor;
  -[VOTRotor dealloc](&v4, "dealloc");
}

- (int64_t)_firstNonGesturedTextInputRotorTypeWithFallback:(int64_t)a3
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElementRotor _currentAvailableRotorItems](self, "_currentAvailableRotorItems", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"VOTRotorType"]);
        int64_t v11 = (int)[v10 intValue];

        if (!sub_1000D3070(v11))
        {
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"Enabled"]);
          unsigned __int8 v13 = [v12 BOOLValue];

          if ((v13 & 1) != 0)
          {
            a3 = v11;
            goto LABEL_12;
          }
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (BOOL)_customPublicRotorInRotor:(id)a3
{
  id v4 = a3;
  if (sub_1000D35B8( self->super._currentRotors,  (const void *)+[VOTRotor rotorTypeForSystemRotorType:]( &OBJC_CLASS___VOTRotor,  "rotorTypeForSystemRotorType:",  v4)) == -1)
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTRotor customPublicRotors](self, "customPublicRotors", 0LL));
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          int64_t v11 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v14 + 1) + 8 * (void)i) objectForKeyedSubscript:@"name"]);
          unsigned __int8 v12 = [v11 isEqualToString:v4];

          if ((v12 & 1) != 0)
          {
            BOOL v5 = 1;
            goto LABEL_13;
          }
        }

        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    BOOL v5 = 0;
LABEL_13:
  }

  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (void)_updateWebRotorItems
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 voiceOverRotorItems]);

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        id v10 = [v9 mutableCopy];
        int64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"RotorItem"]);
        unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue( +[VOTRotor rotorTypeForPreferenceString:]( &OBJC_CLASS___VOTRotor,  "rotorTypeForPreferenceString:",  v11));

        if (v12)
        {
          [v10 setObject:v12 forKeyedSubscript:@"VOTRotorType"];
          unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"Enabled"]);
          [v10 setObject:v13 forKeyedSubscript:@"Enabled"];
        }

        [v2 addObject:v10];
      }

      id v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v6);
  }

  enabledWebRotorItemsQueue = (dispatch_queue_s *)self->_enabledWebRotorItemsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009AAC8;
  block[3] = &unk_100176DA8;
  block[4] = self;
  id v21 = v2;
  id v15 = v2;
  dispatch_sync(enabledWebRotorItemsQueue, block);
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElementRotor updatedWebRotorItemsCallback](self, "updatedWebRotorItemsCallback"));

  if (v16)
  {
    __int128 v17 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[VOTElementRotor updatedWebRotorItemsCallback]( self,  "updatedWebRotorItemsCallback"));
    ((void (**)(void, VOTElementRotor *))v17)[2](v17, self);
  }
}

- (id)_currentEnabledWebRotorItems
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_10009AB98;
  id v10 = sub_10009ABA8;
  id v11 = 0LL;
  enabledWebRotorItemsQueue = (dispatch_queue_s *)self->_enabledWebRotorItemsQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10009ABB0;
  v5[3] = &unk_100176E20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(enabledWebRotorItemsQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_currentAvailableRotorItems
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElementRotor _currentEnabledWebRotorItems](self, "_currentEnabledWebRotorItems"));
  id v3 = [v2 mutableCopy];

  unint64_t v4 = 0LL;
  id v5 = 0LL;
  if ([v3 count])
  {
    do
    {
      uint64_t v6 = v5;
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndex:v4]);

      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"VOTRotorType"]);
      unsigned int v8 = [v7 intValue];

      if (v8 == 23) {
        break;
      }
      ++v4;
    }

    while (v4 < (unint64_t)[v3 count]);
  }

  if (v4 < (unint64_t)[v3 count])
  {
    id v9 = [v5 mutableCopy];
    [v9 setObject:kAXSVoiceOverTouchRotorItemBrailleInputLanguage forKeyedSubscript:@"RotorItem"];
    [v9 setObject:&off_1001879A0 forKeyedSubscript:@"VOTRotorType"];
    [v3 insertObject:v9 atIndex:v4 + 1];
  }

  return v3;
}

- (void)nanoUpdateRotorForElement:(id)a3
{
  id v4 = a3;
  currentRotors = self->super._currentRotors;
  if (currentRotors) {
    CFArrayRef Copy = CFArrayCreateCopy(kCFAllocatorDefault, currentRotors);
  }
  else {
    CFArrayRef Copy = CFArrayCreate(kCFAllocatorDefault, 0LL, 0LL, 0LL);
  }
  uint64_t v7 = Copy;
  CFArrayRemoveAllValues(self->super._currentRotors);
  uint64_t v33 = objc_claimAutoreleasedReturnValue([v4 customRotorActions]);
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement organizedActionsByCategory:](&OBJC_CLASS___VOTElement, "organizedActionsByCategory:"));
  objc_storeStrong((id *)&self->super._customRotorActionCategories, v32);
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  unsigned int v8 = self->super._customRotorActionCategories;
  id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v41,  v46,  16LL);
  if (v9)
  {
    id v10 = v9;
    v29 = v7;
    v30 = self;
    id v31 = v4;
    char v35 = 0;
    uint64_t v36 = *(void *)v42;
    uint64_t v11 = UIAccessibilityCustomActionCategoryEdit;
    id obj = v8;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v42 != v36) {
          objc_enumerationMutation(obj);
        }
        unsigned __int8 v13 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)i);
        __int128 v37 = 0u;
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        __int128 v40 = 0u;
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 actions]);
        id v15 = [v14 countByEnumeratingWithState:&v37 objects:v45 count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v38;
          do
          {
            for (j = 0LL; j != v16; j = (char *)j + 1)
            {
              if (*(void *)v38 != v17) {
                objc_enumerationMutation(v14);
              }
              v19 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)j);
              v20 = (void *)objc_claimAutoreleasedReturnValue([v19 name]);
              if ([v20 length])
              {
                id v21 = (void *)objc_claimAutoreleasedReturnValue([v19 categoryName]);
                unsigned int v22 = [v21 isEqualToString:v11];

                if (!v22)
                {
                  char v35 = 1;
                  goto LABEL_22;
                }
              }

              else
              {
              }
            }

            id v16 = [v14 countByEnumeratingWithState:&v37 objects:v45 count:16];
          }

          while (v16);
        }

- (BOOL)rotorTypeIsValid:(int64_t)a3 eventOrigin:(int64_t)a4
{
  if (a3 == 48
    && a4 == 2
    && (uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTRotor delegate](self, "delegate")),
        id v8 = [v7 actionsRotorAddBehaviorForElementRotor:self],
        v7,
        v8 != (id)1))
  {
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v10 = self->super._customRotorActionCategories;
    id v11 = -[NSArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v27,  v32,  16LL);
    if (v11)
    {
      id v12 = v11;
      unsigned __int8 v9 = 0;
      uint64_t v13 = *(void *)v28;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
          __int128 v23 = 0u;
          __int128 v24 = 0u;
          __int128 v25 = 0u;
          __int128 v26 = 0u;
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 actions]);
          id v17 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v17)
          {
            id v18 = v17;
            uint64_t v19 = *(void *)v24;
            while (2)
            {
              for (j = 0LL; j != v18; j = (char *)j + 1)
              {
                if (*(void *)v24 != v19) {
                  objc_enumerationMutation(v16);
                }
                if (![*(id *)(*((void *)&v23 + 1) + 8 * (void)j) ignoreWhenVoiceOverTouches])
                {
                  unsigned __int8 v9 = 1;
                  goto LABEL_20;
                }
              }

              id v18 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
              if (v18) {
                continue;
              }
              break;
            }
          }

- (void)updateRotorForElement:(id)a3 shouldPreserveRotorNavigation:(BOOL)a4
{
}

- (void)updateRotorForElement:(id)a3 shouldPreserveRotorNavigation:(BOOL)a4 firstResponder:(id)a5
{
  BOOL v195 = a4;
  id v7 = a3;
  id v206 = a5;
  -[VOTRotor setCurrentRotorElement:](self, "setCurrentRotorElement:", v7);
  CFArrayRef Copy = CFArrayCreateCopy(kCFAllocatorDefault, self->super._currentRotors);
  CFIndex v198 = sub_1000D35B8(Copy, (const void *)0x2F);
  CFArrayRemoveAllValues(self->super._currentRotors);
  -[VOTRotor setCustomActionIndex:](self, "setCustomActionIndex:", 0LL);
  typeKey = self->super._typeKey;
  self->super._typeKey = (NSString *)@"CurrentRotorTypeSimple";

  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned __int8 v10 = [v9 voiceOverUseTVToggleStyleNavigation];

  if ((v10 & 1) != 0)
  {
    if ([(id)VOTSharedWorkspace tvInteractionMode] != (id)2) {
      goto LABEL_6;
    }
    uint64_t v11 = 86LL;
  }

  else
  {
    CFArrayAppendValue(self->super._currentRotors, (const void *)0x55);
    CFArrayAppendValue(self->super._currentRotors, (const void *)0x56);
    uint64_t v11 = 36LL;
  }

  CFArrayAppendValue(self->super._currentRotors, (const void *)v11);
LABEL_6:
  id v12 = [v7 doesHaveTraits:kAXAdjustableTrait];
  int v199 = (int)v12;
  if ((_DWORD)v12)
  {
    uint64_t v13 = VOTLogRotor();
    __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_1000F3DE8();
    }

    uint64_t v208 = 1LL;
    sub_1000D4914(self->super._currentRotors, (const void *)1);
  }

  else
  {
    uint64_t v208 = 0LL;
  }

  if (AXDeviceSupportsSonification(v12) && [v7 supportsAudiographs])
  {
    uint64_t v15 = VOTLogRotor();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_1000F3DBC();
    }

    uint64_t v208 = 59LL;
    sub_1000D4914(self->super._currentRotors, (const void *)0x3B);
  }

  unsigned int v213 = [v7 doesHaveTraits:kAXMathEquationTrait];
  if (v213 && [v7 canNavigateMathSegments])
  {
    uint64_t v208 = -[VOTRotor currentRotorType](self, "currentRotorType");
    if (!sub_1000D48F4(v208))
    {
      uint64_t v17 = VOTLogRotor();
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        sub_1000F3D90();
      }

      uint64_t v208 = 49LL;
    }

    sub_1000D4914(self->super._currentRotors, (const void *)0x31);
    sub_1000D4914(self->super._currentRotors, (const void *)0x32);
    sub_1000D4914(self->super._currentRotors, (const void *)0x33);
    sub_1000D4914(self->super._currentRotors, (const void *)0x34);
  }

  v224 = self;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v7 application]);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 typingCandidateElements]);
  id v21 = [v20 count];

  if (v21)
  {
    objc_super v22 = self;
    if (!-[VOTElementRotor ignoreDefaultTypeAutofill](self, "ignoreDefaultTypeAutofill"))
    {
      uint64_t v23 = VOTLogRotor();
      __int128 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        sub_1000F3D64();
      }

      uint64_t v208 = 2LL;
    }

    sub_1000D4914(self->super._currentRotors, (const void *)2);
  }

  else
  {
    objc_super v22 = self;
  }

  uint64_t v207 = kAXWebContentTrait;
  unsigned int v25 = objc_msgSend(v7, "doesHaveTraits:");
  if (((v213 | v25) & 1) == 0)
  {
    sub_1000D4914(v22->super._currentRotors, (const void *)3);
    sub_1000D4914(v22->super._currentRotors, (const void *)4);
  }

  uint64_t v26 = kAXTextEntryTrait;
  uint64_t v205 = kAXIsEditingTrait;
  unsigned int v220 = [v7 doesHaveAllTraits:kAXIsEditingTrait | kAXTextEntryTrait];
  unsigned int v27 = [v7 isReadingContent];
  v204 = (void *)objc_claimAutoreleasedReturnValue([v7 label]);
  uint64_t v28 = kAXTextAreaTrait;
  v223 = v7;
  unsigned int v209 = v27;
  if ([v7 doesHaveTraits:kAXTextAreaTrait])
  {
    __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 1LL));
    __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 0LL));
    id v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v29,  @"lineNumber",  v30,  @"lineColumn",  0LL));

    id v7 = v223;
    LOBYTE(v32) = [v223 rangeForLineNumberAndColumn:v31] != (id)0x7FFFFFFFFFFFFFFFLL;
  }

  else
  {
    if (v27)
    {
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v7 stringForLineNumber:0]);
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet"));
      char v35 = (void *)objc_claimAutoreleasedReturnValue([v33 stringByTrimmingCharactersInSet:v34]);

      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v7 pageContent]);
      __int128 v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet"));
      __int128 v38 = (void *)objc_claimAutoreleasedReturnValue([v36 stringByTrimmingCharactersInSet:v37]);

      if ([v35 length] && objc_msgSend(v38, "length")) {
        unsigned int v32 = [v38 isEqualToString:v35] ^ 1;
      }
      else {
        LOBYTE(v32) = 0;
      }

      [v7 doesHaveTraits:v28];
      unsigned int v27 = v209;
      goto LABEL_43;
    }

    LOBYTE(v32) = 0;
  }

  if (([v7 doesHaveTraits:v28] | v27) != 1)
  {
    BOOL v39 = 0;
    goto LABEL_47;
  }

- (BOOL)customActionsAreValid:(id)a3
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v15 + 1) + 8 * (void)i) actions]);
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472LL;
        v14[2] = sub_10009D420;
        v14[3] = &unk_100178CC8;
        v14[4] = self;
        unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 indexesOfObjectsPassingTest:v14]);
        id v11 = [v10 count];

        if (v11)
        {
          BOOL v12 = 1;
          goto LABEL_11;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  BOOL v12 = 0;
LABEL_11:

  return v12;
}

- (BOOL)customActionsAreDragDrop:(id)a3
{
  return 0;
}

- (BOOL)showsWebSearchResults
{
  return self->_showsWebSearchResults;
}

- (void)setShowsWebSearchResults:(BOOL)a3
{
  self->_showsWebSearchResults = a3;
}

- (BOOL)ignoreDefaultTypeAutofill
{
  return self->_ignoreDefaultTypeAutofill;
}

- (void)setIgnoreDefaultTypeAutofill:(BOOL)a3
{
  self->_ignoreDefaultTypeAutofill = a3;
}

- (id)updatedWebRotorItemsCallback
{
  return self->_updatedWebRotorItemsCallback;
}

- (void)setUpdatedWebRotorItemsCallback:(id)a3
{
}

- (void).cxx_destruct
{
}

@end