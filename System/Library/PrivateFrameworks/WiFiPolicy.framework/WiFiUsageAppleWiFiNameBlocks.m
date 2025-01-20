@interface WiFiUsageAppleWiFiNameBlocks
- (NSString)building;
- (NSString)floor;
- (NSString)name;
- (NSString)other;
- (NSString)pod;
- (NSString)section;
- (WiFiUsageAppleWiFiNameBlocks)initWithAPName:(id)a3;
- (void)setBuilding:(id)a3;
- (void)setFloor:(id)a3;
- (void)setName:(id)a3;
- (void)setOther:(id)a3;
- (void)setPod:(id)a3;
- (void)setSection:(id)a3;
@end

@implementation WiFiUsageAppleWiFiNameBlocks

- (WiFiUsageAppleWiFiNameBlocks)initWithAPName:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4
    && ([v4 containsString:@"."] & 1) == 0
    && (v22.receiver = self,
        v22.super_class = (Class)&OBJC_CLASS___WiFiUsageAppleWiFiNameBlocks,
        v6 = -[WiFiUsageAppleWiFiNameBlocks init](&v22, sel_init),
        (self = v6) != 0LL))
  {
    -[WiFiUsageAppleWiFiNameBlocks setBuilding:](v6, "setBuilding:", 0LL);
    -[WiFiUsageAppleWiFiNameBlocks setSection:](self, "setSection:", 0LL);
    -[WiFiUsageAppleWiFiNameBlocks setFloor:](self, "setFloor:", 0LL);
    -[WiFiUsageAppleWiFiNameBlocks setPod:](self, "setPod:", 0LL);
    -[WiFiUsageAppleWiFiNameBlocks setOther:](self, "setOther:", 0LL);
    v7 = 0LL;
    if ([v5 containsString:@"-"])
    {
      [v5 componentsSeparatedByString:@"-"];
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if ([v7 count])
    {
      [v7 objectAtIndex:0];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiUsageAppleWiFiNameBlocks setBuilding:](self, "setBuilding:", v8);
    }

    if ((unint64_t)[v7 count] >= 2)
    {
      [v7 objectAtIndex:1];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v10 = [v9 length];

      [v7 objectAtIndex:1];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v10 < 2)
      {
        -[WiFiUsageAppleWiFiNameBlocks setFloor:](self, "setFloor:", v11);
      }

      else
      {
        objc_msgSend(v11, "substringWithRange:", 0, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[WiFiUsageAppleWiFiNameBlocks setSection:](self, "setSection:", v13);

        [v7 objectAtIndex:1];
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "substringWithRange:", 1, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[WiFiUsageAppleWiFiNameBlocks setFloor:](self, "setFloor:", v15);

        [v7 objectAtIndex:1];
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 substringFromIndex:2];
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[WiFiUsageAppleWiFiNameBlocks setPod:](self, "setPod:", v16);
      }
    }

    if ((unint64_t)[v7 count] >= 4)
    {
      [v7 objectAtIndex:1];
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiUsageAppleWiFiNameBlocks setSection:](self, "setSection:", v19);

      [v7 objectAtIndex:2];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiUsageAppleWiFiNameBlocks setFloor:](self, "setFloor:", v20);

      -[WiFiUsageAppleWiFiNameBlocks setPod:](self, "setPod:", 0LL);
    }

    if ((unint64_t)[v7 count] >= 2)
    {
      [v7 lastObject];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiUsageAppleWiFiNameBlocks setOther:](self, "setOther:", v21);
    }

    self = self;

    v17 = self;
  }

  else
  {
    v17 = 0LL;
  }

  return v17;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)building
{
  return self->_building;
}

- (void)setBuilding:(id)a3
{
}

- (NSString)section
{
  return self->_section;
}

- (void)setSection:(id)a3
{
}

- (NSString)floor
{
  return self->_floor;
}

- (void)setFloor:(id)a3
{
}

- (NSString)pod
{
  return self->_pod;
}

- (void)setPod:(id)a3
{
}

- (NSString)other
{
  return self->_other;
}

- (void)setOther:(id)a3
{
}

- (void).cxx_destruct
{
}

@end