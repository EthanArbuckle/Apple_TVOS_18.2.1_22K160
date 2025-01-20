@interface SCATActionItem
+ (id)fromAction:(int64_t)a3;
+ (id)fromSwitch:(id)a3 longPress:(BOOL)a4;
- (NSString)shortcutIdentifier;
- (id)description;
- (int64_t)action;
- (void)setAction:(int64_t)a3;
- (void)setShortcutIdentifier:(id)a3;
@end

@implementation SCATActionItem

+ (id)fromAction:(int64_t)a3
{
  v4 = objc_opt_new(&OBJC_CLASS___SCATActionItem);
  -[SCATActionItem setAction:](v4, "setAction:", a3);
  return v4;
}

+ (id)fromSwitch:(id)a3 longPress:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = objc_opt_new(&OBJC_CLASS___SCATActionItem);
  if (v4)
  {
    -[SCATActionItem setAction:](v6, "setAction:", [v5 longPressAction]);
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 longPressShortcutIdentifier]);
  }

  else
  {
    -[SCATActionItem setAction:](v6, "setAction:", [v5 action]);
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 shortcutIdentifier]);
  }

  v8 = (void *)v7;

  -[SCATActionItem setShortcutIdentifier:](v6, "setShortcutIdentifier:", v8);
  return v6;
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SCATActionItem;
  id v3 = -[SCATActionItem description](&v9, "description");
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[SCATActionItem action](self, "action")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATActionItem shortcutIdentifier](self, "shortcutIdentifier"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ action: %@, shortcut: %@",  v4,  v5,  v6));

  return v7;
}

- (int64_t)action
{
  return self->action;
}

- (void)setAction:(int64_t)a3
{
  self->action = a3;
}

- (NSString)shortcutIdentifier
{
  return self->shortcutIdentifier;
}

- (void)setShortcutIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end