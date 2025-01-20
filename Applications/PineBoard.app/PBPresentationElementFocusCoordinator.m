@interface PBPresentationElementFocusCoordinator
- (BOOL)eventDeferringManagerSystemShellBehavior:(id)a3 shouldSuppressRemoteRuleForOwningElement:(id)a4 inEnvironment:(id)a5;
- (BSIntegerMap)levelsToLayoutState;
- (BSMutableIntegerMap)levelsToElementsMap;
- (PBPresentationElementFocusCoordinator)init;
- (TVSObserverSet)observers;
- (id)description;
- (id)windowForLayoutLevel:(int64_t)a3;
- (int64_t)activeLayoutLevel;
- (int64_t)eventDeferringManagerSystemShellBehavior:(id)a3 compareRemoteRuleOwningElement:(id)a4 toElement:(id)a5 inEnvironment:(id)a6;
- (int64_t)highestLayoutLevel;
- (void)_deregisterForFocusCoordination:(id)a3;
- (void)_registerForFocusCoordination:(id)a3;
- (void)_updateActiveLayoutLevel;
- (void)addObserver:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeObserver:(id)a3;
- (void)setLevelsToLayoutState:(id)a3;
@end

@implementation PBPresentationElementFocusCoordinator

- (PBPresentationElementFocusCoordinator)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PBPresentationElementFocusCoordinator;
  v2 = -[PBPresentationElementFocusCoordinator init](&v9, "init");
  v3 = v2;
  if (v2)
  {
    v2->_activeLayoutLevel = -1LL;
    v2->_highestLayoutLevel = -1LL;
    v4 = objc_alloc_init(&OBJC_CLASS___TVSObserverSet);
    observers = v3->_observers;
    v3->_observers = v4;

    v6 = objc_alloc_init(&OBJC_CLASS___BSMutableIntegerMap);
    levelsToElementsMap = v3->_levelsToElementsMap;
    v3->_levelsToElementsMap = v6;
  }

  return v3;
}

- (id)windowForLayoutLevel:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSMutableIntegerMap objectForKey:](self->_levelsToElementsMap, "objectForKey:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 object]);

  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 view]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 window]);

  return v6;
}

- (void)addObserver:(id)a3
{
  id v3 = -[TVSObserverSet addObserver:](self->_observers, "addObserver:", a3);
}

- (void)removeObserver:(id)a3
{
}

- (id)description
{
  v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472LL;
  v7 = sub_1001A2C7C;
  v8 = &unk_1003CFEB8;
  objc_super v9 = self;
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self));
  id v2 = v10;
  [v2 appendBodySectionWithName:0 multilinePrefix:0 block:&v5];
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "build", v5, v6, v7, v8, v9));

  return v3;
}

- (void)_registerForFocusCoordination:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[BSZeroingWeakReference referenceWithObject:]( &OBJC_CLASS___BSZeroingWeakReference,  "referenceWithObject:",  v4));
  -[BSMutableIntegerMap setObject:forKey:]( self->_levelsToElementsMap,  "setObject:forKey:",  v5,  [v4 layoutLevel]);
  -[PBPresentationElementFocusCoordinator _updateActiveLayoutLevel](self, "_updateActiveLayoutLevel");
  [v4 addObserver:self forKeyPath:@"state" options:0 context:off_10046CEA0];
}

- (void)_deregisterForFocusCoordination:(id)a3
{
  id v4 = a3;
  -[BSMutableIntegerMap removeObjectForKey:]( self->_levelsToElementsMap,  "removeObjectForKey:",  [v4 layoutLevel]);
  -[PBPresentationElementFocusCoordinator _updateActiveLayoutLevel](self, "_updateActiveLayoutLevel");
  [v4 removeObserver:self forKeyPath:@"state" context:off_10046CEA0];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_10046CEA0 == a6)
  {
    -[PBPresentationElementFocusCoordinator _updateActiveLayoutLevel](self, "_updateActiveLayoutLevel", a3, a4, a5);
  }

  else
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___PBPresentationElementFocusCoordinator;
    -[PBPresentationElementFocusCoordinator observeValueForKeyPath:ofObject:change:context:]( &v6,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (void)_updateActiveLayoutLevel
{
  id v3 = objc_alloc_init(&OBJC_CLASS___BSMutableIntegerMap);
  uint64_t v24 = 0LL;
  v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  uint64_t v27 = -1LL;
  uint64_t v20 = 0LL;
  v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  uint64_t v23 = -1LL;
  levelsToElementsMap = self->_levelsToElementsMap;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1001A30DC;
  v16[3] = &unk_1003DB118;
  v18 = &v20;
  v19 = &v24;
  v5 = v3;
  v17 = v5;
  -[BSMutableIntegerMap enumerateWithBlock:](levelsToElementsMap, "enumerateWithBlock:", v16);
  self->_highestLayoutLevel = v25[3];
  unint64_t activeLayoutLevel = self->_activeLayoutLevel;
  if (v21[3] != activeLayoutLevel)
  {
    id v7 = sub_1001A2B14(self);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = sub_1001A3184(activeLayoutLevel);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      uint64_t v11 = sub_1001A3184(v21[3]);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      *(_DWORD *)buf = 138543618;
      v29 = v10;
      __int16 v30 = 2114;
      v31 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Active presentation element layout level changed. {oldLayoutLevel=%{public}@, newLayoutLevel=%{public}@}",  buf,  0x16u);
    }

    -[PBPresentationElementFocusCoordinator willChangeValueForKey:]( self,  "willChangeValueForKey:",  @"activeLayoutLevel");
    self->_unint64_t activeLayoutLevel = v21[3];
    -[PBPresentationElementFocusCoordinator didChangeValueForKey:]( self,  "didChangeValueForKey:",  @"activeLayoutLevel");
    observers = self->_observers;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1001A31A4;
    v15[3] = &unk_1003DB140;
    v15[4] = self;
    v15[5] = activeLayoutLevel;
    -[TVSObserverSet enumerateObserversUsingBlock:](observers, "enumerateObserversUsingBlock:", v15);
  }

  id v14 = -[BSMutableIntegerMap copy](v5, "copy");
  -[PBPresentationElementFocusCoordinator setLevelsToLayoutState:](self, "setLevelsToLayoutState:", v14);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
}

