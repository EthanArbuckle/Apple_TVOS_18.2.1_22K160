@interface LifetimeServoAFLUTColumn
- (LifetimeServoAFLUTColumn)initWithLUTColumn:(id)a3 voltage:(int)a4;
- (float)accelerationFactor:(int)a3;
- (int)voltage;
@end

@implementation LifetimeServoAFLUTColumn

- (LifetimeServoAFLUTColumn)initWithLUTColumn:(id)a3 voltage:(int)a4
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___LifetimeServoAFLUTColumn;
  v6 = -[LifetimeServoAFLUTColumn init](&v20, "init");
  v7 = v6;
  if (!v6) {
    return v7;
  }
  v6->_voltage = a4;
  int rowCount = [a3 count];
  v7->_int rowCount = rowCount;
  if (rowCount < 13) {
    goto LABEL_5;
  }
  v9 = (os_log_s *)qword_10007CF50;
  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v19 = 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "<Error> LifetimeServoAFLUTColumn cannot hold all data elements",  v19,  2u);
    int rowCount = v7->_rowCount;
LABEL_5:
    if (rowCount < 1) {
      return v7;
    }
  }

  uint64_t v10 = 0LL;
  do
  {
    id v11 = [a3 objectAtIndex:v10];
    v12 = (char *)v7 + 4 * v10;
    *((_DWORD *)v12 + 4) = objc_msgSend(objc_msgSend(v11, "objectForKey:", @"temp"), "intValue");
    objc_msgSend(objc_msgSend(v11, "objectForKey:", @"af"), "floatValue");
    *((_DWORD *)v12 + 16) = v13;
    ++v10;
    uint64_t v14 = v7->_rowCount;
  }

  while (v10 < v14);
  if ((int)v14 >= 2)
  {
    uint64_t v15 = 0LL;
    do
    {
      v16 = (char *)v7 + 4 * v15;
      if (*((_DWORD *)v16 + 4) >= *((_DWORD *)v16 + 5) || *((float *)v16 + 16) > *((float *)v16 + 17))
      {
        v17 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v19 = 0;
          _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "<Error> LifetimeServoAFLUTColumn data improperly sorted",  v19,  2u);
          LODWORD(v14) = v7->_rowCount;
        }
      }

      ++v15;
    }

    while (v15 < (int)v14 - 1);
  }

  return v7;
}

- (float)accelerationFactor:(int)a3
{
  temperatures = self->_temperatures;
  int v3 = self->_temperatures[0];
  uint64_t rowCount = self->_rowCount;
  if (v3 <= a3)
  {
    int v3 = temperatures[(int)rowCount - 1];
    if (v3 >= a3) {
      int v3 = a3;
    }
  }

  if ((int)rowCount < 2)
  {
    LODWORD(rowCount) = 1;
  }

  else
  {
    uint64_t v6 = 0LL;
    while (v3 > self->_temperatures[v6 + 1])
    {
      if (rowCount - 1 == ++v6) {
        goto LABEL_11;
      }
    }

    LODWORD(rowCount) = v6 + 1;
  }

- (int)voltage
{
  return self->_voltage;
}

@end