@interface UIGestureRecognizer
- (BOOL)pb_wasTriggeringPressType:(int64_t)a3 fromGameController:(BOOL)a4;
- (__IOHIDEvent)pb_eventRef;
- (unint64_t)pb_eventSenderID;
- (void)pb_cancel;
@end

@implementation UIGestureRecognizer

- (__IOHIDEvent)pb_eventRef
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIGestureRecognizer _activeEvents](self, "_activeEvents"));
  if ((unint64_t)[v2 count] >= 2)
  {
    id v3 = sub_100082C04();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v18 = v2;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Multiple events active, picking one at random: %{public}@",  buf,  0xCu);
    }
  }

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = v2;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if (objc_msgSend(v9, "_hidEvent", (void)v12))
        {
          id v6 = v9;
          goto LABEL_15;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (unint64_t)pb_eventSenderID
{
  return sub_1001776C4((uint64_t)-[UIGestureRecognizer pb_eventRef](self, "pb_eventRef"));
}

- (BOOL)pb_wasTriggeringPressType:(int64_t)a3 fromGameController:(BOOL)a4
{
  BOOL v27 = a4;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[UIGestureRecognizer _activeEvents](self, "_activeEvents"));
  id v6 = [v5 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v35;
    v9 = &OBJC_CLASS___TVSUIGradientView_ptr;
    while (2)
    {
      v10 = 0LL;
      id v28 = v7;
      do
      {
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)v10);
        uint64_t v12 = objc_opt_class(v9[57]);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
        {
          id v13 = v11;
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 pressesForGestureRecognizer:self]);
          __int128 v30 = 0u;
          __int128 v31 = 0u;
          __int128 v32 = 0u;
          __int128 v33 = 0u;
          id v15 = v14;
          id v16 = [v15 countByEnumeratingWithState:&v30 objects:v38 count:16];
          if (v16)
          {
            uint64_t v17 = v8;
            v18 = v9;
            uint64_t v19 = *(void *)v31;
            while (2)
            {
              for (i = 0LL; i != v16; i = (char *)i + 1)
              {
                if (*(void *)v31 != v19) {
                  objc_enumerationMutation(v15);
                }
                if ([*(id *)(*((void *)&v30 + 1) + 8 * (void)i) type] == (id)a3)
                {
                  id v16 = [v13 _hidEvent];
                  goto LABEL_17;
                }
              }

              id v16 = [v15 countByEnumeratingWithState:&v30 objects:v38 count:16];
              if (v16) {
                continue;
              }
              break;
            }

- (void)pb_cancel
{
  if (-[UIGestureRecognizer isEnabled](self, "isEnabled"))
  {
    -[UIGestureRecognizer setEnabled:](self, "setEnabled:", 0LL);
    -[UIGestureRecognizer setEnabled:](self, "setEnabled:", 1LL);
  }

@end