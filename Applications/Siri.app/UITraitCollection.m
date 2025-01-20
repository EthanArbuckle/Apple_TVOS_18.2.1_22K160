@interface UITraitCollection
- (id)aceDisplayColorGamut;
- (id)aceDisplayColorScheme;
- (id)aceDisplayContrast;
- (id)aceDynamicTypeSize;
- (id)aceTextLegibilityWeight;
@end

@implementation UITraitCollection

- (id)aceDisplayColorScheme
{
  UIUserInterfaceStyle v2 = -[UITraitCollection userInterfaceStyle](self, "userInterfaceStyle");
  return v3;
}

- (id)aceDisplayColorGamut
{
  id v2 = -[UITraitCollection displayGamut](self, "displayGamut");
  return v2;
}

- (id)aceTextLegibilityWeight
{
  id v2 = -[UITraitCollection legibilityWeight](self, "legibilityWeight");
  return v2;
}

- (id)aceDynamicTypeSize
{
  UIContentSizeCategory v3 = (UIContentSizeCategory)objc_claimAutoreleasedReturnValue(-[UITraitCollection preferredContentSizeCategory](self, "preferredContentSizeCategory"));

  v4 = (id *)&SAUIDynamicTypeSizeUnspecifiedValue;
  if (v3 != UIContentSizeCategoryUnspecified)
  {
    UIContentSizeCategory v5 = (UIContentSizeCategory)objc_claimAutoreleasedReturnValue( -[UITraitCollection preferredContentSizeCategory]( self,  "preferredContentSizeCategory"));

    if (v5 == UIContentSizeCategorySmall)
    {
      v4 = (id *)&SAUIDynamicTypeSizeSmallValue;
    }

    else
    {
      UIContentSizeCategory v6 = (UIContentSizeCategory)objc_claimAutoreleasedReturnValue( -[UITraitCollection preferredContentSizeCategory]( self,  "preferredContentSizeCategory"));

      if (v6 == UIContentSizeCategoryMedium)
      {
        v4 = (id *)&SAUIDynamicTypeSizeMediumValue;
      }

      else
      {
        UIContentSizeCategory v7 = (UIContentSizeCategory)objc_claimAutoreleasedReturnValue( -[UITraitCollection preferredContentSizeCategory]( self,  "preferredContentSizeCategory"));

        if (v7 == UIContentSizeCategoryExtraSmall)
        {
          v4 = (id *)&SAUIDynamicTypeSizeExtraSmallValue;
        }

        else
        {
          UIContentSizeCategory v8 = (UIContentSizeCategory)objc_claimAutoreleasedReturnValue( -[UITraitCollection preferredContentSizeCategory]( self,  "preferredContentSizeCategory"));

          if (v8 == UIContentSizeCategoryLarge)
          {
            v4 = (id *)&SAUIDynamicTypeSizeLargeValue;
          }

          else
          {
            UIContentSizeCategory v9 = (UIContentSizeCategory)objc_claimAutoreleasedReturnValue( -[UITraitCollection preferredContentSizeCategory]( self,  "preferredContentSizeCategory"));

            if (v9 == UIContentSizeCategoryExtraLarge)
            {
              v4 = (id *)&SAUIDynamicTypeSizeExtraLargeValue;
            }

            else
            {
              UIContentSizeCategory v10 = (UIContentSizeCategory)objc_claimAutoreleasedReturnValue( -[UITraitCollection preferredContentSizeCategory]( self,  "preferredContentSizeCategory"));

              if (v10 == UIContentSizeCategoryExtraExtraLarge)
              {
                v4 = (id *)&SAUIDynamicTypeSizeExtraExtraLargeValue;
              }

              else
              {
                UIContentSizeCategory v11 = (UIContentSizeCategory)objc_claimAutoreleasedReturnValue( -[UITraitCollection preferredContentSizeCategory]( self,  "preferredContentSizeCategory"));

                if (v11 == UIContentSizeCategoryExtraExtraExtraLarge)
                {
                  v4 = (id *)&SAUIDynamicTypeSizeExtraExtraExtraLargeValue;
                }

                else
                {
                  UIContentSizeCategory v12 = (UIContentSizeCategory)objc_claimAutoreleasedReturnValue( -[UITraitCollection preferredContentSizeCategory]( self,  "preferredContentSizeCategory"));

                  if (v12 == UIContentSizeCategoryAccessibilityMedium)
                  {
                    v4 = (id *)&SAUIDynamicTypeSizeAccessibilityMediumValue;
                  }

                  else
                  {
                    UIContentSizeCategory v13 = (UIContentSizeCategory)objc_claimAutoreleasedReturnValue( -[UITraitCollection preferredContentSizeCategory]( self,  "preferredContentSizeCategory"));

                    if (v13 == UIContentSizeCategoryAccessibilityLarge)
                    {
                      v4 = (id *)&SAUIDynamicTypeSizeAccessibilityLargeValue;
                    }

                    else
                    {
                      UIContentSizeCategory v14 = (UIContentSizeCategory)objc_claimAutoreleasedReturnValue( -[UITraitCollection preferredContentSizeCategory]( self,  "preferredContentSizeCategory"));

                      if (v14 == UIContentSizeCategoryAccessibilityExtraLarge)
                      {
                        v4 = (id *)&SAUIDynamicTypeSizeAccessibilityExtraLargeValue;
                      }

                      else
                      {
                        UIContentSizeCategory v15 = (UIContentSizeCategory)objc_claimAutoreleasedReturnValue( -[UITraitCollection preferredContentSizeCategory]( self,  "preferredContentSizeCategory"));

                        if (v15 == UIContentSizeCategoryAccessibilityExtraExtraLarge)
                        {
                          v4 = (id *)&SAUIDynamicTypeSizeAccessibilityExtraExtraLargeValue;
                        }

                        else
                        {
                          UIContentSizeCategory v16 = (UIContentSizeCategory)objc_claimAutoreleasedReturnValue( -[UITraitCollection preferredContentSizeCategory]( self,  "preferredContentSizeCategory"));

                          if (v16 == UIContentSizeCategoryAccessibilityExtraExtraExtraLarge) {
                            v4 = (id *)&SAUIDynamicTypeSizeAccessibilityExtraExtraExtraLargeValue;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return *v4;
}

- (id)aceDisplayContrast
{
  id v2 = -[UITraitCollection accessibilityContrast](self, "accessibilityContrast");
  return v2;
}

@end