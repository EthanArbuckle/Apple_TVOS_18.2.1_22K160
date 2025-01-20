@interface ReviewNetworkPolicyTask
- (void)main;
@end

@implementation ReviewNetworkPolicyTask

- (void)main
{
  id Property = *(id *)&self->super._success;
  if (Property) {
    id Property = objc_getProperty(Property, a2, 24LL, 1);
  }
  id v4 = Property;
  id v5 = sub_1001D19F0((uint64_t)&OBJC_CLASS___NetworkMonitor);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  int v7 = BYTE1(self->super._error);
  id v8 = sub_10028715C((uint64_t)&OBJC_CLASS___CellularMonitor);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v61[1] = 0LL;
  id v10 = sub_100287480(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = 0LL;

  unint64_t v13 = *(void *)&self->_accessWasUnblocked;
  if (!v11)
  {
    LOBYTE(v19) = v7 != 0;
    BOOL v14 = v13 > 4;
    uint64_t v29 = (1LL << v13) & 0x19;
    if (!v14 && v29 != 0)
    {
      uint64_t v31 = ASDLogHandleForCategory(25LL);
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        id v54 = *(id *)&self->super._success;
        if (v54) {
          id v54 = objc_getProperty(v54, v33, 32LL, 1);
        }
        id v55 = v54;
        *(_DWORD *)buf = 138412546;
        id v63 = v55;
        __int16 v64 = 2114;
        id v65 = v12;
        _os_log_error_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "[%@]: Unable to evaluate cellular download: %{public}@",  buf,  0x16u);
      }

      *(void *)&self->_accessWasUnblocked = 4LL;
    }

    goto LABEL_30;
  }

  BOOL v14 = v13 > 4;
  uint64_t v15 = (1LL << v13) & 0x19;
  if (!v14 && v15 != 0)
  {
    v17 = sub_1001BB300((uint64_t)&OBJC_CLASS___ExpensiveNetworkEvaluator, v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    *(void *)&self->_accessWasUnblocked = sub_1001BB3D8((uint64_t)v18, *(void **)&self->super._success);
  }

  LOBYTE(v19) = v7 != 0;
  if (v7)
  {
LABEL_30:
    id v27 = v12;
    goto LABEL_31;
  }

  unint64_t v20 = *(void *)&self->_accessWasUnblocked;
  BOOL v14 = v20 > 4;
  uint64_t v21 = (1LL << v20) & 0x15;
  BOOL v22 = v14 || v21 == 0;
  if (v22 || ![v6 isExpensiveOrCellular])
  {
    LOBYTE(v19) = 0;
    goto LABEL_30;
  }

  v23 = objc_alloc_init(&OBJC_CLASS___ExpensiveNetworkEvaluatorTask);
  v25 = v23;
  if (v23)
  {
    objc_setProperty_atomic(v23, v24, *(id *)&self->super._success, 40LL);
    objc_setProperty_atomic(v25, v26, v11, 48LL);
  }

  v61[0] = v12;
  unsigned int v19 = -[Task runSubTask:returningError:](self, "runSubTask:returningError:", v25, v61);
  id v27 = v61[0];

  if (v19)
  {
    if (v25)
    {
      cellularDownload = v25->_cellularDownload;
      *(void *)&self->_accessWasUnblocked = cellularDownload;
      if ((unint64_t)&cellularDownload[-1]._name + 7 <= 1
        && ((unint64_t)cellularDownload & 0xFFFFFFFFFFFFFFFDLL) == 1
        && [v6 isConstrained])
      {
        self->_download = *(EvaluatorDownload **)&self->_accessWasUnblocked;
      }
    }

    else
    {
      *(void *)&self->_accessWasUnblocked = 0LL;
    }
  }

  else
  {
    uint64_t v51 = ASDLogHandleForCategory(25LL);
    v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      id v58 = *(id *)&self->super._success;
      if (v58) {
        id v58 = objc_getProperty(v58, v53, 32LL, 1);
      }
      id v59 = v58;
      *(_DWORD *)buf = 138412546;
      id v63 = v59;
      __int16 v64 = 2114;
      id v65 = v27;
      _os_log_error_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_ERROR,  "[%@]: Unable to evaluate cellular download: %{public}@",  buf,  0x16u);
    }
  }

LABEL_31:
  download = self->_download;
  BOOL v14 = (unint64_t)download > 4;
  uint64_t v35 = (1LL << (char)download) & 0x19;
  if (!v14 && v35 != 0)
  {
    v37 = objc_alloc_init(&OBJC_CLASS___LowDataNetworkEvaluator);
    self->_download = (EvaluatorDownload *)sub_1001C94A0((uint64_t)v37, *(void **)&self->super._success);
  }

  if ((v19 & 1) == 0)
  {
    v38 = self->_download;
    if ((unint64_t)v38 <= 4
      && ((1LL << (char)v38) & 0x15) != 0
      && [v6 isConstrained])
    {
      v39 = objc_alloc_init(&OBJC_CLASS___LowDataEvaluatorTask);
      v41 = v39;
      if (v39) {
        objc_setProperty_atomic(v39, v40, *(id *)&self->super._success, 40LL);
      }
      id v60 = 0LL;
      unsigned int v42 = -[Task runSubTask:returningError:](self, "runSubTask:returningError:", v41, &v60, v59);
      id v43 = v60;
      if (v42)
      {
        if (v41) {
          error = (EvaluatorDownload *)v41->super._error;
        }
        else {
          error = 0LL;
        }
        self->_download = error;
      }

      else
      {
        uint64_t v45 = ASDLogHandleForCategory(25LL);
        v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          id v56 = *(id *)&self->super._success;
          if (v56) {
            id v56 = objc_getProperty(v56, v47, 32LL, 1);
          }
          id v57 = v56;
          *(_DWORD *)buf = 138412546;
          id v63 = v57;
          __int16 v64 = 2114;
          id v65 = v43;
          _os_log_error_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_ERROR,  "[%@]: Unable to evaluate low data download: %{public}@",  buf,  0x16u);
        }
      }
    }
  }

  unint64_t v48 = *(void *)&self->_accessWasUnblocked;
  if (v48 > 4) {
    int64_t v49 = 62LL;
  }
  else {
    int64_t v49 = qword_10038AA88[v48];
  }
  self->_constrainedResult = v49;
  if (!objc_msgSend(v6, "isExpensive", v59)
    || (unint64_t v50 = *(void *)&self->_accessWasUnblocked & 0xFFFFFFFFFFFFFFFDLL, v50 != 1))
  {
    if (![v6 isConstrained]
      || (unint64_t v50 = (unint64_t)self->_download & 0xFFFFFFFFFFFFFFFDLL, v50 != 1))
    {
      LOBYTE(v50) = ([v6 isExpensive] & 1) == 0
                 && ![v6 isConstrained];
    }
  }

  LOBYTE(self->super._error) = v50;
  -[Task completeWithSuccess](self, "completeWithSuccess");
}

- (void).cxx_destruct
{
}

@end