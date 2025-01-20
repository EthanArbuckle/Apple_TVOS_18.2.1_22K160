@interface TVDAUserStep
- (BOOL)hasActionWithTimer;
- (BOOL)isEqual:(id)a3;
- (NSArray)actions;
- (NSMutableArray)mutableActions;
- (NSString)appleSupportFooter;
- (NSString)debugDescription;
- (NSString)footer;
- (NSString)subtitle;
- (NSString)title;
- (TVDAMeasurement)measurement;
- (TVDAStepAction)preferredAction;
- (TVDAUserStep)init;
- (TVDAUserStep)initWithTitle:(id)a3 subtitle:(id)a4 footer:(id)a5 appleSupportFooter:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)menuBehavior;
- (unint64_t)hash;
- (void)addAction:(id)a3;
- (void)setMeasurement:(id)a3;
- (void)setMenuBehavior:(int64_t)a3;
- (void)setMutableActions:(id)a3;
- (void)setPreferredAction:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation TVDAUserStep

- (TVDAUserStep)init
{
  id location = self;
  objc_storeStrong(&location, 0LL);
  return 0LL;
}

- (TVDAUserStep)initWithTitle:(id)a3 subtitle:(id)a4 footer:(id)a5 appleSupportFooter:(id)a6
{
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v17 = 0LL;
  objc_storeStrong(&v17, a4);
  id v16 = 0LL;
  objc_storeStrong(&v16, a5);
  id v15 = 0LL;
  objc_storeStrong(&v15, a6);
  v6 = v19;
  v19 = 0LL;
  v14.receiver = v6;
  v14.super_class = (Class)&OBJC_CLASS___TVDAUserStep;
  v19 = -[TVDAUserStep init](&v14, "init");
  objc_storeStrong((id *)&v19, v19);
  if (v19)
  {
    objc_storeStrong((id *)&v19->_title, location[0]);
    objc_storeStrong((id *)&v19->_subtitle, v17);
    objc_storeStrong((id *)&v19->_footer, v16);
    objc_storeStrong((id *)&v19->_appleSupportFooter, v15);
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    mutableActions = v19->_mutableActions;
    v19->_mutableActions = v7;

    v19->_menuBehavior = 0LL;
  }

  v10 = v19;
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v19, 0LL);
  return v10;
}

- (NSArray)actions
{
  return (NSArray *)-[NSMutableArray copy](self->_mutableActions, "copy", a2, self);
}

