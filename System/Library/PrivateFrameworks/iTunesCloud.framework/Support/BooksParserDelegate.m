@interface BooksParserDelegate
- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4;
- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4;
- (BOOL)shouldParseMetadata;
- (BooksParserDelegate)initWithOperation:(id)a3;
- (ICBook)currentParsingBook;
- (JaliscoLoadBooksOperation)operation;
- (NSMutableArray)parsedBooks;
- (void)parser:(id)a3 didEndContainerCode:(unsigned int)a4;
- (void)parser:(id)a3 didFailWithError:(id)a4;
- (void)parser:(id)a3 didFinishWithState:(int64_t)a4;
- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6;
- (void)parser:(id)a3 didStartContainerCode:(unsigned int)a4 contentLength:(unsigned int)a5;
- (void)parserDidStart:(id)a3;
- (void)setCurrentParsingBook:(id)a3;
- (void)setShouldParseMetadata:(BOOL)a3;
@end

@implementation BooksParserDelegate

- (BooksParserDelegate)initWithOperation:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___BooksParserDelegate;
  v6 = -[BooksParserDelegate init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_operation, a3);
  }

  return v7;
}

- (void)parserDidStart:(id)a3
{
  v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array", a3));
  parsedBooks = self->_parsedBooks;
  self->_parsedBooks = v4;
}

- (void)parser:(id)a3 didFinishWithState:(int64_t)a4
{
  -[JaliscoLoadBooksOperation setParserSuccess:](self->_operation, "setParserSuccess:", a4 == 2);
  if (-[JaliscoLoadBooksOperation parserSuccess](self->_operation, "parserSuccess")) {
    parsedBooks = self->_parsedBooks;
  }
  else {
    parsedBooks = 0LL;
  }
  -[JaliscoLoadBooksOperation setBooks:](self->_operation, "setBooks:", parsedBooks);
  v6 = self->_parsedBooks;
  self->_parsedBooks = 0LL;
}

- (void)parser:(id)a3 didFailWithError:(id)a4
{
  parsedBooks = self->_parsedBooks;
  self->_parsedBooks = 0LL;
}

- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4
{
  BOOL result = 1;
  if ((int)a4 > 1634951537)
  {
    if ((int)a4 > 1835626092)
    {
      if ((int)a4 > 1835821427)
      {
        if (a4 == 1835821428) {
          return result;
        }
        int v6 = 1836082546;
      }

      else
      {
        if (a4 == 1835626093) {
          return result;
        }
        int v6 = 1835819884;
      }

      goto LABEL_22;
    }

    if (a4 != 1634951538 && a4 != 1634952304)
    {
      int v6 = 1634953070;
      goto LABEL_22;
    }
  }

  else
  {
    if ((int)a4 <= 1634035307)
    {
      if ((int)a4 > 1634030191)
      {
        if (a4 == 1634030192) {
          return result;
        }
        unsigned __int16 v5 = 21321;
      }

      else
      {
        if (a4 == 1633968755) {
          return result;
        }
        unsigned __int16 v5 = 17249;
      }

      goto LABEL_21;
    }

    if ((a4 - 1634358884 > 0xB || ((1 << (a4 - 100)) & 0x901) == 0) && a4 != 1634035308)
    {
      unsigned __int16 v5 = 26982;
LABEL_21:
      int v6 = v5 | 0x61650000;
LABEL_22:
      if (a4 != v6) {
        return 0;
      }
    }
  }

  return result;
}

- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4
{
  BOOL result = 1;
  if ((int)a4 <= 1634036069)
  {
    if (a4 == 1633968755) {
      return result;
    }
    int v5 = 1634035308;
    goto LABEL_7;
  }

  if (a4 != 1634036070 && a4 != 1835819884)
  {
    int v5 = 1835821428;
LABEL_7:
    if (a4 != v5) {
      return 0;
    }
  }

  return result;
}

- (void)parser:(id)a3 didStartContainerCode:(unsigned int)a4 contentLength:(unsigned int)a5
{
  if (a4 == 1835821428)
  {
    self->_shouldParseMetadata = 1;
    int v6 = objc_alloc_init(&OBJC_CLASS___ICBook);
    currentParsingBook = self->_currentParsingBook;
    self->_currentParsingBook = v6;
  }

- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6
{
  id v10 = a3;
  if (!self->_shouldParseMetadata) {
    goto LABEL_31;
  }
  id v18 = v10;
  if ((int)a4 > 1634358894)
  {
    if ((int)a4 <= 1634953069)
    {
      switch(a4)
      {
        case 0x616A566Fu:
          v11 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  a5,  a6,  4LL);
          -[ICBook setVppOrganizationID:](self->_currentParsingBook, "setVppOrganizationID:", v11);
          goto LABEL_29;
        case 0x61736172u:
          v11 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  a5,  a6,  4LL);
          -[ICBook setAuthor:](self->_currentParsingBook, "setAuthor:", v11);
          goto LABEL_29;
        case 0x61736470u:
          v11 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)bswap32(*(_DWORD *)a5)));
          -[ICBook setDatePurchased:](self->_currentParsingBook, "setDatePurchased:", v11);
