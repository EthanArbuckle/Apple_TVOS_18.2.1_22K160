@interface NSUserDefaults(BoxingUtils)
- (__CFString)stringValueSafeForKey:()BoxingUtils status:;
- (const)utf8ValueSafeForKey:()BoxingUtils status:;
- (double)doubleValueSafeForKey:()BoxingUtils status:;
- (id)stringValueSafeForKey:()BoxingUtils;
- (uint64_t)BOOLValueSafeForKey:()BoxingUtils;
- (uint64_t)BOOLValueSafeForKey:()BoxingUtils status:;
- (uint64_t)doubleValueSafeForKey:()BoxingUtils;
- (uint64_t)int64ValueSafeForKey:()BoxingUtils;
- (uint64_t)int64ValueSafeForKey:()BoxingUtils status:;
- (uint64_t)utf8ValueSafeForKey:()BoxingUtils;
@end

@implementation NSUserDefaults(BoxingUtils)

- (uint64_t)BOOLValueSafeForKey:()BoxingUtils
{
  return [a1 BOOLValueSafeForKey:a3 status:0];
}

- (uint64_t)BOOLValueSafeForKey:()BoxingUtils status:
{
  id v6 = a3;
  [a1 objectForKey:v6];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    uint64_t v9 = 0LL;
    int v11 = -6727;
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  uint64_t v9 = [v7 BOOLValueSafe:&v11];
  if (a4) {
LABEL_3:
  }
    *a4 = v11;
LABEL_4:

  return v9;
}

- (uint64_t)int64ValueSafeForKey:()BoxingUtils
{
  return [a1 int64ValueSafeForKey:a3 status:0];
}

- (uint64_t)int64ValueSafeForKey:()BoxingUtils status:
{
  id v6 = a3;
  [a1 objectForKey:v6];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    uint64_t v9 = 0LL;
    int v11 = -6727;
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  uint64_t v9 = [v7 int64ValueSafe:&v11];
  if (a4) {
LABEL_3:
  }
    *a4 = v11;
LABEL_4:

  return v9;
}

- (uint64_t)doubleValueSafeForKey:()BoxingUtils
{
  return [a1 doubleValueSafeForKey:a3 status:0];
}

- (double)doubleValueSafeForKey:()BoxingUtils status:
{
  id v6 = a3;
  [a1 objectForKey:v6];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    int v12 = -6727;
    double v10 = 0.0;
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  [v7 doubleValueSafe:&v12];
  double v10 = v9;
  if (a4) {
LABEL_3:
  }
    *a4 = v12;
LABEL_4:

  return v10;
}

- (id)stringValueSafeForKey:()BoxingUtils
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (__CFString)stringValueSafeForKey:()BoxingUtils status:
{
  id v6 = a3;
  [a1 objectForKey:v6];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    [v7 stringValueSafe:&v13];
    double v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  double v9 = 0LL;
  int v13 = -6727;
  if (a4) {
LABEL_3:
  }
    *a4 = v13;
LABEL_4:
  double v10 = &stru_189F34A78;
  if (v9) {
    double v10 = v9;
  }
  int v11 = v10;

  return v11;
}

- (uint64_t)utf8ValueSafeForKey:()BoxingUtils
{
  return [a1 utf8ValueSafeForKey:a3 status:0];
}

- (const)utf8ValueSafeForKey:()BoxingUtils status:
{
  id v6 = a3;
  [a1 objectForKey:v6];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 utf8ValueSafe:&v12];
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  uint64_t v9 = 0LL;
  int v12 = -6727;
  if (a4) {
LABEL_3:
  }
    *a4 = v12;
LABEL_4:
  if (v9) {
    double v10 = (const char *)v9;
  }
  else {
    double v10 = "";
  }

  return v10;
}

@end