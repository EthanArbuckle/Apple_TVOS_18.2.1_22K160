@interface LifetimeServoAFLUT
- (LifetimeServoAFLUT)initWithAFTableColumns:(id)a3;
- (float)accelerationFactor:(int)a3 voltage:(int)a4;
@end

@implementation LifetimeServoAFLUT

- (LifetimeServoAFLUT)initWithAFTableColumns:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___LifetimeServoAFLUT;
  v4 = -[LifetimeServoAFLUT init](&v19, "init");
  if (v4)
  {
    int v5 = [a3 count];
    v4->_uint64_t columnCount = v5;
    if (v5 <= 26)
    {
      if (v5 >= 1)
      {
        uint64_t v9 = 0LL;
        do
        {
          id v10 = [a3 objectAtIndex:v9];
          v4->_afLUTColumns[v9++] = -[LifetimeServoAFLUTColumn initWithLUTColumn:voltage:]( [LifetimeServoAFLUTColumn alloc],  "initWithLUTColumn:voltage:",  [v10 objectForKey:@"afColumn"],  objc_msgSend(objc_msgSend(v10, "objectForKey:", @"voltage"), "intValue"));
          uint64_t columnCount = v4->_columnCount;
        }

        while (v9 < columnCount);
        if ((int)columnCount >= 2)
        {
          uint64_t v12 = 0LL;
          do
          {
            v13 = (id *)&(&v4->super.isa)[v12];
            int v14 = [v13[3] voltage];
            if (v14 >= (int)[v13[4] voltage])
            {
              v15 = (os_log_s *)qword_10007CF50;
              if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
                sub_10003A45C(&v17, v18, v15);
              }
            }

            ++v12;
          }

          while (v12 < v4->_columnCount - 1LL);
        }
      }

      v4->_minVoltage = -[LifetimeServoAFLUTColumn voltage](v4->_afLUTColumns[0], "voltage");
      v4->_maxVoltage = -[LifetimeServoAFLUTColumn voltage](v4->_afLUTColumns[v4->_columnCount - 1], "voltage");
    }

    else
    {
      v6 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_10003A424(v6, v7, v8);
      }
      return 0LL;
    }
  }

  return v4;
}

- (float)accelerationFactor:(int)a3 voltage:(int)a4
{
  uint64_t v4 = *(void *)&a3;
  int minVoltage = self->_minVoltage;
  if (minVoltage <= a4)
  {
    if (self->_maxVoltage >= a4) {
      int minVoltage = a4;
    }
    else {
      int minVoltage = self->_maxVoltage;
    }
  }

  afLUTColumns = self->_afLUTColumns;
  if (self->_columnCount < 2)
  {
    unsigned int v11 = 1;
  }

  else
  {
    uint64_t v8 = 4LL;
    while (minVoltage > (int)-[objc_class voltage]((&self->super.isa)[v8], "voltage"))
    {
      int v9 = v8 + 1;
      uint64_t v10 = v8 - 2;
      ++v8;
      if (v10 >= self->_columnCount)
      {
        unsigned int v11 = v9 - 3;
        goto LABEL_12;
      }
    }

    unsigned int v11 = v8 - 3;
  }

@end