LABEL_29:

          goto LABEL_30;
      }

      goto LABEL_31;
    }

    if (a4 == 1634953070)
    {
      v11 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  a5,  a6,  4LL);
      -[ICBook setGenre:](self->_currentParsingBook, "setGenre:", v11);
      goto LABEL_29;
    }

    if (a4 == 1835626093)
    {
      v11 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  a5,  a6,  4LL);
      -[ICBook setTitle:](self->_currentParsingBook, "setTitle:", v11);
      goto LABEL_29;
    }

    if (a4 != 1836082546) {
      goto LABEL_31;
    }
    -[ICBook setPurchaseHistoryID:]( self->_currentParsingBook,  "setPurchaseHistoryID:",  (((unint64_t)*a5 << 56) | ((unint64_t)a5[1] << 48) | ((unint64_t)a5[2] << 40) | ((unint64_t)a5[3] << 32) | ((unint64_t)a5[4] << 24) | ((unint64_t)a5[5] << 16) | ((unint64_t)a5[6] << 8))
    + a5[7]);
LABEL_30:
    id v10 = v18;
    goto LABEL_31;
  }

  if ((int)a4 > 1634030408)
  {
    switch(a4)
    {
      case 0x61655349u:
        -[ICBook setStoreID:]( self->_currentParsingBook,  "setStoreID:",  (((unint64_t)*a5 << 56) | ((unint64_t)a5[1] << 48) | ((unint64_t)a5[2] << 40) | ((unint64_t)a5[3] << 32) | ((unint64_t)a5[4] << 24) | ((unint64_t)a5[5] << 16) | ((unint64_t)a5[6] << 8))
        + a5[7]);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[JaliscoLoadBooksOperation queryStoreIDs](self->_operation, "queryStoreIDs"));
        id v10 = v18;
        if (!v12) {
          goto LABEL_31;
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[JaliscoLoadBooksOperation queryStoreIDs](self->_operation, "queryStoreIDs"));
        v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[ICBook storeID](self->_currentParsingBook, "storeID")));
        unsigned __int8 v15 = [v13 containsObject:v14];

        id v10 = v18;
        if ((v15 & 1) != 0) {
          goto LABEL_31;
        }
        self->_shouldParseMetadata = 0;
        currentParsingBook = self->_currentParsingBook;
        self->_currentParsingBook = 0LL;

        break;
      case 0x616A5664u:
        v11 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  a5,  a6,  4LL);
        -[ICBook setVppOrganizationDisplayName:](self->_currentParsingBook, "setVppOrganizationDisplayName:", v11);
        goto LABEL_29;
      case 0x616A566Cu:
        -[ICBook setVppLicensed:](self->_currentParsingBook, "setVppLicensed:", *a5 != 0);
        break;
      default:
        goto LABEL_31;
    }

    goto LABEL_30;
  }

  if (a4 == 1634026337)
  {
    v11 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  a5,  a6,  4LL);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v11));
    -[ICBook setArtworkURL:](self->_currentParsingBook, "setArtworkURL:", v17);

    goto LABEL_29;
  }

  if (a4 == 1634030192)
  {
    v11 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  a5,  a6,  4LL);
    -[ICBook setRedownloadParameters:](self->_currentParsingBook, "setRedownloadParameters:", v11);
    goto LABEL_29;
  }

- (void)parser:(id)a3 didEndContainerCode:(unsigned int)a4
{
  id v6 = a3;
  if (a4 == 1835821428)
  {
    id v8 = v6;
    if (self->_shouldParseMetadata) {
      -[NSMutableArray addObject:](self->_parsedBooks, "addObject:", self->_currentParsingBook);
    }
    currentParsingBook = self->_currentParsingBook;
    self->_currentParsingBook = 0LL;

    id v6 = v8;
  }
}

- (JaliscoLoadBooksOperation)operation
{
  return self->_operation;
}

- (NSMutableArray)parsedBooks
{
  return self->_parsedBooks;
}

- (ICBook)currentParsingBook
{
  return self->_currentParsingBook;
}

- (void)setCurrentParsingBook:(id)a3
{
}

- (BOOL)shouldParseMetadata
{
  return self->_shouldParseMetadata;
}

- (void)setShouldParseMetadata:(BOOL)a3
{
  self->_shouldParseMetadata = a3;
}

- (void).cxx_destruct
{
}

@end