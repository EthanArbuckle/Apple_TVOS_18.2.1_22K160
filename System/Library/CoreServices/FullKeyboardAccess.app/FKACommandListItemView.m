@interface FKACommandListItemView
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation FKACommandListItemView

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FKACommandListItemView arrangedSubviews](self, "arrangedSubviews"));
  id v4 = [v3 count];

  if (v4 != (id)2)
  {
    uint64_t v6 = FKALogCommon(v5);
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_100011904(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FKACommandListItemView arrangedSubviews](self, "arrangedSubviews"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 firstObject]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 accessibilityLabel]);

  return v17;
}

- (id)accessibilityValue
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FKACommandListItemView arrangedSubviews](self, "arrangedSubviews"));
  id v4 = [v3 count];

  if (v4 != (id)2)
  {
    uint64_t v6 = FKALogCommon(v5);
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_100011904(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FKACommandListItemView arrangedSubviews](self, "arrangedSubviews"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 lastObject]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 accessibilityLabel]);

  return v17;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 0;
}

@end