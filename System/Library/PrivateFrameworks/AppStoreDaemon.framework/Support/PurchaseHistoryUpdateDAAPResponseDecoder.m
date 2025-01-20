@interface PurchaseHistoryUpdateDAAPResponseDecoder
- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4;
- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4;
- (void)parser:(id)a3 didFailWithError:(id)a4;
- (void)parser:(id)a3 didFinishWithState:(int64_t)a4;
- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6;
- (void)parserDidCancel:(id)a3;
- (void)parserDidStart:(id)a3;
@end

@implementation PurchaseHistoryUpdateDAAPResponseDecoder

- (void)parserDidStart:(id)a3
{
  revision = self->_revision;
  self->_revision = 0LL;

  status = self->_status;
  self->_status = 0LL;

  self->_hasParsedData = 0;
}

- (void)parser:(id)a3 didFinishWithState:(int64_t)a4
{
  self->_hasParsedData = 1;
}

- (void)parserDidCancel:(id)a3
{
  revision = self->_revision;
  self->_revision = 0LL;

  status = self->_status;
  self->_status = 0LL;

  self->_hasParsedData = 0;
  uint64_t v6 = ASDLogHandleForCategory(14LL);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v10 = 138412290;
    id v11 = (id)objc_opt_class(self, v8);
    id v9 = v11;
    _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "[%@]: Parser canceled",  (uint8_t *)&v10,  0xCu);
  }
}

- (void)parser:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  revision = self->_revision;
  self->_revision = 0LL;

  status = self->_status;
  self->_status = 0LL;

  self->_hasParsedData = 0;
  uint64_t v8 = ASDLogHandleForCategory(14LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    int v12 = 138412546;
    id v13 = (id)objc_opt_class(self, v10);
    __int16 v14 = 2114;
    id v15 = v5;
    id v11 = v13;
    _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "[%@]: Parser failed with error: %{public}@",  (uint8_t *)&v12,  0x16u);
  }
}

- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4
{
  BOOL v4 = a4 == 1836413028 || a4 == 1836413810;
  return a4 == 1836282996 || v4;
}

- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4
{
  return a4 == 1836413028;
}

- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6
{
  id v9 = a3;
  if (a4 == 1836413810)
  {
    id v13 = v9;
    int v12 = (NSNumber *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  bswap32(*(_DWORD *)a5)));
    revision = self->_revision;
    self->_revision = v12;
    goto LABEL_5;
  }

  if (a4 == 1836282996)
  {
    id v13 = v9;
    uint64_t v10 = (NSNumber *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  bswap32(*(_DWORD *)a5)));
    revision = self->_status;
    self->_status = v10;
LABEL_5:

    id v9 = v13;
  }
}

- (void).cxx_destruct
{
}

@end