- (BOOL)eventDeferringManagerSystemShellBehavior:(id)a3 shouldSuppressRemoteRuleForOwningElement:(id)a4 inEnvironment:(id)a5
{
  id v6 = a4;
  id v7 = sub_1001A32F4(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = v8;
  if (!v8)
  {
    id v20 = sub_1001A2B14(self);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v23 = 138543362;
      id v24 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Not suppressing remote rule for non-presentation element {%{public}@}",  (uint8_t *)&v23,  0xCu);
    }

    goto LABEL_7;
  }

  id v10 = [v8 state];
  id v11 = sub_1001A2B14(self);
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if (v10 == (id)3)
  {
    if (v13) {
      sub_10028AE4C((uint64_t)v6, v12, v14, v15, v16, v17, v18, v19);
    }
LABEL_7:
    BOOL v21 = 0;
    goto LABEL_11;
  }

  if (v13) {
    sub_10028AEB4((uint64_t)v6, v12, v14, v15, v16, v17, v18, v19);
  }
  BOOL v21 = 1;
LABEL_11:

  return v21;
}

- (int64_t)eventDeferringManagerSystemShellBehavior:(id)a3 compareRemoteRuleOwningElement:(id)a4 toElement:(id)a5 inEnvironment:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  id v10 = sub_1001A32F4(v8);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = sub_1001A32F4(v9);
  uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
  uint64_t v14 = (void *)v13;
  if (v11 && v13)
  {
    id v15 = [v11 state];
    id v16 = [v14 state];
    if (v16 > v15) {
      int64_t v17 = -1LL;
    }
    else {
      int64_t v17 = 1LL;
    }
    if (v15 == v16)
    {
      id v18 = [v11 layoutLevel];
      id v19 = [v14 layoutLevel];
      unint64_t v20 = (unint64_t)v19;
      else {
        uint64_t v21 = 1LL;
      }
      if (v18 == v19) {
        int64_t v17 = 0LL;
      }
      else {
        int64_t v17 = v21;
      }
      id v22 = sub_1001A2B14(self);
      int v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v24 = sub_1001A3184((unint64_t)v18);
        v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
        else {
          int v26 = v17 + 61;
        }
        uint64_t v27 = sub_1001A3184(v20);
        v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        int v38 = 138544386;
        id v39 = v25;
        __int16 v40 = 1024;
        *(_DWORD *)v41 = v26;
        *(_WORD *)&v41[4] = 2114;
        *(void *)&v41[6] = v28;
        __int16 v42 = 2114;
        id v43 = v8;
        __int16 v44 = 2114;
        id v45 = v9;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  "Presentation layout level: %{public}@ %c %{public}@ {%{public}@, %{public}@}",  (uint8_t *)&v38,  0x30u);
      }
    }

    else
    {
      unint64_t v30 = (unint64_t)v16;
      id v31 = sub_1001A2B14(self);
      int v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        id v33 = sub_10010F16C((unint64_t)v15);
        v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
        else {
          int v35 = 60;
        }
        id v36 = sub_10010F16C(v30);
        v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
        int v38 = 138544386;
        id v39 = v34;
        __int16 v40 = 1024;
        *(_DWORD *)v41 = v35;
        *(_WORD *)&v41[4] = 2114;
        *(void *)&v41[6] = v37;
        __int16 v42 = 2114;
        id v43 = v8;
        __int16 v44 = 2114;
        id v45 = v9;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  "Presentation element state: %{public}@ %c %{public}@ {%{public}@, %{public}@}",  (uint8_t *)&v38,  0x30u);
      }
    }
  }

  else
  {
    id v29 = sub_1001A2B14(self);
    int v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      int v38 = 138543618;
      id v39 = v8;
      __int16 v40 = 2114;
      *(void *)v41 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "Falling back on default ordering {%{public}@, %{public}@}",  (uint8_t *)&v38,  0x16u);
    }

    int64_t v17 = 0LL;
  }

  return v17;
}

- (int64_t)activeLayoutLevel
{
  return self->_activeLayoutLevel;
}

- (int64_t)highestLayoutLevel
{
  return self->_highestLayoutLevel;
}

- (TVSObserverSet)observers
{
  return self->_observers;
}

- (BSMutableIntegerMap)levelsToElementsMap
{
  return self->_levelsToElementsMap;
}

- (BSIntegerMap)levelsToLayoutState
{
  return self->_levelsToLayoutState;
}

- (void)setLevelsToLayoutState:(id)a3
{
}

- (void).cxx_destruct
{
}

@end