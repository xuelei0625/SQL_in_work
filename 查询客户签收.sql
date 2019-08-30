SELECT
	a.colCltID [编号],
	a.colName [姓名],
	a.colEmpID [归属员工],
	b.colName [员工姓名],
	b.colDptID [归属部门],
	c.colName
FROM
	TBL_CLIENT a,
	tbl_Emp b,
	tbl_Dpt c
WHERE
	b.colDptID = c.colID
AND a.colempid = b.colID
AND a.colCltID IN (
	SELECT
		a.colCltID
	FROM
		tbl_Order a,
		tbl_OdrTypeID b
	WHERE
		a.colID = b.colID
	AND b.colPhase IN ('O', 'C')
	AND a.colOdrTim >= '2017-6-1'
	GROUP BY
		colCltID
	HAVING
		SUM (colOrderAmt) >= 9800
)
ORDER BY
	a.colEmpID