- (void)addAction:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  [location[0] idleSecondsToTrigger];
  if (v3 > 0.0) {
    v5->_hasActionWithTimer = 1;
  }
  -[NSMutableArray addObject:](v5->_mutableActions, "addObject:", location[0]);
  objc_storeStrong(location, 0LL);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v17 = self;
  v16[2] = (id)a2;
  v16[1] = a3;
  v16[0] = -[TVDAUserStep initWithTitle:subtitle:footer:appleSupportFooter:]( objc_alloc(&OBJC_CLASS___TVDAUserStep),  "initWithTitle:subtitle:footer:appleSupportFooter:",  v17->_title,  v17->_subtitle,  v17->_footer,  v17->_appleSupportFooter);
  memset(__b, 0, sizeof(__b));
  obj = v17->_mutableActions;
  id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v18,  16LL);
  if (v12)
  {
    uint64_t v8 = *(void *)__b[2];
    uint64_t v9 = 0LL;
    id v10 = v12;
    while (1)
    {
      uint64_t v7 = v9;
      if (*(void *)__b[2] != v8) {
        objc_enumerationMutation(obj);
      }
      id v15 = *(id *)(__b[1] + 8 * v9);
      id location = [v15 copy];
      [v16[0] addAction:location];
      v5 = -[TVDAUserStep preferredAction](v17, "preferredAction");
      unsigned __int8 v6 = -[TVDAStepAction isEqual:](v5, "isEqual:", v15);

      if ((v6 & 1) != 0) {
        [v16[0] setPreferredAction:location];
      }
      objc_storeStrong(&location, 0LL);
      ++v9;
      if (v7 + 1 >= (unint64_t)v10)
      {
        uint64_t v9 = 0LL;
        id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v18,  16LL);
        if (!v10) {
          break;
        }
      }
    }
  }

  [v16[0] setMeasurement:v17->_measurement];
  objc_msgSend(v16[0], "setMenuBehavior:", -[TVDAUserStep menuBehavior](v17, "menuBehavior"));
  id v4 = v16[0];
  objc_storeStrong(v16, 0LL);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v40 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v40 == location[0])
  {
    char v41 = 1;
    int v38 = 1;
  }

  else
  {
    id v20 = location[0];
    uint64_t v3 = objc_opt_class(&OBJC_CLASS___TVDAUserStep);
    if ((objc_opt_isKindOfClass(v20, v3) & 1) != 0)
    {
      id v37 = location[0];
      title = v40->_title;
      id v17 = [v37 title];
      unsigned __int8 v18 = -[NSString isEqualToString:](title, "isEqualToString:");

      char v35 = 0;
      unsigned __int8 v19 = 0;
      if ((v18 & 1) != 0)
      {
        subtitle = v40->_subtitle;
        id v36 = [v37 subtitle];
        char v35 = 1;
        unsigned __int8 v19 = -[NSString isEqualToString:](subtitle, "isEqualToString:");
      }

      if ((v35 & 1) != 0) {

      }
      char v33 = 0;
      unsigned __int8 v14 = 0;
      if ((v19 & 1) != 0)
      {
        footer = v40->_footer;
        id v34 = [v37 footer];
        char v33 = 1;
        unsigned __int8 v14 = -[NSString isEqualToString:](footer, "isEqualToString:");
      }

      if ((v33 & 1) != 0) {

      }
      char v31 = 0;
      unsigned __int8 v12 = 0;
      if ((v14 & 1) != 0)
      {
        appleSupportFooter = v40->_appleSupportFooter;
        id v32 = [v37 appleSupportFooter];
        char v31 = 1;
        unsigned __int8 v12 = -[NSString isEqualToString:](appleSupportFooter, "isEqualToString:");
      }

      if ((v31 & 1) != 0) {

      }
      char v29 = 0;
      char v27 = 0;
      unsigned __int8 v10 = 0;
      if ((v12 & 1) != 0)
      {
        v30 = -[TVDAUserStep actions](v40, "actions");
        char v29 = 1;
        id v28 = [v37 actions];
        char v27 = 1;
        unsigned __int8 v10 = -[NSArray isEqualToArray:](v30, "isEqualToArray:");
      }

      if ((v27 & 1) != 0) {

      }
      if ((v29 & 1) != 0) {
      char v25 = 0;
      }
      char v23 = 0;
      unsigned __int8 v9 = 0;
      if ((v10 & 1) != 0)
      {
        v26 = -[TVDAUserStep preferredAction](v40, "preferredAction");
        char v25 = 1;
        id v24 = [v37 preferredAction];
        char v23 = 1;
        unsigned __int8 v9 = -[TVDAStepAction isEqual:](v26, "isEqual:");
      }

      if ((v23 & 1) != 0) {

      }
      if ((v25 & 1) != 0) {
      char v21 = 0;
      }
      unsigned __int8 v8 = 0;
      if ((v9 & 1) != 0)
      {
        measurement = v40->_measurement;
        id v22 = [v37 measurement];
        char v21 = 1;
        unsigned __int8 v8 = -[TVDAMeasurement isEqual:](measurement, "isEqual:");
      }

      if ((v21 & 1) != 0) {

      }
      BOOL v6 = 0;
      if ((v8 & 1) != 0)
      {
        id v5 = -[TVDAUserStep menuBehavior](v40, "menuBehavior");
        BOOL v6 = v5 == [v37 menuBehavior];
      }

      char v41 = v6;
      int v38 = 1;
      objc_storeStrong(&v37, 0LL);
    }

    else
    {
      char v41 = 0;
      int v38 = 1;
    }
  }

  objc_storeStrong(location, 0LL);
  return v41 & 1;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_title, "hash");
  unint64_t v4 = v3 ^ -[NSString hash](self->_subtitle, "hash");
  return v4 ^ (unint64_t)-[NSMutableArray hash](self->_mutableActions, "hash");
}

- (NSString)debugDescription
{
  unint64_t v4 = objc_alloc(&OBJC_CLASS___NSString);
  v2 = (objc_class *)objc_opt_class(self);
  id v5 = NSStringFromClass(v2);
  BOOL v6 = -[NSString initWithFormat:](v4, "initWithFormat:", @"<%@: %p> \"%@\"", v5, self, self->_title);

  return v6;
}

- (TVDAStepAction)preferredAction
{
  return self->_preferredAction;
}

- (void)setPreferredAction:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)footer
{
  return self->_footer;
}

- (NSString)appleSupportFooter
{
  return self->_appleSupportFooter;
}

- (BOOL)hasActionWithTimer
{
  return self->_hasActionWithTimer;
}

- (int64_t)menuBehavior
{
  return self->_menuBehavior;
}

- (void)setMenuBehavior:(int64_t)a3
{
  self->_menuBehavior = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSMutableArray)mutableActions
{
  return self->_mutableActions;
}

- (void)setMutableActions:(id)a3
{
}

- (TVDAMeasurement)measurement
{
  return self->_measurement;
}

- (void)setMeasurement:(id)a3
{
}

- (void).cxx_destruct
{
}

@end