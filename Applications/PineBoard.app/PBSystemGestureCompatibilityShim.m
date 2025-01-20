@interface PBSystemGestureCompatibilityShim
- (BOOL)isEnabled;
- (NSSet)handles;
- (PBSystemGestureCompatibilityShim)initWithAppDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation PBSystemGestureCompatibilityShim

- (PBSystemGestureCompatibilityShim)initWithAppDelegate:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PBSystemGestureCompatibilityShim;
  v5 = -[PBSystemGestureCompatibilityShim init](&v11, "init");
  v6 = v5;
  if (v5)
  {
    v5->_enabled = 1;
    id v7 = sub_1000E43BC(v4);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    handles = v6->_handles;
    v6->_handles = (NSSet *)v8;
  }

  return v6;
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    BOOL v3 = a3;
    self->_enabled = a3;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id v4 = self->_handles;
    id v5 = -[NSSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0LL;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)v8);
          if (v3) {
            [v9 acquire];
          }
          else {
            objc_msgSend(v9, "relinquish", (void)v10);
          }
          uint64_t v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        id v6 = -[NSSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
      }

      while (v6);
    }
  }

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (NSSet)handles
{
  return self->_handles;
}

- (void).cxx_destruct
{
}

@end