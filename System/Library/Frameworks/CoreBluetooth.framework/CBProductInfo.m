@interface CBProductInfo
+ (id)productInfoWithProductID:(unsigned int)a3;
- (CBProductInfo)initWithProductInfoPtr:(id *)a3;
- (NSString)model;
- (NSString)productName;
- (NSString)sfSymbolNameCase;
- (NSString)sfSymbolNameMain;
- (unsigned)flags;
- (unsigned)productID;
- (unsigned)radarComponentID;
- (unsigned)vendorIDBluetooth;
- (unsigned)vendorIDUSB;
@end

@implementation CBProductInfo

+ (id)productInfoWithProductID:(unsigned int)a3
{
  v4 = objc_alloc(&OBJC_CLASS___CBProductInfo);
  if ((int)a3 > 21759)
  {
    if ((int)a3 <= 28942)
    {
      switch(a3)
      {
        case 0x5500u:
          v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB389);
          return v6;
        case 0x6F04u:
          v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoJ42);
          return v6;
        case 0x7108u:
          v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoJ105);
          return v6;
      }
    }

    else if ((int)a3 > 29454)
    {
      if (a3 == 29455)
      {
        v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoJ305);
        return v6;
      }

      if (a3 == 29715)
      {
        v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB520);
        return v6;
      }
    }

    else
    {
      if (a3 == 28943)
      {
        v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", &CBProductInfoB238A);
        return v6;
      }

      if (a3 == 28944)
      {
        v5 = &CBProductInfoB238;
LABEL_7:
        v6 = -[CBProductInfo initWithProductInfoPtr:](v4, "initWithProductInfoPtr:", v5);
        return v6;
      }
    }

- (CBProductInfo)initWithProductInfoPtr:(id *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CBProductInfo;
  v4 = -[CBProductInfo init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_flags = a3->var0;
    objc_storeStrong((id *)&v4->_model, a3->var1);
    v5->_productID = a3->var2;
    objc_storeStrong((id *)&v5->_productName, a3->var3);
    v5->_radarComponentID = a3->var4;
    objc_storeStrong((id *)&v5->_sfSymbolNameCase, a3->var5);
    objc_storeStrong((id *)&v5->_sfSymbolNameMain, a3->var6);
    v5->_vendorIDBluetooth = a3->var7;
    v5->_vendorIDUSB = a3->var8;
    v6 = v5;
  }

  return v5;
}

- (unsigned)flags
{
  return self->_flags;
}

- (NSString)model
{
  return self->_model;
}

- (unsigned)productID
{
  return self->_productID;
}

- (NSString)productName
{
  return self->_productName;
}

- (unsigned)radarComponentID
{
  return self->_radarComponentID;
}

- (NSString)sfSymbolNameCase
{
  return self->_sfSymbolNameCase;
}

- (NSString)sfSymbolNameMain
{
  return self->_sfSymbolNameMain;
}

- (unsigned)vendorIDBluetooth
{
  return self->_vendorIDBluetooth;
}

- (unsigned)vendorIDUSB
{
  return self->_vendorIDUSB;
}

- (void).cxx_destruct
{
}

@end