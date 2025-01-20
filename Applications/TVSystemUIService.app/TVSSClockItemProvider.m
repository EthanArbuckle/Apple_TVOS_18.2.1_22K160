@interface TVSSClockItemProvider
- (TVSSClockItemProvider)init;
@end

@implementation TVSSClockItemProvider

- (TVSSClockItemProvider)init
{
  SEL v9 = a2;
  v10 = 0LL;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVSSClockItemProvider;
  v10 = -[TVSSMenuItemProvider init](&v8, "init");
  objc_storeStrong((id *)&v10, v10);
  if (v10)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___TVSSClockContent);
    v6 = -[TVSSMenuItem initWithIdentifier:hasFocusableContent:]( objc_alloc(&OBJC_CLASS___TVSSMenuItem),  "initWithIdentifier:hasFocusableContent:",  @"com.apple.status.clockItem",  0LL);
    -[TVSSMenuItem setVisualContent:](v6, "setVisualContent:", v7);
    v4 = v10;
    v5 = +[NSOrderedSet orderedSetWithObject:](&OBJC_CLASS___NSOrderedSet, "orderedSetWithObject:", v6);
    -[TVSSMenuItemProvider setItems:](v4, "setItems:");

    objc_storeStrong((id *)&v6, 0LL);
    objc_storeStrong((id *)&v7, 0LL);
  }

  v3 = v10;
  objc_storeStrong((id *)&v10, 0LL);
  return v3;
}

@end