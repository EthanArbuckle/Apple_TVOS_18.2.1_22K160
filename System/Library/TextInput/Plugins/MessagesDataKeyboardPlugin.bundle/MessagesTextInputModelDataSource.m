@interface MessagesTextInputModelDataSource
- (MessagesTextInputModelDataSource)init;
- (id)nextOutgoingMessageBatch;
- (unint64_t)nextRowID;
- (void)reset;
- (void)setNextRowID:(unint64_t)a3;
@end

@implementation MessagesTextInputModelDataSource

- (MessagesTextInputModelDataSource)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MessagesTextInputModelDataSource;
  result = -[MessagesTextInputModelDataSource init](&v3, "init");
  if (result) {
    result->_currentMaxRow = 0LL;
  }
  return result;
}

- (void)setNextRowID:(unint64_t)a3
{
  self->_currentMaxRow = a3;
}

- (void)reset
{
  self->_currentMaxRow = 0LL;
}

- (unint64_t)nextRowID
{
  return self->_currentMaxRow;
}

- (id)nextOutgoingMessageBatch
{
  uint64_t v3 = IMDMessageRecordCountMessages(self, a2);
  int64_t currentMaxRow = self->_currentMaxRow;
  if (((v3 - currentMaxRow) & ~((v3 - currentMaxRow) >> 63)) >= 1000) {
    uint64_t v5 = 1000LL;
  }
  else {
    uint64_t v5 = (v3 - currentMaxRow) & ~((v3 - currentMaxRow) >> 63);
  }
  BOOL v7 = v3 <= currentMaxRow;
  uint64_t v6 = v3 - currentMaxRow;
  BOOL v7 = v7 || v6 < 1;
  if (v7
    || (v8 = (const __CFArray *)IMDMessageRecordCopyMessagesBetweenRowIDs(currentMaxRow, v5 + currentMaxRow)) == 0LL)
  {
    v11 = 0LL;
  }

  else
  {
    v9 = v8;
    uint64_t v24 = v5;
    if (CFArrayGetCount(v8) < 1)
    {
      v11 = 0LL;
    }

    else
    {
      CFIndex v10 = 0LL;
      v11 = 0LL;
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v9, v10);
        uint64_t v29 = -1LL;
        v30[0] = 0LL;
        uint64_t v27 = -1LL;
        uint64_t v28 = -1LL;
        CFTypeRef v25 = 0LL;
        v26 = 0LL;
        IMDMessageRecordBulkCopy( ValueAtIndex,  &v28,  &v27,  0LL,  &v25,  &v29,  0LL,  0LL,  0LL,  v30,  0LL,  &v26,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,
          0LL,
          0LL,
          0LL,
          0LL,
          0LL,
          0LL);
        if (!v28)
        {
          unint64_t v13 = (unint64_t)[v26 unsignedLongLongValue];
          v14 = (const void *)IMDMessageRecordCopyHandle(ValueAtIndex);
          if (v14)
          {
            CFAllocatorRef Default = CFAllocatorGetDefault();
            v16 = (const __CFString *)IMDHandleRecordCopyID(Default, v14);
          }

          else
          {
            v16 = 0LL;
          }

          if (v29 < 1) {
            id v17 = 0LL;
          }
          else {
            id v17 = +[NSDate __im_dateWithNanosecondTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:",  (double)v29);
          }
          if (v30[0] && CFStringGetLength(v30[0]) && v16 && CFStringGetLength(v16) && v17)
          {
            v18 = v11;
            uint64_t v19 = (v13 >> 2) & 1;
            v20 = objc_alloc(&OBJC_CLASS___MessagesDataSourceMessage);
            v21 = -[MessagesDataSourceMessage initWithDate:recipient:body:]( v20,  "initWithDate:recipient:body:",  v17,  v16,  v30[0]);
            uint64_t v22 = v19;
            v11 = v18;
            -[MessagesDataSourceMessage setFromMe:](v21, "setFromMe:", v22);
            -[MessagesDataSourceMessage setRowID:](v21, "setRowID:", v27);
            -[MessagesDataSourceMessage setGuid:](v21, "setGuid:", v25);
            if (!v18) {
              v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
            }
            -[NSMutableArray addObject:](v11, "addObject:", v21);
          }

          if (v14) {
            CFRelease(v14);
          }
          if (v16) {
            CFRelease(v16);
          }
          if (v26)
          {
            CFRelease(v26);
            v26 = 0LL;
          }
        }

        if (v30[0])
        {
          CFRelease(v30[0]);
          v30[0] = 0LL;
        }

        if (v25) {
          CFRelease(v25);
        }
        ++v10;
      }

      while (v10 < CFArrayGetCount(v9));
    }

    CFRelease(v9);
    uint64_t v5 = v24;
  }

  self->_currentMaxRow += v5;
  return v11;
}

@end